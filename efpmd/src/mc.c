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
	vec_t inertia;
	vec_t inertia_inv;
	double mass;
};

struct mc {
	size_t n_bodies;
	struct body *bodies;
	size_t n_freedom;
	six_t box;
	int step; /* current mc step */
	double potential_energy;
	struct state *state;
	int accept;
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

static double get_volume(const struct mc *mc)
{
	return mc->box.x * mc->box.y * mc->box.z;
}

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
 
static void rotate_step(size_t a1, size_t a2, double angle, mat_t *rotmat)
{
	mat_t rot = { 1.0, 0.0, 0.0,
		      0.0, 1.0, 0.0,
		      0.0, 0.0, 1.0 };

	double cosa = cos(angle);
	double sina = sin(angle);

	mat_set(&rot, a1, a1,  cosa);
	mat_set(&rot, a2, a2,  cosa);

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

static void print_info(const struct mc *mc)
{
	print_energy(mc->state);
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

static struct mc *mc_create(struct state *state)
{
	struct mc *mc = xcalloc(1, sizeof(struct mc));

	mc->state = state;
	// Creates the periodic box if the user chooses to... "box_from_str" is in common.c
	mc->box = box_from_str(cfg_get_string(state->cfg, "periodic_box"));

	mc->n_bodies = state->sys->n_frags;
	mc->bodies = xcalloc(mc->n_bodies, sizeof(struct body));

//	srand(0); // For starting at a constant particle every time
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
	free(mc);
}

void sim_mc(struct state *state)
{
	msg("MONTE CARLO JOB\n\n\n");

	struct mc *mc = mc_create(state);
	 
	compute_energy(mc->state, false);
	msg("    INITIAL STATE\n\n");
	print_status(mc);

	for (mc->step = 0;
	     mc->step < cfg_get_int(state->cfg, "max_steps");
	     mc->step++) {
		update_step(mc); // Step where Monte Carlo energy comparison takes place

		if (mc->step % cfg_get_int(state->cfg, "print_step") == 0) {
			msg("    STATE AFTER %d STEPS\n\n", mc->step);
			print_status(mc);
		}
	}

	mc_shutdown(mc);
	printf("No. of steps accepted %5d\n",mc->accept);
	printf("Perc of steps accepted %12.6f % \n",(float)mc->accept/cfg_get_int(state->cfg, "max_steps"));
	msg("MONTE CARLO JOB COMPLETED SUCCESSFULLY\n");


}

