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
#ifdef TORCH_SWITCH
#include "torch.h"
#endif
#include "time.h"
//#include "../torch/torch.h"

// void get_frag_elpot(struct state *);

/* current coordinates from efp struct are used */
void compute_energy(struct state *state, bool do_grad)
{
	struct efp_atom *atoms;
	struct efp_energy efp_energy;
	double xyz[3], xyzabc[6], *grad;
	size_t ifrag, nfrag, iatom, natom, spec_frag, n_special_atoms;
	int itotal;

    if (cfg_get_int(state->cfg, "print")>0) {
        print_geometry(state->efp);
    }

	/* EFP part */
    // print_geometry(state->efp);
	check_fail(efp_compute(state->efp, do_grad));
	check_fail(efp_get_energy(state->efp, &efp_energy));
	check_fail(efp_get_frag_count(state->efp, &nfrag));

	if (do_grad) {
		check_fail(efp_get_gradient(state->efp, state->grad));
		check_fail(efp_get_point_charge_gradient(state->efp,
		    state->grad + 6 * nfrag));
        if (cfg_get_int(state->cfg, "print") > 0)
            print_gradient(state);
	}

	state->energy = efp_energy.total;
	// print_energy(state);
	// printf("\n State energy (state->energy) %lf \n", state->energy);	
 
	/* constraints */
	for (ifrag = 0; ifrag < nfrag; ifrag++) {
		const struct frag *frag = state->sys->frags + ifrag;

		check_fail(efp_get_frag_xyzabc(state->efp, ifrag, xyzabc));

		if (frag->constraint_enable) {
			double dr2, drx, dry, drz;

			drx = xyzabc[0] - frag->constraint_xyz.x;
			dry = xyzabc[1] - frag->constraint_xyz.y;
			drz = xyzabc[2] - frag->constraint_xyz.z;

			dr2 = drx * drx + dry * dry + drz * drz;
			state->energy += 0.5 * frag->constraint_k * dr2;

			if (do_grad) {
				grad = state->grad + 6 * ifrag;
				grad[0] += frag->constraint_k * drx;
				grad[1] += frag->constraint_k * dry;
				grad[2] += frag->constraint_k * drz;
			}
		}
	}

    /* Torch fragment part here */
#ifdef TORCH_SWITCH

    if (cfg_get_bool(state->cfg, "enable_torch") && cfg_get_int(state->cfg, "opt_special_frag") > -1) {

	    spec_frag = cfg_get_int(state->cfg, "special_fragment");
        check_fail(efp_get_frag_atom_count(state->efp, spec_frag, &n_special_atoms));  // SKP

	    if (cfg_get_bool(state->cfg, "enable_elpot")) {
            double *elpot;
            struct efp_atom *atoms;
	        atoms = xmalloc(n_special_atoms * sizeof(struct efp_atom));
            check_fail(efp_get_frag_atoms(state->efp, spec_frag, n_special_atoms, atoms));
	        elpot = xcalloc(n_special_atoms, sizeof(double));
	        for (size_t j = 0; j < n_special_atoms; j++) {
                check_fail(efp_get_elec_potential(state->efp, spec_frag, &atoms[j].x, elpot + j));
            }
            free(atoms);

            if (cfg_get_int(state->cfg, "print") > 2) {
                printf("\n ELECTROSTATIC POTENTIAL \n");
                for (iatom = 0; iatom < n_special_atoms; iatom++) {
                  printf("%12.6f\n", *(elpot + iatom));
                }
            }
            torch_set_elpot(state->torch, elpot);
            free(elpot);

            //printf("\n\n=================CUSTOM MODEL=====================\n\n");
            clock_t start_time = clock();
            torch_custom_compute(state->torch, cfg_get_int(state->cfg, "print"));
            clock_t end_time = clock();
            double time_taken = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;
            if (cfg_get_int(state->cfg, "print")>1) printf("WALL time to compute ML energy: %f seconds\n", time_taken);
            //printf("=======================================================\n\n");
	    }
	    else {
            //printf("\n\n=================REGULAR ANI-MODEL=====================\n");
            clock_t start_time = clock();
            torch_compute(state->torch, cfg_get_string(state->cfg, "ml_path"), cfg_get_int(state->cfg, "print"));
            clock_t end_time = clock();
            double time_taken = ((double)(end_time - start_time)) / CLOCKS_PER_SEC;
            if (cfg_get_int(state->cfg, "print")>1) printf("WALL time to compute ML energy: %f seconds\n", time_taken);
            //printf("\n\n========================================================\n");
	    }

        state->torch_energy = torch_get_energy(state->torch);
        state->energy += state->torch_energy;

        if (do_grad) {
            torch_get_gradient(state->torch, state->torch_grad);

	        if (cfg_get_int(state->cfg, "print") > 2) {
                printf("\nTorch gradient in energy.c\n");
                for (size_t i = 0; i < 3*n_special_atoms; i++)
                    printf("%lf ", state->torch_grad[i]);
            }

            // combine EFP and torch (atomic) gradients on special fragments
            // do not add EFP contribution on a special fragment if it is the only fragment in the system
            if (nfrag > 1) {
                double *tmp_grad = xcalloc(n_special_atoms * 3, sizeof(double));

                // get gradient from fragment atoms directly if QQ and LJ terms are computed
                if (cfg_get_enum(state->cfg, "atom_gradient") == ATOM_GRAD_MM) {
                        check_fail(efp_get_atom_gradient(state->efp, spec_frag, tmp_grad));
                } else
                    check_fail(efp_get_frag_atomic_gradient(state->efp, spec_frag, tmp_grad));

                if (cfg_get_int(state->cfg, "print") > 2) {
                    printf("\nEFP fragment atomic gradient\n");
                    for (size_t i = 0; i < 3 * n_special_atoms; i++)
                        printf("%lf ", tmp_grad[i]);
                    printf("\n");
                }

                // adding EFP and TORCH gradients on special fragment
                for (size_t i = 0; i < 3*n_special_atoms; i++)
                    state->torch_grad[i] += tmp_grad[i];


		//msg("\n====Torch grad + EFP grad ===\n");
		//for (size_t i = 0; i < 3*n_special_atoms; i++)
		//	printf("%lf ", state->torch_grad[i]);
		//msg("\n=================================\n");

                // print total EFP and torch gradients
                if (cfg_get_int(state->cfg, "print") > 2) {
                    printf("\n TOTAL GRADIENTS on ML fragment atoms\n\n");
                    for (size_t i = 0; i < n_special_atoms; i++)
                        printf("%s      %12.6f      %12.6f     %12.6f\n", state->sys->frags[spec_frag].atoms[i].label,
                               state->torch_grad[i*3], state->torch_grad[i*3+1], state->torch_grad[i*3+2]);
                    printf("\n");
                }
                free(tmp_grad);
	        }
        }
    }
#endif

	/* MM force field part */
	if (state->ff == NULL)
		return;

	for (ifrag = 0, itotal = 0; ifrag < nfrag; ifrag++) {
		check_fail(efp_get_frag_atom_count(state->efp, ifrag, &natom));
		atoms = xmalloc(natom * sizeof(struct efp_atom));
		check_fail(efp_get_frag_atoms(state->efp, ifrag, natom, atoms));

		for (iatom = 0; iatom < natom; iatom++, itotal++)
			ff_set_atom_xyz(state->ff, itotal, &atoms[iatom].x);

		free(atoms);
	}

	ff_compute(state->ff, do_grad);

	if (do_grad) {
		for (ifrag = 0, itotal = 0, grad = state->grad; ifrag < nfrag; ifrag++, grad += 6) {
			check_fail(efp_get_frag_xyzabc(state->efp, ifrag, xyzabc));
			check_fail(efp_get_frag_atom_count(state->efp, ifrag, &natom));
			atoms = xmalloc(natom * sizeof(struct efp_atom));
			check_fail(efp_get_frag_atoms(state->efp, ifrag, natom, atoms));

			for (iatom = 0; iatom < natom; iatom++, itotal++) {
				ff_get_atom_gradient(state->ff, itotal, xyz);

				grad[0] += xyz[0];
				grad[1] += xyz[1];
				grad[2] += xyz[2];

				grad[3] += (atoms[iatom].y - xyzabc[1]) * xyz[2] -
					   (atoms[iatom].z - xyzabc[2]) * xyz[1];
				grad[4] += (atoms[iatom].z - xyzabc[2]) * xyz[0] -
					   (atoms[iatom].x - xyzabc[0]) * xyz[2];
				grad[5] += (atoms[iatom].x - xyzabc[0]) * xyz[1] -
					   (atoms[iatom].y - xyzabc[1]) * xyz[0];
			}

			free(atoms);
		}
	}

	state->energy += ff_get_energy(state->ff);
}
