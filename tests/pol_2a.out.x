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
WALL CLOCK TIME IS Wed May 28 22:54:46 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec pol
special_terms elec pol
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
ref_energy 0.00136852
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
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0013685226


              REFERENCE ENERGY     0.0013685212
               COMPUTED ENERGY     0.0013685226  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -2.11851947E-04  -8.09720836E-04  -1.70339262E-03
N F0001   -2.11852018E-04  -8.09720808E-04  -1.70339267E-03  MATCH
A D0001   -2.65536729E-03   5.68999802E-04  -2.65536729E-03
N D0001   -2.65532693E-03   5.68917380E-04  -2.65532693E-03  MATCH
A F0002   -9.25287585E-05   8.56845949E-05  -3.93836305E-04
N F0002   -9.25282746E-05   8.56845540E-05  -3.93836279E-04  MATCH
A D0002    7.26623143E-05   6.10919415E-04  -3.81660962E-04
N D0002    7.26685476E-05   6.10962847E-04  -3.81599288E-04  MATCH
A F0003    5.12922193E-04   4.05477664E-04   7.54630667E-04
N F0003    5.12922161E-04   4.05477688E-04   7.54630711E-04  MATCH
A D0003   -4.87242428E-04  -5.09921790E-04   1.45134706E-03
N D0003   -4.87215374E-04  -5.09928333E-04   1.45132010E-03  MATCH
A F0004   -9.35709122E-05   4.13707335E-04   9.82398940E-04
N F0004   -9.35708522E-05   4.13707314E-04   9.82398988E-04  MATCH
A D0004    5.81881909E-04   1.40672376E-04   1.99164879E-03
N D0004    5.81873087E-04   1.40697869E-04   1.99160537E-03  MATCH
A F0005   -1.14970575E-04  -9.51487587E-05   3.60199321E-04
N F0005   -1.14971015E-04  -9.51487304E-05   3.60199250E-04  MATCH
A D0005   -1.11372576E-03  -2.67273391E-04   7.10691890E-04
N D0005   -1.11358921E-03  -2.67235721E-04   7.10586882E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:46 2025
TOTAL RUN TIME IS 0 SECONDS
