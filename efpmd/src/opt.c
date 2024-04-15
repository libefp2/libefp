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
#include "opt.h"
#include "../c_wrap_torch/src/c_libtorch.h"

void sim_opt(struct state *state);
void sim_opt_with_ml(struct state *state);


static double compute_efp(size_t n, const double *x, double *gx, void *data)
{
        size_t n_frags, n_charge;
        struct state *state = (struct state *)data;

        check_fail(efp_get_frag_count(state->efp, &n_frags));
        check_fail(efp_get_point_charge_count(state->efp, &n_charge));

        assert(n == (6 * n_frags + 3 * n_charge));

        check_fail(efp_set_coordinates(state->efp, EFP_COORD_TYPE_XYZABC, x));
        check_fail(efp_set_point_charge_coordinates(state->efp, x + 6 * n_frags));

        compute_energy(state, true);
        memcpy(gx, state->grad, (6 * n_frags + 3 * n_charge) * sizeof(double));

        for (size_t i = 0; i < n_frags; i++) {
                const double *euler = x + 6 * i + 3;
                double *gradptr = gx + 6 * i + 3;

		for(size_t j=0; j<(6 * i + 3); j++){
     		   printf("euler, gradptr = %f %f\n",euler[j],gradptr[j]);
    		}

                efp_torque_to_derivative(euler, gradptr, gradptr);
        }

        return (state->energy);
}


/*
static double compute_efp(size_t n, double *x, double *gx, void *data)
{
	msg("\nInside compute_efp() routine\n");
	size_t n_frags, n_charge;
	struct state *state = (struct state *)data;

	check_fail(efp_get_frag_count(state->efp, &n_frags));
	check_fail(efp_get_point_charge_count(state->efp, &n_charge));

	assert(n == (6 * n_frags + 3 * n_charge));

	msg("Going in to efp_set_coordinates()\n");
	check_fail(efp_set_coordinates(state->efp, EFP_COORD_TYPE_XYZABC, x));
	check_fail(efp_set_point_charge_coordinates(state->efp, x + 6 * n_frags));

	msg("Going in to compute_energy()\n");
	compute_energy(state, true);
	memcpy(gx, state->grad, (6 * n_frags + 3 * n_charge) * sizeof(double));

	for(size_t i=0; i<(6 * n_frags); i++){
	   printf("x in compute_efp %12.8f\n",x[i]);
	}

	for(size_t i=0; i<(6 * n_frags); i++){
           printf("gx in compute_efp %12.8f\n",gx[i]);
        }

	for (size_t i = 0; i < n_frags; i++) {
		const double *euler = x + 6 * i + 3;
		double *gradptr = gx + 6 * i + 3;

		efp_torque_to_derivative(euler, gradptr, gradptr);
	}

	msg("Energy val in compute_efp = %12.8f\n",state->energy);

	return (state->energy);
}

*/


static double compute_efp_with_ml(size_t n, const double *x, double *gx, void *data) {
    size_t n_atoms, n_frags, n_charge;
    struct state *state = (struct state *)data;
    size_t frag_idx = 1; // for now

    check_fail(efp_get_frag_count(state->efp, &n_frags));
    check_fail(efp_get_frag_atom_count(state->efp, frag_idx, &n_atoms));

    assert(n == (6 + 3 * n_atoms));
    
    double xyzabc[6]; 

//  use efp_get_frag_xyzabc to obtain fragment xyz and abc
    check_fail(efp_get_frag_xyzabc(state->efp, frag_idx, xyzabc));
    
    memcpy(x, xyzabc, 6 * sizeof(double));
//    for(size_t i=0; i<6; i++){
//        printf("In compute_efp_with_ml xyzabc =  %12.8f\n",xyzabc[i]);
//    }

//  add frag atomic coordinates to fragment x after that
   
    struct efp_atom x_atoms[n_atoms];
    check_fail(efp_get_frag_atoms(state->efp, frag_idx, n_atoms, x_atoms));

    double tst_atoms[3*n_atoms];
    for(size_t i=0; i<n_atoms; i++){
       tst_atoms[3*i] = x_atoms[i].x * BOHR_RADIUS;
       tst_atoms[3*i+1] = x_atoms[i].y * BOHR_RADIUS;
       tst_atoms[3*i+2] = x_atoms[i].z * BOHR_RADIUS;
    }

    memcpy(x+6, tst_atoms, (3 * n_atoms) * sizeof(double));

//    for(size_t i=0; i<(3 * n_atoms); i++){
//        printf("In compute_efp_with_ml tst_atoms %12.8f\n",tst_atoms[i]);
//    }    

//    for(size_t i=0; i<(6 + 3 * n_atoms); i++){
//        printf("In compute_efp_with_ml x %12.8f\n",x[i]);
//    }

    compute_energy_with_torch(state, frag_idx);
    memcpy(gx, state->torch_frag_grad, (6 + 3 * n_atoms) * sizeof(double));

//    msg("\nstate->torch_frag_grad PRINT after coming back to compute_efp_with_ml\n");
//                for (int i = 0; i < (6 + n_atoms * 3); i++) {
//                    printf("%12.8f\n", gx[i]);
//                }

//  compute torque on frag_idx only... not atomwise... 
 
    const double *euler = x + 3;
    double *gradptr = gx + 3;

//    for(size_t i=0; i<3; i++){
//        printf("euler, gradptr = %f %f\n",euler[i],gradptr[i]);
//    } 

    efp_torque_to_derivative(euler, gradptr, gradptr);


    return (state->energy);
 
    msg("Coming out of compute_efp_with_ml() routine\n");
    free(xyzabc);
    free(tst_atoms);
}


static void print_restart(struct efp *efp)
{
	size_t n_frags;
	check_fail(efp_get_frag_count(efp, &n_frags));

	double coord[6 * n_frags];
	check_fail(efp_get_coordinates(efp, coord));

	msg("    RESTART DATA\n\n");

	for (size_t i = 0; i < n_frags; i++) {
		char name[64];
		check_fail(efp_get_frag_name(efp, i, sizeof(name), name));

		coord[6 * i + 0] *= BOHR_RADIUS;
		coord[6 * i + 1] *= BOHR_RADIUS;
		coord[6 * i + 2] *= BOHR_RADIUS;

		print_fragment(name, coord + 6 * i, NULL);
	}

	size_t n_charges;
	check_fail(efp_get_point_charge_count(efp, &n_charges));

	if (n_charges > 0) {
		double q[n_charges];
		check_fail(efp_get_point_charge_values(efp, q));

		double xyz[3 * n_charges];
		check_fail(efp_get_point_charge_coordinates(efp, xyz));

		for (size_t i = 0; i < n_charges; i++) {
			double x = xyz[3 * i + 0] * BOHR_RADIUS;
			double y = xyz[3 * i + 1] * BOHR_RADIUS;
			double z = xyz[3 * i + 2] * BOHR_RADIUS;

			print_charge(q[i], x, y, z);
		}
	}

	msg("\n");
}

static int check_conv(double rms_grad, double max_grad, double opt_tol)
{
	return max_grad < opt_tol && rms_grad < opt_tol / 3.0;
}

static void get_grad_info(size_t n_coord, const double *grad, double *rms_grad_out,
				double *max_grad_out)
{
	double rms_grad = 0.0, max_grad = 0.0;
	msg("Inside get_grad_info\n\n");
	for (size_t i = 0; i < n_coord; i++) {
		rms_grad += grad[i] * grad[i];
		msg("rms_grad, grad = %f %f\n",rms_grad,grad[i]);
		if (fabs(grad[i]) > max_grad)
			max_grad = fabs(grad[i]);
	}

	rms_grad = sqrt(rms_grad / n_coord);
	msg("rms_grad = %f\n",rms_grad);
	*rms_grad_out = rms_grad;
	*max_grad_out = max_grad;

}

static void print_status(struct state *state, double e_diff, double rms_grad, double max_grad)
{

        msg("   SKP testing workflow..print_status()....in opt.c\n\n"); //SKP	

	print_geometry(state->efp);
	print_restart(state->efp);
	print_energy(state);

	msg("%30s %16.10lf\n", "ENERGY CHANGE", e_diff);
	msg("%30s %16.10lf\n", "RMS GRADIENT", rms_grad);
	msg("%30s %16.10lf\n", "MAXIMUM GRADIENT", max_grad);
	msg("\n\n");

	fflush(stdout);
}

void sim_opt(struct state *state)
{
        msg("ENERGY MINIMIZATION JOB\n\n\n");

        size_t n_frags, n_charge, n_coord;
        double rms_grad, max_grad;

        check_fail(efp_get_frag_count(state->efp, &n_frags));
        check_fail(efp_get_point_charge_count(state->efp, &n_charge));

        n_coord = 6 * n_frags + 3 * n_charge;

        struct opt_state *opt_state = opt_create(n_coord);
        if (!opt_state)
                error("unable to create an optimizer");

        opt_set_func(opt_state, compute_efp);
        opt_set_user_data(opt_state, state);

        double coord[n_coord], grad[n_coord];
        check_fail(efp_get_coordinates(state->efp, coord));
        check_fail(efp_get_point_charge_coordinates(state->efp, coord + 6 * n_frags));

        if (opt_init(opt_state, n_coord, coord))
                error("unable to initialize an optimizer");

        double e_old = opt_get_fx(opt_state);
        opt_get_gx(opt_state, n_coord, grad);
	msg("n_coord = %2d\n",n_coord);
        get_grad_info(n_coord, grad, &rms_grad, &max_grad);

	msg("    INITIAL STATE\n\n");
        print_status(state, 0.0, rms_grad, max_grad);

        for (int step = 1; step <= cfg_get_int(state->cfg, "max_steps"); step++) {
                if (opt_step(opt_state))
                        error("unable to make an optimization step");

                double e_new = opt_get_fx(opt_state);
                opt_get_gx(opt_state, n_coord, grad);
                get_grad_info(n_coord, grad, &rms_grad, &max_grad);

                if (check_conv(rms_grad, max_grad, cfg_get_double(state->cfg, "opt_tol"))) {
                        msg("    FINAL STATE\n\n");
                        print_status(state, e_new - e_old, rms_grad, max_grad);
                        msg("OPTIMIZATION CONVERGED\n");
                        break;
                }

                msg("    STATE AFTER %d STEPS\n\n", step);
                print_status(state, e_new - e_old, rms_grad, max_grad);

                e_old = e_new;
        }

        opt_shutdown(opt_state);

        msg("ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY\n");
}

/*

void sim_opt(struct state *state)
{
	msg("ENERGY MINIMIZATION JOB\n\n\n");

	size_t n_frags, n_charge, n_coord;
	double rms_grad, max_grad;

	check_fail(efp_get_frag_count(state->efp, &n_frags));
	check_fail(efp_get_point_charge_count(state->efp, &n_charge));

	print_frag_info(state->efp, 1);

	msg("Running efp_compute() in sim_opt()\n");
        bool do_grad = true;
        check_fail(efp_compute(state->efp, do_grad));

	// 3*n_atoms
	n_coord = 6 * n_frags + 3 * n_charge; // For 1 fragment optimization what's number of point charge?

	double ml[6];
	double grd[6 * n_frags];
//	check_fail(efp_get_gradient_ml_frag(state->efp, ml, 1));
//	check_fail(efp_get_gradient(state->efp, grd));	
 
	struct opt_state *opt_state = opt_create(n_coord);  // Initial state creation, "opt_create" in libopt
	if (!opt_state)
		error("unable to create an optimizer");

	opt_set_func(opt_state, compute_efp); // libopt
	opt_set_user_data(opt_state, state); // libopt

	double coord[n_coord], grad[n_coord]; 
	check_fail(efp_get_coordinates(state->efp, coord));
	check_fail(efp_get_point_charge_coordinates(state->efp, coord + 6 * n_frags));	

	if (opt_init(opt_state, n_coord, coord))
		error("unable to initialize an optimizer");

	// opt_get_fx = energy, opt_get_gx = gradient in libopt
	// get_grad_info gets rms_grad and does max_grad comparison

	double e_old = opt_get_fx(opt_state);
	opt_get_gx(opt_state, n_coord, grad);
	get_grad_info(n_coord, grad, &rms_grad, &max_grad);

	msg("    INITIAL STATE\n\n");
	print_status(state, 0.0, rms_grad, max_grad);

	for (int step = 1; step <= cfg_get_int(state->cfg, "max_steps"); step++) {
		if (opt_step(opt_state))
			error("unable to make an optimization step");

		double e_new = opt_get_fx(opt_state);
		opt_get_gx(opt_state, n_coord, grad);
		get_grad_info(n_coord, grad, &rms_grad, &max_grad);

		if (check_conv(rms_grad, max_grad, cfg_get_double(state->cfg, "opt_tol"))) {
			msg("    FINAL STATE\n\n");
			print_status(state, e_new - e_old, rms_grad, max_grad);
			msg("OPTIMIZATION CONVERGED\n");
			break;
		}

		msg("    STATE AFTER %d STEPS\n\n", step);
		print_status(state, e_new - e_old, rms_grad, max_grad);

		e_old = e_new;
	}

	opt_shutdown(opt_state);

	msg("ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY\n");

	msg("\n\nDoing test energy and grad calc for chosen frag:\n");

	size_t frag_idx = 1;

//	torch_single_frag(state, frag_idx);
//	single_frag_total_optim(state);
//	msg("Testing done\n");

}

*/


void sim_opt_with_ml(struct state *state)
{
	msg("ENERGY MINIMIZATION FOR SYSTEM WITH ML FRAGMENT\n\n\n");
        size_t n_atoms, n_coord, n_frags, n_charge;
        double rms_grad, max_grad;
        size_t mini_frag = 1;
	size_t ifrag;
       
	check_fail(efp_get_frag_count(state->efp, &n_frags));
//        check_fail(efp_get_point_charge_count(state->efp, &n_charge));
	check_fail(efp_get_frag_atom_count(state->efp, mini_frag, &n_atoms));

//	msg("Running efp_compute() in sim_opt_with_ml()\n");
	bool do_grad = true;
//	check_fail(efp_compute(state->efp, do_grad));

//	double ml[6];
//        double grd[6 * n_frags];
//        check_fail(efp_get_gradient_ml_frag(state->efp, ml, 1));
//        check_fail(efp_get_gradient(state->efp, grd));

//	msg("Printing geometry in sim_opt_with_ml()\n");
//	print_geometry(state->efp);

//	for(size_t ifrag=0; ifrag < n_frags; ifrag++){
//           if (ifrag == mini_frag){
		
		ifrag = mini_frag;
		n_coord = 6 + 3 * n_atoms; // For 1 fragment optimization what's number of point charge?

//	        msg("\n n_coord %4d \n", n_coord);
//	        msg("\n n_frags %4d \n", n_frags);
//        	msg("\n n_charge %4d \n", n_charge);

		struct opt_state *opt_state = opt_create(n_coord);  // Initial state creation, "opt_create" in libopt
        	if (!opt_state)
        	        error("unable to create an optimizer");
	
        	opt_set_func(opt_state, compute_efp_with_ml); // libopt
        	opt_set_user_data(opt_state, state); // libopt

//		msg("Printing geometry 2nd time in sim_opt_with_ml()\n");
//	        print_geometry(state->efp);
 
        	double coord[n_coord], grad[n_coord];
        	check_fail(efp_get_coordinates(state->efp, coord));
//        	check_fail(efp_get_point_charge_coordinates(state->efp, coord + 6 * n_frags));

	        if (opt_init(opt_state, n_coord, coord))
	                error("unable to initialize an optimizer");	

		double e_old = opt_get_fx(opt_state);
	        opt_get_gx(opt_state, n_coord, grad);
//		msg("n_coord = %2d\n",n_coord);
	        get_grad_info(n_coord, grad, &rms_grad, &max_grad);

	        msg("    INITIAL STATE\n\n");
	        print_status(state, 0.0, rms_grad, max_grad);
		msg("Coming out of print_status\n\n");

        	for (int step = 1; step <= cfg_get_int(state->cfg, "max_steps"); step++) {
		// Need to include the atomic optimization along with the fragment optimization.. every step of the opt
		// distribute COM gradient and Torque to atoms
		// efp_get_atomic_gradient
        	        if (opt_step(opt_state))
        	                error("unable to make an optimization step");

        	        double e_new = opt_get_fx(opt_state);
        	        opt_get_gx(opt_state, n_coord, grad);
        	        get_grad_info(n_coord, grad, &rms_grad, &max_grad);

        	        if (check_conv(rms_grad, max_grad, cfg_get_double(state->cfg, "opt_tol"))) {
        	                msg("    FINAL STATE\n\n");
        	                print_status(state, e_new - e_old, rms_grad, max_grad);
        	                msg("OPTIMIZATION CONVERGED\n");
        	                break;
        	        }
	
       	        	msg("    STATE AFTER %d STEPS\n\n", step);
                	print_status(state, e_new - e_old, rms_grad, max_grad);

                	e_old = e_new;
        	}
	    	
            opt_shutdown(opt_state);
	
//	    } // if-block (mini-frag)
//	} // for-block (ifrag)
	msg("ENERGY MINIMIZATION FOR SYSTEM WITH ML FRAGMENT COMPLETED SUCCESSFULLY\n");
}


