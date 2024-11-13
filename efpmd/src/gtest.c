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
#include "torch.h"

void sim_gtest(struct state *state);

static void test_vec(char label, size_t idx, double tol, const double *agrad,
		const double *ngrad)
{
//	printf("Entering test_vec\n");
	bool match = true;

//	printf("\nAnalytical Gradients in test_vec:\n");
//            for (int j = 0; j < 3; ++j) {
//                printf("%f\t", agrad[j]);
//            }
//            printf("\n\n");

	for (size_t i = 0; i < 3; i++)
		if (fabs(agrad[i] - ngrad[i]) > tol)
			match = false;

	msg("A %c%04zu  ", label, idx);
	print_vec(agrad);
	msg("\n");
	msg("N %c%04zu  ", label, idx);
	print_vec(ngrad);
	msg(match ? "  MATCH\n" : "  DOES NOT MATCH\n");
}

static void test_cgrad(struct state *state, const double *cgrad)
{
//	printf("Entering test_cgrad()\n");
	double tol = cfg_get_double(state->cfg, "gtest_tol");
	double dstep = cfg_get_double(state->cfg, "num_step_dist");

	size_t n_charges;
	check_fail(efp_get_point_charge_count(state->efp, &n_charges));

	double znuc[n_charges], xyz[3 * n_charges];
	check_fail(efp_get_point_charge_values(state->efp, znuc));
	check_fail(efp_get_point_charge_coordinates(state->efp, xyz));

	for (size_t i = 0; i < n_charges; i++) {
		double ngrad[3];

		for (size_t j = 0; j < 3; j++) {
			double e1, e2;
			double coord = xyz[3 * i + j];

			xyz[3 * i + j] = coord - dstep;
			check_fail(efp_set_point_charges(state->efp, n_charges, znuc, xyz));
			compute_energy(state, 0);
			e1 = state->energy;

			xyz[3 * i + j] = coord + dstep;
			check_fail(efp_set_point_charges(state->efp, n_charges, znuc, xyz));
			compute_energy(state, 0);
			e2 = state->energy;

			xyz[3 * i + j] = coord;
			ngrad[j] = (e2 - e1) / (2.0 * dstep);
		}

		test_vec('Q', i + 1, tol, cgrad + 3 * i, ngrad);
	}

	check_fail(efp_set_point_charges(state->efp, n_charges, znuc, xyz));
}

static void test_fgrad(struct state *state, const double *fgrad)
{
//	printf("Entering test_fgrad()\n");
	double tol = cfg_get_double(state->cfg, "gtest_tol");
	double dstep = cfg_get_double(state->cfg, "num_step_dist");
	double astep = cfg_get_double(state->cfg, "num_step_angle");

	size_t n_frags, spec_frag;
	check_fail(efp_get_frag_count(state->efp, &n_frags));

    spec_frag = n_frags + 1; // make in inactive if torch model is off
    if (cfg_get_bool(state->cfg, "enable_torch") &&  cfg_get_int(state->cfg, "special_fragment") > -1)
        spec_frag = cfg_get_int(state->cfg, "special_fragment");

	double xyzabc[6 * n_frags];
	check_fail(efp_get_coordinates(state->efp, xyzabc));

	for (size_t i = 0, k=0; i < n_frags; i++) {

        if (i == spec_frag) continue;

		double deriv[3], ngrad[6];

		for (size_t j = 0; j < 6; j++) {
			double e1, e2;
			double coord = xyzabc[6 * i + j];
			double step = j < 3 ? dstep : astep;

			xyzabc[6 * i + j] = coord - step;
			check_fail(efp_set_coordinates(state->efp, EFP_COORD_TYPE_XYZABC, xyzabc));
			compute_energy(state, false);
			e1 = state->energy;

			xyzabc[6 * i + j] = coord + step;
			check_fail(efp_set_coordinates(state->efp, EFP_COORD_TYPE_XYZABC, xyzabc));
			compute_energy(state, false);
			e2 = state->energy;

			xyzabc[6 * i + j] = coord;
			ngrad[j] = (e2 - e1) / (2.0 * step);
		}

		test_vec('F', i + 1, tol, fgrad + 6 * k, ngrad);
		efp_torque_to_derivative(xyzabc + 6 * i + 3, fgrad + 6 * k + 3, deriv);
		test_vec('D', i + 1, tol, deriv, ngrad + 3);

        k++;
	}

	check_fail(efp_set_coordinates(state->efp, EFP_COORD_TYPE_XYZABC, xyzabc));
}


static void test_agrad(struct state *state, const double *agrad)
{
    printf("\n\nSTARTING TEST_AGRAD()\n\n");
    double tol = cfg_get_double(state->cfg, "gtest_tol");
    double dstep = cfg_get_double(state->cfg, "num_step_dist");

    size_t spec_frag, n_special_atoms;

    spec_frag = cfg_get_int(state->cfg, "special_fragment");
    check_fail(efp_get_frag_atom_count(state->efp, spec_frag, &n_special_atoms));

    double atom_coord[3 * n_special_atoms]; // = (double*)malloc(3 * n_special_atoms * sizeof(double));
    check_fail(efp_get_frag_atom_coord(state->efp, spec_frag, atom_coord));

    
    for (size_t i = 0; i < n_special_atoms; i++) {
        double ngrad[3];
        for (size_t j = 0; j < 3; j++) {

            double e1, e2;
            double coord = atom_coord[3 * i + j];

	    printf("\nAtom %2d, Coord %2d - dstep\n",i,j);
	    printf("\nPRINTING COORD-DTSEP		E1-------------------------------\n");
            atom_coord[3 * i + j] = coord - dstep;
            // propagate special fragment coordinates to EFP and update fragment parameters
            check_fail(update_special_fragment(state->efp, atom_coord));
            // propagate special fragment coordinates to torch
            torch_set_coord(state->torch, atom_coord);
            compute_energy(state, 0);
            e1 = state->energy;
	    //printf("e_minus = %12.8f\n",e1);
	   
            printf("\nAtom %2d, Coord %2d + dstep\n",i,j);
	    printf("\nPRINTING COORD+DTSEP		E2--------------------------------\n");
            atom_coord[3 * i + j] = coord + dstep;
            // propagate special fragment coordinates to EFP and update fragment parameters
            check_fail(update_special_fragment(state->efp, atom_coord));
            // propagate special fragment coordinates to torch
            torch_set_coord(state->torch, atom_coord);
            compute_energy(state, 0);
            e2 = state->energy;
	    //printf("e_plus = %12.8f\n",e2);
            // return to the original coordinates?
            atom_coord[3 * i + j] = coord;
            // propagate special fragment coordinates to EFP and update fragment parameters
            check_fail(update_special_fragment(state->efp, atom_coord));
            // propagate special fragment coordinates to torch
            torch_set_coord(state->torch, atom_coord);

	    //printf("del_e = %12.6f\n",e2 - e1);
            ngrad[j] = ((e2 - e1) / (2.0 * dstep));
	    //printf("ngrad[j] = %12.6f\n",ngrad[j]);

        }
	printf("\n");	
        test_vec('A', i + 1, tol, agrad + 3 * i, ngrad);
    }


    // propagate special fragment coordinates to EFP and update fragment parameters
    check_fail(update_special_fragment(state->efp, atom_coord));
    // propagate special fragment coordinates to torch
    torch_set_coord(state->torch, atom_coord);

}

/*
// 5 point stencil
static void test_agrad(struct state *state, const double *agrad)
{
    double tol = cfg_get_double(state->cfg, "gtest_tol");
    double dstep = cfg_get_double(state->cfg, "num_step_dist");

    size_t spec_frag, n_special_atoms;

    spec_frag = cfg_get_int(state->cfg, "special_fragment");
    check_fail(efp_get_frag_atom_count(state->efp, spec_frag, &n_special_atoms));

    double atom_coord[3 * n_special_atoms]; // = (double*)malloc(3 * n_special_atoms * sizeof(double));
    check_fail(efp_get_frag_atom_coord(state->efp, spec_frag, atom_coord));

    for (size_t i = 0; i < n_special_atoms; i++) {
        double ngrad[3];
	double tmp_agrad[3];
        for (size_t j = 0; j < 3; j++) {

            double e1, e2, e3, e4;
            double coord = atom_coord[3 * i + j];

	    // (x-2h)
            atom_coord[3 * i + j] = coord - 2.0 * dstep;
            check_fail(update_special_fragment(state->efp, atom_coord));
            torch_set_coord(state->torch, atom_coord);
            compute_energy(state, 1);
            e1 = state->energy;

	    // (x-h)
	    atom_coord[3 * i + j] = coord - dstep;
            check_fail(update_special_fragment(state->efp, atom_coord));
            torch_set_coord(state->torch, atom_coord);
            compute_energy(state, 1);
            e2 = state->energy;
 

	    // (x+h)
            atom_coord[3 * i + j] = coord + dstep;
            check_fail(update_special_fragment(state->efp, atom_coord));
            torch_set_coord(state->torch, atom_coord);
            compute_energy(state, 1);
            e3 = state->energy;

	    // (x+2h)
	    atom_coord[3 * i + j] = coord + 2.0 * dstep;
            check_fail(update_special_fragment(state->efp, atom_coord));
            torch_set_coord(state->torch, atom_coord);
            compute_energy(state, 1);
            e4 = state->energy;
 
            atom_coord[3 * i + j] = coord;
            check_fail(update_special_fragment(state->efp, atom_coord));
            torch_set_coord(state->torch, atom_coord);
 
            //ngrad[j] = (e2 - e1) / (2.0 * dstep);
	    // 5 point stencil
	    ngrad[j] = (-e4 + (8.0 * e3) - (8.0 * e2) + e1) / (12.0 * dstep);
	    tmp_agrad[j] = agrad[i * 3 + j];
 
	    printf("\nNumerical Gradients:\n");
            for (int j = 0; j < 3; ++j) {
                printf("%f\t", ngrad[j]);
            }
        }
	printf("\nAnalytical Gradients before calling test_vec:\n");
            for (int j = 0; j < 3; ++j) {
                printf("%f\t", tmp_agrad[j]);
            }
            printf("\n\n");

        test_vec('A', i + 1, tol, agrad + 3 * i, ngrad);
    }

    check_fail(update_special_fragment(state->efp, atom_coord));
    torch_set_coord(state->torch, atom_coord);

}
*/
static void test_grad(struct state *state)
{
//	printf("Entering test_grad()\n");
	size_t n_frags, n_charges;
    size_t spec_frag, n_special_atoms;
	check_fail(efp_get_frag_count(state->efp, &n_frags));
	check_fail(efp_get_point_charge_count(state->efp, &n_charges));

    // models with libtorch optimized fragment
    if (cfg_get_bool(state->cfg, "enable_torch") && cfg_get_int(state->cfg, "opt_special_frag") > -1) {
        spec_frag = cfg_get_int(state->cfg, "special_fragment");
        check_fail(efp_get_frag_atom_count(state->efp, spec_frag, &n_special_atoms));

        // check efp and charges gradient on non-special fragment
        double fgrad[6 * (n_frags-1)];
        double agrad[3 * n_special_atoms];

        // skips gradient of special fragment
        for (size_t i=0, k=0; i<n_frags; i++) {
            if (i == spec_frag) continue;
            memcpy(fgrad+6*k, state->grad+6*i, 6 * sizeof(double));
            k++;
        }
        // memcpy(fgrad, state->grad, n_frags * 6 * sizeof(double));

        /*
        // do not add EFP contribution on a special fragment if it is the only fragment in the system
        if (n_frags > 1) {

            double *tmp_grad = xcalloc(n_special_atoms*3, sizeof (double));

            // get gradient from fragment atoms directly if QQ and LJ terms are computed
            if (cfg_get_enum(state->cfg, "atom_gradient") == ATOM_GRAD_MM) {
                check_fail(efp_get_atom_gradient(state->efp, spec_frag, tmp_grad));
            }
            else
                check_fail(efp_get_frag_atomic_gradient(state->efp, spec_frag, tmp_grad));

            // add EFP and torch gradients
            for (size_t i = 0; i < n_special_atoms*3; i++)
                state->torch_grad[i] += tmp_grad[i];

            free(tmp_grad);
        }
        */

        memcpy(agrad, state->torch_grad, (3 * n_special_atoms) * sizeof(double));
	
	//printf("Torch->energy %12.6f\n\n",state->energy);
        //printf("Analytical Gradients: in test_grad\n");
        //for (int i = 0; i < n_special_atoms; ++i) {
        //    for (int j = 0; j < 3; ++j) {
        //        printf("%f\t", agrad[i * 3 + j]);
        //    }
        //    printf("\n");
        //}	

        if (n_charges > 0) {
            double cgrad[3 * n_charges];
            check_fail(efp_get_point_charge_gradient(state->efp, cgrad));
            test_cgrad(state, cgrad);   // test point charge gradient
        }

        msg("TESTING GRADIENTS ON EFP FRAGMENTS\n");
        test_fgrad(state, fgrad);  // test efp fragment gradient
        msg("TESTING GRADIENTS ON SPECIAL FRAGMENT ATOMS\n");
        test_agrad(state, agrad); // test gradient on special fragment atoms
    }

    // original "normal efp only" case
    else {
        double fgrad[6 * n_frags];
        memcpy(fgrad, state->grad, n_frags * 6 * sizeof(double));

        if (n_charges > 0) {
            double cgrad[3 * n_charges];
            check_fail(efp_get_point_charge_gradient(state->efp, cgrad));
            test_cgrad(state, cgrad);
        }

        test_fgrad(state, fgrad);
    }
}

static void test_energy(struct state *state)
{
	double eref, tol;

	eref = cfg_get_double(state->cfg, "ref_energy");
	tol = cfg_get_double(state->cfg, "gtest_tol");

	msg("%30s %16.10lf\n", "REFERENCE ENERGY", eref);
	msg("%30s %16.10lf", "COMPUTED ENERGY", state->energy);
	msg(fabs(eref - state->energy) < tol ? "  MATCH\n" : "  DOES NOT MATCH\n");
}

void sim_gtest(struct state *state)
{
	msg("GRADIENT TEST JOB\n\n\n");

	print_geometry(state->efp);
	compute_energy(state, 1);
	print_energy(state);
	test_energy(state);

	msg("\n\n    COMPUTING NUMERICAL GRADIENT\n\n");
	test_grad(state);
	msg("\n");

	msg("GRADIENT TEST JOB COMPLETED SUCCESSFULLY\n");
}

void sim_etest(struct state *state)
{
    msg("ENERGY TEST JOB\n\n\n");

    print_geometry(state->efp);
    compute_energy(state, 1);
    print_energy(state);
    test_energy(state);

    msg("ENERGY TEST JOB COMPLETED SUCCESSFULLY\n");
}
