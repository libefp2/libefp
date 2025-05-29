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
WALL CLOCK TIME IS Wed May 28 22:55:20 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp screen
disp_damp tt
pol_damp tt
pol_driver iterative
enable_ff false
enable_multistep false
ff_geometry ff.xyz
ff_parameters /../fraglib/params/amber99.prm
single_params_file false
efp_params_file params.efp
enable_cutoff true
swf_cutoff 6
xr_cutoff 6
max_steps 100
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc true
periodic_box 15.0 15.0 15.0
opt_tol 0.0003
opt_energy_tol 1e-06
gtest_tol 1e-06
ref_energy 0.00012063
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

A01O1                0.034290    -0.052887     0.000000
A02H2                0.359428     0.829134     0.000000
A03H3               -0.903630     0.010216     0.000000
A01N1               17.954151    17.986437    18.041296
A02H2               18.425959    18.828988    18.297541
A03H3               17.580957    18.107853    17.122525
A04H4               18.630125    17.251604    18.006159


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001954597
           POLARIZATION ENERGY    -0.0000081458
             DISPERSION ENERGY    -0.0000677948
     EXCHANGE REPULSION ENERGY     0.0000011106
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001206296


              REFERENCE ENERGY     0.0001206296
               COMPUTED ENERGY     0.0001206296  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    1.02038972E-04   1.12498029E-04   3.62982269E-05
N F0001    1.02038929E-04   1.12497973E-04   3.62981716E-05  MATCH
A D0001   -4.08296006E-04   4.30653088E-04  -4.08296006E-04
N D0001   -4.08280236E-04   4.30645226E-04  -4.08280236E-04  MATCH
A F0002   -1.02038972E-04  -1.12498029E-04  -3.62982269E-05
N F0002   -1.02038929E-04  -1.12497973E-04  -3.62981716E-05  MATCH
A D0002    4.67590267E-04   5.50733271E-04  -2.15102270E-04
N D0002    4.67573009E-04   5.50703054E-04  -2.15068195E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:55:20 2025
TOTAL RUN TIME IS 0 SECONDS
