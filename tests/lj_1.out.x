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
WALL CLOCK TIME IS Wed May 28 22:54:45 2025

SIMULATION SETTINGS

run_type gtest
coord atoms
terms qq lj
special_terms qq lj
elec_damp screen
disp_damp overlap
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
gtest_tol 5e-06
ref_energy -0.00534211
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
special_fragment -100
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


GRADIENT TEST JOB


    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988     0.000000
A02H                -1.616905     1.722730     0.001942
A03H                -2.465495     2.770431    -0.695494
A01O                -1.815220     5.663988     0.000000
A02H                -1.616905     4.722730     0.001942
A03H                -2.465495     5.770431    -0.695494


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0056201495
                     LJ ENERGY     0.0002780347

                  TOTAL ENERGY    -0.0053421148


              REFERENCE ENERGY    -0.0053421148
               COMPUTED ENERGY    -0.0053421148  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    8.45443985E-04  -1.88866531E-03   2.11929555E-03
N F0001    8.45443413E-04  -1.88866178E-03   2.11929638E-03  MATCH
A D0001   -4.96976710E-03  -2.26586753E-03   7.80134035E-03
N D0001   -4.96973823E-03  -2.26584879E-03   7.80142776E-03  MATCH
A F0002   -8.45443985E-04   1.88866531E-03  -2.11929555E-03
N F0002   -8.45443413E-04   1.88866178E-03  -2.11929638E-03  MATCH
A D0002    1.76794342E-04  -1.90153531E-04   4.18483442E-03
N D0002    1.76309134E-04  -1.90168475E-04   4.18507882E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:45 2025
TOTAL RUN TIME IS 0 SECONDS
