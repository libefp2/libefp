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
#include <time.h>

#define MAX_ITER 10

struct body {
	mat_t rotmat;
	vec_t pos;
	//vec_t vel;
	//vec_t vel_old;
	//vec_t angmom;
	//vec_t angmom_old;
	//vec_t force;
	//vec_t torque;
	vec_t inertia;
	vec_t inertia_inv;
	double mass;
};

//struct nvt_data {
//	double chi;
//	double chi_dt;
//};

//struct npt_data {
//	double chi;
//	double chi_dt;
//	double eta;
//};

struct mc {
	size_t n_bodies;
	struct body *bodies;
	size_t n_freedom;
	six_t box;
	int step; /* current mc step */
	double potential_energy;
//	double xr_energy; /* used in multistep mc */
//	double *xr_gradient; /* used in multistep mc */
//	double (*get_invariant)(const struct mc *);
//	void (*update_step)(struct mc*);
	struct state *state;
	int accept;
//	void *data; /* nvt/npt data */
};

void sim_mc(struct state *state);
void simulate_monte_carlo();

static vec_t wrap(const struct mc *mc, const vec_t *pos)
{
	if (!cfg_get_bool(mc->state->cfg, "enable_pbc"))
		return *pos;

	if (mc->box.a == 90.0 && mc->box.b == 90.0 && mc->box.c == 90.0) {
        vec_t sub = {
                mc->box.x * floor(pos->x / mc->box.x),
                mc->box.y * floor(pos->y / mc->box.y),
                mc->box.z * floor(pos->z / mc->box.z)
        };
        return vec_sub(pos, &sub);
    }
	else {
	    vec_t new_pos = {pos->x,pos->y,pos->z};
        cart_to_frac(mc->box, &new_pos);
        vec_t sub = {floor(new_pos.x), floor(new_pos.y), floor(new_pos.z)};
        vec_t dr = vec_sub(&new_pos, &sub);
        frac_to_cart(mc->box, &dr);
        return dr;
    }
}
/*
static double get_kinetic_energy(const struct mc *mc)
{
	double ke = 0.0;

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

		ke += body->mass * body->vel.x * body->vel.x;
		ke += body->mass * body->vel.y * body->vel.y;
		ke += body->mass * body->vel.z * body->vel.z;

		ke += body->angmom.x * body->angmom.x * body->inertia_inv.x;
		ke += body->angmom.y * body->angmom.y * body->inertia_inv.y;
		ke += body->angmom.z * body->angmom.z * body->inertia_inv.z;
	}

	return 0.5 * ke;
}

static double get_temperature(const struct mc *mc)
{
	double ke = get_kinetic_energy(mc);

	return 2.0 * ke / BOLTZMANN / mc->n_freedom;
}
*/

static double get_volume(const struct mc *mc)
{
	return mc->box.x * mc->box.y * mc->box.z;
}
/*
static double get_pressure(const struct mc *mc)
{
	double volume = get_volume(mc);
	vec_t pressure = vec_zero;

	for (size_t i = 0; i < mc->n_bodies; i++) {
		const struct body *body = mc->bodies + i;

		pressure.x += body->mass * body->vel.x * body->vel.x;
		pressure.y += body->mass * body->vel.y * body->vel.y;
		pressure.z += body->mass * body->vel.z * body->vel.z;
	}

	mat_t stress;
	check_fail(efp_get_stress_tensor(mc->state->efp, (double *)&stress));

	pressure.x = (pressure.x + stress.xx) / volume;
	pressure.y = (pressure.y + stress.yy) / volume;
	pressure.z = (pressure.z + stress.zz) / volume;

	return (pressure.x + pressure.y + pressure.z) / 3.0;
}

static double get_invariant_nve(const struct mc *mc)
{
	return mc->potential_energy + get_kinetic_energy(mc);
}

static double get_invariant_nvt(const struct mc *mc)
{
	struct nvt_data *data = (struct nvt_data *)mc->data;

	double t_tau = cfg_get_double(mc->state->cfg, "thermostat_tau");
	double t_target = cfg_get_double(mc->state->cfg, "temperature");

	double kbt = BOLTZMANN * t_target;

	double t_virt = kbt * mc->n_freedom * (data->chi_dt +
	    data->chi * data->chi * t_tau * t_tau / 2.0);

	return mc->potential_energy + get_kinetic_energy(mc) + t_virt;
}

static double get_invariant_npt(const struct mc *mc)
{
	struct npt_data *data = (struct npt_data *)mc->data;

	double t_tau = cfg_get_double(mc->state->cfg, "thermostat_tau");
	double t_target = cfg_get_double(mc->state->cfg, "temperature");
	double p_tau = cfg_get_double(mc->state->cfg, "barostat_tau");
	double p_target = cfg_get_double(mc->state->cfg, "pressure");

	double kbt = BOLTZMANN * t_target;
	double volume = get_volume(mc);

	double t_virt = kbt * mc->n_freedom * (data->chi_dt +
	    data->chi * data->chi * t_tau * t_tau / 2.0);

	double p_virt = p_target * volume + 3.0 * mc->n_bodies * kbt *
	    data->eta * data->eta * p_tau * p_tau / 2.0;

	return mc->potential_energy + get_kinetic_energy(mc) + t_virt + p_virt;
}
*/
static vec_t get_system_com(const struct mc *mc)
{
	double mass = 0.0;
	vec_t com = vec_zero;

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;
		vec_t pos = wrap(mc, &body->pos);

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

/*
static vec_t get_system_com_velocity(const struct mc *mc)
{
	double mass = 0.0;
	vec_t cv = vec_zero;

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

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


static vec_t get_system_angular_momentum(const struct mc *mc)
{
	vec_t cp = get_system_com(mc);
	vec_t cv = get_system_com_velocity(mc);

	vec_t am = vec_zero;

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

		vec_t pos = wrap(mc, &body->pos);
		vec_t dr = vec_sub(&pos, &cp);
		vec_t dv = vec_sub(&body->vel, &cv);

		am.x += (dr.y * dv.z - dr.z * dv.y) * body->mass;
		am.y += (dr.z * dv.x - dr.x * dv.z) * body->mass;
		am.z += (dr.x * dv.y - dr.y * dv.x) * body->mass;
	}

	return am;
}
*/
static mat_t get_system_inertia_tensor(const struct mc *mc)
{
	mat_t inertia = mat_zero;
	vec_t com = get_system_com(mc);

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

		vec_t pos = wrap(mc, &body->pos);
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
/*
static void remove_system_drift(struct mc *mc)
{
	vec_t cp = get_system_com(mc); // system center of mass
	vec_t cv = get_system_com_velocity(mc); // center of mass velocity
	vec_t am = get_system_angular_momentum(mc); // angular momentum of system
	// calculation with intertia and intertia_inverse matrix
	mat_t inertia = get_system_inertia_tensor(mc); 
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

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;
		vec_t pos = wrap(mc, &body->pos); // wrap fn. apply PBC to simbox
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
	vec_t cv2 = get_system_com_velocity(mc);
	vec_t am2 = get_system_angular_momentum(mc);

	assert(vec_len(&cv2) < EPSILON && vec_len(&am2) < EPSILON);
// Ensuring the conservation of momentum and angular momentum by removing
// the translational and angular drift from the particle velocities.

}


static void compute_forces(struct mc *mc)
{
 
	msg("   SKP testing workflow..compute_forces....in mc.c\n\n"); //SKP

	for (size_t i = 0; i < mc->n_bodies; i++) {
		double crd[12]; // position and orientation 6 each
		// copy particle's position (pos) and rotation matrix (rotmat)
		memcpy(crd, &mc->bodies[i].pos, 3 * sizeof(double));
		memcpy(crd + 3, &mc->bodies[i].rotmat, 9 * sizeof(double));
		// checks if particle coordinates matches EFP library ??
		check_fail(efp_set_frag_coordinates(mc->state->efp, i,
		    EFP_COORD_TYPE_ROTMAT, crd));
	}

	if (cfg_get_bool(mc->state->cfg, "enable_multistep")) {
		struct efp_opts opts, opts_save;
		int multistep_steps; // what's multistep ??

		multistep_steps = cfg_get_int(mc->state->cfg,
		    "multistep_steps");
		check_fail(efp_get_opts(mc->state->efp, &opts));
		// Initially computed only xr_energy and gradient
		if (mc->step % multistep_steps == 0) {
			opts_save = opts;
			opts.terms = EFP_TERM_XR; 
			check_fail(efp_set_opts(mc->state->efp, &opts));
			compute_energy(mc->state, true);
			mc->xr_energy = mc->state->energy;
			memcpy(mc->xr_gradient, mc->state->grad,
			    6 * mc->n_bodies * sizeof(double));
			opts = opts_save;
		}
		// For multistep,  XR energy and gradient are added 
		// back to the total energy and gradient
		opts.terms &= ~EFP_TERM_XR;
		check_fail(efp_set_opts(mc->state->efp, &opts));
		compute_energy(mc->state, true);
		mc->state->energy += mc->xr_energy;
		for (size_t i = 0; i < 6 * mc->n_bodies; i++)
			mc->state->grad[i] += mc->xr_gradient[i];
	} else
		compute_energy(mc->state, true);

	mc->potential_energy = mc->state->energy;
	// Forces and Torques Assignment
	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

		body->force.x = -mc->state->grad[6 * i + 0];
		body->force.y = -mc->state->grad[6 * i + 1];
		body->force.z = -mc->state->grad[6 * i + 2];

		body->torque.x = -mc->state->grad[6 * i + 3];
		body->torque.y = -mc->state->grad[6 * i + 4];
		body->torque.z = -mc->state->grad[6 * i + 5];

		body->torque = mat_trans_vec(&body->rotmat, &body->torque);
	}
// calculate forces and torques acting on particles in an MD simulation. 
// Interfaces with EFP library to compute the energy and forces
}
*/

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
 
//static void rotate_step(size_t a1, size_t a2, double angle, vec_t *angmom,
//    mat_t *rotmat)
static void rotate_step(size_t a1, size_t a2, double angle,
    mat_t *rotmat)

{
	mat_t rot = { 1.0, 0.0, 0.0,
		      0.0, 1.0, 0.0,
		      0.0, 0.0, 1.0 };

	double cosa = cos(angle);
	double sina = sin(angle);

	mat_set(&rot, a1, a1,  cosa);
	mat_set(&rot, a2, a2,  cosa);
//	mat_set(&rot, a1, a2,  sina);
//	mat_set(&rot, a2, a1, -sina);

//	*angmom = mat_vec(&rot, angmom);

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
//static void rotate_body(struct body *body, double dt)
static void rotate_body(struct body *body, double alpha, double beta, double gamma)
{
	double angle;

	/* rotate about x axis */
	angle = alpha; //0.5 * dt * body->angmom.x * body->inertia_inv.x;
	rotate_step(1, 2, angle, &body->rotmat);

	/* rotate about y axis */
	angle = beta; //0.5 * dt * body->angmom.y * body->inertia_inv.y;
	rotate_step(2, 0, angle, &body->rotmat);

	/* rotate about z axis */
	angle = gamma; // dt * body->angmom.z * body->inertia_inv.z;
	rotate_step(0, 1, angle, &body->rotmat);

	/* rotate about y axis */
	angle = beta; // 0.5 * dt * body->angmom.y * body->inertia_inv.y;
	rotate_step(2, 0, angle, &body->rotmat);

	/* rotate about x axis */
	angle = alpha; // 0.5 * dt * body->angmom.x * body->inertia_inv.x;
	rotate_step(1, 2, angle, &body->rotmat);
}

static void update_step(struct mc *mc)
{
// Pick a fragment, make random translations and rotation
	int frag_index = rand() % mc->n_bodies;
//	int frag_index = 0;
	printf("Frag_index = %12.8f\n",frag_index);
	double kB = BOLTZMANN;
	struct body *body = mc->bodies + frag_index;
 
	double movemax = cfg_get_double(mc->state->cfg, "max_move");
	double rotmax = cfg_get_double(mc->state->cfg, "max_rot");
	double temp = cfg_get_double(mc->state->cfg, "temperature"); 

	printf("Max_move = %12.8f\n",movemax);
 
        double dx = (rand() / (double)RAND_MAX - 0.5) * movemax; 
        double dy = (rand() / (double)RAND_MAX - 0.5) * movemax;
        double dz = (rand() / (double)RAND_MAX - 0.5) * movemax;
	double dalpha = (rand() / (double)RAND_MAX - 0.5) * rotmax;
        double dbeta = (rand() / (double)RAND_MAX - 0.5) * rotmax;
        double dgamma = (rand() / (double)RAND_MAX - 0.5) * rotmax;
	double energy_change = 0.0;

 	printf("dx, dy, dz = %12.8f %12.8f %12.8f\n",dx,dy,dz);	

	body->pos.x += dx;
	body->pos.y += dy;
	body->pos.z += dz;

	rotate_body(body, dalpha, dbeta, dgamma);

	for (size_t i = 0; i < mc->n_bodies; i++) {
                double crd[12]; // position and orientation 6 each
                memcpy(crd, &mc->bodies[i].pos, 3 * sizeof(double));
                memcpy(crd + 3, &mc->bodies[i].rotmat, 9 * sizeof(double));
                check_fail(efp_set_frag_coordinates(mc->state->efp, i,
                    EFP_COORD_TYPE_ROTMAT, crd));
        }

	print_geometry(mc->state->efp);

	double old_energy = mc->state->energy;
	compute_energy(mc->state, false);

	energy_change = mc->state->energy - old_energy;
	printf("Energy_change = %12.8f\n",energy_change); 
	if (energy_change < 0.0 || exp(-energy_change / (kB * temp)) > (rand() / (double)RAND_MAX)) {
		printf("Step accepted!!\n"); 
		mc->accept++;
		
	}
	else{ 
		body->pos.x -= dx;
	        body->pos.y -= dy;
   		body->pos.z -= dz;
 
        	rotate_body(body, -dalpha, -dbeta, -dgamma);
        	mc->state->energy = old_energy;
		printf("Steps not accepted..Try Again!!\n");
		for (size_t i = 0; i < mc->n_bodies; i++) {
                	double crd[12]; // position and orientation 6 each
                	memcpy(crd, &mc->bodies[i].pos, 3 * sizeof(double));
                	memcpy(crd + 3, &mc->bodies[i].rotmat, 9 * sizeof(double));
                	check_fail(efp_set_frag_coordinates(mc->state->efp, i,
                	    EFP_COORD_TYPE_ROTMAT, crd));
        	}
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
/*
static void update_step_nvt(struct mc *mc)
{
	struct nvt_data *data = (struct nvt_data *)mc->data;

	double dt = cfg_get_double(mc->state->cfg, "time_step");
	double target = cfg_get_double(mc->state->cfg, "temperature");
	double tau = cfg_get_double(mc->state->cfg, "thermostat_tau");

	double t0 = get_temperature(mc);

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

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

	compute_forces(mc);

	double chi_init = data->chi;
	vec_t angmom_init[mc->n_bodies], vel_init[mc->n_bodies];

	for (size_t i = 0; i < mc->n_bodies; i++) {
		angmom_init[i] = mc->bodies[i].angmom;
		vel_init[i] = mc->bodies[i].vel;
	}

	for (size_t iter = 1; iter <= MAX_ITER; iter++) {
		double chi_prev = data->chi;
		double ratio = get_temperature(mc) / target;

		data->chi = chi_init + 0.5 * dt * (ratio - 1.0) / tau / tau;

		for (size_t i = 0; i < mc->n_bodies; i++) {
			struct body *body = mc->bodies + i;

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
*/
/*
 * Reference
 *
 * Simone Melchionna, Giovanni Ciccotti, Brad Lee Holian
 *
 * Hoover NPT dynamics for systems varying in shape and size
 *
 * Mol. Phys. 78, 533 (1993)
 */
/*
static void update_step_npt(struct mc *mc)
{
	struct npt_data *data = (struct npt_data *)mc->data;

	double dt = cfg_get_double(mc->state->cfg, "time_step");
	double t_tau = cfg_get_double(mc->state->cfg, "thermostat_tau");
	double t_target = cfg_get_double(mc->state->cfg, "temperature");
	double p_tau = cfg_get_double(mc->state->cfg, "barostat_tau");
	double p_target = cfg_get_double(mc->state->cfg, "pressure");

	double t_tau2 = t_tau * t_tau;
	double p_tau2 = p_tau * p_tau;
	double kbt = BOLTZMANN * t_target;

	double t0 = get_temperature(mc);
	double p0 = get_pressure(mc);
	double v0 = get_volume(mc);

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

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
	data->eta += 0.5 * dt * v0 * (p0 - p_target) / mc->n_bodies / kbt / p_tau2;

	vec_t com = get_system_com(mc);
	vec_t pos_init[mc->n_bodies];

	for (size_t i = 0; i < mc->n_bodies; i++)
		pos_init[i] = mc->bodies[i].pos;

	for (size_t iter = 1; iter <= MAX_ITER; iter++) {
		bool done = true;

		for (size_t i = 0; i < mc->n_bodies; i++) {
			struct body *body = mc->bodies + i;
			vec_t pos = wrap(mc, &body->pos);

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

	mc->box.x = mc->box.x * exp(dt * data->eta);
    mc->box.y = mc->box.y * exp(dt * data->eta);
    mc->box.z = mc->box.z * exp(dt * data->eta);

	// vec_scale(&mc->box, exp(dt * data->eta));
	check_fail(efp_set_periodic_box(mc->state->efp,
	    mc->box.x, mc->box.y, mc->box.z, mc->box.a, mc->box.b, mc->box.c));

	compute_forces(mc);

	double chi_init = data->chi, eta_init = data->eta;
	vec_t angmom_init[mc->n_bodies], vel_init[mc->n_bodies];

	for (size_t i = 0; i < mc->n_bodies; i++) {
		angmom_init[i] = mc->bodies[i].angmom;
		vel_init[i] = mc->bodies[i].vel;
	}

	for (size_t iter = 1; iter <= MAX_ITER; iter++) {
		double chi_prev = data->chi;
		double eta_prev = data->eta;
		double t_cur = get_temperature(mc);
		double p_cur = get_pressure(mc);
		double v_cur = get_volume(mc);

		data->chi = chi_init +
		    0.5 * dt * (t_cur / t_target - 1.0) / t_tau2;
		data->eta = eta_init + 0.5 * dt * v_cur * (p_cur - p_target) /
		    mc->n_bodies / kbt / p_tau2;

		for (size_t i = 0; i < mc->n_bodies; i++) {
			struct body *body = mc->bodies + i;

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
*/
static void print_info(const struct mc *mc)
{
//	double e_kin = get_kinetic_energy(mc);
//	double invariant = mc->get_invariant(mc);
//	double temperature = get_temperature(mc);

	print_energy(mc->state);
//	msg("%30s %16.10lf\n", "KINETIC ENERGY", e_kin);
//	msg("%30s %16.10lf\n", "INVARIANT", invariant);
//	msg("%30s %16.10lf\n", "TEMPERATURE (K)", temperature);

//	if (cfg_get_enum(mc->state->cfg, "ensemble") == ENSEMBLE_TYPE_NPT) {
//		double pressure = get_pressure(mc) / BAR_TO_AU;

//		msg("%30s %16.10lf bar\n", "PRESSURE", pressure);
//	}

	if (cfg_get_bool(mc->state->cfg, "enable_pbc")) {
		double x = mc->box.x * BOHR_RADIUS;
		double y = mc->box.y * BOHR_RADIUS;
		double z = mc->box.z * BOHR_RADIUS;
		double alpha = mc->box.a;
        double beta = mc->box.b;
        double gamma = mc->box.c;

		msg("%30s %9.3lf %9.3lf %9.3lf %9.3lf %9.3lf %9.3lf  A^6\n",
		    "PERIODIC BOX SIZE AND ANGLES", x, y, z, alpha, beta, gamma);
	}

	msg("\n\n");
}
/*
static void print_restart(const struct mc *mc)
{
	msg("    RESTART DATA\n\n");

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

		char name[64];
		check_fail(efp_get_frag_name(mc->state->efp, i,
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
*/
static struct mc *mc_create(struct state *state)
{
	struct mc *mc = xcalloc(1, sizeof(struct mc));

	mc->state = state;
	// Creates the periodic box if the user chooses to... "box_from_str" is in common.c
	mc->box = box_from_str(cfg_get_string(state->cfg, "periodic_box"));
//	mc->update_step = update_step;


	mc->n_bodies = state->sys->n_frags;
	mc->bodies = xcalloc(mc->n_bodies, sizeof(struct body));
//	mc->xr_gradient = xcalloc(6 * mc->n_bodies, sizeof(double));

//	srand(0);
	srand(time(0));

	mc->accept = 0; // for calculating percs
	double coord[6 * mc->n_bodies];
	check_fail(efp_get_coordinates(state->efp, coord));

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;
		// position of the atoms
		body->pos.x = coord[6 * i + 0];
		body->pos.y = coord[6 * i + 1];
		body->pos.z = coord[6 * i + 2];

		double a = coord[6 * i + 3];
		double b = coord[6 * i + 4];
		double c = coord[6 * i + 5];

		euler_to_matrix(a, b, c, &body->rotmat);
		set_body_mass_and_inertia(state->efp, i, body);

		mc->n_freedom += 3;
		//n_freedom?? EPSILON?? 
		if (body->inertia.x > EPSILON)
			mc->n_freedom++;
		if (body->inertia.y > EPSILON)
			mc->n_freedom++;
		if (body->inertia.z > EPSILON)
			mc->n_freedom++;
	}

	return (mc);
// Uses coordinates and efp info to generate position, orientation, 
// velocity, mass, and moment of inertia for each body.
}
/*
static void velocitize(struct mc *mc)
{
	rand_init();

	double temperature = cfg_get_double(mc->state->cfg, "temperature");
	double ke = temperature * BOLTZMANN * // Kinetic energy
	    mc->n_freedom / (2.0 * 6.0 * mc->n_bodies); // Reason fro this array size??

	for (size_t i = 0; i < mc->n_bodies; i++) {
		struct body *body = mc->bodies + i;

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
*/
static void print_status(const struct mc *mc)
{
	print_geometry(mc->state->efp);
//	print_restart(mc);
	print_info(mc);

	fflush(stdout);
}

static void mc_shutdown(struct mc *mc)
{
	free(mc->bodies);
//	free(mc->xr_gradient);
//	free(mc->data);
	free(mc);
}

void sim_mc(struct state *state)
{
	msg("MONTE CARLO JOB\n\n\n");

	struct mc *mc = mc_create(state);
	 
//	if (cfg_get_bool(state->cfg, "velocitize"))
//		velocitize(mc);

//	remove_system_drift(mc);
//	compute_forces(mc);
	compute_energy(mc->state, false);
	msg("    INITIAL STATE\n\n");
	print_status(mc);

	for (mc->step = 0;
	     mc->step < cfg_get_int(state->cfg, "max_steps");
	     mc->step++) {
		update_step(mc);

		if (mc->step % cfg_get_int(state->cfg, "print_step") == 0) {
			msg("    STATE AFTER %d STEPS\n\n", mc->step);
			print_status(mc);
		}
	}

	mc_shutdown(mc);
	printf("No. of steps accepted %5d\n",mc->accept);
	printf("Perc of steps accepted %12.6f % \n",(float)mc->accept/cfg_get_int(state->cfg, "max_steps"));
	msg("MONTE CARLO JOB COMPLETED SUCCESSFULLY\n");

//	simulate_monte_carlo();

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
//    srand(time(NULL));
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
