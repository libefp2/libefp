/*-
 * Copyright (c) 2012-2015 Ilya Kaliman
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

#include "common.h"
#include "rand.h"

#define MAX_ITER 10

struct body {
	mat_t rotmat;
	vec_t pos;
	vec_t vel;
	vec_t vel_old;
	vec_t angmom;
	vec_t angmom_old;
	vec_t force;
	vec_t torque;
	vec_t inertia;
	vec_t inertia_inv;
	double mass;
};

struct nvt_data {
	double chi;
	double chi_dt;
};

struct npt_data {
	double chi;
	double chi_dt;
	double eta;
};

struct md {
	size_t n_bodies;
	struct body *bodies;
	size_t n_freedom;
	six_t box;
	int step; /* current md step */
	double potential_energy;
	double xr_energy; /* used in multistep md */
	double *xr_gradient; /* used in multistep md */
	double (*get_invariant)(const struct md *);
	void (*update_step)(struct md *);
	struct state *state;
	void *data; /* nvt/npt data */
};

void sim_md(struct state *state);
void simulate_monte_carlo();

static vec_t wrap(const struct md *md, const vec_t *pos)
{
	if (!cfg_get_bool(md->state->cfg, "enable_pbc"))
		return *pos;

	if (md->box.a == 90.0 && md->box.b == 90.0 && md->box.c == 90.0) {
        vec_t sub = {
                md->box.x * floor(pos->x / md->box.x),
                md->box.y * floor(pos->y / md->box.y),
                md->box.z * floor(pos->z / md->box.z)
        };
        return vec_sub(pos, &sub);
    }
	else {
	    vec_t new_pos = {pos->x,pos->y,pos->z};
        cart_to_frac(md->box, &new_pos);
        vec_t sub = {floor(new_pos.x), floor(new_pos.y), floor(new_pos.z)};
        vec_t dr = vec_sub(&new_pos, &sub);
        frac_to_cart(md->box, &dr);
        return dr;
    }
}

static double get_kinetic_energy(const struct md *md)
{
	double ke = 0.0;

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		ke += body->mass * body->vel.x * body->vel.x;
		ke += body->mass * body->vel.y * body->vel.y;
		ke += body->mass * body->vel.z * body->vel.z;

		ke += body->angmom.x * body->angmom.x * body->inertia_inv.x;
		ke += body->angmom.y * body->angmom.y * body->inertia_inv.y;
		ke += body->angmom.z * body->angmom.z * body->inertia_inv.z;
	}

	return 0.5 * ke;
}

static double get_temperature(const struct md *md)
{
	double ke = get_kinetic_energy(md);

	return 2.0 * ke / BOLTZMANN / md->n_freedom;
}

static double get_volume(const struct md *md)
{
	return md->box.x * md->box.y * md->box.z;
}

static double get_pressure(const struct md *md)
{
	double volume = get_volume(md);
	vec_t pressure = vec_zero;

	for (size_t i = 0; i < md->n_bodies; i++) {
		const struct body *body = md->bodies + i;

		pressure.x += body->mass * body->vel.x * body->vel.x;
		pressure.y += body->mass * body->vel.y * body->vel.y;
		pressure.z += body->mass * body->vel.z * body->vel.z;
	}

	mat_t stress;
	check_fail(efp_get_stress_tensor(md->state->efp, (double *)&stress));

	pressure.x = (pressure.x + stress.xx) / volume;
	pressure.y = (pressure.y + stress.yy) / volume;
	pressure.z = (pressure.z + stress.zz) / volume;

	return (pressure.x + pressure.y + pressure.z) / 3.0;
}

static double get_invariant_nve(const struct md *md)
{
	return md->potential_energy + get_kinetic_energy(md);
}

static double get_invariant_nvt(const struct md *md)
{
	struct nvt_data *data = (struct nvt_data *)md->data;

	double t_tau = cfg_get_double(md->state->cfg, "thermostat_tau");
	double t_target = cfg_get_double(md->state->cfg, "temperature");

	double kbt = BOLTZMANN * t_target;

	double t_virt = kbt * md->n_freedom * (data->chi_dt +
	    data->chi * data->chi * t_tau * t_tau / 2.0);

	return md->potential_energy + get_kinetic_energy(md) + t_virt;
}

static double get_invariant_npt(const struct md *md)
{
	struct npt_data *data = (struct npt_data *)md->data;

	double t_tau = cfg_get_double(md->state->cfg, "thermostat_tau");
	double t_target = cfg_get_double(md->state->cfg, "temperature");
	double p_tau = cfg_get_double(md->state->cfg, "barostat_tau");
	double p_target = cfg_get_double(md->state->cfg, "pressure");

	double kbt = BOLTZMANN * t_target;
	double volume = get_volume(md);

	double t_virt = kbt * md->n_freedom * (data->chi_dt +
	    data->chi * data->chi * t_tau * t_tau / 2.0);

	double p_virt = p_target * volume + 3.0 * md->n_bodies * kbt *
	    data->eta * data->eta * p_tau * p_tau / 2.0;

	return md->potential_energy + get_kinetic_energy(md) + t_virt + p_virt;
}

static vec_t get_system_com(const struct md *md)
{
	double mass = 0.0;
	vec_t com = vec_zero;

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;
		vec_t pos = wrap(md, &body->pos);

		com.x += body->mass * pos.x;
		com.y += body->mass * pos.y;
		com.z += body->mass * pos.z;

		mass += body->mass;
	}

	com.x /= mass;
	com.y /= mass;
	com.z /= mass;

	return com;
}

static vec_t get_system_com_velocity(const struct md *md)
{
	double mass = 0.0;
	vec_t cv = vec_zero;

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		cv.x += body->vel.x * body->mass;
		cv.y += body->vel.y * body->mass;
		cv.z += body->vel.z * body->mass;

		mass += body->mass;
	}

	cv.x /= mass;
	cv.y /= mass;
	cv.z /= mass;

	return cv;
}

static vec_t get_system_angular_momentum(const struct md *md)
{
	vec_t cp = get_system_com(md);
	vec_t cv = get_system_com_velocity(md);

	vec_t am = vec_zero;

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		vec_t pos = wrap(md, &body->pos);
		vec_t dr = vec_sub(&pos, &cp);
		vec_t dv = vec_sub(&body->vel, &cv);

		am.x += (dr.y * dv.z - dr.z * dv.y) * body->mass;
		am.y += (dr.z * dv.x - dr.x * dv.z) * body->mass;
		am.z += (dr.x * dv.y - dr.y * dv.x) * body->mass;
	}

	return am;
}

static mat_t get_system_inertia_tensor(const struct md *md)
{
	mat_t inertia = mat_zero;
	vec_t com = get_system_com(md);

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		vec_t pos = wrap(md, &body->pos);
		vec_t dr = vec_sub(&pos, &com);

		inertia.xx += body->mass * (dr.y * dr.y + dr.z * dr.z);
		inertia.yy += body->mass * (dr.x * dr.x + dr.z * dr.z);
		inertia.zz += body->mass * (dr.x * dr.x + dr.y * dr.y);
		inertia.xy -= body->mass * dr.x * dr.y;
		inertia.xz -= body->mass * dr.x * dr.z;
		inertia.yz -= body->mass * dr.y * dr.z;
	}

	inertia.yx = inertia.xy;
	inertia.zx = inertia.xz;
	inertia.zy = inertia.yz;

	return inertia;
}

static void remove_system_drift(struct md *md)
{
	vec_t cp = get_system_com(md); // system center of mass
	vec_t cv = get_system_com_velocity(md); // center of mass velocity
	vec_t am = get_system_angular_momentum(md); // angular momentum of system
	// calculation with intertia and intertia_inverse matrix
	mat_t inertia = get_system_inertia_tensor(md); 
	mat_t inertia_inv = mat_zero;

	if (inertia.xx < EPSILON ||
	    inertia.yy < EPSILON ||
	    inertia.zz < EPSILON) {
		inertia_inv.xx = inertia.xx < EPSILON ? 0.0 : 1.0 / inertia.xx;
		inertia_inv.yy = inertia.yy < EPSILON ? 0.0 : 1.0 / inertia.yy;
		inertia_inv.zz = inertia.zz < EPSILON ? 0.0 : 1.0 / inertia.zz;
	}
	else {
		inertia_inv = mat_inv(&inertia);
	}

	vec_t av = mat_vec(&inertia_inv, &am);

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;
		vec_t pos = wrap(md, &body->pos); // wrap fn. apply PBC to simbox
		// cross product of the angular velocity (av) 
		// and the vector from the center of mass (cp) 
		// to the particle's position (pos) to velocity 
		// correction due to angular motion 
		vec_t cross = {
			av.y * (pos.z - cp.z) - av.z * (pos.y - cp.y),
			av.z * (pos.x - cp.x) - av.x * (pos.z - cp.z),
			av.x * (pos.y - cp.y) - av.y * (pos.x - cp.x)
		};
		// subtract com-velocity (cv) and the calculated cross vector
		// from the particle's velocity to remove the system drift.
		body->vel.x -= cv.x + cross.x;
		body->vel.y -= cv.y + cross.y;
		body->vel.z -= cv.z + cross.z;
	}
	// Recalculation of com-velocity and angmom
	vec_t cv2 = get_system_com_velocity(md);
	vec_t am2 = get_system_angular_momentum(md);

	assert(vec_len(&cv2) < EPSILON && vec_len(&am2) < EPSILON);
// Ensuring the conservation of momentum and angular momentum by removing
// the translational and angular drift from the particle velocities.

}

static void compute_forces(struct md *md)
{
 
	msg("   SKP testing workflow..compute_forces....in md.c\n\n"); //SKP

	for (size_t i = 0; i < md->n_bodies; i++) {
		double crd[12]; // position and orientation 6 each
		// copy particle's position (pos) and rotation matrix (rotmat)
		memcpy(crd, &md->bodies[i].pos, 3 * sizeof(double));
		memcpy(crd + 3, &md->bodies[i].rotmat, 9 * sizeof(double));
		// checks if particle coordinates matches EFP library ??
		check_fail(efp_set_frag_coordinates(md->state->efp, i,
		    EFP_COORD_TYPE_ROTMAT, crd));
	}

	if (cfg_get_bool(md->state->cfg, "enable_multistep")) {
		struct efp_opts opts, opts_save;
		int multistep_steps; // what's multistep ??

		multistep_steps = cfg_get_int(md->state->cfg,
		    "multistep_steps");
		check_fail(efp_get_opts(md->state->efp, &opts));
		// Initially computed only xr_energy and gradient
		if (md->step % multistep_steps == 0) {
			opts_save = opts;
			opts.terms = EFP_TERM_XR; /* xr only */
			check_fail(efp_set_opts(md->state->efp, &opts));
			compute_energy(md->state, true);
			md->xr_energy = md->state->energy;
			memcpy(md->xr_gradient, md->state->grad,
			    6 * md->n_bodies * sizeof(double));
			opts = opts_save;
		}
		// For multistep,  XR energy and gradient are added 
		// back to the total energy and gradient
		opts.terms &= ~EFP_TERM_XR; /* turn off xr */
		check_fail(efp_set_opts(md->state->efp, &opts));
		compute_energy(md->state, true);
		md->state->energy += md->xr_energy;
		for (size_t i = 0; i < 6 * md->n_bodies; i++)
			md->state->grad[i] += md->xr_gradient[i];
	} else
		compute_energy(md->state, true);

	md->potential_energy = md->state->energy;
	// Forces and Torques Assignment
	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		body->force.x = -md->state->grad[6 * i + 0];
		body->force.y = -md->state->grad[6 * i + 1];
		body->force.z = -md->state->grad[6 * i + 2];

		body->torque.x = -md->state->grad[6 * i + 3];
		body->torque.y = -md->state->grad[6 * i + 4];
		body->torque.z = -md->state->grad[6 * i + 5];

		/* convert torque to body frame */
		body->torque = mat_trans_vec(&body->rotmat, &body->torque);
	}
// calculate forces and torques acting on particles in an MD simulation. 
// Interfaces with EFP library to compute the energy and forces
}

static void set_body_mass_and_inertia(struct efp *efp, size_t idx,
    struct body *body)
{
	double mass, inertia[3];

	check_fail(efp_get_frag_mass(efp, idx, &mass));
	check_fail(efp_get_frag_inertia(efp, idx, inertia));

	body->mass = AMU_TO_AU * mass;

	body->inertia.x = AMU_TO_AU * inertia[0];
	body->inertia.y = AMU_TO_AU * inertia[1];
	body->inertia.z = AMU_TO_AU * inertia[2];

	body->inertia_inv.x = body->inertia.x < EPSILON ? 0.0 :
	    1.0 / body->inertia.x;
	body->inertia_inv.y = body->inertia.y < EPSILON ? 0.0 :
	    1.0 / body->inertia.y;
	body->inertia_inv.z = body->inertia.z < EPSILON ? 0.0 :
	    1.0 / body->inertia.z;
}

static void rotate_step(size_t a1, size_t a2, double angle, vec_t *angmom,
    mat_t *rotmat)
{
	mat_t rot = { 1.0, 0.0, 0.0,
		      0.0, 1.0, 0.0,
		      0.0, 0.0, 1.0 };

	double cosa = cos(angle);
	double sina = sin(angle);

	mat_set(&rot, a1, a1,  cosa);
	mat_set(&rot, a2, a2,  cosa);
	mat_set(&rot, a1, a2,  sina);
	mat_set(&rot, a2, a1, -sina);

	*angmom = mat_vec(&rot, angmom);

	/* transpose */
	mat_set(&rot, a1, a2, -sina);
	mat_set(&rot, a2, a1,  sina);

	*rotmat = mat_mat(rotmat, &rot);
}

/*
 * Rotation algorithm reference:
 *
 * Andreas Dullweber, Benedict Leimkuhler, and Robert McLachlan
 *
 * Symplectic splitting methods for rigid body molecular dynamics
 *
 * J. Chem. Phys. 107, 5840 (1997)
 */
static void rotate_body(struct body *body, double dt)
{
	double angle;

	/* rotate about x axis */
	angle = 0.5 * dt * body->angmom.x * body->inertia_inv.x;
	rotate_step(1, 2, angle, &body->angmom, &body->rotmat);

	/* rotate about y axis */
	angle = 0.5 * dt * body->angmom.y * body->inertia_inv.y;
	rotate_step(2, 0, angle, &body->angmom, &body->rotmat);

	/* rotate about z axis */
	angle = dt * body->angmom.z * body->inertia_inv.z;
	rotate_step(0, 1, angle, &body->angmom, &body->rotmat);

	/* rotate about y axis */
	angle = 0.5 * dt * body->angmom.y * body->inertia_inv.y;
	rotate_step(2, 0, angle, &body->angmom, &body->rotmat);

	/* rotate about x axis */
	angle = 0.5 * dt * body->angmom.x * body->inertia_inv.x;
	rotate_step(1, 2, angle, &body->angmom, &body->rotmat);
}

static void update_step_nve(struct md *md)
{
	double dt = cfg_get_double(md->state->cfg, "time_step");

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		body->vel.x += 0.5 * body->force.x * dt / body->mass;
		body->vel.y += 0.5 * body->force.y * dt / body->mass;
		body->vel.z += 0.5 * body->force.z * dt / body->mass;

		body->angmom.x += 0.5 * body->torque.x * dt;
		body->angmom.y += 0.5 * body->torque.y * dt;
		body->angmom.z += 0.5 * body->torque.z * dt;

		body->pos.x += body->vel.x * dt;
		body->pos.y += body->vel.y * dt;
		body->pos.z += body->vel.z * dt;

		rotate_body(body, dt);
	}

	compute_forces(md);

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		body->vel.x += 0.5 * body->force.x * dt / body->mass;
		body->vel.y += 0.5 * body->force.y * dt / body->mass;
		body->vel.z += 0.5 * body->force.z * dt / body->mass;

		body->angmom.x += 0.5 * body->torque.x * dt;
		body->angmom.y += 0.5 * body->torque.y * dt;
		body->angmom.z += 0.5 * body->torque.z * dt;
	}
}

/*
 * NVT with Nose-Hoover thermostat:
 *
 * William G. Hoover
 *
 * Canonical dynamics: Equilibrium phase-space distributions
 *
 * Phys. Rev. A 31, 1695 (1985)
 */
static void update_step_nvt(struct md *md)
{
	struct nvt_data *data = (struct nvt_data *)md->data;

	double dt = cfg_get_double(md->state->cfg, "time_step");
	double target = cfg_get_double(md->state->cfg, "temperature");
	double tau = cfg_get_double(md->state->cfg, "thermostat_tau");

	double t0 = get_temperature(md);

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		body->vel.x += 0.5 * dt * (body->force.x / body->mass -
					body->vel.x * data->chi);
		body->vel.y += 0.5 * dt * (body->force.y / body->mass -
					body->vel.y * data->chi);
		body->vel.z += 0.5 * dt * (body->force.z / body->mass -
					body->vel.z * data->chi);

		body->angmom.x += 0.5 * dt * (body->torque.x -
					body->angmom.x * data->chi);
		body->angmom.y += 0.5 * dt * (body->torque.y -
					body->angmom.y * data->chi);
		body->angmom.z += 0.5 * dt * (body->torque.z -
					body->angmom.z * data->chi);

		body->pos.x += body->vel.x * dt;
		body->pos.y += body->vel.y * dt;
		body->pos.z += body->vel.z * dt;

		rotate_body(body, dt);
	}

	data->chi += 0.5 * dt * (t0 / target - 1.0) / tau / tau;
	data->chi_dt += 0.5 * dt * data->chi;

	compute_forces(md);

	double chi_init = data->chi;
	vec_t angmom_init[md->n_bodies], vel_init[md->n_bodies];

	for (size_t i = 0; i < md->n_bodies; i++) {
		angmom_init[i] = md->bodies[i].angmom;
		vel_init[i] = md->bodies[i].vel;
	}

	for (size_t iter = 1; iter <= MAX_ITER; iter++) {
		double chi_prev = data->chi;
		double ratio = get_temperature(md) / target;

		data->chi = chi_init + 0.5 * dt * (ratio - 1.0) / tau / tau;

		for (size_t i = 0; i < md->n_bodies; i++) {
			struct body *body = md->bodies + i;

			body->vel.x = vel_init[i].x +
			    0.5 * dt * (body->force.x / body->mass -
				vel_init[i].x * data->chi);
			body->vel.y = vel_init[i].y +
			    0.5 * dt * (body->force.y / body->mass -
				vel_init[i].y * data->chi);
			body->vel.z = vel_init[i].z +
			    0.5 * dt * (body->force.z / body->mass -
				vel_init[i].z * data->chi);

			body->angmom.x = angmom_init[i].x + 0.5 * dt *
				(body->torque.x - angmom_init[i].x * data->chi);
			body->angmom.y = angmom_init[i].y + 0.5 * dt *
				(body->torque.y - angmom_init[i].y * data->chi);
			body->angmom.z = angmom_init[i].z + 0.5 * dt *
				(body->torque.z - angmom_init[i].z * data->chi);
		}

		if (fabs(data->chi - chi_prev) < EPSILON)
			break;

		if (iter == MAX_ITER)
			msg("WARNING: NVT UPDATE DID NOT CONVERGE\n\n");
	}

	data->chi_dt += 0.5 * dt * data->chi;
}

/*
 * Reference
 *
 * Simone Melchionna, Giovanni Ciccotti, Brad Lee Holian
 *
 * Hoover NPT dynamics for systems varying in shape and size
 *
 * Mol. Phys. 78, 533 (1993)
 */
static void update_step_npt(struct md *md)
{
	struct npt_data *data = (struct npt_data *)md->data;

	double dt = cfg_get_double(md->state->cfg, "time_step");
	double t_tau = cfg_get_double(md->state->cfg, "thermostat_tau");
	double t_target = cfg_get_double(md->state->cfg, "temperature");
	double p_tau = cfg_get_double(md->state->cfg, "barostat_tau");
	double p_target = cfg_get_double(md->state->cfg, "pressure");

	double t_tau2 = t_tau * t_tau;
	double p_tau2 = p_tau * p_tau;
	double kbt = BOLTZMANN * t_target;

	double t0 = get_temperature(md);
	double p0 = get_pressure(md);
	double v0 = get_volume(md);

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		body->vel.x += 0.5 * dt * (body->force.x / body->mass -
					body->vel.x * (data->chi + data->eta));
		body->vel.y += 0.5 * dt * (body->force.y / body->mass -
					body->vel.y * (data->chi + data->eta));
		body->vel.z += 0.5 * dt * (body->force.z / body->mass -
					body->vel.z * (data->chi + data->eta));

		body->angmom.x += 0.5 * dt * (body->torque.x -
						body->angmom.x * data->chi);
		body->angmom.y += 0.5 * dt * (body->torque.y -
						body->angmom.y * data->chi);
		body->angmom.z += 0.5 * dt * (body->torque.z -
						body->angmom.z * data->chi);

		rotate_body(body, dt);
	}

	data->chi += 0.5 * dt * (t0 / t_target - 1.0) / t_tau2;
	data->chi_dt += 0.5 * dt * data->chi;
	data->eta += 0.5 * dt * v0 * (p0 - p_target) / md->n_bodies / kbt / p_tau2;

	vec_t com = get_system_com(md);
	vec_t pos_init[md->n_bodies];

	for (size_t i = 0; i < md->n_bodies; i++)
		pos_init[i] = md->bodies[i].pos;

	for (size_t iter = 1; iter <= MAX_ITER; iter++) {
		bool done = true;

		for (size_t i = 0; i < md->n_bodies; i++) {
			struct body *body = md->bodies + i;
			vec_t pos = wrap(md, &body->pos);

			vec_t v = {
				data->eta * (pos.x - com.x),
				data->eta * (pos.y - com.y),
				data->eta * (pos.z - com.z)
			};

			vec_t new_pos = {
				pos_init[i].x + dt * (body->vel.x + v.x),
				pos_init[i].y + dt * (body->vel.y + v.y),
				pos_init[i].z + dt * (body->vel.z + v.z)
			};

			done = done && vec_dist(&body->pos, &new_pos) < EPSILON;
			body->pos = new_pos;
		}

		if (done)
			break;

		if (iter == MAX_ITER)
			msg("WARNING: NPT UPDATE DID NOT CONVERGE\n\n");
	}

	md->box.x = md->box.x * exp(dt * data->eta);
    md->box.y = md->box.y * exp(dt * data->eta);
    md->box.z = md->box.z * exp(dt * data->eta);

	// vec_scale(&md->box, exp(dt * data->eta));
	check_fail(efp_set_periodic_box(md->state->efp,
	    md->box.x, md->box.y, md->box.z, md->box.a, md->box.b, md->box.c));

	compute_forces(md);

	double chi_init = data->chi, eta_init = data->eta;
	vec_t angmom_init[md->n_bodies], vel_init[md->n_bodies];

	for (size_t i = 0; i < md->n_bodies; i++) {
		angmom_init[i] = md->bodies[i].angmom;
		vel_init[i] = md->bodies[i].vel;
	}

	for (size_t iter = 1; iter <= MAX_ITER; iter++) {
		double chi_prev = data->chi;
		double eta_prev = data->eta;
		double t_cur = get_temperature(md);
		double p_cur = get_pressure(md);
		double v_cur = get_volume(md);

		data->chi = chi_init +
		    0.5 * dt * (t_cur / t_target - 1.0) / t_tau2;
		data->eta = eta_init + 0.5 * dt * v_cur * (p_cur - p_target) /
		    md->n_bodies / kbt / p_tau2;

		for (size_t i = 0; i < md->n_bodies; i++) {
			struct body *body = md->bodies + i;

			body->vel.x = vel_init[i].x + 0.5 * dt *
			    (body->force.x / body->mass -
				vel_init[i].x * (data->chi + data->eta));
			body->vel.y = vel_init[i].y + 0.5 * dt *
			    (body->force.y / body->mass -
				vel_init[i].y * (data->chi + data->eta));
			body->vel.z = vel_init[i].z + 0.5 * dt *
			    (body->force.z / body->mass -
				vel_init[i].z * (data->chi + data->eta));

			body->angmom.x = angmom_init[i].x + 0.5 * dt *
				(body->torque.x - angmom_init[i].x * data->chi);
			body->angmom.y = angmom_init[i].y + 0.5 * dt *
				(body->torque.y - angmom_init[i].y * data->chi);
			body->angmom.z = angmom_init[i].z + 0.5 * dt *
				(body->torque.z - angmom_init[i].z * data->chi);
		}

		if (fabs(data->chi - chi_prev) < EPSILON &&
		    fabs(data->eta - eta_prev) < EPSILON)
			break;

		if (iter == MAX_ITER)
			msg("WARNING: NPT UPDATE DID NOT CONVERGE\n\n");
	}

	data->chi_dt += 0.5 * dt * data->chi;
}

static void print_info(const struct md *md)
{
	double e_kin = get_kinetic_energy(md);
	double invariant = md->get_invariant(md);
	double temperature = get_temperature(md);

	print_energy(md->state);
	msg("%30s %16.10lf\n", "KINETIC ENERGY", e_kin);
	msg("%30s %16.10lf\n", "INVARIANT", invariant);
	msg("%30s %16.10lf\n", "TEMPERATURE (K)", temperature);

	if (cfg_get_enum(md->state->cfg, "ensemble") == ENSEMBLE_TYPE_NPT) {
		double pressure = get_pressure(md) / BAR_TO_AU;

		msg("%30s %16.10lf bar\n", "PRESSURE", pressure);
	}

	if (cfg_get_bool(md->state->cfg, "enable_pbc")) {
		double x = md->box.x * BOHR_RADIUS;
		double y = md->box.y * BOHR_RADIUS;
		double z = md->box.z * BOHR_RADIUS;
		double alpha = md->box.a;
        double beta = md->box.b;
        double gamma = md->box.c;

		msg("%30s %9.3lf %9.3lf %9.3lf %9.3lf %9.3lf %9.3lf  A^6\n",
		    "PERIODIC BOX SIZE AND ANGLES", x, y, z, alpha, beta, gamma);
	}

	msg("\n\n");
}

static void print_restart(const struct md *md)
{
	msg("    RESTART DATA\n\n");

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		char name[64];
		check_fail(efp_get_frag_name(md->state->efp, i,
		    sizeof(name), name));

		double xyzabc[6] = { body->pos.x * BOHR_RADIUS,
				     body->pos.y * BOHR_RADIUS,
				     body->pos.z * BOHR_RADIUS };

		matrix_to_euler(&body->rotmat,
		    xyzabc + 3, xyzabc + 4, xyzabc + 5);

		double vel[6] = { body->vel.x,
				  body->vel.y,
				  body->vel.z,
				  body->angmom.x * body->inertia_inv.x,
				  body->angmom.y * body->inertia_inv.y,
				  body->angmom.z * body->inertia_inv.z };

		print_fragment(name, xyzabc, vel);
	}

	msg("\n");
}

static struct md *md_create(struct state *state)
{
	struct md *md = xcalloc(1, sizeof(struct md));

	md->state = state;
	// Creates the periodic box if the user chooses to... "box_from_str" is in common.c
	md->box = box_from_str(cfg_get_string(state->cfg, "periodic_box"));
 	// choice of ensemble
	switch (cfg_get_enum(state->cfg, "ensemble")) {
		case ENSEMBLE_TYPE_NVE:
			md->get_invariant = get_invariant_nve; // calculates KE and adds to PE
			md->update_step = update_step_nve; // makes changes to properties of the system (angmom/velo etc)
			break;
		case ENSEMBLE_TYPE_NVT:
			md->get_invariant = get_invariant_nvt; // calculates KE and adds to PE and t_virt
			md->update_step = update_step_nvt;
			md->data = xcalloc(1, sizeof(struct nvt_data));
			break;
		case ENSEMBLE_TYPE_NPT:
			md->get_invariant = get_invariant_npt; // calculates KE and adds to PE, t_virt and p_virt
			md->update_step = update_step_npt;
			md->data = xcalloc(1, sizeof(struct npt_data)); 
			break;
		default:
			assert(0);
	}

	md->n_bodies = state->sys->n_frags;
	md->bodies = xcalloc(md->n_bodies, sizeof(struct body));
	md->xr_gradient = xcalloc(6 * md->n_bodies, sizeof(double));

	double coord[6 * md->n_bodies];
	check_fail(efp_get_coordinates(state->efp, coord));

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;
		// position of the atoms
		body->pos.x = coord[6 * i + 0];
		body->pos.y = coord[6 * i + 1];
		body->pos.z = coord[6 * i + 2];

		double a = coord[6 * i + 3];
		double b = coord[6 * i + 4];
		double c = coord[6 * i + 5];

		euler_to_matrix(a, b, c, &body->rotmat);
		// velocity of the  atoms
		body->vel.x = md->state->sys->frags[i].vel[0];
		body->vel.y = md->state->sys->frags[i].vel[1];
		body->vel.z = md->state->sys->frags[i].vel[2];

		set_body_mass_and_inertia(state->efp, i, body);
		// angular momentum of the atoms
		body->angmom.x = md->state->sys->frags[i].vel[3] *
		    body->inertia.x;
		body->angmom.y = md->state->sys->frags[i].vel[4] *
		    body->inertia.y;
		body->angmom.z = md->state->sys->frags[i].vel[5] *
		    body->inertia.z;

		md->n_freedom += 3;
		//n_freedom?? EPSILON?? 
		if (body->inertia.x > EPSILON)
			md->n_freedom++;
		if (body->inertia.y > EPSILON)
			md->n_freedom++;
		if (body->inertia.z > EPSILON)
			md->n_freedom++;
	}

	return (md);
// Uses coordinates and efp info to generate position, orientation, 
// velocity, mass, and moment of inertia for each body.
}

static void velocitize(struct md *md)
{
	rand_init();

	double temperature = cfg_get_double(md->state->cfg, "temperature");
	double ke = temperature * BOLTZMANN * // Kinetic energy
	    md->n_freedom / (2.0 * 6.0 * md->n_bodies); // Reason fro this array size??

	for (size_t i = 0; i < md->n_bodies; i++) {
		struct body *body = md->bodies + i;

		double vel = sqrt(2.0 * ke / body->mass); // from ke = (1/2)m.v.v
	
		body->vel.x = vel * rand_normal();
		body->vel.y = vel * rand_normal();
		body->vel.z = vel * rand_normal();

		body->angmom.x = sqrt(2.0 * ke * body->inertia.x) *
		    rand_normal();
		body->angmom.y = sqrt(2.0 * ke * body->inertia.y) *
		    rand_normal();
		body->angmom.z = sqrt(2.0 * ke * body->inertia.z) *
		    rand_normal();
// Uses ke to update the velocity and anmom information;
// In previous routine, fragment_velo(?) were used to 
// initialize the above info in body struct.
	}
}

static void print_status(const struct md *md)
{
	print_geometry(md->state->efp);
	print_restart(md);
	print_info(md);

	fflush(stdout);
}

static void md_shutdown(struct md *md)
{
	free(md->bodies);
	free(md->xr_gradient);
	free(md->data);
	free(md);
}

void sim_md(struct state *state)
{
	msg("MOLECULAR DYNAMICS JOB\n\n\n");

	struct md *md = md_create(state);

	if (cfg_get_bool(state->cfg, "velocitize"))
		velocitize(md);

	remove_system_drift(md);
	compute_forces(md);

	msg("    INITIAL STATE\n\n");
	print_status(md);

	for (md->step = 1;
	     md->step <= cfg_get_int(state->cfg, "max_steps");
	     md->step++) {
		md->update_step(md);

		if (md->step % cfg_get_int(state->cfg, "print_step") == 0) {
			msg("    STATE AFTER %d STEPS\n\n", md->step);
			print_status(md);
		}
	}

	md_shutdown(md);

	msg("MOLECULAR DYNAMICS JOB COMPLETED SUCCESSFULLY\n");

	simulate_monte_carlo();

}

void monteCarloMove(Particle* particles, int num_particles, double temperature) {
    int particle_index = rand() % num_particles;
    Particle selected_particle = particles[particle_index];
    double kB = BOLTZMANN;

    double dx = (rand() / (double)RAND_MAX - 0.5) * 0.1;
    double dy = (rand() / (double)RAND_MAX - 0.5) * 0.1;
    double dz = (rand() / (double)RAND_MAX - 0.5) * 0.1;

    selected_particle.x += dx;
    selected_particle.y += dy;
    selected_particle.z += dz;

    double energy_change = 0.0;
    for (int i = 0; i < num_particles; i++) {
        if (i != particle_index) {
            energy_change += calculatePairwiseEnergy(selected_particle, particles[i]) -
                            calculatePairwiseEnergy(particles[particle_index], particles[i]);
        }
    }

    if (energy_change < 0.0 || exp(-energy_change / (kB * temperature)) > (rand() / (double)RAND_MAX)) {
        particles[particle_index] = selected_particle;
    }
}

void monteCarloSimulation(Particle* particles, int num_particles, double temperature) {
    double kB = BOLTZMANN; // Assuming BOLTZMANN is defined elsewhere
    int num_steps = 50;

    for (int step = 0; step < num_steps; step++) {
        int particle_index = rand() % num_particles;
        Particle selected_particle = particles[particle_index];

        double dx = (rand() / (double)RAND_MAX - 0.5) * 0.1;
        double dy = (rand() / (double)RAND_MAX - 0.5) * 0.1;
        double dz = (rand() / (double)RAND_MAX - 0.5) * 0.1;

        selected_particle.x += dx;
        selected_particle.y += dy;
        selected_particle.z += dz;
	
	double energy_change = 0.0;
        for (int i = 0; i < num_particles; i++) {
            if (i != particle_index) {
                energy_change += calculatePairwiseEnergy(selected_particle, particles[i]) -
                                calculatePairwiseEnergy(particles[particle_index], particles[i]);
            }
        }

        if (energy_change < 0.0 || exp(-energy_change / (kB * temperature)) > (rand() / (double)RAND_MAX)) {
            particles[particle_index] = selected_particle;

		printf("\nStep %d:\n", step + 1);
        	for (int i = 0; i < num_particles; i++) {
            	   printf("Particle %d: x=%.6f, y=%.6f, z=%.6f\n", i + 1, particles[i].x, particles[i].y, particles[i].z);
        	}

        }

//	printf("\nStep %d:\n", step + 1);
//        for (int i = 0; i < num_particles; i++) {
//            printf("Particle %d: x=%.6f, y=%.6f, z=%.6f\n", i + 1, particles[i].x, particles[i].y, particles[i].z);
//        }
        printf("\n");
    }
}

void simulate_monte_carlo() {

    msg("\n\nMONTE CARLO JOB\n\n\n");    
    srand(time(NULL));
    int num_particles = 6;
    double temperature = 298.15; 
    Particle* particles = (Particle*)malloc(num_particles * sizeof(Particle));

    double initial_coordinates[][3] = {
    	{0.000010, 0.058100, 0.547078},
    	{-0.752741, -0.481588, 0.386524},
    	{0.752563, -0.481879, 0.386570},
    	{0.000002, 0.003940, 4.377149},
    	{-0.466697, -0.812793, 4.713742},
    	{-0.466895, 0.803769, 4.751899}
    };

    msg("\n\nINITIAL COORDIANTES\n\n\n");

    for (int i = 0; i < num_particles; i++) {
        printf("Particle %d: x=%.6f, y=%.6f, z=%.6f\n", i + 1, 
            initial_coordinates[i][0], initial_coordinates[i][1], initial_coordinates[i][2]);
    }

    for(int i = 0; i < num_particles; i++) {
       particles[i].x = initial_coordinates[i][0];
       particles[i].y = initial_coordinates[i][1];
       particles[i].z = initial_coordinates[i][2];
    }   
 
//    int num_steps = 1000;
//    for (int step = 0; step < num_steps; step++) {
//        monteCarloMove(particles, num_particles, temperature);
	  monteCarloSimulation(particles, num_particles, temperature);
//    }

    msg("\n\nFINAL COORDIANTES\n\n\n");

    for (int i = 0; i < num_particles; i++) {
        printf("Particle %d: x=%.2f, y=%.2f, z=%.2f\n", i + 1, particles[i].x, particles[i].y, particles[i].z);
    }
    
    free(particles);
    msg("\n\nMONTE CARLO JOB COMPLETED SUCCESSFULLY\n");

}
