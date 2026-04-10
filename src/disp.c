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

#include "private.h"
#include <stdio.h>

static const double weights[] = {
	0.72086099022968040154E-02, 0.17697067815034886394E-01,
	0.30660908596251749739E-01, 0.48381293256249884995E-01,
	0.74878830420650517080E-01, 0.11806515901361630228E+00,
	0.19535413832209084204E+00, 0.35055692324483221824E+00,
	0.71577113554429568336E+00, 0.18140975997632396972E+01,
	0.69792344511487082324E+01, 0.83248093882965845391E+02
};

static double
get_damp_tt(double r)
{
	static const double a = 1.5; /* Tang-Toennies damping parameter */

	double ra = r * a;
	double ra2 = ra * ra;
	double ra3 = ra2 * ra;
	double ra4 = ra3 * ra;
	double ra5 = ra4 * ra;
	double ra6 = ra5 * ra;

	return 1.0 - exp(-ra) * (1.0 + ra + ra2 / 2.0 + ra3 / 6.0 +
	    ra4 / 24.0 + ra5 / 120.0 + ra6 / 720.0);
}

static double
get_damp_tt_grad(double r)
{
	static const double a = 1.5; /* Tang-Toennies damping parameter */

	double ra = r * a;
	double ra2 = ra * ra;
	double ra6 = ra2 * ra2 * ra2;

	return a * exp(-ra) * ra6 / 720.0;
}

static double
disp_tt(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx, size_t pt_i_idx,
    size_t pt_j_idx, double sum, const struct swf *swf)
{
	const struct frag *fr_i = efp->frags + fr_i_idx;
	const struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

	double r = vec_len(&dr);
	double r2 = r * r;
	double r6 = r2 * r2 * r2;

	double damp = get_damp_tt(r);
	double energy = -4.0 / 3.0 * sum * damp / r6;

	if (efp->do_gradient) {
		double gdamp = get_damp_tt_grad(r);
		double g = 4.0 / 3.0 * sum * (gdamp / r - 6.0 * damp / r2) / r6;

		vec_t force = {
			g * dr.x * swf->swf,
			g * dr.y * swf->swf,
			g * dr.z * swf->swf
		};

		efp_add_force(efp->grad + fr_i_idx, CVEC(fr_i->x),
		    CVEC(pt_i->x), &force, NULL);
		efp_sub_force(efp->grad + fr_j_idx, CVEC(fr_j->x),
		    CVEC(pt_j->x), &force, NULL);
		efp_add_stress(&swf->dr, &force, &efp->stress);
	}
	return energy;
}

static double
disp_overlap(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
    size_t pt_i_idx, size_t pt_j_idx, double s_ij, six_t ds_ij,
    double sum, const struct swf *swf)
{
	const struct frag *fr_i = efp->frags + fr_i_idx;
	const struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

	double r = vec_len(&dr);
	double r2 = r * r;
	double r6 = r2 * r2 * r2;

	double ln_s = 0.0;
	double damp = 1.0;

	if (fabs(s_ij) > 1.0e-5) {
		ln_s = log(fabs(s_ij));
		damp = 1.0 - s_ij * s_ij * (1.0 - 2.0 * ln_s +
		    2.0 * ln_s * ln_s);
	}

	double energy = -4.0 / 3.0 * sum * damp / r6;

	if (efp->do_gradient) {
		vec_t force, torque_i, torque_j;

		double t1 = -8.0 * sum / r6 / r2 * damp;
		double t2 = -16.0 / 3.0 * sum / r6 * ln_s * ln_s * s_ij;

		vec_t dr_i = vec_sub(CVEC(pt_i->x), CVEC(fr_i->x));
		vec_t dr_j = vec_sub(CVEC(pt_j->x), CVEC(fr_j->x));

		force.x = (t1 * dr.x - t2 * ds_ij.x) * swf->swf;
		force.y = (t1 * dr.y - t2 * ds_ij.y) * swf->swf;
		force.z = (t1 * dr.z - t2 * ds_ij.z) * swf->swf;

		torque_i.x = swf->swf * (t1 * (dr.z * dr_i.y - dr.y * dr_i.z) +
		    t2 * ds_ij.a);
		torque_i.y = swf->swf * (t1 * (dr.x * dr_i.z - dr.z * dr_i.x) +
		    t2 * ds_ij.b);
		torque_i.z = swf->swf * (t1 * (dr.y * dr_i.x - dr.x * dr_i.y) +
		    t2 * ds_ij.c);

		torque_j.x = swf->swf * (t1 * (dr.z * dr_j.y - dr.y * dr_j.z) +
		    t2 * (ds_ij.z * swf->dr.y - ds_ij.y * swf->dr.z) +
		    t2 * ds_ij.a);
		torque_j.y = swf->swf * (t1 * (dr.x * dr_j.z - dr.z * dr_j.x) +
		    t2 * (ds_ij.x * swf->dr.z - ds_ij.z * swf->dr.x) +
		    t2 * ds_ij.b);
		torque_j.z = swf->swf * (t1 * (dr.y * dr_j.x - dr.x * dr_j.y) +
		    t2 * (ds_ij.y * swf->dr.x - ds_ij.x * swf->dr.y) +
		    t2 * ds_ij.c);

		six_atomic_add_xyz(efp->grad + fr_i_idx, &force);
		six_atomic_add_abc(efp->grad + fr_i_idx, &torque_i);
		six_atomic_sub_xyz(efp->grad + fr_j_idx, &force);
		six_atomic_sub_abc(efp->grad + fr_j_idx, &torque_j);
		efp_add_stress(&swf->dr, &force, &efp->stress);
	}
	return energy;
}

static double
disp_off(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx, size_t pt_i_idx,
    size_t pt_j_idx, double sum, const struct swf *swf)
{
	const struct frag *fr_i = efp->frags + fr_i_idx;
	const struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

	double r = vec_len(&dr);
	double r2 = r * r;
	double r6 = r2 * r2 * r2;

	double energy = -4.0 / 3.0 * sum / r6;

	if (efp->do_gradient) {
		double r8 = r6 * r2;
		double g = -8.0 * sum / r8;

		vec_t force = {
			g * dr.x * swf->swf,
			g * dr.y * swf->swf,
			g * dr.z * swf->swf
		};

		efp_add_force(efp->grad + fr_i_idx, CVEC(fr_i->x),
		    CVEC(pt_i->x), &force, NULL);
		efp_sub_force(efp->grad + fr_j_idx, CVEC(fr_j->x),
		    CVEC(pt_j->x), &force, NULL);
		efp_add_stress(&swf->dr, &force, &efp->stress);
	}
	return energy;
}

/* No scaling in R^-6 term. Take care of factor in the calling function */
static double
disp_base(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx, size_t pt_i_idx,
    size_t pt_j_idx, double sum, const struct swf *swf)
{
	const struct frag *fr_i = efp->frags + fr_i_idx;
	const struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

	double r = vec_len(&dr);
	double r2 = r * r;
	double r6 = r2 * r2 * r2;

	double energy =  sum / r6;

	if (efp->do_gradient) {
		double r8 = r6 * r2;
		double g = -8.0 * sum / r8;

		vec_t force = {
			g * dr.x * swf->swf,
			g * dr.y * swf->swf,
			g * dr.z * swf->swf
		};

		efp_add_force(efp->grad + fr_i_idx, CVEC(fr_i->x),
		    CVEC(pt_i->x), &force, NULL);
		efp_sub_force(efp->grad + fr_j_idx, CVEC(fr_j->x),
		    CVEC(pt_j->x), &force, NULL);
		efp_add_stress(&swf->dr, &force, &efp->stress);
	}
	return energy;
}

static double
point_point_disp(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
    size_t pt_i_idx, size_t pt_j_idx, double s, six_t ds, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	double sum = 0.0;

	for (size_t k = 0; k < ARRAY_SIZE(weights); k++) {
		double tr_i = (pt_i->tensor[k].xx +
			       pt_i->tensor[k].yy +
			       pt_i->tensor[k].zz) / 3;
		double tr_j = (pt_j->tensor[k].xx +
			       pt_j->tensor[k].yy +
			       pt_j->tensor[k].zz) / 3;
		sum += weights[k] * tr_i * tr_j;
	}

	switch (efp->opts.disp_damp) {
	case EFP_DISP_DAMP_TT:
		return disp_tt(efp, fr_i_idx, fr_j_idx,
		    pt_i_idx, pt_j_idx, sum, swf);
	case EFP_DISP_DAMP_OVERLAP:
		return disp_overlap(efp, fr_i_idx, fr_j_idx,
		    pt_i_idx, pt_j_idx, s, ds, sum, swf);
	case EFP_DISP_DAMP_OFF:
		return disp_off(efp, fr_i_idx, fr_j_idx,
		    pt_i_idx, pt_j_idx, sum, swf);
	}
	assert(0);
}

/*
 * Reference:
 *
 * Ivana Adamovic, Mark Gordon
 *
 * Dynamic polarizability, dispersion coefficient C6 and dispersion energy in
 * the effective fragment potential method
 *
 * Mol. Phys. 103, 379 (2005)
 */
double
efp_frag_frag_disp(struct efp *efp, size_t frag_i, size_t frag_j,
    const double *s, const six_t *ds)
{
	double energy = 0.0;
	double tmp=0, tmp_diag = 0, sum_mol=0, sum_diag=0;

	struct frag *fr_i = efp->frags + frag_i;
	struct frag *fr_j = efp->frags + frag_j;

    struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
    // skip calculations if distance between fragments is too big...
    if (swf.swf == 0.0) 
        return 0.0;

	////////////////////////////////////////////////////////////////
	// molecular dispersion diagonal and anisotropic
	// COM-COM distance
	vec_t Rij = {
		fr_j->x - fr_i->x - swf.cell.x,
		fr_j->y - fr_i->y - swf.cell.y,
		fr_j->z - fr_i->z - swf.cell.z
	};
	double r_ij = vec_len(&Rij);
	mat_t Tij = Tab(&Rij);

	// printf("\n 2BODY DISPERSION \n");
	for (size_t w = 0; w < ARRAY_SIZE(weights); w++) {
		tmp = 0; 
		tmp_diag = 0;
		// full
		for (size_t i=0; i<3; i++)
		for (size_t j=0; j<3; j++)
			for (size_t a=0; a<3; a++)
			for (size_t b=0; b<3; b++) {
				tmp += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
						mat_get(&Tij,a,j) * mat_get(&Tij,i,b);
			}
		// printf("MOL freq %zu: %.14lf \n", w, tmp);
		sum_mol += weights[w] * (tmp);

		// diag
		for (size_t i=0; i<3; i++)
		for (size_t j=0; j<3; j++) {
			tmp_diag += mat_get(&fr_i->dyn_elec_pol[w],i,i) * mat_get(&fr_j->dyn_elec_pol[w],j,j) *
						mat_get(&Tij,i,j) * mat_get(&Tij,i,j);
		}
		// printf("DIAG freq %zu: %.14lf \n", w, tmp_diag);
		sum_diag += weights[w] * (tmp_diag);
	}
	sum_mol = sum_mol / (2*PI);
	sum_diag = sum_diag / (2*PI); 
	//printf("\n2BODY DISP %zu %zu FULL: %.14lf DIAG: %.14lf DIFF: %.14lf\n", frag_i, frag_j, sum_mol, sum_diag, sum_mol-sum_diag);

	///////////////////////////////////////////////////////////
    
	size_t n_disp_i = fr_i->n_dynamic_polarizable_pts;
	size_t n_disp_j = fr_j->n_dynamic_polarizable_pts;

	for (size_t ii = 0, idx = 0; ii < n_disp_i; ii++)
		for (size_t jj = 0; jj < n_disp_j; jj++, idx++) 
			energy += point_point_disp(efp, frag_i, frag_j, ii, jj,
										s[idx], ds[idx], &swf);
			
	vec_t force = {
			swf.dswf.x * energy,
			swf.dswf.y * energy,
			swf.dswf.z * energy
	};

	six_atomic_add_xyz(efp->grad + frag_i, &force);
	six_atomic_sub_xyz(efp->grad + frag_j, &force);
	efp_add_stress(&swf.dr, &force, &efp->stress);
	return energy * swf.swf;
}

// temporary fix to solve trouble with erroneous mag_elec polarizabilities...
// using distributed elec-elec polarizabilities to compute molecular mag_elec polarizability
void update_mol_mag_elec_pol(struct frag *frag){
	printf("\nIn update_mol_mag_elec_pol \n");
	// use information of a local fragment
	// assume that points and tensors are already rotated 
	for (size_t w = 0; w < 12; w++) {
		mat_t *mag_elec = frag->mag_elec_pol + w; 
		for (size_t i = 0; i < frag->n_dynamic_polarizable_pts; i++) {
			struct dynamic_polarizable_pt *pt_in =
		    									frag->dynamic_polarizable_pts + i;
			const mat_t *pol = pt_in->tensor + w;
			// distance between center of point and COM
			const vec_t R = {pt_in->x - frag->x, pt_in->y - frag->y, pt_in->z - frag->z};

			mat_t tmp = mat_zero;
			for (size_t i=0; i<3; i++)
				for (size_t j=0; j<3; j++) {
					double x = mat_get(pol, i, 1) * R.z - mat_get(pol, i, 2) * R.y;
					double y = mat_get(pol, i, 2) * R.x - mat_get(pol, i, 0) * R.z;
					double z = mat_get(pol, i, 0) * R.y - mat_get(pol, i, 1) * R.x;
					mat_set(&tmp, 0, i, x);  
					mat_set(&tmp, 1, i, y);  
					mat_set(&tmp, 2, i, z);  
				}
			*mag_elec = mat_add(mag_elec, &tmp);
		}
	}
}

void
efp_update_disp(struct frag *frag)
{
	for (size_t i = 0; i < frag->n_dynamic_polarizable_pts; i++) {
		const struct dynamic_polarizable_pt *pt_in =
		    frag->lib->dynamic_polarizable_pts + i;
		struct dynamic_polarizable_pt *pt_out =
		    frag->dynamic_polarizable_pts + i;

		efp_move_pt(CVEC(frag->x), &frag->rotmat,
		    CVEC(pt_in->x), VEC(pt_out->x));
		for (size_t j = 0; j < 12; j++) {
			const mat_t *in = pt_in->tensor + j;
			mat_t *out = pt_out->tensor + j;
			efp_rotate_t2(&frag->rotmat, (const double *)in,
			    (double *)out);

			in = pt_in->mag_elec + j;
			out = pt_out->mag_elec + j;

			efp_rotate_t2(&frag->rotmat, (const double *)in,
			    (double *)out);

			in = pt_in->vel_elec + j;
			out = pt_out->vel_elec + j;

			efp_rotate_t2(&frag->rotmat, (const double *)in,
			    (double *)out);
		}
	}

	// also rotate molecular dispersion-related tensors here
	for (size_t j = 0; j < 12; j++) {

		// do not use mag_elec_pol - as it might be erroneous
		// const mat_t *in = frag->lib->mag_elec_pol + j;
		//mat_t *out = frag->mag_elec_pol + j;
		// efp_rotate_t2(&frag->rotmat, (const double *)in, (double *)out);

		const mat_t *in = frag->lib->vel_elec_pol + j;
		const mat_t *out = frag->vel_elec_pol + j;

		efp_rotate_t2(&frag->rotmat, (const double *)in, (double *)out);

		in = frag->lib->dyn_elec_pol + j;
		out = frag->dyn_elec_pol + j;

		efp_rotate_t2(&frag->rotmat, (const double *)in, (double *)out);
	}

	// compute mag_elec_pol from distributed dynamic polarizabilities
	update_mol_mag_elec_pol(frag);	
}

/* Distributed isoctropic interactions between two chiral molecules */
static double
point_point_chiral_chiral_iso(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
    size_t pt_i_idx, size_t pt_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	double sum = 0.0;

	for (size_t k = 0; k < ARRAY_SIZE(weights); k++) {
		double tr_i = (pt_i->mag_elec[k].xx +
			       pt_i->mag_elec[k].yy +
			       pt_i->mag_elec[k].zz) / 3;
		double tr_j = (pt_j->mag_elec[k].xx +
			       pt_j->mag_elec[k].yy +
			       pt_j->mag_elec[k].zz) / 3;
		sum += weights[k] * tr_i * tr_j;
	}

	sum = sum * (6.0 * FINE_CONST * FINE_CONST / PI); 
		
	return disp_base(efp, fr_i_idx, fr_j_idx, pt_i_idx, pt_j_idx, sum, swf);

	assert(0);
}

/* Distributed anisotropic interactions between two chiral molecules */
static double
point_point_chiral_chiral(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx,
    size_t pt_i_idx, size_t pt_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;

	const struct dynamic_polarizable_pt *pt_i =
	    fr_i->dynamic_polarizable_pts + pt_i_idx;
	const struct dynamic_polarizable_pt *pt_j =
	    fr_j->dynamic_polarizable_pts + pt_j_idx;

	double sum = 0.0, tmp = 0.0;

	vec_t dr = {
		pt_j->x - pt_i->x - swf->cell.x,
		pt_j->y - pt_i->y - swf->cell.y,
		pt_j->z - pt_i->z - swf->cell.z
	};

	mat_t Tij = Tab(&dr);

	for (size_t k = 0; k < ARRAY_SIZE(weights); k++) {
		tmp = 0;
		for (size_t i=0; i<3; i++)
			for (size_t j=0; j<3; j++)
				for (size_t a=0; a<3; a++)
					for (size_t b=0; b<3; b++)
						tmp += mat_get(&pt_i->mag_elec[k],i,a) * mat_get(&pt_j->mag_elec[k],j,b) *
								mat_get(&Tij,i,j) * mat_get(&Tij,a,b);
		
		//printf("freq %zu: %.10lf\n", k, tmp * weights[k]);
		sum += weights[k] * tmp;
	}
	//printf("pair %zu %zu: %.14lf\n", pt_i_idx, pt_j_idx, sum);

	sum = sum * (FINE_CONST * FINE_CONST / PI); 
		
	return sum;

	assert(0);
}


/* Molecular interactions between two chiral molecules */
static double
mol_chiral_chiral_iso(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;

	double sum = 0.0, tmp = 0.0;

	// COM-COM distance
	vec_t dr = {
		fr_j->x - fr_i->x - swf->cell.x,
		fr_j->y - fr_i->y - swf->cell.y,
		fr_j->z - fr_i->z - swf->cell.z
	};

	double r = vec_len(&dr);
	double r2 = r * r;
	double r6 = r2 * r2 * r2;

	for (size_t k = 0; k < ARRAY_SIZE(weights); k++) {
		double tr_i = (fr_i->mag_elec_pol[k].xx +
			       fr_i->mag_elec_pol[k].yy +
			       fr_i->mag_elec_pol[k].zz) / 3;
		double tr_j = (fr_j->mag_elec_pol[k].xx +
			       fr_j->mag_elec_pol[k].yy +
			       fr_j->mag_elec_pol[k].zz) / 3;
		tmp = weights[k] * tr_i * tr_j / r6;
		//printf("freq %zu: %.10lf\n", k, tmp * 6.0);
		sum += tmp;
	}

	sum = sum * (6.0 * FINE_CONST * FINE_CONST / PI); 
	return sum;

	assert(0);
}

/* Molecular interactions between two chiral molecules */
static double
mol_chiral_chiral(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;

	double sum = 0.0, tmp = 0.0;

	// COM-COM distance
	vec_t dr = {
		fr_j->x - fr_i->x - swf->cell.x,
		fr_j->y - fr_i->y - swf->cell.y,
		fr_j->z - fr_i->z - swf->cell.z
	};

	mat_t Tij = Tab(&dr);

	for (size_t k = 0; k < ARRAY_SIZE(weights); k++) {
		tmp = 0;
		for (size_t i=0; i<3; i++)
			for (size_t j=0; j<3; j++)
				for (size_t a=0; a<3; a++)
					for (size_t b=0; b<3; b++)
						tmp += mat_get(&fr_i->mag_elec_pol[k],i,a) * mat_get(&fr_j->mag_elec_pol[k],j,b) *
								mat_get(&Tij,i,j) * mat_get(&Tij,a,b);
		
		//printf("freq %zu: %.14lf\n", k, tmp * weights[k]);
		sum += weights[k] * tmp;
	}

	sum = sum * (FINE_CONST * FINE_CONST / PI); 
	// printf("\n MOL CHIRAL pair %zu %zu: %.14lf\n", fr_i_idx, fr_j_idx, sum);
	return sum;

	assert(0);
}

/* Molecular diagonal interactions between two chiral molecules */
static double
mol_chiral_chiral_diag(struct efp *efp, size_t fr_i_idx, size_t fr_j_idx, const struct swf *swf)
{
	struct frag *fr_i = efp->frags + fr_i_idx;
	struct frag *fr_j = efp->frags + fr_j_idx;

	double sum = 0.0, tmp = 0.0;

	// COM-COM distance
	vec_t dr = {
		fr_j->x - fr_i->x - swf->cell.x,
		fr_j->y - fr_i->y - swf->cell.y,
		fr_j->z - fr_i->z - swf->cell.z
	};

	mat_t Tij = Tab(&dr);

	for (size_t k = 0; k < ARRAY_SIZE(weights); k++) {
		tmp = 0;
		for (size_t i=0; i<3; i++)
			for (size_t j=0; j<3; j++) 
				tmp += mat_get(&fr_i->mag_elec_pol[k],i,i) * mat_get(&fr_j->mag_elec_pol[k],j,j) *
						mat_get(&Tij,i,j) * mat_get(&Tij,j,i);
		
		//printf("freq %zu: %.14lf\n", k, tmp * weights[k]);
		sum += weights[k] * tmp;
	}

	sum = sum * (FINE_CONST * FINE_CONST / PI); 
	// printf("\n MOL CHIRAL pair %zu %zu: %.14lf\n", fr_i_idx, fr_j_idx, sum);
	return sum;

	assert(0);
}

/* Interactions between two chiral molecules */
double
efp_frag_frag_chiral_chiral(struct efp *efp, size_t frag_i, size_t frag_j)
{
	double energy = 0.0;
	double energy_mol = 0.0; 
	double energy_iso = 0.0;
	double energy_diag = 0.0;

	struct frag *fr_i = efp->frags + frag_i;
	struct frag *fr_j = efp->frags + frag_j;

    struct swf swf = efp_make_swf(efp, fr_i, fr_j, 0);
    // skip calculations if distance between fragments is too big...
    if (swf.swf == 0.0) {
        return 0.0;
    }
    else {
        size_t n_disp_i = fr_i->n_dynamic_polarizable_pts;
        size_t n_disp_j = fr_j->n_dynamic_polarizable_pts;


        for (size_t ii = 0, idx = 0; ii < n_disp_i; ii++)
            for (size_t jj = 0; jj < n_disp_j; jj++, idx++)
                energy += point_point_chiral_chiral(efp, frag_i, frag_j, ii, jj, &swf);

		// molecular case
		energy_mol += mol_chiral_chiral(efp, frag_i, frag_j, &swf);

		// diagonal molecular case
		energy_diag += mol_chiral_chiral_diag(efp, frag_i, frag_j, &swf);

		// iso molecular case
		energy_iso += mol_chiral_chiral_iso(efp, frag_i, frag_j, &swf);

		printf("\nCHIRAL %zu %zu: MOL %.14lf, DIAG %.14lf, ISO %.14lf\n", frag_i, frag_j, energy_mol, energy_diag, energy_iso);

        // vec_t force = {
        //         swf.dswf.x * energy,
        //         swf.dswf.y * energy,
        //         swf.dswf.z * energy
        // };

        // six_atomic_add_xyz(efp->grad + frag_i, &force);
        // six_atomic_sub_xyz(efp->grad + frag_j, &force);
        // efp_add_stress(&swf.dr, &force, &efp->stress);
        return energy_diag * swf.swf;
    }
}

/*
4-body dispersion term
*/
double
efp_frag_frag_disp_4body(struct efp *efp, size_t frag_i, size_t frag_j)
{
	double sum = 0.0, sum_iso=0, sum_diag = 0; 
	double sum1=0.0, sum2=0.0, sum3=0.0, sum1_diag = 0, sum2_diag = 0, sum3_diag = 0;
	double tmp=0, tmp2=0, tmp3=0, tmp_iso=0, tmp2_iso=0, tmp3_iso=0, tmp_diag=0, tmp2_diag=0, tmp3_diag=0;
	double total_pair = 0.0;
	double ene_pair_distrib = 0.0, e_distrib = 0.0; 

	struct frag *fr_i = efp->frags + frag_i;
	struct frag *fr_j = efp->frags + frag_j;

    struct swf swf_ij = efp_make_swf(efp, fr_i, fr_j, 0);
    // skip calculations if distance between fragments is too big...
    if (swf_ij.swf == 0.0) 
        return 0.0;

		// COM-COM distances
	vec_t Rij = {
		fr_j->x - fr_i->x - swf_ij.cell.x,
		fr_j->y - fr_i->y - swf_ij.cell.y,
		fr_j->z - fr_i->z - swf_ij.cell.z
	};

	for (size_t frag_k=frag_j+1; frag_k < efp->n_frag; frag_k++) {
		if (frag_i == frag_k || frag_j == frag_k)
			continue;
		if (frag_k <= frag_i) continue; // 
		struct frag *fr_k = efp->frags + frag_k;
		struct swf swf_ik = efp_make_swf(efp, fr_i, fr_k, 0);
		struct swf swf_jk = efp_make_swf(efp, fr_j, fr_k, 0);
		if (swf_ik.swf == 0.0 || swf_jk.swf == 0.0) 
			continue;
		vec_t Rik = {
			fr_k->x - fr_i->x - swf_ik.cell.x,
			fr_k->y - fr_i->y - swf_ik.cell.y,
			fr_k->z - fr_i->z - swf_ik.cell.z
		};
		vec_t Rjk = {
			fr_k->x - fr_j->x - swf_jk.cell.x,
			fr_k->y - fr_j->y - swf_jk.cell.y,
			fr_k->z - fr_j->z - swf_jk.cell.z
		};

		for (size_t frag_l=frag_k+1; frag_l < efp->n_frag; frag_l++) {
			if (frag_i == frag_l || frag_j == frag_l)
				continue;
			struct frag *fr_l = efp->frags + frag_l;
			struct swf swf_il = efp_make_swf(efp, fr_i, fr_l, 0);
			struct swf swf_jl = efp_make_swf(efp, fr_j, fr_l, 0);
			struct swf swf_kl = efp_make_swf(efp, fr_k, fr_l, 0);
			if (swf_il.swf == 0.0 || swf_jl.swf == 0.0 || swf_kl.swf == 0.0) 
				continue;

			//e_distrib = compute_4body_distrib(efp, frag_i, frag_j, frag_k, frag_l);
			//ene_pair_distrib += e_distrib;

			// printf("\n--- 4BODY DISP %zu %zu %zu %zu ---\n", frag_i, frag_j, frag_k, frag_l);
			vec_t Ril = {
				fr_l->x - fr_i->x - swf_il.cell.x,
				fr_l->y - fr_i->y - swf_il.cell.y,
				fr_l->z - fr_i->z - swf_il.cell.z
			};

			vec_t Rjl = {
				fr_l->x - fr_j->x - swf_jl.cell.x,
				fr_l->y - fr_j->y - swf_jl.cell.y,
				fr_l->z - fr_j->z - swf_jl.cell.z
			};

			vec_t Rkl = {
				fr_l->x - fr_k->x - swf_kl.cell.x,
				fr_l->y - fr_k->y - swf_kl.cell.y,
				fr_l->z - fr_k->z - swf_kl.cell.z
			};

			double r_ij = vec_len(&Rij);
			double r_ik = vec_len(&Rik);
			double r_jk = vec_len(&Rjk);
			double r_il = vec_len(&Ril);
			double r_jl = vec_len(&Rjl);
			double r_kl = vec_len(&Rkl);
			mat_t Tij = Tab(&Rij);
			mat_t Tjk = Tab(&Rjk);
			mat_t Tkl = Tab(&Rkl);
			mat_t Til = Tab(&Ril);
			mat_t Tik = Tab(&Rik);
			mat_t Tjl = Tab(&Rjl);

			sum = 0.0, sum_iso=0, sum_diag = 0; 
			sum1=0.0, sum2=0.0, sum3=0.0, sum1_diag = 0, sum2_diag = 0, sum3_diag = 0;

			for (size_t w = 0; w < ARRAY_SIZE(weights); w++) {
				tmp = 0; 
				tmp2 = 0; 
				tmp3 = 0;
				tmp_iso = 0, tmp2_iso=0, tmp3_iso = 0;
				tmp_diag = 0, tmp2_diag=0, tmp3_diag = 0;
				for (size_t i=0; i<3; i++)
				for (size_t j=0; j<3; j++)
				for (size_t k=0; k<3; k++)
				for (size_t l=0; l<3; l++)
					for (size_t a=0; a<3; a++)
					for (size_t b=0; b<3; b++)
					for (size_t c=0; c<3; c++)
					for (size_t d=0; d<3; d++) {
					// 1-2-3-4-1
						tmp += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
								mat_get(&fr_k->dyn_elec_pol[w],k,c) * mat_get(&fr_l->dyn_elec_pol[w],l,d) *
								mat_get(&Tij,a,j) * mat_get(&Tjk,b,k) * mat_get(&Tkl,c,l) * mat_get(&Til,d,i);
						// 1-2-4-3-1
						tmp2 += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
								mat_get(&fr_k->dyn_elec_pol[w],k,c) * mat_get(&fr_l->dyn_elec_pol[w],l,d) *
								mat_get(&Tij,a,j) * mat_get(&Tjl,b,l) * mat_get(&Tkl,d,k) * mat_get(&Tik,c,i);
						// 1-3-2-4-1
						tmp3 += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
								mat_get(&fr_k->dyn_elec_pol[w],k,c) * mat_get(&fr_l->dyn_elec_pol[w],l,d) *
									mat_get(&Tik,a,k) * mat_get(&Tjk,c,j) * mat_get(&Tjl,b,l) * mat_get(&Til,d,i);
					}
				
				// printf("freq %zu: %.14lf %.14lf %.14lf\n", w, tmp, tmp2, tmp3);
				sum1 += weights[w] * tmp; //+tmp2+tmp3);
				sum2 += weights[w] * tmp2; 
				sum3 += weights[w] * tmp3; 

				// iso part
				double pol_i = (mat_get(&fr_i->dyn_elec_pol[w],0,0) + mat_get(&fr_i->dyn_elec_pol[w],1,1) +
								mat_get(&fr_i->dyn_elec_pol[w],2,2))/3;
				double pol_j = (mat_get(&fr_j->dyn_elec_pol[w],0,0) + mat_get(&fr_j->dyn_elec_pol[w],1,1) +
								mat_get(&fr_j->dyn_elec_pol[w],2,2))/3;
				double pol_k = (mat_get(&fr_k->dyn_elec_pol[w],0,0) + mat_get(&fr_k->dyn_elec_pol[w],1,1) +
								mat_get(&fr_k->dyn_elec_pol[w],2,2))/3;
				double pol_l = (mat_get(&fr_l->dyn_elec_pol[w],0,0) + mat_get(&fr_l->dyn_elec_pol[w],1,1) +
								mat_get(&fr_l->dyn_elec_pol[w],2,2))/3;
				// // 1-2-3-4-1
				// tmp_iso += 90 * pol_i*pol_j*pol_k*pol_l / (r_ij*r_ij*r_ij) / (r_jk*r_jk*r_jk)/(r_kl*r_kl*r_kl)/(r_il*r_il*r_il);
				// tmp2_iso += 90 * pol_i*pol_j*pol_k*pol_l / (r_ij*r_ij*r_ij) / (r_jl*r_jl*r_jl)/(r_kl*r_kl*r_kl)/(r_ik*r_ik*r_ik);
				// tmp3_iso += 90 * pol_i*pol_j*pol_k*pol_l / (r_ik*r_ik*r_ik) / (r_jk*r_jk*r_jk)/(r_jl*r_jl*r_jl)/(r_il*r_il*r_il);
				// // printf("ISO freq %zu: %.14lf %.14lf %.14lf\n", w, tmp_iso, tmp2_iso, tmp3_iso);
				// sum_iso += weights[w] * (tmp_iso+tmp2_iso+tmp3_iso);

				//diagonal
				for (size_t i=0; i<3; i++)
				for (size_t j=0; j<3; j++)
				for (size_t k=0; k<3; k++)
				for (size_t l=0; l<3; l++) {
					// 1-2-3-4-1
						tmp_diag += mat_get(&fr_i->dyn_elec_pol[w],i,i) * mat_get(&fr_j->dyn_elec_pol[w],j,j) *
								mat_get(&fr_k->dyn_elec_pol[w],k,k) * mat_get(&fr_l->dyn_elec_pol[w],l,l) *
								mat_get(&Tij,i,j) * mat_get(&Tjk,j,k) * mat_get(&Tkl,k,l) * mat_get(&Til,l,i);
						// 1-2-4-3-1
						tmp2_diag += mat_get(&fr_i->dyn_elec_pol[w],i,i) * mat_get(&fr_j->dyn_elec_pol[w],j,j) *
								mat_get(&fr_k->dyn_elec_pol[w],k,k) * mat_get(&fr_l->dyn_elec_pol[w],l,l) *
								mat_get(&Tij,i,j) * mat_get(&Tjl,j,l) * mat_get(&Tkl,l,k) * mat_get(&Tik,k,i);
						// 1-3-2-4-1
						tmp3_diag += mat_get(&fr_i->dyn_elec_pol[w],i,i) * mat_get(&fr_j->dyn_elec_pol[w],j,j) *
								mat_get(&fr_k->dyn_elec_pol[w],k,k) * mat_get(&fr_l->dyn_elec_pol[w],l,l) *
									mat_get(&Tik,i,k) * mat_get(&Tjk,k,j) * mat_get(&Tjl,j,l) * mat_get(&Til,l,i);
				}
				// printf("DIAG freq %zu: %.14lf %.14lf %.14lf\n", w, tmp_diag, tmp2_diag, tmp3_diag);
				sum1_diag += weights[w] * tmp_diag; //+tmp2_diag+tmp3_diag);
				sum2_diag += weights[w] * tmp2_diag;
				sum3_diag += weights[w] * tmp3_diag;
			} // end of frequency loop
			sum1 = sum1 / PI;
			sum2 = sum2 / PI;
			sum3 = sum3 / PI;
			sum1_diag = sum1_diag / PI;
			sum2_diag = sum2_diag / PI;
			sum3_diag = sum3_diag / PI;

			sum = sum1 + sum2 + sum3;
			sum_diag = sum1_diag + sum2_diag + sum3_diag;

			printf("    4BODY part1  MOL: %.14lf  DIAG: %.14lf DIFF: %.14lf \n", sum1, sum1_diag, sum1-sum1_diag);
			printf("    4BODY part2  MOL: %.14lf  DIAG: %.14lf DIFF: %.14lf \n", sum2, sum2_diag, sum2-sum2_diag);
			printf("    4BODY part3  MOL: %.14lf  DIAG: %.14lf DIFF: %.14lf \n", sum3, sum3_diag, sum3-sum3_diag);
			printf("    4BODY total  MOL: %.14lf  DIAG: %.14lf DIFF: %.14lf \n\n", sum, sum_diag, sum-sum_diag);

			total_pair = total_pair + sum; //  + (sum-sum_diag);
		}
	}
	if (fabs(total_pair) > 0.1 )
		printf("\n WARNING: 4-body for pair %zu %zu is %lf\n", frag_i, frag_j, total_pair);

	printf("\n4BODY pair %zu %zu MOL %.10lf DISTRIB %.10lf\n", frag_i, frag_j, total_pair, ene_pair_distrib);
	return ene_pair_distrib; 
	//return total_pair;
}

/*
double compute_4body_distrib(struct efp *efp, size_t frag_i, size_t frag_j, size_t frag_k, size_t frag_l)
{
	struct frag *fr_i = efp->frags + frag_i;
	struct frag *fr_j = efp->frags + frag_j;
	struct frag *fr_k = efp->frags + frag_k;
	struct frag *fr_l = efp->frags + frag_l;

	size_t n_disp_i = fr_i->n_dynamic_polarizable_pts;
	size_t n_disp_j = fr_j->n_dynamic_polarizable_pts;
	size_t n_disp_k = fr_k->n_dynamic_polarizable_pts;
	size_t n_disp_l = fr_l->n_dynamic_polarizable_pts;

	for (size_t w = 0; w < ARRAY_SIZE(weights); w++) {

	for (size_t ii = 0; ii < n_disp_i; ii++)
		for (size_t jj = 0; jj < n_disp_j; jj++) 
			for (size_t kk = 0; kk < n_disp_k; kk++) 
				for (size_t ll = 0; ll < n_disp_l; ll++) {

		vec_t Ril = {
				fr_l->x - fr_i->x - swf_il.cell.x,
				fr_l->y - fr_i->y - swf_il.cell.y,
				fr_l->z - fr_i->z - swf_il.cell.z
			};

			vec_t Rjl = {
				fr_l->x - fr_j->x - swf_jl.cell.x,
				fr_l->y - fr_j->y - swf_jl.cell.y,
				fr_l->z - fr_j->z - swf_jl.cell.z
			};

			vec_t Rkl = {
				fr_l->x - fr_k->x - swf_kl.cell.x,
				fr_l->y - fr_k->y - swf_kl.cell.y,
				fr_l->z - fr_k->z - swf_kl.cell.z
			};

			double r_ij = vec_len(&Rij);
			double r_ik = vec_len(&Rik);
			double r_jk = vec_len(&Rjk);
			double r_il = vec_len(&Ril);
			double r_jl = vec_len(&Rjl);
			double r_kl = vec_len(&Rkl);
			mat_t Tij = Tab(&Rij);
			mat_t Tjk = Tab(&Rjk);
			mat_t Tkl = Tab(&Rkl);
			mat_t Til = Tab(&Ril);
			mat_t Tik = Tab(&Rik);
			mat_t Tjl = Tab(&Rjl);

			sum = 0.0, sum_iso=0, sum_diag = 0; 
			sum1=0.0, sum2=0.0, sum3=0.0, sum1_diag = 0, sum2_diag = 0, sum3_diag = 0;

				tmp = 0; 
				tmp2 = 0; 
				tmp3 = 0;
				tmp_iso = 0, tmp2_iso=0, tmp3_iso = 0;
				tmp_diag = 0, tmp2_diag=0, tmp3_diag = 0;
				for (size_t i=0; i<3; i++)
				for (size_t j=0; j<3; j++)
				for (size_t k=0; k<3; k++)
				for (size_t l=0; l<3; l++)
					for (size_t a=0; a<3; a++)
					for (size_t b=0; b<3; b++)
					for (size_t c=0; c<3; c++)
					for (size_t d=0; d<3; d++) {
					// 1-2-3-4-1
						tmp += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
								mat_get(&fr_k->dyn_elec_pol[w],k,c) * mat_get(&fr_l->dyn_elec_pol[w],l,d) *
								mat_get(&Tij,a,j) * mat_get(&Tjk,b,k) * mat_get(&Tkl,c,l) * mat_get(&Til,d,i);
						// 1-2-4-3-1
						tmp2 += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
								mat_get(&fr_k->dyn_elec_pol[w],k,c) * mat_get(&fr_l->dyn_elec_pol[w],l,d) *
								mat_get(&Tij,a,j) * mat_get(&Tjl,b,l) * mat_get(&Tkl,d,k) * mat_get(&Tik,c,i);
						// 1-3-2-4-1
						tmp3 += mat_get(&fr_i->dyn_elec_pol[w],i,a) * mat_get(&fr_j->dyn_elec_pol[w],j,b) *
								mat_get(&fr_k->dyn_elec_pol[w],k,c) * mat_get(&fr_l->dyn_elec_pol[w],l,d) *
									mat_get(&Tik,a,k) * mat_get(&Tjk,c,j) * mat_get(&Tjl,b,l) * mat_get(&Til,d,i);
					}
				
				// printf("freq %zu: %.14lf %.14lf %.14lf\n", w, tmp, tmp2, tmp3);
				sum1 += weights[w] * tmp; //+tmp2+tmp3);
				sum2 += weights[w] * tmp2; 
				sum3 += weights[w] * tmp3; 

			}
		}
	}
}
*/