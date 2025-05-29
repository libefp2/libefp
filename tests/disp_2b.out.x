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
ref_energy -0.00158018
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

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY    -0.0015801773
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0015801773


              REFERENCE ENERGY    -0.0015801770
               COMPUTED ENERGY    -0.0015801773  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -9.30818590E-05   2.11564064E-04   1.96839912E-04
N F0001   -9.30818460E-05   2.11564112E-04   1.96840031E-04  MATCH
A D0001   -3.95212344E-06   2.94678097E-06  -3.95212344E-06
N D0001   -3.95185776E-06   2.94617366E-06  -3.95185776E-06  MATCH
A F0002    5.04828281E-04  -2.55045248E-04  -4.02885553E-05
N F0002    5.04829426E-04  -2.55045579E-04  -4.02886231E-05  MATCH
A D0002    8.30889156E-05   8.31009627E-06  -1.08721212E-05
N D0002    8.30811136E-05   8.30798632E-06  -1.08697956E-05  MATCH
A F0003    1.02495217E-04  -1.53418357E-05   1.41526417E-04
N F0003    1.02495221E-04  -1.53418305E-05   1.41526437E-04  MATCH
A D0003   -1.27153576E-06   8.48367350E-07   2.94449100E-06
N D0003   -1.27145879E-06   8.48247412E-07   2.94477611E-06  MATCH
A F0004    6.99720981E-05   5.55816239E-05  -2.66309162E-04
N F0004    6.99720848E-05   5.55816277E-05  -2.66309300E-04  MATCH
A D0004   -1.07135212E-06   1.93863024E-06  -2.32308472E-06
N D0004   -1.07129481E-06   1.93807350E-06  -2.32336190E-06  MATCH
A F0005   -5.84213737E-04   3.24139612E-06  -3.17686112E-05
N F0005   -5.84214886E-04   3.24167028E-06  -3.17685447E-05  MATCH
A D0005   -1.98348087E-05  -1.46566136E-05   3.92919933E-05
N D0005   -1.98314465E-05  -1.46564730E-05   3.92858646E-05  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:44 2025
TOTAL RUN TIME IS 0 SECONDS
