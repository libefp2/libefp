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
terms elec
special_terms elec
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
gtest_tol 1e-06
ref_energy 0.00158655
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

          ELECTROSTATIC ENERGY     0.0015865518
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0015865518


              REFERENCE ENERGY     0.0015865516
               COMPUTED ENERGY     0.0015865518  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -2.05934703E-04  -8.22499634E-04  -1.77646550E-03
N F0001   -2.05934778E-04  -8.22499625E-04  -1.77646559E-03  MATCH
A D0001   -2.66564817E-03   5.82811578E-04  -2.66564817E-03
N D0001   -2.66561167E-03   5.82728089E-04  -2.66561167E-03  MATCH
A F0002   -1.22047459E-04   1.14918518E-04  -3.97857362E-04
N F0002   -1.22046997E-04   1.14918476E-04  -3.97857330E-04  MATCH
A D0002    2.44681449E-05   5.82117859E-04  -3.96015204E-04
N D0002    2.44735500E-05   5.82166923E-04  -3.95951149E-04  MATCH
A F0003    5.00556413E-04   3.99451574E-04   7.18279188E-04
N F0003    5.00556382E-04   3.99451597E-04   7.18279226E-04  MATCH
A D0003   -4.50442137E-04  -5.41535813E-04   1.41655396E-03
N D0003   -4.50417629E-04  -5.41541426E-04   1.41652703E-03  MATCH
A F0004   -9.53467763E-05   4.08191100E-04   1.06950246E-03
N F0004   -9.53467121E-05   4.08191077E-04   1.06950255E-03  MATCH
A D0004    5.86130382E-04   1.12683626E-04   2.04128747E-03
N D0004    5.86120770E-04   1.12710900E-04   2.04124277E-03  MATCH
A F0005   -7.72274751E-05  -1.00061558E-04   3.86541220E-04
N F0005   -7.72278956E-05  -1.00061524E-04   3.86541141E-04  MATCH
A D0005   -1.12392653E-03  -2.45607314E-04   6.88457725E-04
N D0005   -1.12378674E-03  -2.45567397E-04   6.88357646E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:44 2025
TOTAL RUN TIME IS 0 SECONDS
