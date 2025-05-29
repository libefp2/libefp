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
ref_energy -0.00146881
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
             DISPERSION ENERGY    -0.0014688087
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0014688087


              REFERENCE ENERGY    -0.0014688094
               COMPUTED ENERGY    -0.0014688087  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -7.89262219E-05   1.95234577E-04   1.60997212E-04
N F0001   -7.89262126E-05   1.95234611E-04   1.60997276E-04  MATCH
A D0001   -3.48209194E-06   4.76012224E-07  -3.48209194E-06
N D0001   -3.48192603E-06   4.75766002E-07  -3.48192603E-06  MATCH
A F0002    4.07585570E-04  -2.23868834E-04  -4.02201749E-05
N F0002    4.07585725E-04  -2.23868840E-04  -4.02201808E-05  MATCH
A D0002    5.22552218E-05   3.92434922E-06  -7.90692159E-06
N D0002    5.22509802E-05   3.92354313E-06  -7.90572543E-06  MATCH
A F0003    9.29746010E-05  -1.13886105E-05   1.29865423E-04
N F0003    9.29746021E-05  -1.13886056E-05   1.29865436E-04  MATCH
A D0003   -1.23955643E-06   6.60638112E-07   2.71160198E-06
N D0003   -1.23947561E-06   6.60552005E-07   2.71176946E-06  MATCH
A F0004    5.92309648E-05   5.27110483E-05  -2.24068184E-04
N F0004    5.92309559E-05   5.27110522E-05  -2.24068261E-04  MATCH
A D0004   -7.48758100E-07   1.33113759E-06  -2.90118243E-06
N D0004   -7.48711205E-07   1.33085633E-06  -2.90131660E-06  MATCH
A F0005   -4.80864914E-04  -1.26881812E-05  -2.65742758E-05
N F0005   -4.80865071E-04  -1.26882172E-05  -2.65742705E-05  MATCH
A D0005   -1.30909121E-05  -9.08831405E-06   2.38700612E-05
N D0005   -1.30888322E-05  -9.08831712E-06   2.38663805E-05  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:44 2025
TOTAL RUN TIME IS 0 SECONDS
