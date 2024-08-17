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

#include "torch.h"
#include "common.h"
#include "cfg.h"
#include <stdio.h>
//#include "../torch/c_libtorch.h"

struct torch {
    double energy;
    double *grad;
    size_t natoms;
    int *atom_types;
    double *atom_coords;
    int nn_type;
};

struct torch *torch_create(void) {
    struct torch *torch;
    torch = calloc(1, sizeof(*torch));
    return (torch);
}

void get_torch_type(struct torch *torch, const char *str) {
    int file_type;
    if (strcmp(str, "ani1.pt") == 0) {
        file_type = 1;
        fprintf(stderr, "chosen nn_type: %s\n", str);
    } else if (strcmp(str, "ani2.pt") == 0) {
        file_type = 2;
        fprintf(stderr, "chosen nn_type: %s\n", str);
    } else {
        file_type = -1; // or any other default/error value
        fprintf(stderr, "Unknown filetype: %s\n", str);
    }
    torch->nn_type = file_type;
}

void torch_init(struct torch *torch, size_t natom) {
    torch->natoms = natom;
    torch->atom_coords = malloc(3*natom*sizeof(double));
    torch->atom_types = malloc(natom*sizeof(int));
    torch->grad = malloc(3*natom*sizeof(double));
}
 
//int torch_load_nn(struct torch *torch, const char *nn_name) {

void torch_get_atom_count(struct torch *torch , size_t natom) {
    natom = torch->natoms;
}

void torch_set_atom_count(struct torch *torch, size_t *natom) {
    torch->natoms = *natom;
}

void torch_get_atom_coord(struct torch *torch, size_t atom, double *coord) {
    assert(atom < torch->natoms);
    memcpy(coord, torch->atom_coords + (atom * 3), 3*sizeof(double));
}

void torch_set_atom_coord(struct torch *torch, size_t atom, const double *coord) {
    assert(atom < torch->natoms);
    memcpy(torch->atom_coords + (atom * 3), coord, 3*sizeof(double));
}

void torch_get_coord(struct torch *torch, double *coords) {
    memcpy(coords, torch->atom_coords, (3 * torch->natoms) * sizeof(double));
}

void torch_set_coord(struct torch *torch, const double *coords) {
    //printf("marker for coming inside torch_set_coord\n");
    memcpy(torch->atom_coords, coords, (3 * torch->natoms) * sizeof(double));
}

void torch_set_atom_species(struct torch *torch, const int *atom_z) {
    memcpy(torch->atom_types, atom_z, (torch->natoms) * sizeof(int));
}

// SKP's torch version
void torch_compute(struct torch *torch) {

    // prepare data arrays 
    msg("\n TORCH CALL \n-------------------------\n");
    // struct state *state;
    size_t n_atoms = torch->natoms;
    float frag_coordinates[n_atoms][3];
    float *energies, *gradients, *forces;

    energies = malloc(n_atoms * sizeof(float));
    gradients = malloc(n_atoms * 3 * sizeof(float));
    forces = malloc(n_atoms * 3 * sizeof(float));

    for (size_t i=0; i<n_atoms; i++) {
        frag_coordinates[i][0] = (float)torch->atom_coords[i*3] * BOHR_RADIUS;
        frag_coordinates[i][1] = (float)torch->atom_coords[i*3+1] * BOHR_RADIUS;
        frag_coordinates[i][2] = (float)torch->atom_coords[i*3+2] * BOHR_RADIUS;
    }

    // flatten to 1D array
    float frag_coord_1D[n_atoms*3];
    for (size_t i=0; i<n_atoms; i++) {
        frag_coord_1D[i*3] = (float)(torch->atom_coords[i*3] * BOHR_RADIUS);
        frag_coord_1D[i*3+1] = (float)(torch->atom_coords[i*3+1] * BOHR_RADIUS);
        frag_coord_1D[i*3+2] = (float)(torch->atom_coords[i*3+2] * BOHR_RADIUS);
    }

    int frag_species[n_atoms];
        for (size_t i=0; i<n_atoms; i++) {
           frag_species[i] = torch->atom_types[i];
 	    //printf("atom_types in torch_compute %4d\n",torch->atom_types[i]);
    }

    double total_energy = 0.0;

    // call function
    // get_torch_energy_grad((float*)frag_coordinates, frag_species, n_atoms, energies, gradients, forces, model_type);
    get_torch_energy_grad(frag_coord_1D, frag_species, n_atoms, energies, gradients, forces, torch->nn_type);

    // print torch data for verification
    
    printf("\nSpecial fragment Atomic Energies, Coordinates, Gradients in H, A, H/A \n---------------------------\n");
    for (int i = 0; i < n_atoms; ++i) {
        printf("%4d   %12.6f     %12.6f %12.6f %12.6f    %12.6f %12.6f %12.6f\n",
            torch->atom_types[i],energies[i], 
            frag_coord_1D[3*i], frag_coord_1D[3*i+1], frag_coord_1D[3*i+2],
            gradients[3*i], gradients[3*i+1], gradients[3*i+2]);
        total_energy  += (double)energies[i];
    }
    printf("   Total TORCH energy %12.6f\n", total_energy);
    printf("--------------------------------\n");
    torch->energy = total_energy;

    
    // printf("Gradients:\n");
    // for (int i = 0; i < n_atoms; ++i) {
    //for (int j = 0; j < 3; ++j) {
    //    printf("%f\t", gradients[i * 3 + j]);
    //}
    //printf("\n");
    //}

    //printf("Forces:\n");
    //for (int i = 0; i < n_atoms; ++i) {
    //        for (int j = 0; j < 3; ++j) {
    //            printf("%f\t", forces[i * 3 + j]);
    //        }
    //        printf("\n");
    //}
    
    // previous commented lines can be deleted later on
 
    // save data in energy and grad
    // convert the gradients from float to double and to Hartree/Bohr
    double *tG_double = malloc(3 * n_atoms * sizeof(double));
    for (int i = 0; i < 3 * n_atoms; i++) {
        tG_double[i] = (double)(gradients[i] * BOHR_RADIUS);
    }

    memcpy(torch->grad, tG_double, (3 * n_atoms) * sizeof(double)); // Atomistic gradient for the EFP-ML fragment

    free(energies);
    free(gradients);
    free(forces);
    free(tG_double);
}


// LS's version
/*
void torch_compute(struct torch *torch, int do_grad) {
    static int iter = 0;

    if (iter == 0) {
        for (size_t g=0; g<torch->natoms*3; g++) {
            torch->grad[g] = 0.1;
        }
        torch->energy = -55.0;
    }
    else {
        for (size_t g = 0; g<torch->natoms * 3; g++) {
            torch->grad[g] = -torch->grad[g] * 0.5;
        }
        torch->energy = torch->energy - 0.1 / (iter+1);
    }
    iter++;
}
*/

double torch_get_energy(struct torch *torch) {
    return torch->energy;
}
void torch_get_gradient(struct torch *torch, double *grad) {
    memcpy(grad, torch->grad, (3 * torch->natoms) * sizeof(double));
}

void torch_free(struct torch *torch) {
    if (torch) {
        free(torch->grad);
        free(torch->atom_coords);
        free(torch->atom_types);
        free(torch);
    }
}

void torch_print(struct torch *torch) {
    if (torch) {
        printf("\n TORCH INFO \n");
	printf("-----------\n");
        printf("\n Special fragment coordinates (Angstroms) \n", torch->natoms);
	printf("-----------------------------------------------------------\n");
	printf("  Atom            X                 Y                Z\n");
        for (size_t i=0; i< torch->natoms; i++) {
            printf("%4d      %12.6f      %12.6f     %12.6f\n", torch->atom_types[i], torch->atom_coords[i*3] * BOHR_RADIUS,
                   torch->atom_coords[i*3+1] * BOHR_RADIUS, torch->atom_coords[i*3+2] * BOHR_RADIUS);	    
        }
	printf("-----------------------------------------------------------\n");
        printf("\n Special fragment atom gradients \n", torch->natoms);
	printf("-----------------------------------------------------------\n");
            printf("  Atom            X                 Y                Z\n");
        for (size_t i=0; i< torch->natoms; i++) {
            printf("%4d      %12.6f      %12.6f     %12.6f\n",i+1,torch->grad[i*3],
                   torch->grad[i*3+1], torch->grad[i*3+2]);
        }
	printf("------------------------------------------------------------\n");
        printf("\n Torch energy %lf \n\n", torch->energy);
    }
}
