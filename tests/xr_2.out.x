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
WALL CLOCK TIME IS Wed May 28 22:55:21 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms xr
special_terms xr
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
ref_energy 0.000844393
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
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0008442709
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0008442709


              REFERENCE ENERGY     0.0008443933
               COMPUTED ENERGY     0.0008442709  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    7.32317919E-05  -9.03866138E-05  -2.26513402E-04
N F0001    7.32319064E-05  -9.03861781E-05  -2.26513421E-04  MATCH
A D0001    1.15914006E-05  -2.03461256E-05   1.15914006E-05
N D0001    1.15880515E-05  -2.03414720E-05   1.15880515E-05  MATCH
A F0002   -9.74641491E-04   2.50798609E-04  -5.01970465E-05
N F0002   -9.74688244E-04   2.50819096E-04  -5.01961802E-05  MATCH
A D0002   -1.05600541E-04  -7.20474287E-05   3.10856285E-05
N D0002   -1.06008186E-04  -7.24357067E-05   3.14378169E-05  MATCH
A F0003   -3.32576338E-05   1.31367009E-05  -3.77255873E-05
N F0003   -3.32577246E-05   1.31366398E-05  -3.77254933E-05  MATCH
A D0003   -9.86378958E-06  -1.30753070E-06   1.63907922E-05
N D0003   -9.86434691E-06  -1.30813278E-06   1.63883655E-05  MATCH
A F0004   -6.28397039E-05  -1.49310575E-05   2.32008752E-04
N F0004   -6.28394866E-05  -1.49310659E-05   2.32008864E-04  MATCH
A D0004    8.61369658E-06  -6.35054892E-06  -2.26953451E-05
N D0004    8.61332473E-06  -6.34075217E-06  -2.26937771E-05  MATCH
A F0005    9.97507037E-04  -1.58617638E-04   8.24272831E-05
N F0005    9.97553549E-04  -1.58638492E-04   8.24262305E-05  MATCH
A D0005    2.24411955E-04   1.22145526E-04  -4.44481166E-04
N D0005    2.24371576E-04   1.22138330E-04  -4.44401723E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:55:21 2025
TOTAL RUN TIME IS 0 SECONDS
