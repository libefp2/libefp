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
#include <stdio.h>

struct torch {
    double energy;
    double *grad;
    size_t natoms;
    int *atom_types;
    double *atom_coords;
};

struct torch *torch_create(void) {
    struct torch *torch;
    torch = calloc(1, sizeof(*torch));
    return (torch);
}

int torch_load_nn(struct torch *torch, const char *nn_name) {
    // load NN
    FILE *fp;
    if ((fp = fopen(nn_name, "r")) == NULL)
        return (0);
    fclose(fp);

    // blah
    return (1);
}

void torch_get_atom_count(struct torch *torch , size_t natom) {
    natom = torch->natoms;
}

void torch_set_atom_count(struct torch *torch, size_t natom) {
    torch->natoms = natom;
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

void torch_set_atom_species(struct torch *torch, size_t atom, int *atom_z) {
    assert(atom < torch->natoms);
    memcpy(torch->atom_types, atom_z, (torch->natoms) * sizeof(int));
}

void torch_compute(struct torch *torch, int do_grad) {
    // prepare data and call this function
    //get_torch_energy_grad(float *coordinates_data, int *species_data, int num_atoms, float *atomic_energies,
    //                           float *gradients, float *forces);
    // save data in energy and grad
}

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
