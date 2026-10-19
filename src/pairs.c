/*-
 * Copyright (c) 2012-2017 Ilya Kaliman
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

/*
 * Fragment pairs: which pairs are skipped, and which pairs are within the
 * interaction cutoff.
 *
 * Skipped pairs used to be a dense n_frag x n_frag byte array (23 GB for
 * 1.5e5 fragments), and every pair loop tested all n_frag^2 pairs against it
 * and against the cutoff. Now:
 *  - skipped pairs are a default rule (symmetric crystals: pairs without a
 *    symmetry-unique fragment are skipped) plus a hash map of the pairs set
 *    explicitly with efp_skip_fragments();
 *  - with a cutoff, efp_compute() builds neighbor lists (cell lists, O(N)) of
 *    the fragments within the cutoff of every fragment, and the pair loops run
 *    over these lists instead of all fragments. The lists use the same
 *    minimum-image distance test as efp_skip_frag_pair() and are sorted, so
 *    the loops see the same pairs in the same order as before.
 */

#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "private.h"

static uint64_t
pair_key(const struct efp *efp, size_t i, size_t j)
{
	size_t lo = i < j ? i : j, hi = i < j ? j : i;

	return (uint64_t)lo * (uint64_t)efp->n_frag + (uint64_t)hi + 1; /* 0 = empty */
}

static size_t
key_slot(uint64_t key, size_t size)
{
	key ^= key >> 33;
	key *= 0xff51afd7ed558ccdULL;
	key ^= key >> 33;
	return (size_t)key & (size - 1);
}

static int
grow_skip_set(struct efp *efp)
{
	size_t size = efp->skip_size ? 2 * efp->skip_size : 64;
	uint64_t *keys = (uint64_t *)calloc(size, sizeof(uint64_t));
	unsigned char *vals = (unsigned char *)calloc(size, 1);

	if (keys == NULL || vals == NULL) {
		free(keys);
		free(vals);
		return 0;
	}
	for (size_t s = 0; s < efp->skip_size; s++) {
		if (efp->skip_keys[s] == 0)
			continue;
		size_t k = key_slot(efp->skip_keys[s], size);

		while (keys[k] != 0)
			k = (k + 1) & (size - 1);
		keys[k] = efp->skip_keys[s];
		vals[k] = efp->skip_vals[s];
	}
	free(efp->skip_keys);
	free(efp->skip_vals);
	efp->skip_keys = keys;
	efp->skip_vals = vals;
	efp->skip_size = size;
	return 1;
}

enum efp_result
efp_set_pair_skip(struct efp *efp, size_t i, size_t j, int value)
{
	if (2 * (efp->skip_count + 1) > efp->skip_size && !grow_skip_set(efp))
		return EFP_RESULT_NO_MEMORY;

	uint64_t key = pair_key(efp, i, j);
	size_t k = key_slot(key, efp->skip_size);

	while (efp->skip_keys[k] != 0 && efp->skip_keys[k] != key)
		k = (k + 1) & (efp->skip_size - 1);
	if (efp->skip_keys[k] == 0) {
		efp->skip_keys[k] = key;
		efp->skip_count++;
	}
	efp->skip_vals[k] = value ? 1 : 0;
	return EFP_RESULT_SUCCESS;
}

void
efp_clear_pair_skips(struct efp *efp)
{
	if (efp->skip_keys)
		memset(efp->skip_keys, 0, efp->skip_size * sizeof(uint64_t));
	efp->skip_count = 0;
}

int
efp_frag_pair_skipped(const struct efp *efp, size_t i, size_t j)
{
	if (efp->skip_count > 0) {
		uint64_t key = pair_key(efp, i, j);
		size_t k = key_slot(key, efp->skip_size);

		while (efp->skip_keys[k] != 0) {
			if (efp->skip_keys[k] == key)
				return efp->skip_vals[k];
			k = (k + 1) & (efp->skip_size - 1);
		}
	}
	if (efp->skip_non_unique)
		return !efp->frag_unique[i] && !efp->frag_unique[j];
	return 0;
}

void
efp_free_pairs(struct efp *efp)
{
	free(efp->skip_keys);
	free(efp->skip_vals);
	free(efp->frag_unique);
	free(efp->nbr_offset);
	free(efp->nbr_list);
	efp->skip_keys = NULL;
	efp->skip_vals = NULL;
	efp->frag_unique = NULL;
	efp->nbr_offset = NULL;
	efp->nbr_list = NULL;
	efp->skip_size = efp->skip_count = efp->nbr_capacity = 0;
	efp->nbr_valid = false;
}

/* cell grid for the neighbor search */
struct grid {
	size_t n[3];      /* number of cells along each direction */
	double origin[3];
	double size[3];   /* cell size, >= cutoff */
	int periodic;
	size_t *head;     /* first fragment of every cell (n_frag = end) */
	size_t *next;     /* next fragment in the same cell */
};

static size_t
cell_coord(const struct grid *g, int d, double x)
{
	double c = floor((x - g->origin[d]) / g->size[d]);
	long n = (long)g->n[d];
	long k = (long)c;

	if (g->periodic)
		k = ((k % n) + n) % n;
	else if (k < 0)
		k = 0;
	else if (k >= n)
		k = n - 1;
	return (size_t)k;
}

/* set up the grid; returns 0 when a cell list cannot be used (brute force) */
static int
setup_grid(const struct efp *efp, struct grid *g)
{
	double cutoff = efp->opts.swf_cutoff;

	memset(g, 0, sizeof(*g));

	if (efp->opts.enable_pbc) {
		/* orthogonal boxes only, and at least three cells per direction so
		 * that the 27 cells around a cell are all different */
		if (efp->box.a != 90.0 || efp->box.b != 90.0 || efp->box.c != 90.0)
			return 0;
		double box[3] = { efp->box.x, efp->box.y, efp->box.z };

		for (int d = 0; d < 3; d++) {
			if (!(box[d] > 0.0))
				return 0;
			g->n[d] = (size_t)floor(box[d] / cutoff);
			if (g->n[d] < 3)
				return 0;
			g->size[d] = box[d] / (double)g->n[d];
			g->origin[d] = 0.0;
		}
		g->periodic = 1;
		return 1;
	}

	double lo[3] = { INFINITY, INFINITY, INFINITY };
	double hi[3] = { -INFINITY, -INFINITY, -INFINITY };

	for (size_t i = 0; i < efp->n_frag; i++) {
		const double *x = &efp->frags[i].x;

		for (int d = 0; d < 3; d++) {
			lo[d] = fmin(lo[d], x[d]);
			hi[d] = fmax(hi[d], x[d]);
		}
	}
	/* at most about 2 cells per fragment for sparse systems */
	double cell = cutoff;

	for (;;) {
		double total = 1.0;

		for (int d = 0; d < 3; d++)
			total *= floor((hi[d] - lo[d]) / cell) + 1.0;
		if (total <= 2.0 * (double)efp->n_frag + 27.0)
			break;
		cell *= 1.25;
	}
	for (int d = 0; d < 3; d++) {
		g->n[d] = (size_t)floor((hi[d] - lo[d]) / cell) + 1;
		g->size[d] = cell;
		g->origin[d] = lo[d];
	}
	return 1;
}

static int
fill_grid(const struct efp *efp, struct grid *g)
{
	size_t n_cells = g->n[0] * g->n[1] * g->n[2];

	g->head = (size_t *)malloc(n_cells * sizeof(size_t));
	g->next = (size_t *)malloc(efp->n_frag * sizeof(size_t));
	if (g->head == NULL || g->next == NULL)
		return 0;
	for (size_t c = 0; c < n_cells; c++)
		g->head[c] = efp->n_frag;

	/* insert in decreasing order, so that every cell lists its fragments in
	 * increasing order */
	for (size_t i = efp->n_frag; i-- > 0;) {
		const double *x = &efp->frags[i].x;
		size_t c = (cell_coord(g, 0, x[0]) * g->n[1] +
		    cell_coord(g, 1, x[1])) * g->n[2] + cell_coord(g, 2, x[2]);

		g->next[i] = g->head[c];
		g->head[c] = i;
	}
	return 1;
}

static int
cmp_u32(const void *a, const void *b)
{
	uint32_t x = *(const uint32_t *)a, y = *(const uint32_t *)b;

	return (x > y) - (x < y);
}

/* the neighbors of fragment i: into list (if not NULL); returns their number */
static size_t
find_neighbors(const struct efp *efp, const struct grid *g, size_t i,
    uint32_t *list)
{
	size_t count = 0;

	if (g == NULL) {
		for (size_t j = 0; j < efp->n_frag; j++)
			if (j != i && !efp_frag_pair_beyond_cutoff(efp, i, j)) {
				if (list)
					list[count] = (uint32_t)j;
				count++;
			}
		return count;
	}

	const double *x = &efp->frags[i].x;
	long c[3];

	for (int d = 0; d < 3; d++)
		c[d] = (long)cell_coord(g, d, x[d]);

	for (long dx = -1; dx <= 1; dx++)
	for (long dy = -1; dy <= 1; dy++)
	for (long dz = -1; dz <= 1; dz++) {
		long k[3] = { c[0] + dx, c[1] + dy, c[2] + dz };
		int out = 0;

		for (int d = 0; d < 3; d++) {
			long n = (long)g->n[d];

			if (g->periodic)
				k[d] = ((k[d] % n) + n) % n;
			else if (k[d] < 0 || k[d] >= n)
				out = 1;
		}
		if (out)
			continue;

		size_t cell = ((size_t)k[0] * g->n[1] + (size_t)k[1]) * g->n[2] +
		    (size_t)k[2];

		for (size_t j = g->head[cell]; j < efp->n_frag; j = g->next[j])
			if (j != i && !efp_frag_pair_beyond_cutoff(efp, i, j)) {
				if (list)
					list[count] = (uint32_t)j;
				count++;
			}
	}
	if (list)
		qsort(list, count, sizeof(uint32_t), cmp_u32);
	return count;
}

enum efp_result
efp_build_neighbors(struct efp *efp)
{
	efp->nbr_valid = false;

	if (!efp->opts.enable_cutoff || efp->n_frag < 2 ||
	    efp->n_frag > (size_t)UINT32_MAX)
		return EFP_RESULT_SUCCESS;

	struct grid grid;
	struct grid *g = setup_grid(efp, &grid) ? &grid : NULL;

	if (g && !fill_grid(efp, g)) {
		free(g->head);
		free(g->next);
		return EFP_RESULT_NO_MEMORY;
	}

	size_t *offset = (size_t *)realloc(efp->nbr_offset,
	    (efp->n_frag + 1) * sizeof(size_t));
	if (offset == NULL) {
		if (g) {
			free(g->head);
			free(g->next);
		}
		return EFP_RESULT_NO_MEMORY;
	}
	efp->nbr_offset = offset;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic, 64)
#endif
	for (size_t i = 0; i < efp->n_frag; i++)
		offset[i + 1] = find_neighbors(efp, g, i, NULL);

	offset[0] = 0;
	for (size_t i = 0; i < efp->n_frag; i++)
		offset[i + 1] += offset[i];

	size_t total = offset[efp->n_frag];

	if (total > efp->nbr_capacity) {
		uint32_t *list = (uint32_t *)realloc(efp->nbr_list,
		    (total ? total : 1) * sizeof(uint32_t));
		if (list == NULL) {
			if (g) {
				free(g->head);
				free(g->next);
			}
			return EFP_RESULT_NO_MEMORY;
		}
		efp->nbr_list = list;
		efp->nbr_capacity = total;
	}

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic, 64)
#endif
	for (size_t i = 0; i < efp->n_frag; i++)
		find_neighbors(efp, g, i, efp->nbr_list + offset[i]);

	if (g) {
		free(g->head);
		free(g->next);
	}
	efp->nbr_valid = true;
	return EFP_RESULT_SUCCESS;
}
