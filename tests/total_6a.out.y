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
WALL CLOCK TIME IS Thu May 29 00:30:38 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp off
disp_damp off
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
ref_energy -0.00549506
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
           POLARIZATION ENERGY    -0.0008629044
             DISPERSION ENERGY    -0.0039693146
     EXCHANGE REPULSION ENERGY     0.0030599103
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0054951039


              REFERENCE ENERGY    -0.0054950567
               COMPUTED ENERGY    -0.0054951039  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    1.74639902E-03  -9.32737547E-04  -4.94805100E-04
N F0001    1.74607170E-03  -9.32704664E-04  -4.94845677E-04  MATCH
A D0001    2.78100768E-03   8.98316762E-04   2.78100768E-03
N D0001    2.78080328E-03   8.98281281E-04   2.78080328E-03  MATCH
A F0002   -1.04196096E-03  -1.59266980E-03  -1.01045481E-03
N F0002   -1.04165931E-03  -1.59270329E-03  -1.01045080E-03  MATCH
A D0002   -1.06906408E-03   2.62764427E-04  -1.06906408E-03
N D0002   -1.07039675E-03   2.62710320E-04  -1.07039675E-03  MATCH
A F0003   -1.24327440E-03   1.21965557E-03  -1.41356495E-03
N F0003   -1.24327364E-03   1.21966283E-03  -1.41356603E-03  MATCH
A D0003   -1.32555795E-03   6.51962029E-04  -1.32555795E-03
N D0003   -1.32551531E-03   6.51938603E-04  -1.32551531E-03  MATCH
A F0004    2.18377826E-03   2.16957242E-03  -4.99921249E-04
N F0004    2.18378015E-03   2.16956104E-03  -4.99880507E-04  MATCH
A D0004   -1.74370381E-04   3.80915341E-04  -1.74370381E-04
N D0004   -1.74383945E-04   3.81040100E-04  -1.74383945E-04  MATCH
A F0005   -1.64494191E-03  -8.63820640E-04   3.41874612E-03
N F0005   -1.64491889E-03  -8.63815793E-04   3.41874308E-03  MATCH
A D0005   -1.99928462E-03   6.11999778E-04  -1.99928462E-03
N D0005   -1.99881863E-03   6.12126116E-04  -1.99881863E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:30:39 2025
TOTAL RUN TIME IS 1 SECONDS
