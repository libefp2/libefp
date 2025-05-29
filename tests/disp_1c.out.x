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
WALL CLOCK TIME IS Wed May 28 22:54:44 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms disp
special_terms disp
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
enable_cutoff true
swf_cutoff 6
xr_cutoff 6
max_steps 100
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc true
periodic_box 20.0 20.0 20.0
opt_tol 0.0003
opt_energy_tol 1e-06
gtest_tol 1e-06
ref_energy -9.8002e-05
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

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY    -0.0000980020
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000980020


              REFERENCE ENERGY    -0.0000980020
               COMPUTED ENERGY    -0.0000980020  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -8.38896517E-05   2.43366322E-07  -4.49760012E-07
N F0001   -8.38896609E-05   2.43366254E-07  -4.49759889E-07  MATCH
A D0001    4.48674260E-06  -2.29849404E-06  -5.85897161E-07
N D0001    4.48635784E-06  -2.29842623E-06  -5.85796931E-07  MATCH
A F0002    8.38896517E-05  -2.43366322E-07   4.49760012E-07
N F0002    8.38896609E-05  -2.43366254E-07   4.49759889E-07  MATCH
A D0002   -2.18726412E-06  -6.64382954E-06  -9.30144171E-07
N D0002   -2.18711201E-06  -6.64328715E-06  -9.30004602E-07  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:44 2025
TOTAL RUN TIME IS 0 SECONDS
