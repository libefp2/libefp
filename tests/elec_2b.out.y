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
WALL CLOCK TIME IS Thu May 29 00:29:10 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec
special_terms elec
elec_damp overlap
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
gtest_tol 1e-06
ref_energy 0.00170492
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

A01O1               -0.965290     3.752612     0.400000
A02H2               -1.903682     3.696980     0.400000
A03H3               -0.647186     2.868031     0.400000
A01N1                0.447792    -0.941278    -0.698155
A02H2                0.349851    -0.470991     0.177855
A03H3               -0.414514    -1.404117    -0.899062
A04H4                0.600618    -0.251362    -1.404424
A01O1                1.677535     1.985647     3.242885
A02H2                1.582225     2.803540     3.696362
A03H3                2.174309     1.424250     3.810092
A01O1                0.030549     3.900750    -3.344873
A02H2               -0.091049     4.625324    -3.931287
A03H3               -0.393787     3.162768    -3.743616
A01N1               -3.500000    -0.027001    -0.642883
A02H2               -2.732448    -0.355417    -1.191666
A03H3               -3.423526     0.966242    -0.566881
A04H4               -4.344026    -0.235667    -1.135057


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0017732424
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000683149
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0017049276


              REFERENCE ENERGY     0.0017049246
               COMPUTED ENERGY     0.0017049276  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -1.95758173E-04  -8.33694983E-04  -1.80005115E-03
N F0001   -1.95758321E-04  -8.33695090E-04  -1.80005134E-03  MATCH
A D0001   -2.66763691E-03   5.81492186E-04  -2.66763691E-03
N D0001   -2.66760061E-03   5.81408336E-04  -2.66760061E-03  MATCH
A F0002   -2.60308905E-04   1.51224047E-04  -3.89677924E-04
N F0002   -2.60330706E-04   1.51231717E-04  -3.89676534E-04  MATCH
A D0002    2.36266984E-05   5.86620911E-04  -3.96436815E-04
N D0002    2.36516571E-05   5.86687138E-04  -3.96390555E-04  MATCH
A F0003    4.93295714E-04   4.02035304E-04   7.08754447E-04
N F0003    4.93295671E-04   4.02035349E-04   7.08754456E-04  MATCH
A D0003   -4.49766794E-04  -5.40906479E-04   1.41600140E-03
N D0003   -4.49742291E-04  -5.40912035E-04   1.41597467E-03  MATCH
A F0004   -1.03515532E-04   4.06500873E-04   1.09887028E-03
N F0004   -1.03515425E-04   4.06500847E-04   1.09887048E-03  MATCH
A D0004    5.84537827E-04   1.20797792E-04   2.04288497E-03
N D0004    5.84528266E-04   1.20824070E-04   2.04284008E-03  MATCH
A F0005    6.62868958E-05  -1.26065241E-04   3.82104349E-04
N F0005    6.63087812E-05  -1.26072823E-04   3.82102936E-04  MATCH
A D0005   -1.13040988E-03  -2.56664314E-04   7.15438503E-04
N D0005   -1.13026681E-03  -2.56624986E-04   7.15333792E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:10 2025
TOTAL RUN TIME IS 0 SECONDS
