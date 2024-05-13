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

#include "balance.h"
#include "elec.h"
#include "private.h"

#include <stdio.h>
#include <stdbool.h>

static double
get_screen_damping(double r_ij, double pi, double pj)
{
	if (pj == HUGE_VAL) {   /* j is nucleus */
		return 1.0 - exp(-pi * r_ij);
	}
	else if (fabs(pi - pj) < 1.0e-5) {
		return 1.0 - (1.0 + 0.5 * pi * r_ij) * exp(-pi * r_ij);
	}
	else {
		return 1.0 - exp(-pi * r_ij) * pj * pj / (pj * pj - pi * pi) -
			     exp(-pj * r_ij) * pi * pi / (pi * pi - pj * pj);
	}
}

static double
get_screen_damping_grad(double r_ij, double pi, double pj)
{
	if (pj == HUGE_VAL) {   /* j is nucleus */
		return 1.0 - exp(-r_ij * pi) * (1.0 + pi * r_ij);
	}
	else if (fabs(pi - pj) < 1.0e-5) {
		return 1.0 - exp(-r_ij * pi) * (1.0 + pi * r_ij +
						0.5 * pi * pi * r_ij * r_ij);
	}
	else {
		return 1.0 - exp(-r_ij * pi) * (1.0 + pi * r_ij) *
						pj * pj / (pj * pj - pi * pi) -
			     exp(-r_ij * pj) * (1.0 + pj * r_ij) *
						pi * pi / (pi * pi - pj * pj);
	}
}

static double
mult_mult_energy(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
    size_t pt_i_idx, size_t pt_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;
	struct multipole_pt *pt_i = fr_i->multipole_pts + pt_i_idx;
	struct multipole_pt *pt_j = fr_j->multipole_pts + pt_j_idx;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

	double energy = 0.0, ccdamp = 1.0, ccdamp_i = 1.0, ccdamp_j = 1.0;
	double qi = pt_i->monopole + pt_i->znuc;
    double qj = pt_j->monopole + pt_j->znuc;

	if (efp->opts.elec_damp == EFP_ELEC_DAMP_SCREEN) {
		double r = vec_len(&dr);
		//double screen_i = fr_i->screen_params[pt_i_idx];
		//double screen_j = fr_j->screen_params[pt_j_idx];
        double screen_i = pt_i->screen2;
        double screen_j = pt_j->screen2;

		ccdamp = get_screen_damping(r, screen_i, screen_j);
        ccdamp_j = get_screen_damping(r, screen_j, HUGE_VAL);
        ccdamp_i = get_screen_damping(r, screen_i, HUGE_VAL);
	}

    // charge - monopole
    if (pt_i->if_znuc && pt_j->if_mon)
        energy += ccdamp_j * efp_charge_charge_energy(pt_i->znuc, pt_j->monopole, &dr);

    // monopole - charge
    if (pt_j->if_znuc && pt_i->if_mon)
        energy += ccdamp_i * efp_charge_charge_energy(pt_j->znuc, pt_i->monopole, &dr);

    // charge-charge
    if (pt_i->if_znuc && pt_j->if_znuc)
        energy += efp_charge_charge_energy(pt_i->znuc, pt_j->znuc, &dr);

    // monopole - monopole
    if (pt_i->if_mon && pt_j->if_mon)
	    energy += ccdamp * efp_charge_charge_energy(pt_i->monopole,
	            pt_j->monopole, &dr);

	// monopole - dipole
    if ((pt_i->if_znuc || pt_i->if_mon) && pt_j->if_dip)
	    energy += efp_charge_dipole_energy(qi, &pt_j->dipole, &dr);

	// dipole - monopole
    if ((pt_j->if_znuc || pt_j->if_mon) && pt_i->if_dip)
	    energy -= efp_charge_dipole_energy(qj, &pt_i->dipole, &dr);

	// monopole - quadrupole
    if ((pt_i->if_znuc || pt_i->if_mon) && pt_j->if_quad)
        energy += efp_charge_quadrupole_energy(qi, pt_j->quadrupole, &dr);

	// quadrupole - monopole
    if ((pt_j->if_znuc || pt_j->if_mon) && pt_i->if_quad)
    	energy += efp_charge_quadrupole_energy(qj, pt_i->quadrupole, &dr);

	// monopole - octupole
    if ((pt_i->if_znuc || pt_i->if_mon) && pt_j->if_oct)
        energy += efp_charge_octupole_energy(qi, pt_j->octupole, &dr);

	// octupole - monopole
    if ((pt_j->if_znuc || pt_j->if_mon) && pt_i->if_oct)
    	energy -= efp_charge_octupole_energy(qj, pt_i->octupole, &dr);

	/* dipole - dipole */
    if (pt_i->if_dip && pt_j->if_dip)
        energy += efp_dipole_dipole_energy(&pt_i->dipole, &pt_j->dipole, &dr);

	/* dipole - quadrupole */
    if (pt_i->if_dip && pt_j->if_quad)
    	energy += efp_dipole_quadrupole_energy(&pt_i->dipole, pt_j->quadrupole, &dr);

	/* quadrupole - dipole */
    if (pt_j->if_dip && pt_i->if_dip)
        energy -= efp_dipole_quadrupole_energy(&pt_j->dipole, pt_i->quadrupole, &dr);

	/* quadrupole - quadrupole */
    if (pt_i->if_quad && pt_j->if_quad)
        energy += efp_quadrupole_quadrupole_energy(pt_i->quadrupole,
                pt_j->quadrupole, &dr);

	return energy;
}

static void
mult_mult_grad(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
    size_t pt_i_idx, size_t pt_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;
	struct multipole_pt *pt_i = fr_i->multipole_pts + pt_i_idx;
	struct multipole_pt *pt_j = fr_j->multipole_pts + pt_j_idx;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

    double qi = pt_i->monopole + pt_i->znuc;
    double qj = pt_j->monopole + pt_j->znuc;

    bool if_qi = pt_i->if_mon || pt_i->if_znuc;
    bool if_qj = pt_j->if_mon || pt_j->if_znuc;

    vec_t force_, torque_i_, torque_j_;
	vec_t force = vec_zero, torque_i = vec_zero, torque_j = vec_zero;

    // charge-charge
    if (pt_i->if_znuc && pt_j->if_znuc) {
        efp_charge_charge_grad(pt_i->znuc, pt_j->znuc, &dr,
                               &force_, &torque_i_, &torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

    // monopole - monopole
    if (pt_i->if_mon && pt_j->if_mon) {
        efp_charge_charge_grad(pt_i->monopole, pt_j->monopole, &dr,
                               &force_, &torque_i_, &torque_j_);

        if (efp->opts.elec_damp == EFP_ELEC_DAMP_SCREEN) {
            double r = vec_len(&dr);
            double screen_i = pt_i->screen2;
            double screen_j = pt_j->screen2;
            double gdamp = get_screen_damping_grad(r, screen_i, screen_j);

            force_.x *= gdamp;
            force_.y *= gdamp;
            force_.z *= gdamp;
        }
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	// charge-monopole
    if (pt_i->if_znuc && pt_j->if_mon) {
        efp_charge_charge_grad(pt_i->znuc, pt_j->monopole, &dr,
                               &force_, &torque_i_, &torque_j_);

        if (efp->opts.elec_damp == EFP_ELEC_DAMP_SCREEN) {
            double r = vec_len(&dr);
            double screen_j = pt_j->screen2;
            double gdamp_j = get_screen_damping_grad(r, screen_j, HUGE_VAL);

            force_.x *= gdamp_j;
            force_.y *= gdamp_j;
            force_.z *= gdamp_j;
            //printf("MM %d %d %d %d gdamp %lf \n",
              //     fr_i_idx, fr_j_idx, pt_i_idx, pt_j_idx, gdamp_j);
        }
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

    // monopole-charge
    if (pt_j->if_znuc && pt_i->if_mon) {
        efp_charge_charge_grad(pt_i->monopole, pt_j->znuc, &dr,
                               &force_, &torque_i_, &torque_j_);

        if (efp->opts.elec_damp == EFP_ELEC_DAMP_SCREEN) {
            double r = vec_len(&dr);
            double screen_i = pt_i->screen2;
            double gdamp_i = get_screen_damping_grad(r, screen_i, HUGE_VAL);

            force_.x *= gdamp_i;
            force_.y *= gdamp_i;
            force_.z *= gdamp_i;
        }
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

    // monopole - dipole
    if (if_qi && pt_j->if_dip) {
        efp_charge_dipole_grad(qi, &pt_j->dipole, &dr,
                               &force_, &torque_i_, &torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	// dipole - monopole
    if (if_qj && pt_i->if_dip) {
        efp_charge_dipole_grad(qj, &pt_i->dipole, &dr,
                               &force_, &torque_j_, &torque_i_);
        vec_negate(&force_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	// monopole - quadrupole
    if (if_qi && pt_j->if_quad) {
        efp_charge_quadrupole_grad(qi, pt_j->quadrupole, &dr,
                                   &force_, &torque_i_, &torque_j_);
        vec_negate(&torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	// quadrupole - monopole
    if (if_qj && pt_i->if_quad) {
        efp_charge_quadrupole_grad(qj, pt_i->quadrupole, &dr,
                                   &force_, &torque_j_, &torque_i_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	// monopole - octupole
    if (if_qi && pt_j->if_oct) {
        efp_charge_octupole_grad(qi, pt_j->octupole, &dr,
                                 &force_, &torque_i_, &torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	// octupole - monopole
    if (if_qj && pt_i->if_oct) {
        efp_charge_octupole_grad(qj, pt_i->octupole, &dr,
                                 &force_, &torque_j_, &torque_i_);
        vec_negate(&force_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	/* dipole - dipole */
    if (pt_i->if_dip && pt_j->if_dip) {
        efp_dipole_dipole_grad(&pt_i->dipole, &pt_j->dipole, &dr,
                               &force_, &torque_i_, &torque_j_);
        vec_negate(&torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	/* dipole - quadrupole */
    if (pt_i->if_dip && pt_j->if_quad) {
        efp_dipole_quadrupole_grad(&pt_i->dipole, pt_j->quadrupole, &dr,
                                   &force_, &torque_i_, &torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	/* quadrupole - dipole */
    if (pt_j->if_dip && pt_i->if_quad) {
        efp_dipole_quadrupole_grad(&pt_j->dipole, pt_i->quadrupole, &dr,
                                   &force_, &torque_j_, &torque_i_);
        vec_negate(&force_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	/* quadrupole - quadrupole */
    if (pt_i->if_quad && pt_j->if_quad) {
        efp_quadrupole_quadrupole_grad(pt_i->quadrupole, pt_j->quadrupole,
                                       &dr, &force_, &torque_i_, &torque_j_);
        vec_negate(&torque_j_);
        add_3(&force, &force_, &torque_i, &torque_i_, &torque_j, &torque_j_);
    }

	vec_scale(&force, swf->swf);
	vec_scale(&torque_i, swf->swf);
	vec_scale(&torque_j, swf->swf);

	efp_add_force(efp->grad + fr_i_idx, CVEC(fr_i->x), CVEC(pt_i->x),
	    &force, &torque_i);
	efp_sub_force(efp->grad + fr_j_idx, CVEC(fr_j->x), CVEC(pt_j->x),
	    &force, &torque_j);
	efp_add_stress(&swf->dr, &force, &efp->stress);
}

double
efp_frag_frag_elec(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;
	struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
	double energy = 0.0;

    // skip calculations if distance between fragments is too big...
    if (swf.swf == 0.0) {
        return 0.0;
    }
    else {
        /* mult points - mult points */
        for (size_t ii = 0; ii < fr_i->n_multipole_pts; ii++) {
            for (size_t jj = 0; jj < fr_j->n_multipole_pts; jj++) {
                energy += mult_mult_energy(efp, fr_i_idx, fr_j_idx,
                                           ii, jj, &swf);
                if (efp->do_gradient) {
                    mult_mult_grad(efp, fr_i_idx, fr_j_idx,
                                   ii, jj, &swf);
                }
            }
        }

        vec_t force = {
                swf.dswf.x * energy,
                swf.dswf.y * energy,
                swf.dswf.z * energy
        };

        six_atomic_add_xyz(efp->grad + fr_i_idx, &force);
        six_atomic_sub_xyz(efp->grad + fr_j_idx, &force);
        efp_add_stress(&swf.dr, &force, &efp->stress);

        return energy * swf.swf;
    }
}

static void
rotate_quadrupole(const mat_t *rotmat, const double *in, double *out)
{
	double full_in[9], full_out[9];

	for (size_t a = 0; a < 3; a++)
		for (size_t b = 0; b < 3; b++)
			full_in[a * 3 + b] = in[quad_idx(a, b)];

	efp_rotate_t2(rotmat, full_in, full_out);

	for (size_t a = 0; a < 3; a++)
		for (size_t b = 0; b < 3; b++)
			out[quad_idx(a, b)] = full_out[a * 3 + b];
}

static void
rotate_octupole(const mat_t *rotmat, const double *in, double *out)
{
	double full_in[27], full_out[27];

	for (size_t a = 0; a < 3; a++)
		for (size_t b = 0; b < 3; b++)
			for (size_t c = 0; c < 3; c++) {
				size_t idx = 9 * a + 3 * b + c;
				full_in[idx] = in[oct_idx(a, b, c)];
			}

	efp_rotate_t3(rotmat, full_in, full_out);

	for (size_t a = 0; a < 3; a++)
		for (size_t b = 0; b < 3; b++)
			for (size_t c = 0; c < 3; c++) {
				size_t idx = 9 * a + 3 * b + c;
				out[oct_idx(a, b, c)] = full_out[idx];
			}
}

void
efp_update_elec(struct frag *frag)
{
	for (size_t i = 0; i < frag->n_multipole_pts; i++) {
		const struct multipole_pt *in = frag->lib->multipole_pts + i;
		struct multipole_pt *out = frag->multipole_pts + i;

		/* move point position */
		efp_move_pt(CVEC(frag->x), &frag->rotmat,
		    CVEC(in->x), VEC(out->x));

		/* rotate dipole */
		if (out->if_dip)
		    out->dipole = mat_vec(&frag->rotmat, &in->dipole);

		/* rotate quadrupole */
		if (out->if_quad) {
            rotate_quadrupole(&frag->rotmat, in->quadrupole, out->quadrupole);

            /* correction for Buckingham quadrupoles */
            double *quad = out->quadrupole;

            double qtr = quad[quad_idx(0, 0)] +
                         quad[quad_idx(1, 1)] +
                         quad[quad_idx(2, 2)];

            quad[0] = 1.5 * quad[0] - 0.5 * qtr;
            quad[1] = 1.5 * quad[1] - 0.5 * qtr;
            quad[2] = 1.5 * quad[2] - 0.5 * qtr;
            quad[3] = 1.5 * quad[3];
            quad[4] = 1.5 * quad[4];
            quad[5] = 1.5 * quad[5];
        }

		/* rotate octupole */
		if (out->if_oct) {
            rotate_octupole(&frag->rotmat, in->octupole, out->octupole);

            /* correction for Buckingham octupoles */
            double *oct = out->octupole;

            double otrx = oct[oct_idx(0, 0, 0)] +
                          oct[oct_idx(0, 1, 1)] +
                          oct[oct_idx(0, 2, 2)];
            double otry = oct[oct_idx(0, 0, 1)] +
                          oct[oct_idx(1, 1, 1)] +
                          oct[oct_idx(1, 2, 2)];
            double otrz = oct[oct_idx(0, 0, 2)] +
                          oct[oct_idx(1, 1, 2)] +
                          oct[oct_idx(2, 2, 2)];

            oct[0] = 2.5 * oct[0] - 1.5 * otrx;
            oct[1] = 2.5 * oct[1] - 1.5 * otry;
            oct[2] = 2.5 * oct[2] - 1.5 * otrz;
            oct[3] = 2.5 * oct[3] - 0.5 * otry;
            oct[4] = 2.5 * oct[4] - 0.5 * otrz;
            oct[5] = 2.5 * oct[5] - 0.5 * otrx;
            oct[6] = 2.5 * oct[6] - 0.5 * otrz;
            oct[7] = 2.5 * oct[7] - 0.5 * otrx;
            oct[8] = 2.5 * oct[8] - 0.5 * otry;
            oct[9] = 2.5 * oct[9];
        }
	}
}

void efp_update_elec_special(struct frag *frag)
{
    size_t natom = frag->n_atoms;

    for (size_t i = 0; i < frag->n_multipole_pts; i++) {
        const struct multipole_pt *in = frag->lib->multipole_pts + i;
        struct multipole_pt *out = frag->multipole_pts + i;

        /* copy atom coordinates into multipole points */
        if (i < natom) {
            out->x = frag->atoms[i].x;
            out->y = frag->atoms[i].y;
            out->z = frag->atoms[i].z;
        }
        else {
            if (out->label[0] == 'B' && out->label[1] == 'O') {
                int length = strlen(out->label) - 2;
                printf(" Analyzing label %s, length is %d\n", out->label, length);
                size_t m1, m2;
                if (length == 2) {
                    char label1[1], label2[1];
                    strncpy(label1,out->label+2,1);
                    strncpy(label2,out->label+3,1);
                    sscanf(label1, "%zu", &m1);
                    sscanf(label2, "%zu", &m2);
                }
                else if (length == 3) {
                    char label1[2], label2[1];
                    strncpy(label1,out->label+2,2);
                    strncpy(label2,out->label+4,1);
                    sscanf(label1, "%zu", &m1);
                    sscanf(label2, "%zu", &m2);
                }
                else if (length == 4) {
                    char label1[2], label2[2];
                    strncpy(label1,out->label+2,2);
                    strncpy(label2,out->label+4,2);
                    sscanf(label1, "%zu", &m1);
                    sscanf(label2, "%zu", &m2);
                }
                else printf("Reading BO point %s but do not know what to do with it!\n", out->label);

                out->x = (frag->atoms[m1-1].x + frag->atoms[m2-1].x)/2;
                out->y = (frag->atoms[m1-1].y + frag->atoms[m2-1].y)/2;
                out->z = (frag->atoms[m1-1].z + frag->atoms[m2-1].z)/2;
            }
        }

        /* rotate dipole */
        if (out->if_dip)
            out->dipole = mat_vec(&frag->rotmat, &in->dipole);

        /* rotate quadrupole */
        if (out->if_quad) {
            rotate_quadrupole(&frag->rotmat, in->quadrupole, out->quadrupole);

            /* correction for Buckingham quadrupoles */
            double *quad = out->quadrupole;

            double qtr = quad[quad_idx(0, 0)] +
                         quad[quad_idx(1, 1)] +
                         quad[quad_idx(2, 2)];

            quad[0] = 1.5 * quad[0] - 0.5 * qtr;
            quad[1] = 1.5 * quad[1] - 0.5 * qtr;
            quad[2] = 1.5 * quad[2] - 0.5 * qtr;
            quad[3] = 1.5 * quad[3];
            quad[4] = 1.5 * quad[4];
            quad[5] = 1.5 * quad[5];
        }

        /* rotate octupole */
        if (out->if_oct) {
            rotate_octupole(&frag->rotmat, in->octupole, out->octupole);

            /* correction for Buckingham octupoles */
            double *oct = out->octupole;

            double otrx = oct[oct_idx(0, 0, 0)] +
                          oct[oct_idx(0, 1, 1)] +
                          oct[oct_idx(0, 2, 2)];
            double otry = oct[oct_idx(0, 0, 1)] +
                          oct[oct_idx(1, 1, 1)] +
                          oct[oct_idx(1, 2, 2)];
            double otrz = oct[oct_idx(0, 0, 2)] +
                          oct[oct_idx(1, 1, 2)] +
                          oct[oct_idx(2, 2, 2)];

            oct[0] = 2.5 * oct[0] - 1.5 * otrx;
            oct[1] = 2.5 * oct[1] - 1.5 * otry;
            oct[2] = 2.5 * oct[2] - 1.5 * otrz;
            oct[3] = 2.5 * oct[3] - 0.5 * otry;
            oct[4] = 2.5 * oct[4] - 0.5 * otrz;
            oct[5] = 2.5 * oct[5] - 0.5 * otrx;
            oct[6] = 2.5 * oct[6] - 0.5 * otrz;
            oct[7] = 2.5 * oct[7] - 0.5 * otrx;
            oct[8] = 2.5 * oct[8] - 0.5 * otry;
            oct[9] = 2.5 * oct[9];
        }
    }
}

static double
compute_ai_elec_frag(struct efp *efp, size_t frag_idx)
{
	struct frag *fr_i = efp->frags + frag_idx;
	double energy = 0.0;

	/*
	for (size_t i = 0; i < fr_i->n_atoms; i++) {
		for (size_t j = 0; j < efp->n_ptc; j++) {
			struct efp_atom *at_i = fr_i->atoms + i;
			vec_t dr = vec_sub(CVEC(at_i->x), efp->ptc_xyz + j);

			energy += efp_charge_charge_energy(at_i->znuc,
			    efp->ptc[j], &dr);
		}
	} */

	for (size_t i = 0; i < fr_i->n_multipole_pts; i++) {
		for (size_t j = 0; j < efp->n_ptc; j++) {
			struct multipole_pt *pt_i = fr_i->multipole_pts + i;
			vec_t dr = vec_sub(CVEC(pt_i->x), efp->ptc_xyz + j);

			/* charge - monopole */
			// WHY NOT USING SCREEN2 HERE???
			if (pt_i->if_mon || pt_i->if_znuc) {
                double qi = pt_i->monopole + pt_i->znuc;
                energy += efp_charge_charge_energy(efp->ptc[j],
                                                   qi, &dr);
            }
            // energy += efp_charge_charge_energy(efp->ptc[j],
            //                                 pt_i->monopole, &dr);

			/* charge - dipole */
			if (pt_i->if_dip)
			    energy += efp_charge_dipole_energy(efp->ptc[j], &pt_i->dipole, &dr);

			/* charge - quadrupole */
            if (pt_i->if_quad)
			    energy += efp_charge_quadrupole_energy(efp->ptc[j], pt_i->quadrupole, &dr);

			/* charge - octupole */
            if (pt_i->if_oct)
                energy += efp_charge_octupole_energy(efp->ptc[j], pt_i->octupole, &dr);
		}
	}
	return energy;
}

static void
compute_ai_elec_frag_grad(struct efp *efp, size_t frag_idx)
{
	struct frag *fr_j = efp->frags + frag_idx;
	vec_t force, add_i, add_j, force_, add_i_, add_j_;

	for (size_t i = 0; i < efp->n_ptc; i++) {
		/* ab initio atom - fragment atoms
		for (size_t k = 0; k < fr_j->n_atoms; k++) {
			struct efp_atom *at_j = fr_j->atoms + k;
			vec_t dr = vec_sub(CVEC(at_j->x), efp->ptc_xyz + i);

			efp_charge_charge_grad(efp->ptc[i], at_j->znuc, &dr,
			    &force, &add_i, &add_j);
			vec_atomic_add(efp->ptc_grad + i, &force);
			efp_sub_force(efp->grad + frag_idx, CVEC(fr_j->x),
			    CVEC(at_j->x), &force, &add_j);
		} */

		/* ab initio atom - fragment multipoles */
		for (size_t k = 0; k < fr_j->n_multipole_pts; k++) {
			struct multipole_pt *pt_j = fr_j->multipole_pts + k;
			vec_t dr = vec_sub(CVEC(pt_j->x), efp->ptc_xyz + i);

			force = vec_zero;
			add_i = vec_zero;
			add_j = vec_zero;

			/* monopole */
			if (pt_j->if_mon || pt_j->if_znuc) {
			    double qj = pt_j->monopole + pt_j->znuc;
                efp_charge_charge_grad(efp->ptc[i], qj, &dr,
                                       &force_, &add_i_, &add_j_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			/* dipole */
			if (pt_j->if_dip) {
                efp_charge_dipole_grad(efp->ptc[i], &pt_j->dipole, &dr,
                                       &force_, &add_i_, &add_j_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			/* quadrupole */
            if (pt_j->if_quad) {
                efp_charge_quadrupole_grad(efp->ptc[i],
                                           pt_j->quadrupole, &dr, &force_, &add_i_, &add_j_);
                vec_negate(&add_j_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			/* octupole */
            if (pt_j->if_oct) {
                efp_charge_octupole_grad(efp->ptc[i], pt_j->octupole,
                                         &dr, &force_, &add_i_, &add_j_);
                add_3(&force, &force_, &add_i, &add_i_,
                      &add_j, &add_j_);
            }

			vec_atomic_add(efp->ptc_grad + i, &force);
			efp_sub_force(efp->grad + frag_idx, CVEC(fr_j->x),
			    CVEC(pt_j->x), &force, &add_j);
		}
	}
}

static void
compute_ai_elec_range(struct efp *efp, size_t from, size_t to, void *data)
{
	double energy = 0.0;
	double energy_tmp = 0.0;

	(void)data;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic) reduction(+:energy)
#endif
	for (size_t i = from; i < to; i++) {
        // skip special fragment
        if (i == efp->opts.special_fragment)
            continue;

		energy_tmp = compute_ai_elec_frag(efp, i);
		energy += energy_tmp;
        if (efp->opts.enable_pairwise && efp->opts.ligand == -1) {
            efp->pair_energies[i].electrostatic += energy_tmp;
        }
		if (efp->do_gradient)
			compute_ai_elec_frag_grad(efp, i);
	}
	efp->energy.electrostatic_point_charges += energy;
}

enum efp_result
efp_compute_ai_elec(struct efp *efp)
{
	if (!(efp->opts.terms & EFP_TERM_AI_ELEC))
		return EFP_RESULT_SUCCESS;

	efp_balance_work(efp, compute_ai_elec_range, NULL);
	efp_allreduce(&efp->energy.electrostatic_point_charges, 1);

	return EFP_RESULT_SUCCESS;
}

static double
qq_energy(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
                 size_t pt_i_idx, size_t pt_j_idx, const struct swf *swf)
{
    struct frag *fr_i = efp->frags + fr_i_idx;
    struct frag *fr_j = efp->frags + fr_j_idx;
    struct efp_atom *pt_i = fr_i->atoms + pt_i_idx;
    struct efp_atom *pt_j = fr_j->atoms + pt_j_idx;

    vec_t dr = {
            pt_j->x - pt_i->x - swf->cell.x,
            pt_j->y - pt_i->y - swf->cell.y,
            pt_j->z - pt_i->z - swf->cell.z
    };

    double energy = 0.0;

    // charge - charge
    energy += efp_charge_charge_energy(pt_i->mm_charge, pt_j->mm_charge, &dr);

    // gradient
    if (efp->do_gradient) {
        vec_t force_, add_i_, add_j_;
        vec_t force = vec_zero;

        // charge-charge
        efp_charge_charge_grad(pt_i->mm_charge, pt_j->mm_charge, &dr,
                               &force_, &add_i_, &add_j_);
        vec_add(&force, &force_);
        vec_scale(&force, swf->swf);

        efp_add_force(efp->grad + fr_i_idx, CVEC(fr_i->x), CVEC(pt_i->x),
                      &force, &vec_zero);
        efp_sub_force(efp->grad + fr_j_idx, CVEC(fr_j->x), CVEC(pt_j->x),
                      &force, &vec_zero);
        efp_add_stress(&swf->dr, &force, &efp->stress);

        // adding forces to atoms as well - clean this place later
        vec_t force2 = {
                swf->dswf.x * energy,
                swf->dswf.y * energy,
                swf->dswf.z * energy
        };

        pt_i->gx += force.x + force2.x;
        pt_i->gy += force.y + force2.y;
        pt_i->gz += force.z + force2.z;

        pt_j->gx -= force.x + force2.x;
        pt_j->gy -= force.y + force2.y;
        pt_j->gz -= force.z + force2.z;
    }

    return energy;
}

static double
lj_energy(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
          size_t pt_i_idx, size_t pt_j_idx, const struct swf *swf)
{
    int combination_rule = 2; // need to add keyword!

    struct frag *fr_i = efp->frags + fr_i_idx;
    struct frag *fr_j = efp->frags + fr_j_idx;
    struct efp_atom *pt_i = fr_i->atoms + pt_i_idx;
    struct efp_atom *pt_j = fr_j->atoms + pt_j_idx;

    vec_t dr = {
            pt_j->x - pt_i->x - swf->cell.x,
            pt_j->y - pt_i->y - swf->cell.y,
            pt_j->z - pt_i->z - swf->cell.z
    };
    double r = vec_len(&dr);

    double energy = 0.0;
    double g = 0.0, g1 = 0.0, g2 = 0.0;
    double r2, sr6 = 0.0;

    if (combination_rule == 1) {
        // E_lj = (C_12/r^12 - C_6/r^6)
        // sigma_ij = sqrt(C_6_i*C_6_j)
        // eps_ij = sqrt(C_12_i * C_12_j)
        double C6 = sqrt(pt_i->sigma * pt_j->sigma); // C_6
        double C12 = sqrt(pt_i->epsilon * pt_j->epsilon); //C_12
        r2 = r*r;
        sr6 = 1/(r2*r2*r2);
        energy += (C12*sr6 * sr6 - C6*sr6);

        if (efp->do_gradient) {
            r2 = r * r;
            g1 = 6.0 * C6 * sr6 / r2;
            g2 = -12.0 * C12 * sr6 * sr6 / r2;
            g = -(g1 + g2);
        }
    }
    else if (combination_rule == 2) {
        // E_lj = 4*epsilon*((sigma/r)^12 - (sigma/r)^6)
        // sigma_ij = 0.5 * (sigma_i + sigma_j)
        // eps_ij = sqrt(eps_i * eps_j)
        double sigma_ij = 0.5*(pt_i->sigma + pt_j->sigma);
        sr6 = pow(sigma_ij / r, 6);
        double epsilon_ij = sqrt(pt_i->epsilon * pt_j->epsilon);
        energy += 4 * epsilon_ij * (sr6 * sr6 - sr6);

        if (efp->do_gradient) {
            r2 = r * r;
            g1 = 6.0 * sr6 / r2;
            g2 = -12.0 * sr6 * sr6 / r2;
            // force is opposite of gradient!
            g = -4 * epsilon_ij * (g1 + g2);
        }
    }
    else if (combination_rule == 3) {
        // used in OPLS
        // E_lj = 4*epsilon*((sigma/r)^12 - (sigma/r)^6)
        // sigma_ij = sqrt(sigma_i * sigma_j)
        // eps_ij = sqrt(eps_i * eps_j)
        double sigma_ij = sqrt(pt_i->sigma * pt_j->sigma);
        sr6 = pow(sigma_ij / r, 6);
        double epsilon_ij = sqrt(pt_i->epsilon * pt_j->epsilon);
        energy += 4 * epsilon_ij * (sr6 * sr6 - sr6);

        if (efp->do_gradient) {
            r2 = r*r;
            g1 = 6.0 * sr6 / r2;
            g2 = -12.0 * sr6*sr6 / r2;
            g = -4*epsilon_ij * (g1+g2);
        }
    }
    else {
        printf("WARNING: Unknown combination rule for LJ; LJ energy is not computed!");
    }

    if (efp->do_gradient) {
        vec_t force = {
                g * dr.x * swf->swf,
                g * dr.y * swf->swf,
                g * dr.z * swf->swf
        };

        // careful: adding force both to atoms and fragments...
        // clean this place later

        // this force contribution is added only to atoms here
        // it is added to fragments in frag_frag routine
        vec_t force2 = {
                swf->dswf.x * energy,
                swf->dswf.y * energy,
                swf->dswf.z * energy
        };

        pt_i->gx += force.x + force2.x;
        pt_i->gy += force.y + force2.y;
        pt_i->gz += force.z + force2.z;

        pt_j->gx -= force.x + force2.x;
        pt_j->gy -= force.y + force2.y;
        pt_j->gz -= force.z + force2.z;

        // adding force to fragments
        efp_add_force(efp->grad + fr_i_idx, CVEC(fr_i->x), CVEC(pt_i->x),
                      &force, &vec_zero);
        efp_sub_force(efp->grad + fr_j_idx, CVEC(fr_j->x), CVEC(pt_j->x),
                      &force, &vec_zero);
        efp_add_stress(&swf->dr, &force, &efp->stress);
    }

    return energy;
}

double
efp_frag_frag_qq(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx)
{
    struct frag *fr_i = efp->frags + fr_i_idx;
    struct frag *fr_j = efp->frags + fr_j_idx;
    // might need to change this switching function treatment
    struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
    double energy = 0.0;

    // skip calculations if distance between fragments is too big...
    if (swf.swf == 0.0) {
        return 0.0;
    }
    else {
        for (size_t ii = 0; ii < fr_i->n_atoms; ii++) {
            for (size_t jj = 0; jj < fr_j->n_atoms; jj++) {
                energy += qq_energy(efp, fr_i_idx, fr_j_idx, ii, jj, &swf);
            }
        }

        if (efp->do_gradient) {
            vec_t force = {
                    swf.dswf.x * energy,
                    swf.dswf.y * energy,
                    swf.dswf.z * energy
            };

            six_atomic_add_xyz(efp->grad + fr_i_idx, &force);
            six_atomic_sub_xyz(efp->grad + fr_j_idx, &force);
            efp_add_stress(&swf.dr, &force, &efp->stress);
        }

        return energy * swf.swf;
    }
}

double
efp_frag_frag_lj(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx)
{
    struct frag *fr_i = efp->frags + fr_i_idx;
    struct frag *fr_j = efp->frags + fr_j_idx;
    // might need to change this switching function treatment
    struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
    double energy = 0.0;

    // skip calculations if distance between fragments is too big...
    if (swf.swf == 0.0) {
        return 0.0;
    }
    else {
        for (size_t ii = 0; ii < fr_i->n_atoms; ii++) {
            for (size_t jj = 0; jj < fr_j->n_atoms; jj++) {
                energy += lj_energy(efp, fr_i_idx, fr_j_idx, ii, jj, &swf);
            }
        }

        if (efp->do_gradient) {
            vec_t force = {
                    swf.dswf.x * energy,
                    swf.dswf.y * energy,
                    swf.dswf.z * energy
            };

            six_atomic_add_xyz(efp->grad + fr_i_idx, &force);
            six_atomic_sub_xyz(efp->grad + fr_j_idx, &force);
            efp_add_stress(&swf.dr, &force, &efp->stress);
        }
        return energy * swf.swf;
    }
}

static double
compute_ai_qq_frag(struct efp *efp, size_t frag_idx)
{
    struct frag *fr_i = efp->frags + frag_idx;
    double energy = 0.0;

    for (size_t i = 0; i < fr_i->n_atoms; i++) {
        for (size_t j = 0; j < efp->n_ptc; j++) {
            struct efp_atom *at_i = fr_i->atoms + i;
            vec_t dr = vec_sub(CVEC(at_i->x), efp->ptc_xyz + j);

            energy += efp_charge_charge_energy(at_i->mm_charge,
                efp->ptc[j], &dr);
        }
    }
    return energy;
}

static void
compute_ai_qq_frag_grad(struct efp *efp, size_t frag_idx)
{
    struct frag *fr_i = efp->frags + frag_idx;

    for (size_t i = 0; i < fr_i->n_atoms; i++) {
        for (size_t j = 0; j < efp->n_ptc; j++) {
            struct efp_atom *at_i = fr_i->atoms + i;

            vec_t force, add1, add2;
            vec_t dr = vec_sub(CVEC(at_i->x), efp->ptc_xyz + j);

            efp_charge_charge_grad(efp->ptc[j], at_i->mm_charge, &dr,
                                   &force, &add1, &add2);
            vec_atomic_add(efp->ptc_grad + j, &force);
            efp_sub_force(efp->grad + frag_idx, CVEC(fr_i->x),
                          CVEC(at_i->x), &force, &vec_zero);

            // add forces to atoms as well - clean this later
            at_i->gx -= force.x;
            at_i->gy -= force.y;
            at_i->gz -= force.z;
        }
    }
}

static void
compute_ai_qq_range(struct efp *efp, size_t from, size_t to, void *data)
{
    double energy = 0.0;
    double energy_tmp = 0.0;

    (void)data;

#ifdef _OPENMP
#pragma omp parallel for schedule(dynamic) reduction(+:energy)
#endif
    for (size_t i = from; i < to; i++) {
        // skip special fragment
        if (i == efp->opts.special_fragment)
            continue;

        // where are switching functions???

        energy_tmp = compute_ai_qq_frag(efp, i);
        energy += energy_tmp;
        // no pairwise interactions so far
        //if (efp->opts.enable_pairwise && efp->opts.ligand == -1) {
        //    efp->pair_energies[i].electrostatic += energy_tmp;
        //}
        if (efp->do_gradient) {
            compute_ai_qq_frag_grad(efp, i);
        }
    }
    // ??? where to store this energy?
    efp->energy.electrostatic_point_charges += energy;
}

enum efp_result
efp_compute_ai_qq(struct efp *efp)
{
    if (!(efp->opts.terms & EFP_TERM_AI_QQ))
        return EFP_RESULT_SUCCESS;

    efp_balance_work(efp, compute_ai_qq_range, NULL);
    efp_allreduce(&efp->energy.electrostatic_point_charges, 1);

    return EFP_RESULT_SUCCESS;
}
