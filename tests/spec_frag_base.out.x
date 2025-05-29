EFPMD ver. 2.0.0
Copyright (c) 2012-2017 Ilya Kaliman, 2017-2024 Lyudmila Slipchenko

LIBEFP ver. 2.0.0
Copyright (c) 2012-2017 Ilya Kaliman
              2018-2025 Lyudmila Slipchenko

Journal References:
  - Kaliman and Slipchenko, JCC 2013.
    DOI: http://dx.doi.org/10.1002/jcc.23375
  - Kaliman and Slipchenko, JCC 2015.
    DOI: http://dx.doi.org/10.1002/jcc.23772

Project web site: https://github.com/libefp2/libefp/

RUNNING 1 MPI PROCESSES WITH 12 OPENMP THREADS EACH
WALL CLOCK TIME IS Wed May 28 22:54:51 2025

SIMULATION SETTINGS

run_type sp
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp screen
disp_damp off
pol_damp tt
pol_driver iterative
enable_ff false
enable_multistep false
ff_geometry ff.xyz
ff_parameters /../fraglib/params/amber99.prm
single_params_file false
efp_params_file params.efp
enable_cutoff false
swf_cutoff 10
xr_cutoff 10
max_steps 100
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc false
periodic_box 30.0 30.0 30.0 90.0 90.0 90.0
opt_tol 0.0003
opt_energy_tol 1e-06
gtest_tol 1e-06
ref_energy 0
hess_central false
num_step_dist 0.001
num_step_angle 0.01
pol_damp_value 0.6
ensemble nve
time_step 1
print_step 1
velocitize false
temperature 300
pressure 1
thermostat_tau 1000
barostat_tau 10000
ligand -100
enable_pairwise false
print_pbc false
symmetry false
special_fragment 0
enable_torch false
enable_elpot false
opt_special_frag -1
torch_nn none
ml_path none
userml_path none
custom_nn none
aev_nn none
atom_gradient frag
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


SINGLE POINT ENERGY JOB


    GEOMETRY (ANGSTROMS)

A01O1                0.000000     0.063030     0.000000
A02H2               -0.752652    -0.500166     0.000000
A03H3                0.752652    -0.500166     0.000000
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397059
           POLARIZATION ENERGY    -0.0000429508
             DISPERSION ENERGY    -0.0001897219
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850092


SINGLE POINT ENERGY JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:51 2025
TOTAL RUN TIME IS 0 SECONDS
