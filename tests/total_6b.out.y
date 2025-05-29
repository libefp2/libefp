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
elec_damp overlap
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
ref_energy -0.00512533
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

          ELECTROSTATIC ENERGY    -0.0037227952
           POLARIZATION ENERGY    -0.0008627044
             DISPERSION ENERGY    -0.0033008958
     EXCHANGE REPULSION ENERGY     0.0030599103
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002988617
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0051253467


              REFERENCE ENERGY    -0.0051253344
               COMPUTED ENERGY    -0.0051253467  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    2.13975759E-03  -8.88357984E-04  -4.47437986E-04
N F0001    2.13949045E-03  -8.88334024E-04  -4.47478046E-04  MATCH
A D0001    2.73757658E-03   8.96257337E-04   2.73757658E-03
N D0001    2.73737108E-03   8.96222037E-04   2.73737108E-03  MATCH
A F0002   -1.44316984E-03  -1.60269312E-03  -9.88104478E-04
N F0002   -1.44292744E-03  -1.60271781E-03  -9.88100572E-04  MATCH
A D0002   -8.48645802E-04   2.85151748E-04  -8.48645802E-04
N D0002   -8.50017179E-04   2.85093201E-04  -8.50017179E-04  MATCH
A F0003   -1.23538595E-03   1.19370505E-03  -1.40448790E-03
N F0003   -1.23538501E-03   1.19371211E-03  -1.40448866E-03  MATCH
A D0003   -1.32742014E-03   6.53205548E-04  -1.32742014E-03
N D0003   -1.32737720E-03   6.53182149E-04  -1.32737720E-03  MATCH
A F0004    2.19194442E-03   2.18547426E-03  -5.51110150E-04
N F0004    2.19194277E-03   2.18546047E-03  -5.51069293E-04  MATCH
A D0004   -1.39515960E-04   3.95482165E-04  -1.39515960E-04
N D0004   -1.39522946E-04   3.95603423E-04  -1.39522946E-04  MATCH
A F0005   -1.65314623E-03  -8.88128205E-04   3.39114051E-03
N F0005   -1.65312075E-03  -8.88120618E-04   3.39113663E-03  MATCH
A D0005   -1.98257845E-03   6.46146631E-04  -1.98257845E-03
N D0005   -1.98213342E-03   6.46268297E-04  -1.98213342E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:30:39 2025
TOTAL RUN TIME IS 0 SECONDS
