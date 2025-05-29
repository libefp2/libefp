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
WALL CLOCK TIME IS Thu May 29 00:30:39 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp screen
disp_damp overlap
pol_damp off
pol_driver iterative
enable_ff false
enable_multistep false
ff_geometry ff.xyz
ff_parameters /../fraglib/params/amber99.prm
single_params_file false
efp_params_file params.efp
enable_cutoff true
swf_cutoff 5
xr_cutoff 5
max_steps 100
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc true
periodic_box 15.0 15.0 15.0
opt_tol 0.0003
opt_energy_tol 1e-06
gtest_tol 5e-06
ref_energy -0.00640135
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

A01O1                0.000000     0.063030     0.000000
A02H2               -0.752652    -0.500166     0.000000
A03H3                0.752652    -0.500166     0.000000
A01C1               18.282881     0.013446    -0.000001
A02O2               19.678634    -0.063043    -0.000001
A03H3               17.905866     0.520396     0.883227
A04H4               17.905007    -0.998593    -0.000048
A05H5               17.905844     0.520490    -0.883163
A06H6               20.051482     0.798141     0.000002
A01O1                0.000000    19.063030     0.000000
A02H2               -0.752652    18.499834     0.000000
A03H3                0.752652    18.499834     0.000000
A01C1               -0.717119     0.013446    18.999999
A02O2                0.678634    -0.063043    18.999999
A03H3               -1.094134     0.520396    19.883227
A04H4               -1.094993    -0.998593    18.999952
A05H5               -1.094156     0.520490    18.116837
A06H6                1.051482     0.798141    19.000002
A01N1               18.000000    18.000000    17.936823
A02H2               17.533209    17.191494    18.292603
A03H3               17.533209    18.808506    18.292603
A04H4               18.933582    18.000000    18.292603


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0046581861
           POLARIZATION ENERGY    -0.0008629044
             DISPERSION ENERGY    -0.0039402156
     EXCHANGE REPULSION ENERGY     0.0030599103
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0064013957


              REFERENCE ENERGY    -0.0064013486
               COMPUTED ENERGY    -0.0064013957  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    9.28963397E-04  -9.74919947E-04  -6.57574519E-04
N F0001    9.28629107E-04  -9.74886522E-04  -6.57615557E-04  MATCH
A D0001    3.14776895E-03   8.79738812E-04   3.14776895E-03
N D0001    3.14753877E-03   8.79703314E-04   3.14753877E-03  MATCH
A F0002   -1.51965349E-04  -1.88003213E-03  -1.26739521E-03
N F0002   -1.51656888E-04  -1.88006615E-03  -1.26739123E-03  MATCH
A D0002   -1.04139652E-03   3.76659250E-04  -1.04139652E-03
N D0002   -1.04256543E-03   3.76580615E-04  -1.04256543E-03  MATCH
A F0003   -1.27216058E-03   1.26808417E-03  -1.44162047E-03
N F0003   -1.27215983E-03   1.26809155E-03  -1.44162156E-03  MATCH
A D0003   -1.32216657E-03   6.47541094E-04  -1.32216657E-03
N D0003   -1.32212417E-03   6.47517688E-04  -1.32212417E-03  MATCH
A F0004    1.99387979E-03   2.01032097E-03  -2.75600110E-04
N F0004    1.99388187E-03   2.01030962E-03  -2.75558957E-04  MATCH
A D0004   -3.00697429E-04   5.12460719E-04  -3.00697429E-04
N D0004   -3.00702071E-04   5.12565803E-04  -3.00702071E-04  MATCH
A F0005   -1.49871726E-03  -4.23453053E-04   3.64219031E-03
N F0005   -1.49869425E-03  -4.23448369E-04   3.64218737E-03  MATCH
A D0005   -1.98453000E-03   6.27638341E-04  -1.98453000E-03
N D0005   -1.98406743E-03   6.27764148E-04  -1.98406743E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:30:39 2025
TOTAL RUN TIME IS 0 SECONDS
