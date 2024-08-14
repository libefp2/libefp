/*-
 * Copyright (c) 2012-2017 Ilya Kaliman
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

#include <time.h>

#include "common.h"
#include "torch.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef void (*sim_fn_t)(struct state *);

void sim_sp(struct state *);
void sim_grad(struct state *);
void sim_hess(struct state *);
void sim_opt(struct state *);
void sim_md(struct state *);
void sim_efield(struct state *);
void sim_elpot(struct state *);
void sim_gtest(struct state *);
void sim_etest(struct state *);
void test_nnp7();

#define USAGE_STRING \
	"usage: efpmd [-d | -v | -h | input]\n" \
	"  -d  print the list of all keywords and their default values\n" \
	"  -v  print package version\n" \
	"  -h  print this help message\n"

static struct cfg *make_cfg(void)
{
	struct cfg *cfg = cfg_create();

	cfg_add_enum(cfg, "run_type", RUN_TYPE_SP,
		"sp\n"
		"grad\n"
		"hess\n"
		"opt\n"
		"md\n"
		"efield\n"
        "elpot\n"
		"gtest\n"
        "etest\n",
		(int []) { RUN_TYPE_SP,
			   RUN_TYPE_GRAD,
			   RUN_TYPE_HESS,
			   RUN_TYPE_OPT,
			   RUN_TYPE_MD,
			   RUN_TYPE_EFIELD,
			   RUN_TYPE_ELPOT,
			   RUN_TYPE_GTEST,
			   RUN_TYPE_ETEST});

	cfg_add_enum(cfg, "coord", EFP_COORD_TYPE_POINTS,
		"xyzabc\n"
		"points\n"
		"rotmat\n"
        "atoms\n",
		(int []) { EFP_COORD_TYPE_XYZABC,
			   EFP_COORD_TYPE_POINTS,
			   EFP_COORD_TYPE_ROTMAT,
			   EFP_COORD_TYPE_ATOMS});

	cfg_add_string(cfg, "terms", "elec pol disp xr");
    	cfg_add_string(cfg, "special_terms", "elec pol disp xr");

	cfg_add_enum(cfg, "elec_damp", EFP_ELEC_DAMP_SCREEN,
		"screen\n"
		"overlap\n"
		"off\n",
		(int []) { EFP_ELEC_DAMP_SCREEN,
			   EFP_ELEC_DAMP_OVERLAP,
			   EFP_ELEC_DAMP_OFF });

	cfg_add_enum(cfg, "disp_damp", EFP_DISP_DAMP_OVERLAP,
		"tt\n"
		"overlap\n"
		"off\n",
		(int []) { EFP_DISP_DAMP_TT,
			   EFP_DISP_DAMP_OVERLAP,
			   EFP_DISP_DAMP_OFF });

	cfg_add_enum(cfg, "pol_damp", EFP_POL_DAMP_TT,
		"tt\n"
		"off\n",
		(int []) { EFP_POL_DAMP_TT,
			   EFP_POL_DAMP_OFF });

	cfg_add_enum(cfg, "pol_driver", EFP_POL_DRIVER_ITERATIVE,
		"iterative\n"
		"direct\n",
		(int []) { EFP_POL_DRIVER_ITERATIVE,
			   EFP_POL_DRIVER_DIRECT });

	cfg_add_bool(cfg, "enable_ff", false);
	cfg_add_bool(cfg, "enable_multistep", false);
	cfg_add_string(cfg, "ff_geometry", "ff.xyz");
	cfg_add_string(cfg, "ff_parameters", FRAGLIB_PATH "/params/amber99.prm");
	cfg_add_bool(cfg, "single_params_file", false);
	cfg_add_string(cfg, "efp_params_file", "params.efp");
	cfg_add_bool(cfg, "enable_cutoff", false);
	cfg_add_double(cfg, "swf_cutoff", 10.0);
    cfg_add_double(cfg, "xr_cutoff", 0.0);
	cfg_add_int(cfg, "max_steps", 100);
	cfg_add_int(cfg, "multistep_steps", 1);
	cfg_add_string(cfg, "fraglib_path", FRAGLIB_PATH);
	cfg_add_string(cfg, "userlib_path", ".");
	cfg_add_bool(cfg, "enable_pbc", false);
	cfg_add_string(cfg, "periodic_box", "30.0 30.0 30.0 90.0 90.0 90.0");
	cfg_add_double(cfg, "opt_tol", 1.0e-4);
	cfg_add_double(cfg, "gtest_tol", 1.0e-6);
	cfg_add_double(cfg, "ref_energy", 0.0);
	cfg_add_bool(cfg, "hess_central", false);
	cfg_add_double(cfg, "num_step_dist", 0.001);
	cfg_add_double(cfg, "num_step_angle", 0.01);

	cfg_add_enum(cfg, "ensemble", ENSEMBLE_TYPE_NVE,
		"nve\n"
		"nvt\n"
		"npt\n",
		(int []) { ENSEMBLE_TYPE_NVE,
			   ENSEMBLE_TYPE_NVT,
			   ENSEMBLE_TYPE_NPT });

	cfg_add_double(cfg, "time_step", 1.0);
	cfg_add_int(cfg, "print_step", 1);
	cfg_add_bool(cfg, "velocitize", false);
	cfg_add_double(cfg, "temperature", 300.0);
	cfg_add_double(cfg, "pressure", 1.0);
	cfg_add_double(cfg, "thermostat_tau", 1.0e3);
	cfg_add_double(cfg, "barostat_tau", 1.0e4);

	cfg_add_int(cfg, "ligand", -100);
    cfg_add_bool(cfg, "enable_pairwise", false);
    cfg_add_bool(cfg, "print_pbc", false);
    cfg_add_bool(cfg, "symmetry", false);

    cfg_add_int(cfg, "special_fragment", -100);

    cfg_add_bool(cfg, "enable_torch", false);
    cfg_add_int(cfg, "opt_special_frag", -1);
    cfg_add_string(cfg, "torch_nn", "ani.pt");

    cfg_add_enum(cfg, "symm_frag", EFP_SYMM_FRAG_FRAG,
                 "frag\n"
                 "list\n",
                 (int []) { EFP_SYMM_FRAG_FRAG,
                            EFP_SYMM_FRAG_LIST });

    cfg_add_int(cfg, "update_params", 0);
    cfg_add_double(cfg, "update_params_cutoff", 0.0);

    cfg_add_int(cfg, "print", 0);
    cfg_add_int(cfg, "verbose", 0);
    return cfg;
}

static sim_fn_t get_sim_fn(enum run_type run_type)
{
	switch (run_type) {
	    case RUN_TYPE_SP:
		    return sim_sp;
	    case RUN_TYPE_GRAD:
		    return sim_grad;
	    case RUN_TYPE_HESS:
		    return sim_hess;
	    case RUN_TYPE_OPT:
		    return sim_opt;
	    case RUN_TYPE_MD:
		    return sim_md;
	    case RUN_TYPE_EFIELD:
		    return sim_efield;
		case RUN_TYPE_ELPOT:
            return sim_elpot;
	    case RUN_TYPE_GTEST:
		    return sim_gtest;
		case RUN_TYPE_ETEST:
		    return sim_etest;
	}
	assert(0);
}

static int string_compare(const void *a, const void *b)
{
	const char *s1 = *(const char *const *)a;
	const char *s2 = *(const char *const *)b;

	return strcmp(s1, s2);
}

static bool is_lib(const char *name)
{
	size_t len = strlen(name);

	return len > 2 && name[len - 2] == '_' &&
	    (name[len - 1] == 'l' || name[len - 1] == 'L');
}

static void add_potentials(struct efp *efp, const struct cfg *cfg, const struct sys *sys)
{
	size_t i, n_uniq;
	const char *uniq[sys->n_frags];
	char path[512];

	for (i = 0; i < sys->n_frags; i++)
		uniq[i] = sys->frags[i].name;

	qsort(uniq, sys->n_frags, sizeof(const char *), string_compare);

	for (i = 1, n_uniq = 1; i < sys->n_frags; i++)
		if (strcmp(uniq[i - 1], uniq[i]) != 0)
			uniq[n_uniq++] = uniq[i];

	for (i = 0; i < n_uniq; i++) {
		const char *name = uniq[i];
		const char *prefix = is_lib(name) ?
			cfg_get_string(cfg, "fraglib_path") :
			cfg_get_string(cfg, "userlib_path");
		size_t len = is_lib(name) ? strlen(name) - 2 : strlen(name);

		snprintf(path, sizeof(path), "%s/%.*s.efp", prefix, (int)len, name);
		check_fail(efp_add_potential(efp, path));
	}
}

static unsigned get_terms(const char *str)
{
	static const struct {
		const char *name;
		enum efp_term value;
	} list[] = {
		{ "elec", EFP_TERM_ELEC },
		{ "pol",  EFP_TERM_POL  },
		{ "disp", EFP_TERM_DISP },
		{ "xr",   EFP_TERM_XR   },
        { "qq",   EFP_TERM_QQ   },
        { "lj",   EFP_TERM_LJ   }

    };

	unsigned terms = 0;

	while (*str) {
		for (size_t i = 0; i < ARRAY_SIZE(list); i++) {
			if (efp_strncasecmp(list[i].name, str, strlen(list[i].name)) == 0) {
				str += strlen(list[i].name);
				terms |= list[i].value;
				goto next;
			}
		}
		error("unknown energy term specified");
next:
		while (*str && isspace(*str))
			str++;
	}

	return terms;
}

static unsigned get_special_terms(const char *str)
{
    static const struct {
        const char *name;
        enum efp_term value;
    } list[] = {
            { "elec", EFP_SPEC_TERM_ELEC },
            { "pol",  EFP_SPEC_TERM_POL  },
            { "disp", EFP_SPEC_TERM_DISP },
            { "xr",   EFP_SPEC_TERM_XR   },
            { "qq",   EFP_SPEC_TERM_QQ   },
            { "lj",   EFP_SPEC_TERM_LJ   }
    };

    unsigned terms = 0;

    while (*str) {
        for (size_t i = 0; i < ARRAY_SIZE(list); i++) {
            if (efp_strncasecmp(list[i].name, str, strlen(list[i].name)) == 0) {
                str += strlen(list[i].name);
                terms |= list[i].value;
                goto next;
            }
        }
        error("unknown energy term specified");
        next:
        while (*str && isspace(*str))
            str++;
    }

    return terms;
}

static struct efp *create_efp(const struct cfg *cfg, const struct sys *sys)
{
	struct efp_opts opts = {
		.terms = get_terms(cfg_get_string(cfg, "terms")),
        	.special_terms = get_special_terms(cfg_get_string(cfg, "special_terms")),
		.elec_damp = cfg_get_enum(cfg, "elec_damp"),
		.disp_damp = cfg_get_enum(cfg, "disp_damp"),
		.pol_damp = cfg_get_enum(cfg, "pol_damp"),
		.pol_driver = cfg_get_enum(cfg, "pol_driver"),
		.enable_pbc = cfg_get_bool(cfg, "enable_pbc"),
		.enable_cutoff = cfg_get_bool(cfg, "enable_cutoff"),
		.swf_cutoff = cfg_get_double(cfg, "swf_cutoff"),
		.xr_cutoff = cfg_get_double(cfg, "xr_cutoff"),
        .enable_pairwise = cfg_get_bool(cfg, "enable_pairwise"), 
        .ligand = cfg_get_int(cfg, "ligand"),
        .special_fragment = cfg_get_int(cfg, "special_fragment"),
        .enable_torch = cfg_get_bool(cfg, "enable_torch"),
        .opt_special_frag = cfg_get_int(cfg, "opt_special_frag"),
        .print_pbc = cfg_get_bool(cfg, "print_pbc"),
        .symmetry = cfg_get_bool(cfg, "symmetry"),
        .symm_frag = cfg_get_enum(cfg, "symm_frag"),
        .update_params = cfg_get_int(cfg, "update_params"),
        .update_params_cutoff = cfg_get_double(cfg, "update_params_cutoff"),
        .print = cfg_get_int(cfg, "print")
	};

	if (opts.xr_cutoff == 0.0) {
	    opts.xr_cutoff = opts.swf_cutoff;
	    printf("xr_cutoff is set to %lf \n\n", opts.xr_cutoff*0.52917721092);
	}

	enum efp_coord_type coord_type = cfg_get_enum(cfg, "coord");
	struct efp *efp = efp_create();

	if (!efp)
		error("unable to create efp object");

	if (cfg_get_bool(cfg, "single_params_file"))
		check_fail(efp_add_potential(efp, cfg_get_string(cfg, "efp_params_file")));
	else
		add_potentials(efp, cfg, sys);

	for (size_t i = 0; i < sys->n_frags; i++)
	    check_fail(efp_add_fragment(efp, sys->frags[i].name));

	if (sys->n_charges > 0) {
		double q[sys->n_charges];
		double pos[3 * sys->n_charges];

		for (size_t i = 0; i < sys->n_charges; i++) {
			q[i] = sys->charges[i].q;
			pos[3 * i + 0] = sys->charges[i].pos.x;
			pos[3 * i + 1] = sys->charges[i].pos.y;
			pos[3 * i + 2] = sys->charges[i].pos.z;
		}

		if (opts.terms & EFP_TERM_ELEC)
			opts.terms |= EFP_TERM_AI_ELEC;

		if (opts.terms & EFP_TERM_POL)
			opts.terms |= EFP_TERM_AI_POL;

		check_fail(efp_set_point_charges(efp, sys->n_charges, q, pos));
	}

	if (cfg_get_bool(cfg, "enable_ff"))
		opts.terms &= ~(EFP_TERM_ELEC | EFP_TERM_POL | EFP_TERM_DISP | EFP_TERM_XR);

    if (opts.enable_pairwise)
        check_fail(efp_add_ligand(efp, opts.ligand));

    check_fail(efp_set_opts(efp, &opts));
	check_fail(efp_prepare(efp));
    check_fail(efp_set_symmlist(efp));

    if (opts.enable_pbc) {
		six_t box = box_from_str(cfg_get_string(cfg, "periodic_box"));
		check_fail(efp_set_periodic_box(efp, box.x, box.y, box.z, box.a, box.b, box.c));
	}

	for (size_t i = 0; i < sys->n_frags; i++)
        check_fail(efp_set_frag_coordinates(efp, i, coord_type, sys->frags[i].coord));

	/*
	// LVS: need to coordinate this function with update_fragment() in efp.c
	// copying atomic coordinates of fragments
	// possibly add check on update_params == 1
	if (coord_type == EFP_COORD_TYPE_ATOMS)
        for (size_t i = 0; i < sys->n_frags; i++)
            check_fail(efp_set_frag_atoms(efp, i, sys->frags[i].n_atoms, sys->frags[i].atoms));
	*/

	return (efp);
}

static void state_init(struct state *state, const struct cfg *cfg, const struct sys *sys)
{
	size_t ntotal, ifrag, nfrag, natom, spec_frag, n_special_atoms, iatom;

	state->efp = create_efp(cfg, sys);
	state->energy = 0;
	state->grad = xcalloc(sys->n_frags * 6 + sys->n_charges * 3, sizeof(double));
	state->ff = NULL;
        state->torch = NULL;
 
	if (cfg_get_bool(cfg, "enable_ff")) {
		if ((state->ff = ff_create()) == NULL)
			error("cannot create ff object");

		if (!ff_load_geometry(state->ff, cfg_get_string(cfg, "ff_geometry")))
			error("cannot load ff geometry");

		if (!ff_load_parameters(state->ff, cfg_get_string(cfg, "ff_parameters")))
			error("cannot load ff parameters");

		check_fail(efp_get_frag_count(state->efp, &nfrag));

		for (ifrag = 0, ntotal = 0; ifrag < nfrag; ifrag++) {
			check_fail(efp_get_frag_atom_count(state->efp, ifrag, &natom));
			ntotal += natom;
		}

		if (ff_get_atom_count(state->ff) != (int)ntotal)
			error("total fragment number of atoms does not match .xyz file");
	}

    // initiate torch state
    if (cfg_get_bool(cfg, "enable_torch")) {
        if (cfg_get_int(cfg, "special_fragment") < 0 || cfg_get_int(cfg, "special_fragment") > nfrag-1)
            error("do not know for which fragment to compute torch: set special_fragment");

        // create torch state
        if ((state->torch = torch_create()) == NULL)
            error("cannot create torch object");

        // load torch NN
        //if (!torch_load_nn(state->torch, cfg_get_string(cfg, "torch_nn")))
        //    printf("Could not load torch nn %s, continue testing\n", cfg_get_string(cfg, "torch_nn"));
            //error("cannot load torch NN");
		//int torch_file_type;
		//assign_file_type(cfg, torch_file_type);
        //printf("Assigned file type: %d\n", torch_file_type);

	    get_torch_type(state->torch, cfg_get_string(cfg, "torch_nn"));
		//printf("torch_model_type %d\n",torch_model_type); 	
 
        spec_frag = cfg_get_int(cfg, "special_fragment");
        check_fail(efp_get_frag_atom_count(state->efp, spec_frag, &n_special_atoms));
        torch_init(state->torch, n_special_atoms);
        state->torch_grad = xcalloc(n_special_atoms * 3, sizeof(double));

        struct efp_atom *special_atoms;
        special_atoms = xmalloc(n_special_atoms * sizeof(struct efp_atom));
        check_fail(efp_get_frag_atoms(state->efp, ifrag, n_special_atoms, special_atoms));

        //torch_print(state->torch);
        double *atom_coord_tmp = malloc(3 * n_special_atoms * sizeof(double));
		int *atom_znuc = malloc(3 * n_special_atoms * sizeof(int));
        for (iatom = 0; iatom < n_special_atoms; iatom++) {
            // send atom coordinates to torch
            atom_coord_tmp[3*iatom] = special_atoms[iatom].x;
            atom_coord_tmp[3*iatom + 1] = special_atoms[iatom].y;
            atom_coord_tmp[3*iatom + 2] = special_atoms[iatom].z;
            // send atom types to torch
			atom_znuc[iatom] = (int)special_atoms[iatom].znuc;
 	    	// torch_set_atom_species_double(state->torch, iatom, &special_atoms[iatom].znuc);
        }

        torch_set_coord(state->torch, atom_coord_tmp);
		torch_set_atom_species(state->torch, atom_znuc);

        free(special_atoms);
        free(atom_coord_tmp);
		free(atom_znuc);
        //torch_print(state->torch);
    }
}

static void print_banner(void)
{
	msg("EFPMD ver. " LIBEFP_VERSION_STRING "\n");
	msg("Copyright (c) 2012-2017 Ilya Kaliman\n\n");
	msg("%s", efp_banner());
}

static void print_proc_info(void)
{
	int n_mpi = 1, n_omp = 1;

#ifdef EFP_USE_MPI
	MPI_Comm_size(MPI_COMM_WORLD, &n_mpi);
#endif
#ifdef _OPENMP
	n_omp = omp_get_max_threads();
#endif
	msg("RUNNING %d MPI PROCESSES WITH %d OPENMP THREADS EACH\n", n_mpi, n_omp);
}

static void print_time(const time_t *t)
{
	msg("WALL CLOCK TIME IS %s", ctime(t));
}

static void print_config(struct cfg *cfg)
{
#ifdef EFP_USE_MPI
	int rank;

	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	if (rank == 0) {
		cfg_print(cfg, stdout);
	}
#else
	cfg_print(cfg, stdout);
#endif
}

static void convert_units(struct cfg *cfg, struct sys *sys)
{
	cfg_set_double(cfg, "time_step",
		cfg_get_double(cfg, "time_step") * FS_TO_AU);
	cfg_set_double(cfg, "thermostat_tau",
		cfg_get_double(cfg, "thermostat_tau") * FS_TO_AU);
	cfg_set_double(cfg, "barostat_tau",
		cfg_get_double(cfg, "barostat_tau") * FS_TO_AU);
	cfg_set_double(cfg, "pressure",
		cfg_get_double(cfg, "pressure") * BAR_TO_AU);
	cfg_set_double(cfg, "swf_cutoff",
		cfg_get_double(cfg, "swf_cutoff") / BOHR_RADIUS);
    cfg_set_double(cfg, "xr_cutoff",
            cfg_get_double(cfg, "xr_cutoff") / BOHR_RADIUS);
    cfg_set_double(cfg, "num_step_dist",
		cfg_get_double(cfg, "num_step_dist") / BOHR_RADIUS);

	size_t n_convert = (size_t []) {
		[EFP_COORD_TYPE_XYZABC] = 3,
		[EFP_COORD_TYPE_POINTS] = 9,
		[EFP_COORD_TYPE_ROTMAT] = 3,
		[EFP_COORD_TYPE_ATOMS] = 9}[cfg_get_enum(cfg, "coord")];

	for (size_t i = 0; i < sys->n_frags; i++) {
		vec_scale(&sys->frags[i].constraint_xyz, 1.0 / BOHR_RADIUS);

		for (size_t j = 0; j < n_convert; j++)
			sys->frags[i].coord[j] /= BOHR_RADIUS;
	}

	for (size_t i = 0; i < sys->n_charges; i++)
		vec_scale(&sys->charges[i].pos, 1.0 / BOHR_RADIUS);
}

static void sys_free(struct sys *sys)
{
	for (size_t i = 0; i < sys->n_frags; i++) {
        free(sys->frags[i].name);
        free(sys->frags[i].atoms);
//	    for (size_t j = 0; j < sys->frags[i].n_atoms; j++)
//	        free(sys->frags[i].atoms[j])
	}

	free(sys->frags);
	free(sys->charges);
	free(sys);
}

int main(int argc, char **argv)
{
	struct state state;
	time_t start_time, end_time;

#ifdef EFP_USE_MPI
	MPI_Init(&argc, &argv);
#endif
	if (argc < 2) {
		msg(USAGE_STRING);
		goto exit;
	}

	if (argv[1][0] == '-') {
		switch (argv[1][1]) {
		case 'v':
			print_banner();
			goto exit;
		case 'd':
			state.cfg = make_cfg();
			print_config(state.cfg);
			cfg_free(state.cfg);
			goto exit;
		default:
			msg(USAGE_STRING);
			goto exit;
		}
	}

	start_time = time(NULL);
	print_banner();
	msg("\n");
	print_proc_info();
	print_time(&start_time);
	msg("\n");
	state.cfg = make_cfg();
	state.sys = parse_input(state.cfg, argv[1]);
	msg("SIMULATION SETTINGS\n\n");
	print_config(state.cfg);
	msg("\n\n");
	convert_units(state.cfg, state.sys);
	state_init(&state, state.cfg, state.sys);
	sim_fn_t sim_fn = get_sim_fn(cfg_get_enum(state.cfg, "run_type"));
	sim_fn(&state);
	end_time = time(NULL);
	print_time(&end_time);
	msg("TOTAL RUN TIME IS %d SECONDS\n", (int)(difftime(end_time, start_time)));
	efp_shutdown(state.efp);
	ff_free(state.ff);
    torch_free(state.torch);
	sys_free(state.sys);
	cfg_free(state.cfg);
	free(state.grad);
exit:
#ifdef EFP_USE_MPI
	MPI_Finalize();
#endif
	return (EXIT_SUCCESS);
}
