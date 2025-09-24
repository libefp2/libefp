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

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "stream.h"
#include "private.h"

static void init_multipole_pt(struct multipole_pt *pt) {
    memset(pt, 0, sizeof(*pt));
    pt->screen2 = 10.0;
    pt->screen0 = 10.0;
    pt->if_znuc = false;
    pt->if_mon = false;
    pt->if_dip = false;
    pt->if_quad = false;
    pt->if_oct = false;
    pt->if_scr2 = false;
    pt->if_scr0 = false;
}

static void init_pol_pt(struct polarizable_pt *pt) {
    memset(pt, 0, sizeof(*pt));
}

static int
tok(struct stream *stream, const char *id)
{
	efp_stream_skip_space(stream);

	if (efp_stream_eol(stream))
		return 0;

	if (efp_strncasecmp(efp_stream_get_ptr(stream), id, strlen(id)) == 0)
		return efp_stream_advance(stream, strlen(id));

	return 0;
}

static inline int
tok_stop(struct stream *stream)
{
	if (tok(stream, "STOP")) {
		efp_stream_next_line(stream);
		return 1;
	}
	return 0;
}

static inline int
tok_end(struct stream *stream)
{
	if (tok(stream, "$END")) {
		efp_stream_next_line(stream);
		return 1;
	}
	return 0;
}

static int
skip_label(struct stream *stream)
{
	efp_stream_skip_space(stream);
	efp_stream_skip_nonspace(stream);

	return efp_stream_current_char(stream) != '\0';
}

static int
tok_label(struct stream *stream, size_t size, char *val)
{
	const char *start, *end;

	efp_stream_skip_space(stream);

	if (efp_stream_eol(stream))
		return 0;

	start = efp_stream_get_ptr(stream);
	efp_stream_skip_nonspace(stream);
	end = efp_stream_get_ptr(stream);
	memset(val, 0, size);

	for (size_t i = 0; start < end && i < size - 1; i++)
		*val++ = *start++;

	return start == end;
}

static int
tok_int(struct stream *stream, int *val)
{
	return efp_stream_parse_int(stream, val);
}

static int
tok_uint(struct stream *stream, size_t *val)
{
	int x;

	if (!tok_int(stream, &x))
		return 0;

	if (x < 0)
		return 0;

	if (val)
		*val = (size_t)x;

	return 1;
}

static int
tok_double(struct stream *stream, double *val)
{
	return efp_stream_parse_double(stream, val);
}

static enum efp_result
parse_coordinates(struct frag *frag, struct stream *stream)
{
	efp_stream_next_line(stream);

	while (!efp_stream_eof(stream)) {
		if (tok_stop(stream)) {
			if (frag->n_atoms < 1) {
                efp_log("parse_coordinates() for fragment %s: n_atoms < 1", frag->name);
                return EFP_RESULT_SYNTAX_ERROR;
            }

			return EFP_RESULT_SUCCESS;
		}

		struct efp_atom atom;

		memset(&atom, 0, sizeof(atom));
		if (!tok_label(stream, sizeof(atom.label), atom.label) ||
		    !tok_double(stream, &atom.x) ||
		    !tok_double(stream, &atom.y) ||
		    !tok_double(stream, &atom.z) ||
		    !tok_double(stream, &atom.mass) ||
		    !tok_double(stream, &atom.znuc)) {
            efp_log("parse_coordinates(): reading atom info failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

		if (!eq(atom.mass, 0.0)) {
			frag->n_atoms++;
			frag->atoms = (struct efp_atom *)realloc(frag->atoms,
			    frag->n_atoms * sizeof(struct efp_atom));
			if (frag->atoms == NULL)
				return EFP_RESULT_NO_MEMORY;
			frag->atoms[frag->n_atoms - 1] = atom;
		}

		frag->n_multipole_pts++;
		frag->multipole_pts = (struct multipole_pt *)realloc(
		    frag->multipole_pts,
		    frag->n_multipole_pts * sizeof(struct multipole_pt));
		if (frag->multipole_pts == NULL)
			return EFP_RESULT_NO_MEMORY;

		struct multipole_pt *last_pt =
		    frag->multipole_pts + frag->n_multipole_pts - 1;

		//memset(last_pt, 0, sizeof(*last_pt));
		init_multipole_pt(last_pt);
		strcpy(last_pt->label,atom.label);
		last_pt->x = atom.x;
		last_pt->y = atom.y;
		last_pt->z = atom.z;
        // LVS: let's not use znuc from coordiante section; read it from monopole section instead!
		//last_pt->znuc = atom.znuc;
        //last_pt->if_znuc = true;

		efp_stream_next_line(stream);
	}
	return EFP_RESULT_SYNTAX_ERROR;
}

static enum efp_result
parse_monopoles(struct frag *frag, struct stream *stream)
{
	if (!frag->multipole_pts){
        efp_log("parse_monopoles() failure for fragment %s: no multipole_pts", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);
    int counter = 0;
	for (size_t i = 0; i < frag->n_multipole_pts; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d monopoles of %zu expected in fragment %s \n",
                    counter, frag->n_multipole_pts, frag->name);
            return EFP_RESULT_SUCCESS;
        }

        if (i == 0 && frag->multipole_rank < 1) frag->multipole_rank = 0;

        struct multipole_pt tmp_pt;
        memset(&tmp_pt, 0, sizeof(tmp_pt));
        if (!tok_label(stream, sizeof(tmp_pt.label), tmp_pt.label) ||
		    !tok_double(stream, &tmp_pt.monopole) ||
		    !tok_double(stream, &tmp_pt.znuc)){
            efp_log("parse_monopoles() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }
        for (size_t j = 0; j < frag->n_multipole_pts; j++) {
            if (!strcmp(tmp_pt.label, frag->multipole_pts[j].label)) {
                // found a match
                frag->multipole_pts[j].monopole = tmp_pt.monopole;
                frag->multipole_pts[j].if_mon = true;
                // LVS: use znuc from monopole section now!
                frag->multipole_pts[j].znuc = tmp_pt.znuc;
                frag->multipole_pts[j].if_znuc = true;
                counter++;
                break;
            }
        }
		efp_stream_next_line(stream);
	}

	if (!tok_stop(stream)){
        efp_log("parse_monopoles() failure for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_dipoles(struct frag *frag, struct stream *stream)
{
	if (!frag->multipole_pts){
        efp_log("parse_dipoles() failure for fragment %s: no multipole_pts", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);

    int counter = 0;
    for (size_t i = 0; i < frag->n_multipole_pts; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d dipoles of %zu expected in fragment %s \n",
                   counter, frag->n_multipole_pts, frag->name);
            return EFP_RESULT_SUCCESS;
        }

        if (i == 0 && frag->multipole_rank < 2) frag->multipole_rank = 1;
        if (i == 0) frag->if_mm_frag = false;

        struct multipole_pt tmp_pt;
        memset(&tmp_pt, 0, sizeof(tmp_pt));
        if (!tok_label(stream, sizeof(tmp_pt.label), tmp_pt.label) ||
            !tok_double(stream, &tmp_pt.dipole.x) ||
            !tok_double(stream, &tmp_pt.dipole.y) ||
            !tok_double(stream, &tmp_pt.dipole.z)){
            efp_log("parse_dipoles() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }
        for (size_t j = 0; j < frag->n_multipole_pts; j++) {
            if (!strcmp(tmp_pt.label, frag->multipole_pts[j].label)) {
                // found a match
                frag->multipole_pts[j].dipole.x = tmp_pt.dipole.x;
                frag->multipole_pts[j].dipole.y = tmp_pt.dipole.y;
                frag->multipole_pts[j].dipole.z = tmp_pt.dipole.z;
                frag->multipole_pts[j].if_dip = true;
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }

/*
	for (size_t i = 0; i < frag->n_multipole_pts; i++) {
		if (!skip_label(stream) ||
		    !tok_double(stream, &frag->multipole_pts[i].dipole.x) ||
		    !tok_double(stream, &frag->multipole_pts[i].dipole.y) ||
		    !tok_double(stream, &frag->multipole_pts[i].dipole.z)){
            efp_log("parse_dipoles() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }
		efp_stream_next_line(stream);
	}
*/
	if (!tok_stop(stream)){
        efp_log("parse_dipoles() failure for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_quadrupoles(struct frag *frag, struct stream *stream)
{
	if (!frag->multipole_pts){
        efp_log("quadrupoles() failure: no multipole_pts  for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);

    int counter = 0;
    for (size_t i = 0; i < frag->n_multipole_pts; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d quadrupoles of %zu expected in fragment %s \n",
                   counter, frag->n_multipole_pts, frag->name);
            return EFP_RESULT_SUCCESS;
        }

        if (i == 0 && frag->multipole_rank < 3) frag->multipole_rank = 2;
        if (i == 0) frag->if_mm_frag = false;

        struct multipole_pt tmp_pt;
        memset(&tmp_pt, 0, sizeof(tmp_pt));
        if (!tok_label(stream, sizeof(tmp_pt.label), tmp_pt.label) ||
            !tok_double(stream, &tmp_pt.quadrupole[0]) ||
            !tok_double(stream, &tmp_pt.quadrupole[1]) ||
            !tok_double(stream, &tmp_pt.quadrupole[2]) ||
            !tok_double(stream, &tmp_pt.quadrupole[3]) ||
            !tok_double(stream, &tmp_pt.quadrupole[4]) ||
            !tok_double(stream, &tmp_pt.quadrupole[5]) ){
            efp_log("parse_quadrupoles() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }
        for (size_t j = 0; j < frag->n_multipole_pts; j++) {
            if (!strcmp(tmp_pt.label, frag->multipole_pts[j].label)) {
                // found a match
                for (int q=0; q<6; q++) {
                    frag->multipole_pts[j].quadrupole[q] = tmp_pt.quadrupole[q];
                }
                frag->multipole_pts[j].if_quad = true;
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }
/*
    for (size_t i = 0; i < frag->n_multipole_pts; i++) {
		if (!skip_label(stream)){
            efp_log("quadrupoles() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		double *q = frag->multipole_pts[i].quadrupole;

		for (size_t j = 0; j < 6; j++)
			if (!tok_double(stream, q + j)){
                efp_log("quadrupoles() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }

		efp_stream_next_line(stream);
	}
*/
	if (!tok_stop(stream)){
        efp_log("quadrupoles() failure for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_octupoles(struct frag *frag, struct stream *stream)
{
	if (!frag->multipole_pts){
        efp_log("parse_octupoles() failure: no multipole_pts for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);

    int counter = 0;
    for (size_t i = 0; i < frag->n_multipole_pts; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d octupoles of %zu expected in fragment %s \n",
                   counter, frag->n_multipole_pts, frag->name);
            return EFP_RESULT_SUCCESS;
        }

        if (i == 0) frag->multipole_rank = 3;
        if (i == 0) frag->if_mm_frag = false;

        struct multipole_pt tmp_pt;
        memset(&tmp_pt, 0, sizeof(tmp_pt));

        if (!tok_label(stream, sizeof(tmp_pt.label), tmp_pt.label)){
            efp_log("parse_octupoles() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

        for (size_t k = 0; k < 10; k++)
            if (!tok_double(stream, &tmp_pt.octupole[k])){
                efp_log("parse_octupoles() failure for fragment %s", frag->name);
                return EFP_RESULT_SYNTAX_ERROR;
            }

        for (size_t j = 0; j < frag->n_multipole_pts; j++) {
            if (!strcmp(tmp_pt.label, frag->multipole_pts[j].label)) {
                // found a match
                for (int q=0; q<10; q++) {
                    frag->multipole_pts[j].octupole[q] = tmp_pt.octupole[q];
                }
                frag->multipole_pts[j].if_oct = true;
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }
/*
	for (size_t i = 0; i < frag->n_multipole_pts; i++) {
		if (!skip_label(stream)){
            efp_log("parse_octupoles() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		double *o = frag->multipole_pts[i].octupole;

		for (size_t j = 0; j < 10; j++)
			if (!tok_double(stream, o + j)){
                efp_log("parse_octupoles() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }

		efp_stream_next_line(stream);
	}
*/
	if (!tok_stop(stream)){
        efp_log("parse_octupoles() failure for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_polarizable_pts(struct frag *frag, struct stream *stream)
{
	efp_stream_next_line(stream);

	while (!efp_stream_eof(stream)) {
		if (tok_stop(stream))
			return EFP_RESULT_SUCCESS;

		frag->n_polarizable_pts++;
		frag->polarizable_pts = (struct polarizable_pt *)realloc(
		    frag->polarizable_pts,
		    frag->n_polarizable_pts * sizeof(struct polarizable_pt));
		if (frag->polarizable_pts == NULL)
			return EFP_RESULT_NO_MEMORY;

		struct polarizable_pt *pt =
		    frag->polarizable_pts + frag->n_polarizable_pts - 1;
		// zero out all entries
        init_pol_pt(pt);

		if (!efp_stream_advance(stream, 4)){
            efp_log("parse_polarizable_pts() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

		if (!tok_double(stream, &pt->x) ||
		    !tok_double(stream, &pt->y) ||
		    !tok_double(stream, &pt->z)){
            efp_log("parse_polarizable_pts() coordinate reading failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

		efp_stream_next_line(stream);
		double m[9];

		for (size_t i = 0; i < 9; i++)
			if (!tok_double(stream, m + i)){
                efp_log("parse_polarizable_pts() polarizability reading failure for fragment %s", frag->name);
                return EFP_RESULT_SYNTAX_ERROR;
            }

		pt->tensor.xx = m[0];
		pt->tensor.yy = m[1];
		pt->tensor.zz = m[2];
		pt->tensor.xy = m[3];
		pt->tensor.xz = m[4];
		pt->tensor.yz = m[5];
		pt->tensor.yx = m[6];
		pt->tensor.zx = m[7];
		pt->tensor.zy = m[8];

		efp_stream_next_line(stream);
	}

	efp_log("parse_polarizable_pts() failure for fragment %s", frag->name);
	return EFP_RESULT_SYNTAX_ERROR;
}

static enum efp_result
parse_dynamic_polarizable_pts(struct frag *frag, struct stream *stream)
{
	double m[9];

	efp_stream_next_line(stream);

	while (!efp_stream_eof(stream)) {
		frag->n_dynamic_polarizable_pts++;

		size_t size = sizeof(struct dynamic_polarizable_pt);
		frag->dynamic_polarizable_pts =
		    (struct dynamic_polarizable_pt *)realloc(
		    frag->dynamic_polarizable_pts,
		    frag->n_dynamic_polarizable_pts * size);
		if (frag->dynamic_polarizable_pts == NULL)
			return EFP_RESULT_NO_MEMORY;

		struct dynamic_polarizable_pt *pt =
		    frag->dynamic_polarizable_pts +
		    frag->n_dynamic_polarizable_pts - 1;

		if (!efp_stream_advance(stream, 5)){
            efp_log("parse_dynamic_polarizable_pts() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

		if (!tok_double(stream, &pt->x) ||
		    !tok_double(stream, &pt->y) ||
		    !tok_double(stream, &pt->z)){
            efp_log("parse_dynamic_polarizable_pts() coordinates reading failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

		efp_stream_next_line(stream);

		for (size_t j = 0; j < 9; j++)
			if (!tok_double(stream, m + j)){
                efp_log("parse_dynamic_polarizable_pts() polarizability reading failure for fragment %s", frag->name);
                return EFP_RESULT_SYNTAX_ERROR;
            }

		pt->tensor[0].xx = m[0];
		pt->tensor[0].yy = m[1];
		pt->tensor[0].zz = m[2];
		pt->tensor[0].xy = m[3];
		pt->tensor[0].xz = m[4];
		pt->tensor[0].yz = m[5];
		pt->tensor[0].yx = m[6];
		pt->tensor[0].zx = m[7];
		pt->tensor[0].zy = m[8];

		efp_stream_next_line(stream);

		if (efp_stream_eof(stream)){
            efp_log("parse_dynamic_polarizable_pts() failure for fragment %s", frag->name);
            return EFP_RESULT_SYNTAX_ERROR;
        }

		if (strstr(efp_stream_get_ptr(stream), "FOR"))
			break;
	}

	if (efp_stream_eof(stream)){
        efp_log("parse_dynamic_polarizable_pts() failure for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	for (size_t w = 1; w < 12; w++) {
		for (size_t i = 0; i < frag->n_dynamic_polarizable_pts; i++) {
			struct dynamic_polarizable_pt *pt =
			    frag->dynamic_polarizable_pts + i;

			if (!efp_stream_advance(stream, 5)){
                efp_log("parse_dynamic_polarizable_pts() failure for fragment %s", frag->name);
                return EFP_RESULT_SYNTAX_ERROR;
            }

			if (!tok_double(stream, &pt->x) ||
			    !tok_double(stream, &pt->y) ||
			    !tok_double(stream, &pt->z)){
                efp_log("parse_dynamic_polarizable_pts() coordinate reading failure for fragment %s", frag->name);
                return EFP_RESULT_SYNTAX_ERROR;
            }

			efp_stream_next_line(stream);

			for (size_t j = 0; j < 9; j++)
				if (!tok_double(stream, m + j)){
                    efp_log("parse_dynamic_polarizable_pts() polarizability reading failure for fragment %s", frag->name);
                    return EFP_RESULT_SYNTAX_ERROR;
                }

			pt->tensor[w].xx = m[0];
			pt->tensor[w].yy = m[1];
			pt->tensor[w].zz = m[2];
			pt->tensor[w].xy = m[3];
			pt->tensor[w].xz = m[4];
			pt->tensor[w].yz = m[5];
			pt->tensor[w].yx = m[6];
			pt->tensor[w].zx = m[7];
			pt->tensor[w].zy = m[8];

			efp_stream_next_line(stream);
		}
	}

	if (!tok_stop(stream)){
        efp_log("parse_dynamic_polarizable_pts() failure for fragment %s", frag->name);
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_projection_basis(struct frag *frag, struct stream *stream)
{
	efp_stream_next_line(stream);

	while (!efp_stream_eof(stream)) {
		if (tok_stop(stream))
			return EFP_RESULT_SUCCESS;

		if (!efp_stream_advance(stream, 8)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_projection_basis() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		frag->n_xr_atoms++;
		frag->xr_atoms = (struct xr_atom *)realloc(frag->xr_atoms,
		    frag->n_xr_atoms * sizeof(struct xr_atom));
		if (frag->xr_atoms == NULL)
			return EFP_RESULT_NO_MEMORY;

		struct xr_atom *atom = frag->xr_atoms + frag->n_xr_atoms - 1;
		memset(atom, 0, sizeof(*atom));

		if (!tok_double(stream, &atom->x) ||
		    !tok_double(stream, &atom->y) ||
		    !tok_double(stream, &atom->z) ||
		    !tok_double(stream, &atom->znuc)){
            printf("problem with fragment %s, xr atom %zu", frag->name, frag->n_xr_atoms);
            efp_log("parse_projection_basis() failure: cannot read atom coordinates");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		efp_stream_next_line(stream);
shell:
		if (efp_stream_eof(stream)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_projection_basis() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		// reading fails here when the empty line between atoms contains no white space. WHY???
		efp_stream_skip_space(stream);

        if (efp_stream_eol(stream)) {
            efp_stream_next_line(stream);
            continue;
        }

		atom->n_shells++;
		atom->shells = (struct shell *)realloc(atom->shells,
		    atom->n_shells * sizeof(struct shell));
		if (atom->shells == NULL)
			return EFP_RESULT_NO_MEMORY;

		struct shell *shell = atom->shells + atom->n_shells - 1;
		shell->type = efp_stream_get_char(stream);

        //printf("\n shell->type %c", shell->type);

		if (!strchr("SLPDF", shell->type)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_projection_basis() failure: error in basis function names");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		if (!tok_uint(stream, &shell->n_funcs)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_projection_basis() failure: error in the number of basis functions");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		efp_stream_next_line(stream);

		size_t cnt = (shell->type == 'L' ? 3 : 2) * shell->n_funcs;
		shell->coef = (double *)malloc(cnt * sizeof(double));
		if (shell->coef == NULL)
			return EFP_RESULT_NO_MEMORY;
		double *ptr = shell->coef;

		for (size_t i = 0; i < shell->n_funcs; i++) {
			if (!tok_int(stream, NULL) ||
			    !tok_double(stream, ptr++) ||
			    !tok_double(stream, ptr++)){
                printf("problem with fragment %s", frag->name);
                efp_log("parse_projection_basis() failure: error in reading basis exponents");
                return EFP_RESULT_SYNTAX_ERROR;
            }

			if (shell->type == 'L')
				if (!tok_double(stream, ptr++)){
                    printf("problem with fragment %s", frag->name);
                    efp_log("parse_projection_basis() failure: error in reading basis exponent for L function");
                    return EFP_RESULT_SYNTAX_ERROR;
                }

			efp_stream_next_line(stream);
		}
		goto shell;
	}
    printf("problem with fragment %s", frag->name);
    efp_log("parse_projection_basis() failure");
	return EFP_RESULT_SYNTAX_ERROR;
}

static enum efp_result
parse_multiplicity(struct frag *frag, struct stream *stream)
{
	if (!tok_int(stream, &frag->multiplicity)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_multiplicity() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);

	if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_multiplicity() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_projection_wf(struct frag *frag, struct stream *stream)
{
	if (!tok_uint(stream, &frag->n_lmo) ||
	    !tok_uint(stream, &frag->xr_wf_size)){
        printf("problem with fragment %s, reading n_lmo and wf_size", frag->name);
        efp_log("parse_projection_wf() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	frag->xr_wf = (double *)malloc(
	    frag->n_lmo * frag->xr_wf_size * sizeof(double));
	if (frag->xr_wf == NULL)
		return EFP_RESULT_NO_MEMORY;

	efp_stream_next_line(stream);
	double *ptr = frag->xr_wf;

	for (size_t j = 0; j < frag->n_lmo; j++) {
		for (size_t i = 0; i < frag->xr_wf_size / 5; i++) {
			if (!efp_stream_advance(stream, 5)){
                printf("problem with fragment %s, reading wf coefficients", frag->name);
                efp_log("parse_projection_wf() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }

			for (size_t k = 0; k < 5; k++)
				if (!tok_double(stream, ptr++)){
                    printf("problem with fragment %s, reading wf coefficients", frag->name);
                    efp_log("parse_projection_wf() failure");
                    return EFP_RESULT_SYNTAX_ERROR;
                }

			efp_stream_next_line(stream);
		}

		if (frag->xr_wf_size % 5 == 0)
			continue;

		if (!efp_stream_advance(stream, 5)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_projection_wf() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		for (size_t k = 0; k < frag->xr_wf_size % 5; k++)
			if (!tok_double(stream, ptr++)){
                printf("problem with fragment %s", frag->name);
                efp_log("parse_projection_wf() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }

		efp_stream_next_line(stream);
	}

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_fock_mat(struct frag *frag, struct stream *stream)
{
	efp_stream_next_line(stream);

	size_t size = frag->n_lmo * (frag->n_lmo + 1) / 2;
	frag->xr_fock_mat = (double *)malloc(size * sizeof(double));
	if (frag->xr_fock_mat == NULL)
		return EFP_RESULT_NO_MEMORY;

	for (size_t i = 0; i < size; i++)
		if (!tok_double(stream, frag->xr_fock_mat + i)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_fock_mat() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

	/* work around GAMESS bug */
	if (size % 4 == 0) {
		efp_stream_skip_space(stream);

		if (efp_stream_eol(stream))
			efp_stream_next_line(stream);
	} else
		efp_stream_next_line(stream);

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_lmo_centroids(struct frag *frag, struct stream *stream)
{
	efp_stream_next_line(stream);

	if (frag->n_lmo == 0) {
        printf("problem with fragment %s", frag->name);
        efp_log("number of LMO centroids is zero");
		return EFP_RESULT_SYNTAX_ERROR;
	}
	frag->lmo_centroids = (vec_t *)malloc(frag->n_lmo * sizeof(vec_t));
	if (frag->lmo_centroids == NULL)
		return EFP_RESULT_NO_MEMORY;

	for (size_t i = 0; i < frag->n_lmo; i++) {
		vec_t *ct = frag->lmo_centroids + i;

		if (!skip_label(stream) ||
		    !tok_double(stream, &ct->x) ||
		    !tok_double(stream, &ct->y) ||
		    !tok_double(stream, &ct->z)){
            printf("problem with fragment %s, coordinates of lmo %zu", frag->name, i+1);
            efp_log("parse_lmo_centroids() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

		efp_stream_next_line(stream);
	}

	if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_lmo_centroids() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
skip_canonvec(struct frag *frag, struct stream *stream)
{
	(void)frag;

	size_t wf_size;

	if (!tok_uint(stream, NULL) ||
	    !tok_uint(stream, &wf_size)){
        printf("problem with fragment %s", frag->name);
        efp_log("skip_canonvec() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);

	for (size_t j = 0; j < wf_size; j++) {
		for (size_t i = 0; i <= (wf_size - 1) / 5; i++) {
			efp_stream_next_line(stream);
		}
	}

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
skip_canonfok(struct frag *frag, struct stream *stream)
{
	(void)frag;

	efp_stream_next_line(stream);

	if (strstr(efp_stream_get_ptr(stream), "STOP") != NULL) {
		efp_stream_next_line(stream);
		return EFP_RESULT_SUCCESS;
	}

	efp_stream_next_line(stream);
	efp_stream_next_line(stream);
	return EFP_RESULT_SUCCESS;
}

static enum efp_result
skip_ctvec(struct frag *frag, struct stream *stream)
{
	size_t wf_size;

	assert(frag->xr_wf_size > 0);

	if (!tok_uint(stream, NULL) ||
	    !tok_uint(stream, &wf_size)){
        printf("problem with fragment %s", frag->name);
        efp_log("skip_ctvec() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	efp_stream_next_line(stream);

	for (size_t j = 0; j < wf_size; j++) {
		for (size_t i = 0; i <= (frag->xr_wf_size - 1) / 5; i++)
			efp_stream_next_line(stream);
	}

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
skip_ctfok(struct frag *frag, struct stream *stream)
{
	(void)frag;

	efp_stream_next_line(stream);

	if (strstr(efp_stream_get_ptr(stream), "STOP") != NULL) {
		efp_stream_next_line(stream);
		return EFP_RESULT_SUCCESS;
	}

	efp_stream_next_line(stream);
	efp_stream_next_line(stream);
	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_dipquad_polarizable_pts(struct frag *frag, struct stream *stream)
{
    double m[27];

    efp_stream_next_line(stream);

    while (!efp_stream_eof(stream)) {
        frag->n_dipquad_polarizable_pts++;

        size_t size = sizeof(struct dipquad_polarizable_pt);
        frag->dipquad_polarizable_pts =
                (struct dipquad_polarizable_pt *)realloc(
                        frag->dipquad_polarizable_pts,
                        frag->n_dipquad_polarizable_pts * size);
        if (frag->dipquad_polarizable_pts == NULL)
            return EFP_RESULT_NO_MEMORY;

        struct dipquad_polarizable_pt *pt =
                frag->dipquad_polarizable_pts +
                frag->n_dynamic_polarizable_pts - 1;

        if (!efp_stream_advance(stream, 5)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_dipquad_polarizable_pts() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

        if (!tok_double(stream, &pt->x) ||
            !tok_double(stream, &pt->y) ||
            !tok_double(stream, &pt->z)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_dipquad_polarizable_pts() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

        efp_stream_next_line(stream);

        for (size_t j = 0; j < 27; j++)
            if (!tok_double(stream, m + j)){
                printf("problem with fragment %s", frag->name);
                efp_log("parse_dipquad_polarizable_pts() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }

            //tentative order!!!
        pt->tensor[0].xxx = m[0];
        pt->tensor[0].xxy = m[1];
        pt->tensor[0].xxz = m[2];
        pt->tensor[0].xyx = m[3];
        pt->tensor[0].xyy = m[4];
        pt->tensor[0].xyz = m[5];
        pt->tensor[0].xzx = m[6];
        pt->tensor[0].xzy = m[7];
        pt->tensor[0].xzz = m[8];
        pt->tensor[0].yxx = m[9];
        pt->tensor[0].yxy = m[10];
        pt->tensor[0].yxz = m[11];
        pt->tensor[0].yyx = m[12];
        pt->tensor[0].yyy = m[13];
        pt->tensor[0].yyz = m[14];
        pt->tensor[0].yzx = m[15];
        pt->tensor[0].yzy = m[16];
        pt->tensor[0].yzz = m[17];
        pt->tensor[0].zxx = m[18];
        pt->tensor[0].zxy = m[19];
        pt->tensor[0].zxz = m[20];
        pt->tensor[0].zyx = m[21];
        pt->tensor[0].zyy = m[22];
        pt->tensor[0].zyz = m[23];
        pt->tensor[0].zzx = m[24];
        pt->tensor[0].zzy = m[25];
        pt->tensor[0].zzz = m[26];

        efp_stream_next_line(stream);

        if (efp_stream_eof(stream)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_dipquad_polarizable_pts() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

        if (strstr(efp_stream_get_ptr(stream), "FOR"))
            break;
    }
    if (efp_stream_eof(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_dipquad_polarizable_pts() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    for (size_t w = 1; w < 12; w++) {
        for (size_t i = 0; i < frag->n_dipquad_polarizable_pts; i++) {
            struct dipquad_polarizable_pt *pt =
                    frag->dipquad_polarizable_pts + i;

            if (!efp_stream_advance(stream, 5)){
                printf("problem with fragment %s", frag->name);
                efp_log("parse_dipquad_polarizable_pts() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }
            //printf("\n in dipquad 8");
            if (!tok_double(stream, &pt->x) ||
                !tok_double(stream, &pt->y) ||
                !tok_double(stream, &pt->z)){
                printf("problem with fragment %s", frag->name);
                efp_log("parse_dipquad_polarizable_pts() failure");
                return EFP_RESULT_SYNTAX_ERROR;
            }

            efp_stream_next_line(stream);
            //printf("\n in dipquad 9");
            for (size_t j = 0; j < 27; j++)
                if (!tok_double(stream, m + j)){
                    printf("problem with fragment %s", frag->name);
                    efp_log("parse_dipquad_polarizable_pts() failure");
                    return EFP_RESULT_SYNTAX_ERROR;
                }

            pt->tensor[w].xxx = m[0];
            pt->tensor[w].xxy = m[1];
            pt->tensor[w].xxz = m[2];
            pt->tensor[w].xyx = m[3];
            pt->tensor[w].xyy = m[4];
            pt->tensor[w].xyz = m[5];
            pt->tensor[w].xzx = m[6];
            pt->tensor[w].xzy = m[7];
            pt->tensor[w].xzz = m[8];
            pt->tensor[w].yxx = m[9];
            pt->tensor[w].yxy = m[10];
            pt->tensor[w].yxz = m[11];
            pt->tensor[w].yyx = m[12];
            pt->tensor[w].yyy = m[13];
            pt->tensor[w].yyz = m[14];
            pt->tensor[w].yzx = m[15];
            pt->tensor[w].yzy = m[16];
            pt->tensor[w].yzz = m[17];
            pt->tensor[w].zxx = m[18];
            pt->tensor[w].zxy = m[19];
            pt->tensor[w].zxz = m[20];
            pt->tensor[w].zyx = m[21];
            pt->tensor[w].zyy = m[22];
            pt->tensor[w].zyz = m[23];
            pt->tensor[w].zzx = m[24];
            pt->tensor[w].zzy = m[25];
            pt->tensor[w].zzz = m[26];

            efp_stream_next_line(stream);
        }
    }
    if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_dipquad_polarizable_pts() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    return EFP_RESULT_SUCCESS;
}

/*
static enum efp_result
parse_screen(struct frag *frag, struct stream *stream)
{
	double *scr;
	char type;

	scr = (double *)malloc(frag->n_multipole_pts * sizeof(double));
	if (scr == NULL)
		return EFP_RESULT_NO_MEMORY;
	type = efp_stream_get_char(stream);
	efp_stream_next_line(stream);

	for (size_t i = 0; i < frag->n_multipole_pts; i++) {
		if (!skip_label(stream) ||
		    !tok_double(stream, NULL) ||
		    !tok_double(stream, scr + i)) {
			free(scr);
            efp_log("parse_screen() failure");
			return EFP_RESULT_SYNTAX_ERROR;
		}
		efp_stream_next_line(stream);
	}

	if (!tok_stop(stream)) {
		free(scr);
        efp_log("parse_screen() failure");
		return EFP_RESULT_SYNTAX_ERROR;
	}

	if (type == '\0' || isspace(type)) {
		if (frag->ai_screen_params)
			free(frag->ai_screen_params);
		frag->ai_screen_params = scr;
		return EFP_RESULT_SUCCESS;
	}

	if (type == '2') {
		if (frag->screen_params)
			free(frag->screen_params);
		frag->screen_params = scr;
		return EFP_RESULT_SUCCESS;
	}

	efp_log("unsupported screen group in EFP data file");
	free(scr);
	return EFP_RESULT_SUCCESS;
}
*/

static enum efp_result
parse_screen(struct frag *frag, struct stream *stream)
{
    if (!frag->multipole_pts){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_screen() failure: no multipole_pts");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    char type;
    int screen_type = -1;
    type = efp_stream_get_char(stream);
    if (type == '\0' || isspace(type)) {
        screen_type = 0;
    }
    else if (type == '2') {
        screen_type = 2;
    }
    else if (type == '3') {
        screen_type = 3;
    }
    else {
        printf(" Unknown SCREEN type found for fragment %s \n", frag->name);
        efp_log("parse_screen() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    efp_stream_next_line(stream);

    int counter = 0;
    for (size_t i = 0; i < frag->n_multipole_pts; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d SCREEN_ parameters, %zu expected in fragment %s \n",
                   counter, frag->n_multipole_pts, frag->name);
            return EFP_RESULT_SUCCESS;
        }

        if (i == 0 && screen_type == 0) frag->if_qm_screen = true;

        struct multipole_pt tmp_pt;
        memset(&tmp_pt, 0, sizeof(tmp_pt));
        double tmp_screen;
        if (!tok_label(stream, sizeof(tmp_pt.label), tmp_pt.label) ||
            !tok_double(stream, NULL) ||
            !tok_double(stream, &tmp_screen)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_screen() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }

        for (size_t j = 0; j < frag->n_multipole_pts; j++) {
            if (!strcmp(tmp_pt.label, frag->multipole_pts[j].label)) {
                // found a match
                if (screen_type == 2) {
                    frag->multipole_pts[j].screen2 = tmp_screen;
                    frag->multipole_pts[j].if_scr2 = true;
                    //printf(" SCREEN2 param %lf \n", frag->multipole_pts[j].screen2);
                }
                if (screen_type == 0) {
                    frag->multipole_pts[j].screen0 = tmp_screen;
                    frag->multipole_pts[j].if_scr0 = true;
                    //printf(" SCREEN0 param %lf \n", frag->multipole_pts[j].screen0);
                }
                if (screen_type == 3) {
                    // do nothing with screen3
                    continue;
                }
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }

    if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_screen() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_xrfit(struct frag *frag, struct stream *stream)
{
	if (frag->n_lmo == 0) {
        printf("problem with fragment %s", frag->name);
        efp_log("no LMO centroids found before XRFIT group");
		return EFP_RESULT_SYNTAX_ERROR;
	}

	frag->xrfit = (double *)malloc(frag->n_lmo * 4 * sizeof(double));
	if (frag->xrfit == NULL)
		return EFP_RESULT_NO_MEMORY;
	efp_stream_next_line(stream);

	for (size_t i = 0; i < frag->n_lmo; i++) {
		for (int k = 0; k < 4; k++) {
			if (!tok_double(stream, frag->xrfit + 4 * i + k)) {
                printf("problem with fragment %s", frag->name);
                efp_log("four parameters are expected for "
				    "each LMO in XRFIT group");
				return EFP_RESULT_SYNTAX_ERROR;
			}
		}
		efp_stream_next_line(stream);
	}

	if (!tok_stop(stream)) {
        printf("problem with fragment %s", frag->name);
        efp_log("parse_xrfit() failure");
        return EFP_RESULT_SYNTAX_ERROR;
	}

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_polab(struct frag *frag, struct stream *stream)
{
	if (!tok_double(stream, &frag->pol_damp)) {
        printf("problem with fragment %s", frag->name);
        efp_log("error parsing fragment polarization damping "
		    "parameters");
		return EFP_RESULT_SYNTAX_ERROR;
	}

	efp_stream_next_line(stream);

	if (!tok_stop(stream)) {
        printf("problem with fragment %s", frag->name);
        efp_log("parse_polab() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

	return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_mm_atom_charge(struct frag *frag, struct stream *stream)
{
    if (!frag->atoms){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_mm_atom_charge() failure: no atoms");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    efp_stream_next_line(stream);
    int counter = 0;
    for (size_t i = 0; i < frag->n_atoms; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d mm_atoms of %zu expected in fragment %s \n",
                   counter, frag->n_atoms, frag->name);
            return EFP_RESULT_SUCCESS;
        }
        struct efp_atom atom;
        memset(&atom, 0, sizeof(atom));
        if (!tok_label(stream, sizeof(atom.label), atom.label) ||
            !tok_double(stream, &atom.mm_charge)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_mm_atom_charge() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }
        for (size_t j = 0; j < frag->n_atoms; j++) {
            if (!strcmp(atom.label, frag->atoms[j].label)) {
                // found a match
                frag->atoms[j].mm_charge = atom.mm_charge;
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }

    if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_mm_atom_charge() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_mm_lj(struct frag *frag, struct stream *stream)
{
    if (!frag->atoms){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_mm_lj() failure: no atoms");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    // conversion of LJ params to a.u.
    // assuming sigma-epsilon form (combination rules 2 and 3)
    // epsilon has dimension of energy; sigma has dimension of length
    // in Gromacs energies are in kJ/mol, lengths are in nm
    double nm2bohr = 10.0/0.52917721092;
    double kJmol2H = 1.0/2625.5002;

    efp_stream_next_line(stream);
    int counter = 0;
    for (size_t i = 0; i < frag->n_atoms; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d mm_atoms of %zu expected in fragment %s \n",
                   counter, frag->n_atoms, frag->name);
            return EFP_RESULT_SUCCESS;
        }
        struct efp_atom atom;
        memset(&atom, 0, sizeof(atom));
        if (!tok_label(stream, sizeof(atom.label), atom.label) ||
            !tok_double(stream, &atom.sigma) ||
            !tok_double(stream, &atom.epsilon)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_mm_lj() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }
        for (size_t j = 0; j < frag->n_atoms; j++) {
            if (!strcmp(atom.label, frag->atoms[j].label)) {
                // found a match
                // convert to a.u.
                frag->atoms[j].sigma = atom.sigma * nm2bohr;
                frag->atoms[j].epsilon = atom.epsilon * kJmol2H;
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }

    if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_mm_lj() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    return EFP_RESULT_SUCCESS;
}

static enum efp_result
parse_mm_atomtype(struct frag *frag, struct stream *stream)
{
    if (!frag->atoms){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_mm_atomtype() failure: no atoms");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    efp_stream_next_line(stream);
    int counter = 0;
    for (size_t i = 0; i < frag->n_atoms; i++) {

        if (tok_stop(stream)) {
            printf(" Found %d mm_atoms of %zu expected in fragment %s \n",
                   counter, frag->n_atoms, frag->name);
            return EFP_RESULT_SUCCESS;
        }
        struct efp_atom atom;
        memset(&atom, 0, sizeof(atom));
        if (!tok_label(stream, sizeof(atom.label), atom.label) ||
            !tok_label(stream, sizeof(atom.ff_label), atom.ff_label)){
            printf("problem with fragment %s", frag->name);
            efp_log("parse_mm_atomtype() failure");
            return EFP_RESULT_SYNTAX_ERROR;
        }
        for (size_t j = 0; j < frag->n_atoms; j++) {
            if (!strcmp(atom.label, frag->atoms[j].label)) {
                // found a match
                strcpy(frag->atoms[j].ff_label,atom.ff_label);
                counter++;
                break;
            }
        }
        efp_stream_next_line(stream);
    }

    if (!tok_stop(stream)){
        printf("problem with fragment %s", frag->name);
        efp_log("parse_mm_atomtype() failure");
        return EFP_RESULT_SYNTAX_ERROR;
    }

    return EFP_RESULT_SUCCESS;
}

typedef enum efp_result (*parse_fn)(struct frag *, struct stream *);

static parse_fn
get_parse_fn(struct stream *stream)
{
	static const struct {
		const char *label;
		parse_fn fn;
	} funcs[] = {
		{ "COORDINATES",                parse_coordinates             },
		{ "MONOPOLES",                  parse_monopoles               },
		{ "DIPOLES",                    parse_dipoles                 },
		{ "QUADRUPOLES",                parse_quadrupoles             },
		{ "OCTUPOLES",                  parse_octupoles               },
		{ "POLARIZABLE POINTS",         parse_polarizable_pts         },
		{ "DYNAMIC POLARIZABLE POINTS", parse_dynamic_polarizable_pts },
		{ "PROJECTION BASIS SET",       parse_projection_basis        },
		{ "MULTIPLICITY",               parse_multiplicity            },
		{ "PROJECTION WAVEFUNCTION",    parse_projection_wf           },
		{ "FOCK MATRIX ELEMENTS",       parse_fock_mat                },
		{ "LMO CENTROIDS",              parse_lmo_centroids           },
		{ "CANONVEC",                   skip_canonvec                 },
		{ "CANONFOK",                   skip_canonfok                 },
		{ "CTVEC",                      skip_ctvec                    },
		{ "CTFOK",                      skip_ctfok                    },
        { "DIPOLE-QUADRUPOLE DYNAMIC POLARIZABLE POINTS", parse_dipquad_polarizable_pts},
        { "SCREEN",                     parse_screen                  },
		{ "XRFIT",                      parse_xrfit                   },
		{ "POLAB",                      parse_polab                   },
        { "MM_CHARGE",                  parse_mm_atom_charge          },
        { "MM_LJ",                      parse_mm_lj                   },
        { "MM_ATOMTYPE",                parse_mm_atomtype             },
	};

	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++)
		if (tok(stream, funcs[i].label))
			return funcs[i].fn;

	return NULL;
}

static enum efp_result
parse_fragment(struct frag *frag, struct stream *stream)
{
	enum efp_result res;

	while (!efp_stream_eof(stream)) {
		parse_fn fn = get_parse_fn(stream);

		if (!fn) {
			if (tok_end(stream))
				return EFP_RESULT_SUCCESS;

            printf("problem with fragment %s", frag->name);
            efp_log("unexpected string \"%s\" in .efp file",
			    efp_stream_get_ptr(stream));
			return EFP_RESULT_SYNTAX_ERROR;
		}

		if ((res = fn(frag, stream)))
			return res;
	}

    printf("problem with fragment %s", frag->name);
    efp_log("unexpected end of EFP potential data file");
	return EFP_RESULT_SYNTAX_ERROR;
}

static enum efp_result
parse_file(struct efp *efp, struct stream *stream)
{
	char name[32];
	enum efp_result res;

	while (!efp_stream_eof(stream)) {
		if (efp_stream_get_char(stream) == '\0' ||
		    efp_stream_get_char(stream) != '$') {
			efp_stream_next_line(stream);
			continue;
		}

		if (!tok_label(stream, sizeof(name), name)) {
			efp_log("missing fragment name after $ sign");
			return EFP_RESULT_SYNTAX_ERROR;
		}

		if (efp_find_lib(efp, name)) {
			efp_log("parameters for fragment \"%s\" are "
			    "already loaded", name);
			return EFP_RESULT_FATAL;
		}

		struct frag *frag = (struct frag *)calloc(1,
		    sizeof(struct frag));
		if (frag == NULL)
			return EFP_RESULT_NO_MEMORY;

		efp->n_lib++;
		efp->lib = (struct frag **)realloc(efp->lib,
		    efp->n_lib * sizeof(struct frag *));
		if (efp->lib == NULL) {
			free(frag);
			return EFP_RESULT_NO_MEMORY;
		}

		frag->lib = frag;
		strcpy(frag->name, name);
		efp->lib[efp->n_lib - 1] = frag;

		/* default value */
		//frag->pol_damp = 0.6; //commented out for ticket 3416
        if (efp->opts.pol_damp_tt_value > 0.0) {
            frag->pol_damp = efp->opts.pol_damp_tt_value;
        }
        else frag->pol_damp = 0.6;  // default

        frag->if_mm_frag = true;
        frag->if_qm_screen = false;
        frag->multipole_rank = -1;

		efp_stream_next_line(stream);
		efp_stream_next_line(stream);

		if ((res = parse_fragment(frag, stream)))
			return res;
		if (frag->n_lmo > 0 && frag->lmo_centroids == NULL) {
			efp_log("LMO centroids are missing for fragment \"%s\"", name);
			return EFP_RESULT_FATAL;
		}
	}
	return EFP_RESULT_SUCCESS;
}

EFP_EXPORT enum efp_result
efp_add_potential(struct efp *efp, const char *path)
{
	enum efp_result res;
	struct stream *stream;

	assert(efp);
	assert(path);

	if ((stream = efp_stream_open(path)) == NULL) {
		efp_log("unable to open file %s", path);
		return EFP_RESULT_FILE_NOT_FOUND;
	}

	efp_stream_set_split_char(stream, '>');
	efp_stream_next_line(stream);
	res = parse_file(efp, stream);
	efp_stream_close(stream);

	return res;
}


