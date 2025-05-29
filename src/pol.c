/*-
 * Copyright (c) 2012-2017 Ilya Kaliman
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include "balance.h"
#include "elec.h"
#include "private.h"

#define POL_SCF_TOL 1.0e-10
#define POL_SCF_MAX_ITER 200
#define INDIP_PRINT_TRESH 0.5

double efp_get_pol_damp_tt(double, double, double);
enum efp_result efp_compute_id_direct(struct efp *);

double
efp_get_pol_damp_tt(double r, double pa, double pb)
{
	double ab = sqrt(pa * pb);
	double r2 = r * r;

	return 1.0 - exp(-ab * r2) * (1.0 + ab * r2);
}

static double
efp_get_pol_damp_tt_grad(double r, double pa, double pb)
{
	double ab = sqrt(pa * pb);
	double r2 = r * r;

	return -2.0 * exp(-ab * r2) * (ab * ab * r2);
}

static vec_t
get_multipole_field(const vec_t *xyz, const struct multipole_pt *mult_pt,
    const struct swf *swf)
{
	vec_t field = vec_zero;

	vec_t dr = {
		xyz->x - mult_pt->x - swf->cell.x,
		xyz->y - mult_pt->y - swf->cell.y,
		xyz->z - mult_pt->z - swf->cell.z
	};

	double t1, t2;
	double r = vec_len(&dr);
	double r3 = r * r * r;
	double r5 = r3 * r * r;
	double r7 = r5 * r * r;

	/* charge */
	if (mult_pt->if_mon || mult_pt->if_dip) {
        field.x += swf->swf * (mult_pt->monopole + mult_pt->znuc) * dr.x / r3;
        field.y += swf->swf * (mult_pt->monopole + mult_pt->znuc) * dr.y / r3;
        field.z += swf->swf * (mult_pt->monopole + mult_pt->znuc) * dr.z / r3;
    }

	/* dipole */
	if (mult_pt->if_dip) {
        t1 = vec_dot(&mult_pt->dipole, &dr);

        field.x += swf->swf * (3.0 / r5 * t1 * dr.x - mult_pt->dipole.x / r3);
        field.y += swf->swf * (3.0 / r5 * t1 * dr.y - mult_pt->dipole.y / r3);
        field.z += swf->swf * (3.0 / r5 * t1 * dr.z - mult_pt->dipole.z / r3);
    }

	/* quadrupole */
    if (mult_pt->if_quad) {
        t1 = quadrupole_sum(mult_pt->quadrupole, &dr);

        t2 = mult_pt->quadrupole[quad_idx(0, 0)] * dr.x +
             mult_pt->quadrupole[quad_idx(1, 0)] * dr.y +
             mult_pt->quadrupole[quad_idx(2, 0)] * dr.z;
        field.x += swf->swf * (-2.0 / r5 * t2 + 5.0 / r7 * t1 * dr.x);

        t2 = mult_pt->quadrupole[quad_idx(0, 1)] * dr.x +
             mult_pt->quadrupole[quad_idx(1, 1)] * dr.y +
             mult_pt->quadrupole[quad_idx(2, 1)] * dr.z;
        field.y += swf->swf * (-2.0 / r5 * t2 + 5.0 / r7 * t1 * dr.y);

        t2 = mult_pt->quadrupole[quad_idx(0, 2)] * dr.x +
             mult_pt->quadrupole[quad_idx(1, 2)] * dr.y +
             mult_pt->quadrupole[quad_idx(2, 2)] * dr.z;
        field.z += swf->swf * (-2.0 / r5 * t2 + 5.0 / r7 * t1 * dr.z);
    }

	/* octupole-polarizability interactions are ignored */

	return field;
}

static double
get_multipole_elec_potential(const vec_t *xyz, const struct multipole_pt *mult_pt,
                    const struct swf *swf)
{
    double elpot = 0.0;

    vec_t dr = {
            xyz->x - mult_pt->x - swf->cell.x,
            xyz->y - mult_pt->y - swf->cell.y,
            xyz->z - mult_pt->z - swf->cell.z
    };

    double r = vec_len(&dr);
    double r3 = r * r * r;
    double r5 = r3 * r * r;
    double r7 = r5 * r * r;

    /* charge */
    if (mult_pt->if_mon || mult_pt->if_znuc)
        elpot += swf->swf * (mult_pt->monopole + mult_pt->znuc) / r;

    /* dipole */
    if (mult_pt->if_dip)
        elpot += swf->swf * vec_dot(&mult_pt->dipole, &dr) / r3;

    /* quadrupole */
    if (mult_pt->if_quad)
        elpot += swf->swf * quadrupole_sum(mult_pt->quadrupole, &dr) / r5;

    /* octupole */
    if (mult_pt->if_oct)
        elpot += swf->swf * octupole_sum(mult_pt->octupole, &dr) / r7;

    return elpot;
}

static double
get_mm_elec_potential(const vec_t *xyz, const struct efp_atom *atom,
                             const struct swf *swf)
{
    double elpot = 0.0;

    vec_t dr = {
            xyz->x - atom->x - swf->cell.x,
            xyz->y - atom->y - swf->cell.y,
            xyz->z - atom->z - swf->cell.z
    };

    double r = vec_len(&dr);

    /* mm charge */
    elpot += swf->swf * atom->mm_charge / r;

    return elpot;
}

static vec_t
get_elec_field(const struct efp *efp, size_t frag_idx, size_t pt_idx)
{
	const struct frag *fr_j = efp->frags + frag_idx;
	const struct polarizable_pt *pt = fr_j->polarizable_pts + pt_idx;
	vec_t elec_field = vec_zero;

	for (size_t i = 0; i < efp->n_frag; i++) {
		if (i == frag_idx )
			continue;
		// do not use skip list if symmetry is 1
        if (efp->opts.symmetry == 0 && efp_skip_frag_pair(efp, i, frag_idx))
            continue;
        // this might need to be changed to a more careful separation of
        // elec and pol contributions to the field
        if (i == efp->opts.special_fragment && !(efp->opts.special_terms & EFP_SPEC_TERM_POL))
            continue;
		const struct frag *fr_i = efp->frags + i;
		struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
		if (swf.swf == 0.0)
		    continue;

		/* field due to multipoles */
		for (size_t j = 0; j < fr_i->n_multipole_pts; j++) {
			const struct multipole_pt *mult_pt =
			    fr_i->multipole_pts + j;
			vec_t mult_field = get_multipole_field(CVEC(pt->x),
			    mult_pt, &swf);

			vec_t dr = {
				pt->x - mult_pt->x - swf.cell.x,
				pt->y - mult_pt->y - swf.cell.y,
				pt->z - mult_pt->z - swf.cell.z
			};

			double r = vec_len(&dr);
			double p1 = 1.0;

			if (efp->opts.pol_damp == EFP_POL_DAMP_TT) {
				p1 = efp_get_pol_damp_tt(r, fr_i->pol_damp,
				    fr_j->pol_damp);
			}
			elec_field.x += mult_field.x * p1;
			elec_field.y += mult_field.y * p1;
			elec_field.z += mult_field.z * p1;
		}
	}

	if (efp->opts.terms & EFP_TERM_AI_POL) {
		/* field due to nuclei from ab initio subsystem */
		for (size_t i = 0; i < efp->n_ptc; i++) {
			vec_t dr = vec_sub(CVEC(pt->x), efp->ptc_xyz + i);

			double r = vec_len(&dr);
			double r3 = r * r * r;

			elec_field.x += efp->ptc[i] * dr.x / r3;
			elec_field.y += efp->ptc[i] * dr.y / r3;
			elec_field.z += efp->ptc[i] * dr.z / r3;
		}
	}

	return elec_field;
}

/* this function computes electric field on a polarizable point pt_idx
 * of fragment frag_idx due to other fragment ligand_idx */
static vec_t
get_ligand_field(const struct efp *efp, size_t frag_idx, size_t pt_idx, int ligand_idx)
{
	const struct frag *fr_j = efp->frags + frag_idx;
	const struct polarizable_pt *pt = fr_j->polarizable_pts + pt_idx;
	vec_t elec_field = vec_zero;

    /* ligand is not QM */
    if (ligand_idx != -1) {
        const struct frag *fr_i = efp->frags + ligand_idx;
        if (efp_skip_frag_pair(efp, ligand_idx, frag_idx))
            return elec_field;

        struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
        if (swf.swf == 0)
            return elec_field;

        /* field due to multipoles */
        for (size_t j = 0; j < fr_i->n_multipole_pts; j++) {
            const struct multipole_pt *mult_pt =
                    fr_i->multipole_pts + j;
            vec_t mult_field = get_multipole_field(CVEC(pt->x),
                                                   mult_pt, &swf);

            vec_t dr = {
                    pt->x - mult_pt->x - swf.cell.x,
                    pt->y - mult_pt->y - swf.cell.y,
                    pt->z - mult_pt->z - swf.cell.z
            };

            double r = vec_len(&dr);
            double p1 = 1.0;

            if (efp->opts.pol_damp == EFP_POL_DAMP_TT) {
                p1 = efp_get_pol_damp_tt(r, fr_i->pol_damp,
                                         fr_j->pol_damp);
            }
            elec_field.x += mult_field.x * p1;
            elec_field.y += mult_field.y * p1;
            elec_field.z += mult_field.z * p1;
        }
    }
    /* ligand is QM */
    if (efp->opts.terms & EFP_TERM_AI_POL && ligand_idx == -1) {
        /* field due to nuclei from ab initio subsystem */
        for (size_t i = 0; i < efp->n_ptc; i++) {
            vec_t dr = vec_sub(CVEC(pt->x), efp->ptc_xyz + i);

            double r = vec_len(&dr);
            double r3 = r * r * r;

            elec_field.x += efp->ptc[i] * dr.x / r3;
            elec_field.y += efp->ptc[i] * dr.y / r3;
            elec_field.z += efp->ptc[i] * dr.z / r3;
        }
    }
    return elec_field;
}

static enum efp_result
add_electron_density_field(struct efp *efp)
{
    enum efp_result res;
    vec_t *xyz, *field;

    if (efp->get_electron_density_field == NULL)
        return EFP_RESULT_SUCCESS;

    xyz = (vec_t *)malloc(efp->n_polarizable_pts * sizeof(vec_t));
    field = (vec_t *)malloc(efp->n_polarizable_pts * sizeof(vec_t));

    for (size_t i = 0, idx = 0; i < efp->n_frag; i++) {
        struct frag *frag = efp->frags + i;

        for (size_t j = 0; j < frag->n_polarizable_pts; j++, idx++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            xyz[idx].x = pt->x;
            xyz[idx].y = pt->y;
            xyz[idx].z = pt->z;
        }
    }

    if ((res = efp->get_electron_density_field(efp->n_polarizable_pts,
                                               (const double *)xyz, (double *)field,
                                               efp->get_electron_density_field_user_data)))
        goto error;

    for (size_t i = 0, idx = 0; i < efp->n_frag; i++) {
        struct frag *frag = efp->frags + i;

        for (size_t j = 0; j < frag->n_polarizable_pts; j++, idx++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;
            pt->elec_field_wf = field[idx];
        }
    }
    error:
    free(xyz);
    free(field);
    return res;
}

static void
compute_elec_field_range(struct efp *efp, size_t from, size_t to, void *data)
{
    (void)data;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
	for (size_t i = from; i < to; i++) {
        if (i == efp->opts.special_fragment &&
        !(efp->opts.special_terms & EFP_SPEC_TERM_POL))
            continue;
        // const struct frag *frag = efp->frags + i;
		struct frag *frag = efp->frags + i;

		for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
		    struct polarizable_pt *pt = frag->polarizable_pts + j;

            pt->elec_field = get_elec_field(efp, i, j);
		}
	}
}

static void
compute_ligand_field_range(struct efp *efp, size_t from, size_t to, void *data)
{
    (void)data;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
	for (size_t i = from; i < to; i++) {
		struct frag *frag = efp->frags + i;

		for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;
            pt->ligand_field = get_ligand_field(efp, i, j, efp->opts.ligand);
        }
	}
}

static void
compute_fragment_field_range(struct efp *efp, size_t from, size_t to, void *data)
{
    (void)data;

    struct ligand *ligand = efp->ligand;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
	for (size_t i = from; i < to; i++) {
		struct frag *frag = efp->frags + i;

		for (size_t j = 0; j < ligand->n_ligand_pts; j++) {
            struct ligand_pt *pt = ligand->ligand_pts + j;
			pt->fragment_field[i] = get_ligand_field(efp, efp->ligand_index, j, i);
		}
	}
}

static enum efp_result
compute_elec_field(struct efp *efp) {

    enum efp_result res;

    efp_balance_work(efp, compute_elec_field_range, NULL);

	if (efp->opts.enable_pairwise) {
		// this is field due to ligand on a fragment point
		// for QM ligand this is a field due to QM nuclei
		efp_balance_work(efp, compute_ligand_field_range, NULL);
		// no contribution if ligand is QM
        if (efp->opts.ligand != -1) {
            // this is field due to fragment(s) on ligand points
            efp_balance_work(efp, compute_fragment_field_range, NULL);
        }
	}

    // this part is needed for interface with PSI4 only
    if (efp->opts.terms & EFP_TERM_AI_POL)
        if ((res = add_electron_density_field(efp)))
            return res;

    return EFP_RESULT_SUCCESS;
}

static enum efp_result
compute_elec_field_crystal(struct efp *efp)
{
    int do_pairwise = (efp->opts.enable_pairwise && efp->opts.ligand > -1) ? 1 : 0;
    enum efp_result res;

    int nsymm = efp->nsymm_frag;
    size_t *unique_frag = (size_t *)calloc(nsymm, sizeof(size_t));
    unique_symm_frag(efp, unique_frag);

    // This is not parallelized!!!
    for (size_t i = 0; i < nsymm; i++) {
        struct frag *frag = efp->frags + unique_frag[i];

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            frag->polarizable_pts[j].elec_field = get_elec_field(efp, unique_frag[i], j);
            frag->polarizable_pts[j].elec_field_wf = vec_zero;
        }
    }

    if (do_pairwise) {
        struct ligand *ligand = efp->ligand;

        for (size_t i = 0; i < efp->n_frag; i++) {
            if (i != efp->ligand_index) {
                // field on ligand due to other fragments "i"
                struct frag *frag = efp->frags + i;
                for (size_t lp = 0; lp < ligand->n_ligand_pts; lp++) {
                    struct ligand_pt *pt = ligand->ligand_pts + lp;
                    pt->fragment_field[i] = get_ligand_field(efp, efp->ligand_index, lp, i);
                }
                // field on fragments "i" due to ligand
                for (size_t p = 0; p < frag->n_polarizable_pts; p++) {
                    frag->polarizable_pts[p].ligand_field =
                            get_ligand_field(efp, i, p, efp->ligand_index);
                }
            }
        }
    }

    return EFP_RESULT_SUCCESS;
}

static void
get_induced_dipole_field(struct efp *efp, size_t frag_idx,
    struct polarizable_pt *pt, vec_t *field, vec_t *field_conj)
{
	struct frag *fr_i = efp->frags + frag_idx;

	*field = vec_zero;
	*field_conj = vec_zero;

	for (size_t j = 0; j < efp->n_frag; j++) {
		if (j == frag_idx)
			continue;
		// use skiplist only for no-symmetry systems
		// in symmetric crystals skiplist is setup for pairwise calculations,
		// but here we need field due to all induced dipoles
        if (efp->opts.symmetry == 0 && efp_skip_frag_pair(efp, frag_idx, j))
            continue;

        if (j == efp->opts.special_fragment &&
            !(efp->opts.special_terms & EFP_SPEC_TERM_POL))
            continue;

        struct frag *fr_j = efp->frags + j;
		struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
		if (swf.swf == 0)
		    continue;

		for (size_t jj = 0; jj < fr_j->n_polarizable_pts; jj++) {
			struct polarizable_pt *pt_j = fr_j->polarizable_pts+jj;

			vec_t dr = {
				pt->x - pt_j->x + swf.cell.x,
				pt->y - pt_j->y + swf.cell.y,
				pt->z - pt_j->z + swf.cell.z
			};

			double r = vec_len(&dr);
			double r3 = r * r * r;
			double r5 = r3 * r * r;

            double t1 = vec_dot(&pt_j->indip, &dr);
            double t2 = vec_dot(&pt_j->indipconj, &dr);

			double p1 = 1.0;

			if (efp->opts.pol_damp == EFP_POL_DAMP_TT) {
				p1 = efp_get_pol_damp_tt(r, fr_i->pol_damp,
				    fr_j->pol_damp);
			}
			field->x -= swf.swf * p1 * (pt_j->indip.x / r3 -
			    3.0 * t1 * dr.x / r5);
			field->y -= swf.swf * p1 * (pt_j->indip.y / r3 -
			    3.0 * t1 * dr.y / r5);
			field->z -= swf.swf * p1 * (pt_j->indip.z / r3 -
			    3.0 * t1 * dr.z / r5);

			field_conj->x -= swf.swf * p1 *
			    (pt_j->indipconj.x / r3 - 3.0 * t2 * dr.x / r5);
			field_conj->y -= swf.swf * p1 *
			    (pt_j->indipconj.y / r3 - 3.0 * t2 * dr.y / r5);
			field_conj->z -= swf.swf * p1 *
			    (pt_j->indipconj.z / r3 - 3.0 * t2 * dr.z / r5);
        }
	}
}

static bool
if_clean_indip(struct efp *efp, int counter) {
    return (counter == 0);
}

static bool
if_clean_field(struct efp *efp, int counter) {
    return (counter == 0);
}

static void
zero_ind_dipoles(struct efp *efp, size_t from, size_t to, void *data)
{

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
    for (size_t i = from; i < to; i++) {
        struct frag *frag = efp->frags + i;

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            pt->indip = vec_zero;
            pt->indipconj = vec_zero;
            pt->indip_old = vec_zero;
            pt->indipconj_old = vec_zero;
        }
    }
}

static void
copy_indip_gs(struct efp *efp, size_t from, size_t to, void *data)
{

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
    for (size_t i = from; i < to; i++) {
        struct frag *frag = efp->frags + i;

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            pt->indip_gs = pt->indip;
            pt->indipconj_gs = pt->indipconj;
        }
    }
}

static void
zero_static_field(struct efp *efp, size_t from, size_t to, void *data)
{

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
    for (size_t i = from; i < to; i++) {
        struct frag *frag = efp->frags + i;

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            pt->elec_field = vec_zero;
            pt->ligand_field = vec_zero;
            pt->elec_field_wf = vec_zero;
        }
    }
}

static void
compute_id_range(struct efp *efp, size_t from, size_t to, void *data)
{
	double conv = 0.0;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic) reduction(+:conv)
#endif
	for (size_t i = from; i < to; i++) {

        if (i == efp->opts.special_fragment &&
            !(efp->opts.special_terms & EFP_SPEC_TERM_POL))
            continue;

        struct frag *frag = efp->frags + i;

		for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
			struct polarizable_pt *pt = frag->polarizable_pts + j;
			vec_t field, field_conj;

			/* electric field from other induced dipoles */
			get_induced_dipole_field(efp, i, pt, &field,
			    &field_conj);

			/* add field that doesn't change during scf */
			field.x += pt->elec_field.x + pt->elec_field_wf.x;
			field.y += pt->elec_field.y + pt->elec_field_wf.y;
			field.z += pt->elec_field.z + pt->elec_field_wf.z;

			field_conj.x += pt->elec_field.x + pt->elec_field_wf.x;
			field_conj.y += pt->elec_field.y + pt->elec_field_wf.y;
			field_conj.z += pt->elec_field.z + pt->elec_field_wf.z;

			memcpy(&pt->indip_old, &pt->indip, sizeof(vec_t));
            memcpy(&pt->indipconj_old, &pt->indipconj, sizeof(vec_t));

            pt->indip = mat_vec(&pt->tensor, &field);
            pt->indipconj = mat_trans_vec(&pt->tensor, &field_conj);

            conv += vec_dist(&pt->indip, &pt->indip_old);
            conv += vec_dist(&pt->indipconj, &pt->indipconj_old);
		}
	}

    *(double *)data += conv;
}

static void
compute_id_crystal(struct efp *efp, void *data)
{
    // This is not parallelized!!!
    double conv = 0.0;

    int nsymm = efp->nsymm_frag;
    size_t *unique_frag = (size_t *)calloc(nsymm, sizeof(size_t));
    unique_symm_frag(efp, unique_frag);
    size_t *nsymm_frag = (size_t *)calloc(nsymm, sizeof(size_t));
    n_symm_frag(efp, nsymm_frag);


    // step 1: compute induced dipoles on symmetry-unique fragments
    for (int i = 0; i < nsymm; i++) {
        struct frag *frag = efp->frags + unique_frag[i];

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;
            vec_t field, field_conj;

            /* electric field from other induced dipoles */
            get_induced_dipole_field(efp, unique_frag[i], pt, &field,
                                     &field_conj);
            /* add field that doesn't change during scf */
            field.x += pt->elec_field.x + pt->elec_field_wf.x;
            field.y += pt->elec_field.y + pt->elec_field_wf.y;
            field.z += pt->elec_field.z + pt->elec_field_wf.z;

            field_conj.x += pt->elec_field.x + pt->elec_field_wf.x;
            field_conj.y += pt->elec_field.y + pt->elec_field_wf.y;
            field_conj.z += pt->elec_field.z + pt->elec_field_wf.z;

            memcpy(&pt->indip_old, &pt->indip, sizeof(vec_t));
            memcpy(&pt->indipconj_old, &pt->indipconj, sizeof(vec_t));

            pt->indip = mat_vec(&pt->tensor, &field);
            pt->indipconj = mat_trans_vec(&pt->tensor, &field_conj);

            conv += nsymm_frag[i]*vec_dist(&pt->indip, &pt->indip_old);
            conv += nsymm_frag[i]*vec_dist(&pt->indipconj, &pt->indipconj_old);
        }
    }
    *(double *)data += conv;

    // step 2: broadcast induced dipoles to symmetry-identical fragments
    for (int j=0; j<nsymm; j++){
        // printf("\n unique_frag %d", unique_frag[j]);
        struct frag *symmfrag = efp->frags + unique_frag[j];
        for (size_t i=0; i<efp->n_frag; i++){
            if (i == unique_frag[j]) // do nothing for self
                continue;

            // found same-symmetry fragment, copy induced dipoles
            // printf("\n symm i %d, symm j %d", efp->symmlist[i], efp->symmlist[unique_frag[j]]);
            if (efp->symmlist[i] == efp->symmlist[unique_frag[j]]){
                struct frag *frag = efp->frags + i;
                // compute rotation matrix between two fragments
                mat_t rotmat;
                rotmat = rotmat_2frags(&symmfrag->rotmat, &frag->rotmat);
                //printf("\n rotmat: %lf, %lf, %lf ", rotmat.xy, rotmat.xz, rotmat.yz);

                for (size_t p=0; p<frag->n_polarizable_pts; p++) {
                    struct polarizable_pt *pt_symm = symmfrag->polarizable_pts + p;
                    struct polarizable_pt *pt = frag->polarizable_pts + p;
                    // rotate induced dipole and copy
                    pt->indip = mat_vec(&rotmat, &pt_symm->indip);
                    pt->indipconj = mat_vec(&rotmat, &pt_symm->indipconj);
                }
            }
        }
    }
}

static double
pol_scf_iter(struct efp *efp)
{
	size_t npts = efp->n_polarizable_pts;
	double conv = 0.0;

	if (efp->opts.symmetry == 0) { // original case
        efp_balance_work(efp, compute_id_range, &conv);
        efp_allreduce(&conv, 1);
    }
	else {   // crystal symmetry
        compute_id_crystal(efp, &conv);
	}

	// printing out information on convergence
	if (efp->opts.print > 0)
        printf(" IND DIPOLES NORM: %lf \n", conv / npts / 2);
	if (efp->opts.print > 1) {
        for (size_t i = 0; i < efp->n_frag; i++) {
            struct frag *frag = efp->frags + i;
            for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
                struct polarizable_pt *pt = frag->polarizable_pts + j;
                if (vec_len(&pt->indip) > INDIP_PRINT_TRESH) {
                    printf("\n WARNING: induced dipole %zu on fragment %zu: %lf ", j, i, vec_len(&pt->indip));
                }
            }
        }
    }

    return conv / npts / 2;
}

static void
compute_energy_range(struct efp *efp, size_t from, size_t to, void *data)
{
	double energy = 0.0;

    // if_pairwise tells whether pairwise calculations with EFP (not QM) ligand
    bool if_pairwise = efp->opts.enable_pairwise && efp->opts.ligand > -1;

    struct ligand *ligand;
	if (if_pairwise)
        ligand = efp->ligand;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic) reduction(+:energy)
#endif
    for (size_t i = from; i < to; i++) {

        // skip energy contribution for a special fragment in case of torch model with elpot
        // this assumes that we use ml/efp fragment that induces field to other fragments due to its efp nature (multipoles and ind dipoles)
        // this needs to be changed if ml fragment uses ml-predicted charges instead
        if (efp->opts.enable_elpot && efp->opts.special_fragment == i) continue;

        struct frag *frag = efp->frags + i;

        // zeroing out polarization pair energies is a must
        efp->pair_energies[i].polarization = 0.0;

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            energy += 0.5 * vec_dot(&pt->indipconj, &pt->elec_field_wf) -
                      0.5 * vec_dot(&pt->indip, &pt->elec_field);

            // This part is for non-QM ligand only
            // Interaction of indip on this fragment with ligand's field on this fragment
            if (if_pairwise)
                if (i != efp->ligand_index)
                    efp->pair_energies[i].polarization += - 0.5 * vec_dot(&pt->indip, &pt->ligand_field);

            // ligand is a QM region
            // all fragments get contributions due to interaction with QM wavefunction and QM nuclei
            // (ligand field contains field due to QM nuclei in the case of QM ligand)
            if (efp->opts.enable_pairwise && efp->opts.ligand == -1) {
                efp->pair_energies[i].polarization += 0.5 * vec_dot(&pt->indipconj, &pt->elec_field_wf);
                efp->pair_energies[i].polarization += -0.5 * vec_dot(&pt->indip, &pt->ligand_field);
            }
        }

        // this part is for non-QM ligand only
        // interaction of ligand indip with the field due to this fragment
        if (if_pairwise)
            if ( i != efp->ligand_index )
                for (size_t lp = 0; lp < ligand->n_ligand_pts; lp++) {
                    struct ligand_pt *lpt = ligand->ligand_pts + lp;
                    struct polarizable_pt *pt = ligand->ligand_frag->polarizable_pts + lp;

                    efp->pair_energies[i].polarization +=
                            - 0.5 * vec_dot(&pt->indip, &lpt->fragment_field[i]);
                }
    }

    if (efp->opts.print > 2 && efp->opts.enable_pairwise) {
        printf("\n Pairwise analysis from compute_energy_range() follows \n");
        print_energies(efp);
    }

    *(double *)data += energy;
}

static void
compute_energy_correction_range(struct efp *efp, size_t from, size_t to, void *data)
{
    double energy = 0.0;

    // tells whether pairwise analysis with non-QM ligand
    bool if_pairwise = efp->opts.enable_pairwise && efp->opts.ligand > -1;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic) reduction(+:energy)
#endif
    for (size_t i = from; i < to; i++) {
        struct frag *frag = efp->frags + i;
        // zeroing out polarization pair energies to avoid double-counting for excited states
        efp->pair_energies[i].exs_polarization = 0.0;
        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            energy += 0.5 * vec_dot(&pt->indipconj, &pt->elec_field_wf) -
                      0.5 * vec_dot(&pt->indip, &pt->elec_field);

            vec_t vec1 = vec_sub(&pt->indipconj,&pt->indipconj_gs);
            vec_t vec2 = vec_sub(&pt->indip, &pt->indip_gs);
            vec_t ddip = vec_add(&vec1, &vec2);

            energy -= 0.5 * vec_dot( &ddip, &pt->elec_field_wf);

            // non-QM ligand. Is this part ever used?
            if (if_pairwise)
                if (i != efp->ligand_index)
                    efp->pair_energies[i].exs_polarization +=
                            - 0.5 * vec_dot(&pt->indip, &pt->ligand_field);

            // ligand is a QM region
            // contributions due to excited state wavefunction and QM nuclei
            if (efp->opts.enable_pairwise && efp->opts.ligand == -1) {
                efp->pair_energies[i].exs_polarization +=
                        0.5 * vec_dot(&pt->indipconj, &pt->elec_field_wf);
                efp->pair_energies[i].exs_polarization -=
                        0.5 * vec_dot(&ddip, &pt->elec_field_wf);
                efp->pair_energies[i].exs_polarization +=
                        - 0.5 * vec_dot(&pt->indip, &pt->ligand_field);
            }
        }
        // subtract ground state polarization contributions
        efp->pair_energies[i].exs_polarization -= efp->pair_energies[i].polarization;
    }

    *(double *)data += energy;
}

static void
compute_energy_crystal(struct efp *efp, double *polenergy)
{
    double energy = 0.0;
    int do_pairwise = (efp->opts.enable_pairwise && efp->opts.ligand > -1) ? 1 : 0;

    int nsymm = efp->nsymm_frag;
    size_t *unique_frag = (size_t *)calloc(nsymm, sizeof(size_t));
    unique_symm_frag(efp, unique_frag);

    size_t *nsymm_frag = (size_t *)calloc(nsymm, sizeof(size_t));
    n_symm_frag(efp, nsymm_frag);

    struct ligand *ligand;
    if (do_pairwise)
        ligand = efp->ligand;

    for (int k=0; k<nsymm; k++) {
        size_t i = unique_frag[k];
        struct frag *frag = efp->frags + i;

        size_t factor = nsymm_frag[k];

        for (size_t j = 0; j < frag->n_polarizable_pts; j++) {
            struct polarizable_pt *pt = frag->polarizable_pts + j;

            energy += factor * (0.5 * vec_dot(&pt->indipconj, &pt->elec_field_wf) -
                                0.5 * vec_dot(&pt->indip, &pt->elec_field));

            if (do_pairwise && i == efp->ligand_index) {
                for (size_t fr = 0; fr < efp->n_frag; fr++) {
                    if (fr == i)
                        continue;

                    struct frag *other_frag = efp->frags + fr;
                    efp->pair_energies[fr].polarization +=
                            -0.5 * vec_dot(&pt->indip, &ligand->ligand_pts[j].fragment_field[fr]);
                            //vec_dot(&pt->indip, &efp->fragment_field[other_frag->fragment_field_offset + j]);
                }
            }
        }

        if (do_pairwise && i == efp->ligand_index) {
            for (size_t fr = 0; fr < efp->n_frag; fr++) {
                if (fr == i)
                    continue;

                struct frag *other_frag = efp->frags + fr;
                for (size_t p = 0; p < other_frag->n_polarizable_pts; p++) {
                    struct polarizable_pt *pt = other_frag->polarizable_pts + p;
                    // size_t idx = other_frag->polarizable_offset + p;

                    efp->pair_energies[fr].polarization +=
                            -0.5 * vec_dot(&pt->indip, &pt->ligand_field);
                }
            }
        }
    }
    *polenergy = energy;
}

static enum efp_result
efp_compute_id_iterative(struct efp *efp)
{
	for (size_t iter = 1; iter <= POL_SCF_MAX_ITER; iter++) {
		if (pol_scf_iter(efp) < POL_SCF_TOL)
			break;
		if (iter == POL_SCF_MAX_ITER)
			return EFP_RESULT_POL_NOT_CONVERGED;
	}
	return EFP_RESULT_SUCCESS;
}

enum efp_result
efp_compute_pol_energy(struct efp *efp, double *energy)
{
	enum efp_result res;

	assert(energy);

 	// counter to know when to zero out induced dipoles and static field
	// need to be explored further
	static int counter = 0;

    // think how to skip recomputing static field in qm scf iterations
    // check on efp->do_gradient breaks gtests...
    if ((res = compute_elec_field(efp)))
        return res;

	switch (efp->opts.pol_driver) {
	case EFP_POL_DRIVER_ITERATIVE:
		res = efp_compute_id_iterative(efp);
		break;
	case EFP_POL_DRIVER_DIRECT:
		res = efp_compute_id_direct(efp);
		break;
	}

	if (res)
		return res;

	if (efp->opts.print > 3) {
        for (int i = 0; i < efp->n_frag; i++) {
            printf("Fragment %d\n", i);
            for (int j = 0; j < efp->frags[i].n_polarizable_pts; j++) {
                print_pol_pt(efp, i, j);
            }
        }
    }

	*energy = 0.0;
	efp_balance_work(efp, compute_energy_range, energy);
	efp_allreduce(energy, 1);

    efp_balance_work(efp, copy_indip_gs, NULL);

	counter++;

    return EFP_RESULT_SUCCESS;
}

enum efp_result
efp_compute_pol_correction(struct efp *efp, double *energy)
{
    enum efp_result res;

    assert(energy);

    // do not need to recompute static field for excited state correction
    //if ((res = compute_elec_field(efp)))
    //    return res;

    switch (efp->opts.pol_driver) {
        case EFP_POL_DRIVER_ITERATIVE:
            res = efp_compute_id_iterative(efp);
            break;
        case EFP_POL_DRIVER_DIRECT:
            res = efp_compute_id_direct(efp);
            break;
    }

    if (res)
        return res;

	if (efp->opts.print > 3) {
        for (int i = 0; i < efp->n_frag; i++) {
            printf("Fragment %d\n", i);
            for (int j = 0; j < efp->frags[i].n_polarizable_pts; j++) {
                print_pol_pt(efp, i, j);
            }
        }
    }

    *energy = 0.0;
    efp_balance_work(efp, compute_energy_correction_range, energy);
    efp_allreduce(energy, 1);

    *energy -= efp->energy.polarization;

    return EFP_RESULT_SUCCESS;
}

enum efp_result
efp_compute_pol_energy_crystal(struct efp *efp, double *energy)
{
    enum efp_result res;

    assert(energy);

    // counter to know when to zero out induced dipoles and static field
    static int counter_crystal = 0;

    // think how to skip recomputing static field in qm scf iterations
    // check on efp->do_gradient breaks gtests...
    if ((res = compute_elec_field_crystal(efp)))
        return res;

    if ((res = efp_compute_id_iterative(efp)))
        return res;

    if (efp->opts.print > 3) {
        for (int i = 0; i < efp->n_frag; i++) {
            printf("Fragment %d\n", i);
            for (int j = 0; j < efp->frags[i].n_polarizable_pts; j++) {
                print_pol_pt(efp, i, j);
            }
        }
    }

    *energy = 0.0;
    compute_energy_crystal(efp, energy);

    return EFP_RESULT_SUCCESS;
}

static void
compute_grad_point(struct efp *efp, size_t frag_idx, size_t pt_idx)
{
	const struct frag *fr_i = efp->frags + frag_idx;
	const struct polarizable_pt *pt_i = fr_i->polarizable_pts + pt_idx;
	vec_t force, add_i, add_j, force_, add_i_, add_j_;
	double e;

    vec_t dipole_i = {
            0.5 * (pt_i->indip.x + pt_i->indipconj.x),
            0.5 * (pt_i->indip.y + pt_i->indipconj.y),
            0.5 * (pt_i->indip.z + pt_i->indipconj.z),
    };

    for (size_t j = 0; j < efp->n_frag; j++) {
		if (j == frag_idx || efp_skip_frag_pair(efp, frag_idx, j))
			continue;

        // the code below skips gradient contributions to a special (ml) fragment in case of torch model with elpot
        // this assumes that we use ml/efp fragment that induces field to other fragments due to its efp nature (multipoles and ind dipoles)
        // this needs to be changed if ml fragment uses ml-predicted charges instead

        // this is true for normal cases not related to torch model with elpot
        bool not_torch_elpot = !efp->opts.enable_elpot || (efp->opts.special_fragment != frag_idx && efp->opts.special_fragment != j);
        // true when torch with elpot is invoked and fr_idx is the ml fragment
        bool torch_elpot_i = efp->opts.enable_elpot && (efp->opts.special_fragment == frag_idx);
        // true when torch with elpot is invoked and j is the ml fragment
        bool torch_elpot_j = efp->opts.enable_elpot && (efp->opts.special_fragment == j);

        struct frag *fr_j = efp->frags + j;
		struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
		if (swf.swf == 0.0)
		    continue;

		/* energy without switching applied */
		double energy = 0.0;

		/* induced dipole - multipoles */
		for (size_t k = 0; k < fr_j->n_multipole_pts; k++) {
			struct multipole_pt *pt_j = fr_j->multipole_pts + k;

			vec_t dr = {
				pt_j->x - pt_i->x - swf.cell.x,
				pt_j->y - pt_i->y - swf.cell.y,
				pt_j->z - pt_i->z - swf.cell.z
			};

			double p1 = 1.0, p2 = 0.0;

			if (efp->opts.pol_damp == EFP_POL_DAMP_TT) {
				double r = vec_len(&dr);

				p1 = efp_get_pol_damp_tt(r, fr_i->pol_damp,
				    fr_j->pol_damp);
				p2 = efp_get_pol_damp_tt_grad(r, fr_i->pol_damp,
				    fr_j->pol_damp);
			}

			force = vec_zero;
			add_i = vec_zero;
			add_j = vec_zero;

			/* induced dipole - charge+monopole */
			if (pt_j->if_mon || pt_j->if_znuc) {
                double qj = pt_j->monopole + pt_j->znuc;
                e = -efp_charge_dipole_energy(qj, &dipole_i, &dr);
                efp_charge_dipole_grad(qj, &dipole_i, &dr,
                                       &force_, &add_j_, &add_i_);
                vec_negate(&force_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			/* induced dipole - dipole */
			if (pt_j->if_dip) {
                e += efp_dipole_dipole_energy(&dipole_i,
                                              &pt_j->dipole, &dr);
                efp_dipole_dipole_grad(&dipole_i, &pt_j->dipole, &dr,
                                       &force_, &add_i_, &add_j_);
                vec_negate(&add_j_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			/* induced dipole - quadrupole */
            if (pt_j->if_quad) {
                e += efp_dipole_quadrupole_energy(&dipole_i,
                                                  pt_j->quadrupole, &dr);
                efp_dipole_quadrupole_grad(&dipole_i, pt_j->quadrupole,
                                           &dr, &force_, &add_i_, &add_j_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			/* induced dipole - octupole interactions are ignored */

			vec_scale(&force, p1);
			vec_scale(&add_i, p1);
			vec_scale(&add_j, p1);

			force.x += p2 * e * dr.x;
			force.y += p2 * e * dr.y;
			force.z += p2 * e * dr.z;

			vec_scale(&force, swf.swf);
			vec_scale(&add_i, swf.swf);
			vec_scale(&add_j, swf.swf);

            efp_add_stress(&swf.dr, &force, &efp->stress);

            // normal case
            if (not_torch_elpot) {
                efp_add_force(efp->grad + frag_idx, CVEC(fr_i->x), CVEC(pt_i->x), &force, &add_i);
                efp_sub_force(efp->grad + j, CVEC(fr_j->x), CVEC(pt_j->x), &force, &add_j);
                energy += p1 * e;
            }

            // adding gradients to non-ML fragment only in torch elpot model
            if (torch_elpot_i)  efp_sub_force(efp->grad + j, CVEC(fr_j->x), CVEC(pt_j->x), &force, &add_j);
            if (torch_elpot_j)  efp_add_force(efp->grad + frag_idx, CVEC(fr_i->x), CVEC(pt_i->x), &force, &add_i);
		}

		/* induced dipole - induced dipoles */
		for (size_t jj = 0; jj < fr_j->n_polarizable_pts; jj++) {
			struct polarizable_pt *pt_j = fr_j->polarizable_pts+jj;
			// size_t idx_j = fr_j->polarizable_offset+jj;

			vec_t dr = {
				pt_j->x - pt_i->x - swf.cell.x,
				pt_j->y - pt_i->y - swf.cell.y,
				pt_j->z - pt_i->z - swf.cell.z
			};

            vec_t half_dipole_i = {
                    0.5 * pt_i->indip.x,
                    0.5 * pt_i->indip.y,
                    0.5 * pt_i->indip.z,
            };

			double p1 = 1.0, p2 = 0.0;

			if (efp->opts.pol_damp == EFP_POL_DAMP_TT) {
				double r = vec_len(&dr);

				p1 = efp_get_pol_damp_tt(r, fr_i->pol_damp,
				    fr_j->pol_damp);
				p2 = efp_get_pol_damp_tt_grad(r, fr_i->pol_damp,
				    fr_j->pol_damp);
			}

            e = efp_dipole_dipole_energy(&half_dipole_i, &pt_j->indipconj, &dr);
            efp_dipole_dipole_grad(&half_dipole_i, &pt_j->indipconj, &dr, &force, &add_i, &add_j);
			vec_negate(&add_j);

			vec_scale(&force, p1);
			vec_scale(&add_i, p1);
			vec_scale(&add_j, p1);

			force.x += p2 * e * dr.x;
			force.y += p2 * e * dr.y;
			force.z += p2 * e * dr.z;

			vec_scale(&force, swf.swf);
			vec_scale(&add_i, swf.swf);
			vec_scale(&add_j, swf.swf);

            efp_add_stress(&swf.dr, &force, &efp->stress);

            // normal case
            if (not_torch_elpot) {
                efp_add_force(efp->grad + frag_idx, CVEC(fr_i->x), CVEC(pt_i->x), &force, &add_i);
                efp_sub_force(efp->grad + j, CVEC(fr_j->x), CVEC(pt_j->x), &force, &add_j);
                energy += p1 * e;
            }

            // adding gradients to non-ML fragment only in torch elpot model
            if (torch_elpot_i)  efp_sub_force(efp->grad + j, CVEC(fr_j->x), CVEC(pt_j->x), &force, &add_j);
            if (torch_elpot_j)  efp_add_force(efp->grad + frag_idx, CVEC(fr_i->x), CVEC(pt_i->x), &force, &add_i);
		}

		force.x = swf.dswf.x * energy;
		force.y = swf.dswf.y * energy;
		force.z = swf.dswf.z * energy;
		six_atomic_add_xyz(efp->grad + frag_idx, &force);
		six_atomic_sub_xyz(efp->grad + j, &force);
		efp_add_stress(&swf.dr, &force, &efp->stress);
	}

	/* induced dipole - ab initio nuclei */
	if (efp->opts.terms & EFP_TERM_AI_POL) {
		for (size_t j = 0; j < efp->n_ptc; j++) {
			vec_t dr = vec_sub(efp->ptc_xyz + j, CVEC(pt_i->x));

			efp_charge_dipole_grad(efp->ptc[j], &dipole_i, &dr,
			    &force, &add_j, &add_i);
			vec_negate(&add_i);
			vec_atomic_add(efp->ptc_grad + j, &force);
			efp_sub_force(efp->grad + frag_idx, CVEC(fr_i->x),
			    CVEC(pt_i->x), &force, &add_i);
		}
	}
}

static void
compute_grad_range(struct efp *efp, size_t from, size_t to, void *data)
{
	(void)data;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic)
#endif
	for (size_t i = from; i < to; i++)
		for (size_t j = 0; j < efp->frags[i].n_polarizable_pts; j++)
			compute_grad_point(efp, i, j);
}

enum efp_result
efp_compute_pol(struct efp *efp)
{
	enum efp_result res;

	if (!(efp->opts.terms & EFP_TERM_POL) &&
	    !(efp->opts.terms & EFP_TERM_AI_POL))
		return EFP_RESULT_SUCCESS;

	// this is standard non-symmetric case
	if (! efp->opts.symmetry) {
        if ((res = efp_compute_pol_energy(efp, &efp->energy.polarization)))
            return res;

        if (efp->do_gradient)
            efp_balance_work(efp, compute_grad_range, NULL);
    }
	// for symmetric crystals only
	else {
        if ((res = efp_compute_pol_energy_crystal(efp, &efp->energy.polarization)))
            return res;
        // and of course no gradients...
	}

	return EFP_RESULT_SUCCESS;
}

void
efp_update_pol(struct frag *frag)
{
	for (size_t i = 0; i < frag->n_polarizable_pts; i++) {
		efp_move_pt(CVEC(frag->x), &frag->rotmat,
		    CVEC(frag->lib->polarizable_pts[i].x),
		    VEC(frag->polarizable_pts[i].x));

		const mat_t *in = &frag->lib->polarizable_pts[i].tensor;
		mat_t *out = &frag->polarizable_pts[i].tensor;

		efp_rotate_t2(&frag->rotmat, (const double *)in, (double *)out);
	}
}

EFP_EXPORT enum efp_result
efp_get_electric_field(struct efp *efp, size_t frag_idx, const double *xyz,
    double *field)
{
	assert(efp);
	assert(frag_idx < efp->n_frag);
	assert(xyz);
	assert(field);

	const struct frag *frag = efp->frags + frag_idx;
	vec_t elec_field = vec_zero;

	for (size_t i = 0; i < efp->n_frag; i++) {
		if (i == frag_idx || efp_skip_frag_pair(efp, i, frag_idx))
			continue;

		const struct frag *fr_i = efp->frags + i;
		struct swf swf = efp_make_swf(efp, fr_i, frag, 0);
        if (swf.swf == 0.0)
            continue;

		/* field due to multipoles */
		for (size_t j = 0; j < fr_i->n_multipole_pts; j++) {
			const struct multipole_pt *mpt = fr_i->multipole_pts+j;
			vec_t mult_field = get_multipole_field(
			    (const vec_t *)xyz, mpt, &swf);

			elec_field.x += mult_field.x;
			elec_field.y += mult_field.y;
			elec_field.z += mult_field.z;
		}

		/* field due to induced dipoles */
		for (size_t j = 0; j < fr_i->n_polarizable_pts; j++) {
			struct polarizable_pt *pt_i = fr_i->polarizable_pts + j;

			vec_t dr = {
				xyz[0] - pt_i->x - swf.cell.x,
				xyz[1] - pt_i->y - swf.cell.y,
				xyz[2] - pt_i->z - swf.cell.z
			};

			double r = vec_len(&dr);
			double r3 = r * r * r;
			double r5 = r3 * r * r;
			// double t1 = vec_dot(&efp->indip[idx], &dr);
            double t1 = vec_dot(&pt_i->indip, &dr);

            elec_field.x -= swf.swf * (pt_i->indip.x / r3 -
                                       3.0 * t1 * dr.x / r5);
            elec_field.y -= swf.swf * (pt_i->indip.y / r3 -
                                       3.0 * t1 * dr.y / r5);
            elec_field.z -= swf.swf * (pt_i->indip.z / r3 -
                                       3.0 * t1 * dr.z / r5);

        }
	}

	if (efp->opts.terms & EFP_TERM_AI_POL) {
		/* field due to nuclei from ab initio subsystem */
		for (size_t i = 0; i < efp->n_ptc; i++) {
			vec_t dr = vec_sub((const vec_t *)xyz, efp->ptc_xyz+i);

			double r = vec_len(&dr);
			double r3 = r * r * r;

			elec_field.x += efp->ptc[i] * dr.x / r3;
			elec_field.y += efp->ptc[i] * dr.y / r3;
			elec_field.z += efp->ptc[i] * dr.z / r3;
		}
	}

	*((vec_t *)field) = elec_field;
	return EFP_RESULT_SUCCESS;
}

EFP_EXPORT enum efp_result
efp_get_elec_potential(struct efp *efp, size_t frag_idx, const double *xyz,
                       double *elec_potential)
{
    assert(efp);
    assert(frag_idx < efp->n_frag);
    assert(xyz);
    assert(elec_potential);

    const struct frag *frag = efp->frags + frag_idx;
    double elpot = 0.0;

    for (size_t i = 0; i < efp->n_frag; i++) {
        if (i == frag_idx || efp_skip_frag_pair(efp, i, frag_idx))
            continue;

        const struct frag *fr_i = efp->frags + i;
        struct swf swf = efp_make_swf(efp, fr_i, frag, 0);
        if (swf.swf == 0.0)
            continue;

        /* potential due to multipoles */
        if (efp->opts.terms & EFP_TERM_ELEC)
            for (size_t j = 0; j < fr_i->n_multipole_pts; j++) {
                const struct multipole_pt *mpt = fr_i->multipole_pts+j;
                elpot += get_multipole_elec_potential((const vec_t *)xyz, mpt, &swf);
             }

        /* potential due to MM atoms */
        if (efp->opts.terms & EFP_TERM_QQ)
            for (size_t j = 0; j < fr_i->n_atoms; j++) {
                const struct efp_atom *atom = fr_i->atoms + j;
                elpot += get_mm_elec_potential((const vec_t *) xyz, atom, &swf);
            }

        /* potential due to induced dipoles */
        if (efp->opts.terms & EFP_TERM_POL) {
            for (size_t j = 0; j < fr_i->n_polarizable_pts; j++) {
                struct polarizable_pt *pt_i = fr_i->polarizable_pts + j;
                //size_t idx = fr_i->polarizable_offset + j;

                vec_t dr = {
                        xyz[0] - pt_i->x - swf.cell.x,
                        xyz[1] - pt_i->y - swf.cell.y,
                        xyz[2] - pt_i->z - swf.cell.z
                };

                double r = vec_len(&dr);
                double r3 = r * r * r;

                // LVS: I think the polarization potential should be 0.5*indip*Ta
                // this is different from what enters QM Hamiltonian (0.5*(indip+indipconj)*Ta)
                // However, the classical potential is not supposed to spend work (energy) on inducing dipoles on other fragments,
                // that's why no need to double the induce dipole
                // this is changed on Oct 25 2024 (after the first ANI/EFP paper is published)
                //elpot += swf.swf * 0.5 * (vec_dot(&pt_i->indip, &dr) + vec_dot(&pt_i->indipconj, &dr)) / r3;
                elpot += swf.swf * 0.5 * vec_dot(&pt_i->indip, &dr) / r3;
            }
        }
    }

    if (efp->opts.terms & EFP_TERM_AI_POL) {
        /* elec potential due to nuclei from ab initio subsystem */
        for (size_t i = 0; i < efp->n_ptc; i++) {
            vec_t dr = vec_sub((const vec_t *)xyz, efp->ptc_xyz+i);

            double r = vec_len(&dr);

            elpot += efp->ptc[i] / r;
        }
    }

    *elec_potential = elpot;
    return EFP_RESULT_SUCCESS;
}
