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

RUNNING 1 MPI PROCESSES WITH 1 OPENMP THREADS EACH
WALL CLOCK TIME IS Thu May 29 00:29:05 2025

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
ref_energy 0.000228001
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

A01O1               -0.026657     0.006545    -0.056739
A02H2                0.576926     0.598938     0.353668
A03H3               -0.153867    -0.702819     0.546829
A01N1                5.055087     0.016296     0.026291
A02H2                5.128382    -0.867017    -0.434733
A03H3                4.768465     0.694848    -0.648669
A04H4                4.337749    -0.054247     0.718104


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0002900482
           POLARIZATION ENERGY    -0.0000123244
             DISPERSION ENERGY    -0.0000989033
     EXCHANGE REPULSION ENERGY     0.0000134697
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0002280010


              REFERENCE ENERGY     0.0002280010
               COMPUTED ENERGY     0.0002280010  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    7.18764173E-05  -1.92655616E-03  -1.93816164E-03
N F0001    7.18743020E-05  -1.92655609E-03  -1.93816162E-03  MATCH
A D0001   -2.25934855E-04   5.11786089E-04  -1.46483415E-04
N D0001   -2.25913235E-04   5.11772245E-04  -1.46492005E-04  MATCH
A F0002   -7.18764173E-05   3.68300400E-05   4.84355165E-05
N F0002   -7.18743020E-05   3.68299659E-05   4.84354978E-05  MATCH
A D0002   -1.22058589E-04   9.58458830E-05   1.27736402E-04
N D0002   -1.22053382E-04   9.57850231E-05   1.27715573E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:05 2025
TOTAL RUN TIME IS 0 SECONDS
