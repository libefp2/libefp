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
//#include "cfg.h"
#include <stdio.h>


struct torch *torch_create(void) {
    struct torch *torch;
    torch = calloc(1, sizeof(*torch));
    return (torch);
}

void get_torch_type(struct torch *torch, const char *str) {
    int file_type;
    if (strcmp(str, "ani1.pt") == 0) {
        file_type = 1;
	    printf("Chosen nn_type: %s\n", str);
    } else if (strcmp(str, "ani2.pt") == 0) {
        file_type = 2;
	    printf("Chosen nn_type: %s\n", str);
    } else {
        file_type = -1; // or any other default/error value
        fprintf(stderr, "Unknown nn_type: %s\n", str);
    }
    torch->nn_type = file_type;
}

void torch_init(struct torch *torch, size_t natom) {
    torch->natoms = natom;
    torch->atom_coords = malloc(3*natom*sizeof(double));
    torch->atom_types = malloc(natom*sizeof(int));
    torch->grad = malloc(3*natom*sizeof(double));
    torch->elpot = malloc(natom*sizeof(double));
} 
 
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
    memcpy(torch->atom_coords, coords, (3 * torch->natoms) * sizeof(double));
}

void torch_set_elpot(struct torch *torch, const double *spec_elpot) {
    memcpy(torch->elpot, spec_elpot, torch->natoms * sizeof(double));
}


void torch_set_atom_species(struct torch *torch, const int *atom_z) {
    memcpy(torch->atom_types, atom_z, (torch->natoms) * sizeof(int));
}

void torch_custom_compute(struct torch *torch, int print) {

    size_t n_atoms = torch->natoms;
    float *gradients, *forces; 
    float *frag_coord;
    float *elecpots_data;
    //float custom_energy;
    double custom_energy;

    elecpots_data = malloc(n_atoms * sizeof(float));
    gradients = malloc(n_atoms * 3 * sizeof(float));
    forces = malloc(n_atoms * 3 * sizeof(float));

    frag_coord = malloc(n_atoms*3* sizeof(float));

    for (size_t i=0; i<n_atoms; i++) {
        frag_coord[i*3] = (float)(torch->atom_coords[i*3] * BOHR_RADIUS);
        frag_coord[i*3+1] = (float)(torch->atom_coords[i*3+1] * BOHR_RADIUS);
        frag_coord[i*3+2] = (float)(torch->atom_coords[i*3+2] * BOHR_RADIUS);
	
	    elecpots_data[i] = (float) torch->elpot[i];
    }

    int atomic_num[n_atoms];
    for (size_t i=0; i<n_atoms; i++) {
       atomic_num[i] = torch->atom_types[i];
    }
    
    int64_t frag_species[n_atoms];
    atomic_number_to_species(atomic_num, frag_species, n_atoms);    

    if (print > 2) {
       printf("=============TORCH ELPOT=============\n");
       for (size_t j = 0; j < n_atoms; j++) {
           printf("%2d %12.6f\n",torch->atom_types[j], elecpots_data[j]);
       }
       printf("====================================\n");
    }

    // Hardcoded custom model routine
    // engrad_custom_model_wrapper(frag_coord, frag_species, elecpots_data, n_atoms, &custom_energy, gradients, forces);
 
    get_custom_energy_grad_wrapper(torch->ani_model, frag_coord, frag_species, elecpots_data, n_atoms, &custom_energy, gradients, forces, print);

    torch->energy = custom_energy;

    if (print > 2) {
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
    }

    double *tG_double = xcalloc(3 * n_atoms, sizeof(double));

    for (int i = 0; i < 3 * n_atoms; i++) {
        tG_double[i] = (double)(gradients[i] * BOHR_RADIUS);
    }

    memcpy(torch->grad, tG_double, (3 * n_atoms) * sizeof(double)); // Atomistic gradient for the EFP-ML fragment

    if (print > 0)
        torch_print(torch);

    free(gradients);
    free(forces);
    free(frag_coord);
    free(tG_double);
    free(elecpots_data);
 
}


void atomic_number_to_species(const int* atomic_num, int64_t* frag_species, size_t n_atoms) {

    for (size_t i = 0; i < n_atoms; i++) {
        switch (atomic_num[i]) {
            case 1: 
                frag_species[i] = 0;
                break;
            case 6:  
                frag_species[i] = 1;
                break;
            case 7:  
                frag_species[i] = 2;
                break;
            case 8:  
                frag_species[i] = 3;
                break;
            default:

      	    frag_species[i] = -1; 
                printf("Warning: Unknown atomic number %d\n", atomic_num[i]);
                break;
        }
    }
}

// SKP's torch version
void torch_compute(struct torch *torch, const char* nn_path, int print) {

    size_t n_atoms = torch->natoms;
    float *gradients, *forces, *frag_coord;
    double ani_energy;    

    gradients = malloc(n_atoms * 3 * sizeof(float));
    forces = malloc(n_atoms * 3 * sizeof(float));

    frag_coord = malloc(n_atoms*3* sizeof(float));
    
    for (size_t i=0; i<n_atoms; i++) {
        frag_coord[i*3] = (float)(torch->atom_coords[i*3] * BOHR_RADIUS);
        frag_coord[i*3+1] = (float)(torch->atom_coords[i*3+1] * BOHR_RADIUS);
        frag_coord[i*3+2] = (float)(torch->atom_coords[i*3+2] * BOHR_RADIUS);
	//printf("frag_coord %16.10lf %16.10lf %16.10lf\n",frag_coord[i*3],frag_coord[i*3+1],frag_coord[i*3+2]);
    } 

    int frag_species[n_atoms];
        for (size_t i=0; i<n_atoms; i++) {
           frag_species[i] = torch->atom_types[i];
 	    //printf("atom_types in torch_compute %4d\n",torch->atom_types[i]);
    }

    get_ani_energy_grad(torch->ani_model, frag_coord, frag_species,  &ani_energy, gradients, forces, n_atoms, print);
    // printf("Torch_energy %12.8f\n",ani_energy);
    torch->energy = ani_energy;

    if (print > 2) {
	    printf("Coordinates:\n");
        for (int i = 0; i < n_atoms; ++i) {
            for (int j = 0; j < 3; ++j) {
                printf("%12.8f\t", frag_coord[i * 3 + j]);
            }
            printf("\n");
        }
        printf("Gradients:\n");
        for (int i = 0; i < n_atoms; ++i) {
            for (int j = 0; j < 3; ++j) {
                printf("%12.8f\t", gradients[i * 3 + j]);
            }
            printf("\n");
        }

        printf("Forces:\n");
        for (int i = 0; i < n_atoms; ++i) {
            for (int j = 0; j < 3; ++j) {
                printf("%12.8f\t", forces[i * 3 + j]);
            }
            printf("\n");
        }
    }

    // save data in energy and grad
    double *tG_double = xcalloc(3 * n_atoms, sizeof(double));    
    for (int i = 0; i < 3 * n_atoms; i++) {
        tG_double[i] = (double)(gradients[i] * BOHR_RADIUS);
    }

    //if (print > 2) {
        printf("tG_double Gradients:\n");
        for (int i = 0; i < n_atoms; ++i) {
            for (int j = 0; j < 3; ++j) {
                printf("%16.10lf\t", tG_double[i * 3 + j]);
            }
            printf("\n");
        }
    //}

    memcpy(torch->grad, tG_double, (3 * n_atoms) * sizeof(double));
    if (print > 0)
        torch_print(torch);

    free(gradients);
    free(forces);
    free(frag_coord);
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
	    ANIModel_delete(torch->ani_model);
        free(torch);
    }
}

void torch_print(struct torch *torch) {
    if (torch) {
        printf("\n TORCH INFO \n");
	    printf("-----------\n");
        printf("\n Special fragment coordinates (Angstroms) \n");
	    printf("-----------------------------------------------------------\n");
	    printf("  Atom            X                 Y                Z\n");
        for (size_t i=0; i< torch->natoms; i++) {
            printf("%4d      %12.6f      %12.6f     %12.6f\n", torch->atom_types[i], torch->atom_coords[i*3] * BOHR_RADIUS,
                   torch->atom_coords[i*3+1] * BOHR_RADIUS, torch->atom_coords[i*3+2] * BOHR_RADIUS);	    
        }
	    printf("-----------------------------------------------------------\n");
        printf("\n Special fragment atom gradients \n");
	    printf("-----------------------------------------------------------\n");
        printf("  Atom            X                 Y                Z\n");
        for (size_t i=0; i< torch->natoms; i++) {
            printf("%4d      %12.6f      %12.6f     %12.6f\n",torch->atom_types[i],torch->grad[i*3],
                   torch->grad[i*3+1], torch->grad[i*3+2]);
        }
	    printf("------------------------------------------------------------\n");
        printf("\n Torch energy %lf \n\n", torch->energy);
    }
}
