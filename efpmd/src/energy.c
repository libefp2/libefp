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

/* current coordinates from efp struct are used */

void compute_energy(struct state *state, bool do_grad)
{


        struct efp_atom *atoms;
        struct efp_energy efp_energy;
        double xyz[3], xyzabc[6], *grad;
        size_t ifrag, nfrag, iatom, natom;
        int itotal;

        check_fail(efp_compute(state->efp, do_grad));
        check_fail(efp_get_energy(state->efp, &efp_energy));
        check_fail(efp_get_frag_count(state->efp, &nfrag));

        if (do_grad) {
                check_fail(efp_get_gradient(state->efp, state->grad));
                check_fail(efp_get_point_charge_gradient(state->efp,
                    state->grad + 6 * nfrag));
        }


        state->energy = efp_energy.total;

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


/*
void compute_energy(struct state *state, bool do_grad)
{

        msg("   SKP..compute_energy...do_grad()..line 33..in energy.c\n\n"); //SKP

	struct efp_atom *atoms;
	struct efp_energy efp_energy;
	double xyz[3], xyzabc[6], *grad;
	size_t ifrag, nfrag, iatom, natom;
	int itotal;

	// EFP part 
	check_fail(efp_compute(state->efp, do_grad));
	check_fail(efp_get_energy(state->efp, &efp_energy)); // add libtorch energies here for iFrag
	check_fail(efp_get_frag_count(state->efp, &nfrag));

	if (do_grad) {
	msg("Inside do_grad line 47\n\n");
		check_fail(efp_get_gradient(state->efp, state->grad)); // make new routine with grad on iFrag only
		check_fail(efp_get_point_charge_gradient(state->efp,
		    state->grad + 6 * nfrag));
	}
 
	msg("   SKP..compute_energy...do_grad()..line 52..in energy.c\n\n"); //SKP

	state->energy = efp_energy.total;

	// constraints 
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
				msg("Inside do_grad line 74\n\n");
				grad = state->grad + 6 * ifrag;
				grad[0] += frag->constraint_k * drx;
				grad[1] += frag->constraint_k * dry;
				grad[2] += frag->constraint_k * drz;
			}
		}
	}

	// MM force field part 
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
	msg("   SKP testing workflow...do_grad()..line 99..in energy.c\n\n"); //SKP
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

*/

// ================== Compute Energy with ML data ============================//

void torch_single_frag(struct state *state, size_t frag_idx, float *energies, float *gradients, float *forces)
{

        msg("SINGLE FRAGMENT TORCH JOB\n\n\n");
        size_t n_atoms = 3;
        float frag_coordinates[n_atoms][3];
 
	double tst_atoms[3 * n_atoms];
        struct efp_atom atoms[n_atoms];
        check_fail(efp_get_frag_atoms(state->efp, frag_idx, n_atoms, atoms));

	for(size_t i=0; i<n_atoms; i++){
		tst_atoms[3*i] = atoms[i].x * BOHR_RADIUS;
		tst_atoms[3*i+1] = atoms[i].y * BOHR_RADIUS;
		tst_atoms[3*i+2] = atoms[i].z * BOHR_RADIUS;
	}

        for (size_t a = 0; a < n_atoms; a++) {
                double x = atoms[a].x * BOHR_RADIUS;
                double y = atoms[a].y * BOHR_RADIUS;
                double z = atoms[a].z * BOHR_RADIUS;

                msg("\nPrinting the atomin coordinates of the chosen fragment\n");
                msg("%-16s %12.6lf %12.6lf %12.6lf\n", atoms[a].label, x, y, z);

                frag_coordinates[a][0] = x;
                frag_coordinates[a][1] = y;
                frag_coordinates[a][2] = z;

        }

        int frag_species[3] = {8, 1, 1};
	float total_energy = 0.0;

        get_torch_energy_grad((float*)frag_coordinates, frag_species, n_atoms, (float*)energies, (float*)gradients, (float*)forces);

        printf("Atomic Energies:\n");
        for (int i = 0; i < n_atoms; ++i) {
                printf("%f\n", energies[i]);
		total_energy  += energies[i];
        }

	printf("total_energy %12.6f\n",total_energy);

        printf("Gradients:\n");
        for (int i = 0; i < n_atoms; ++i) {
        for (int j = 0; j < 3; ++j) {
            printf("%f\t", gradients[i * 3 + j]);
        }
        printf("\n");
        }

        printf("Forces:\n");
        for (int i = 0; i < n_atoms; ++i) {
                for (int j = 0; j < 3; ++j) {
                    printf("%f\t", forces[i * 3 + j]);
                }
                printf("\n");
        }

	msg("Coming successfully out of torch_frag_grad\n\n");

//	free(frag_coordinates);
//	free(tst_atoms);
}

void compute_energy_with_torch(struct state *state, size_t frag_idx)
{
	msg("\n Inside compute_energy_with_torch fragment\n");
 
        struct efp_energy efp_energy;
        double *grad;
	float *tE, *tG, *tF;
        size_t ifrag, nfrag, iatom, natom;

	bool do_grad = true;
	double mlfrag_grad[6];
//	double *mlfrag_grad;

	size_t n_atoms = 3;
//        check_fail(efp_get_frag_atom_count(state->efp, frag_idx, &n_atoms));

        // EFP part 
        check_fail(efp_compute(state->efp, do_grad));
        check_fail(efp_get_energy(state->efp, &efp_energy));
        check_fail(efp_get_frag_count(state->efp, &nfrag));

	msg("total efp emergy after efp_compute %12.6f\n",efp_energy.total);

	tE = malloc(n_atoms * sizeof(float));
        tG = malloc(n_atoms * 3 * sizeof(float));
        tF = malloc(n_atoms * 3 * sizeof(float));
 
	torch_single_frag(state, frag_idx, tE, tG, tF);
 
	state->torch_frag_energy = 0.0;

//      add torch_frag_energy = sum of state->torch_frag_data.atomic_energies
//      feed torch_frag_energy and efp_energy to the optimizer
 
	for (size_t i = 0; i < n_atoms; i++) {
		state->torch_frag_energy += tE[i];	
        }

	state->energy = efp_energy.total + state->torch_frag_energy;
 
	msg("total efp emergy after torch addition %12.6f\n",state->energy);
 
//        check_fail(efp_get_gradient(state->efp, state->grad));
	check_fail(efp_get_gradient_ml_frag(state->efp, mlfrag_grad, frag_idx)); // make new routine with grad on iFrag only

//	use memcpy to fill in mlfrag_grad first and state->torch_frag_data.gradients 
//	starting from 6th element in state->torch_frag_grad
	state->torch_frag_grad = malloc((6 + n_atoms * 3) * sizeof(double));

	memcpy(state->torch_frag_grad, mlfrag_grad, 6 * sizeof(double));	// Gradient for the EFP-ML fragment

	double *tG_double = malloc(9 * sizeof(double)); 
	for (int i = 0; i < 9; i++) {
	    tG_double[i] = (double)tG[i];
	}

	memcpy(state->torch_frag_grad + 6, tG_double, (3 * n_atoms) * sizeof(double)); // Atomistic gradient for the EFP-ML fragment

//	msg("\nstate->torch_frag_grad PRINT after addition\n");
//                for (int i = 0; i < (6 + n_atoms * 3); i++) {
//                    printf("%12.8f\n", state->torch_frag_grad[i]);
//                }

	free(tE); free(tG); free(tF); free(tG_double);
}

//=================================================================================//

double calculatePairwiseEnergy(Particle particle1, Particle particle2) {

    double energy = 0.0;

    double epsilon = 1.0; 
    double sigma = 1.0; 

    double dx = particle1.x - particle2.x;
    double dy = particle1.y - particle2.y;
    double dz = particle1.z - particle2.z;

    double r_squared = dx * dx + dy * dy + dz * dz;
    double r = sqrt(r_squared);

    if (r > 0.0) {
        double r6 = r_squared * r_squared * r_squared;
        double r12 = r6 * r6;
        energy = 4.0 * epsilon * (sigma * sigma / r12 - sigma * sigma / r6);
    }

    return energy; 
}

double calculateEnergy(Particle particles[6]) {
    double total_energy = 0.0;

    for (int i = 0; i < 6; i++) {
        for (int j = i + 1; j < 6; j++) {
            double pairwise_energy = calculatePairwiseEnergy(particles[i], particles[j]);
            total_energy += pairwise_energy;
        }
    }

    return total_energy;
}
