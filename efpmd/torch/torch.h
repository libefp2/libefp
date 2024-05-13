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

#include <stddef.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

/* calculations with torch ani */
struct torch;

struct torch *torch_create(void);
void torch_init(struct torch *, size_t);
int torch_load_nn(struct torch *, const char *);
void torch_get_atom_count(struct torch *, size_t natom);
void torch_set_atom_count(struct torch *, size_t *natom);
void torch_get_atom_coord(struct torch *, size_t, double *);
void torch_set_atom_coord(struct torch *, size_t, const double *);
void torch_get_coord(struct torch *, double *);
void torch_set_coord(struct torch *, const double *);
void torch_set_atom_species(struct torch *, size_t, int *);
void torch_compute(struct torch *torch, int do_grad);
double torch_get_energy(struct torch *torch);
void torch_get_gradient(struct torch *, double *);
void torch_free(struct torch *);
void torch_print(struct torch *);
