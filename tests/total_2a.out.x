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
WALL CLOCK TIME IS Wed May 28 22:54:58 2025

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
ref_energy 0.000744086
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
           POLARIZATION ENERGY    -0.0002180292
             DISPERSION ENERGY    -0.0014688087
     EXCHANGE REPULSION ENERGY     0.0008442709
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0007439848


              REFERENCE ENERGY     0.0007440865
               COMPUTED ENERGY     0.0007439848  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -2.17546377E-04  -7.04872872E-04  -1.76890881E-03
N F0001   -2.17546324E-04  -7.04872384E-04  -1.76890881E-03  MATCH
A D0001   -2.64725799E-03   5.49129688E-04  -2.64725799E-03
N D0001   -2.64722081E-03   5.49051673E-04  -2.64722081E-03  MATCH
A F0002   -6.59584680E-04   1.12614370E-04  -4.84253527E-04
N F0002   -6.59630793E-04   1.12634811E-04  -4.84252641E-04  MATCH
A D0002    1.93169948E-05   5.42796335E-04  -3.58482255E-04
N D0002    1.89113421E-05   5.42450683E-04  -3.58067196E-04  MATCH
A F0003    5.72639160E-04   4.07225755E-04   8.46770503E-04
N F0003    5.72639039E-04   4.07225722E-04   8.46770656E-04  MATCH
A D0003   -4.98345774E-04  -5.10568683E-04   1.47044945E-03
N D0003   -4.98319197E-04  -5.10575914E-04   1.47042023E-03  MATCH
A F0004   -9.71796513E-05   4.51487326E-04   9.90339508E-04
N F0004   -9.71793827E-05   4.51487300E-04   9.90339591E-04  MATCH
A D0004    5.89746848E-04   1.35652965E-04   1.96605226E-03
N D0004    5.89737700E-04   1.35687973E-04   1.96601028E-03  MATCH
A F0005    4.01671548E-04  -2.66454578E-04   4.16052328E-04
N F0005    4.01717466E-04  -2.66475439E-04   4.16051210E-04  MATCH
A D0005   -9.02404715E-04  -1.54216179E-04   2.90080785E-04
N D0005   -9.02306463E-04  -1.54185708E-04   2.90051540E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:58 2025
TOTAL RUN TIME IS 0 SECONDS
