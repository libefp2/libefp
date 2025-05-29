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
coord points
terms elec pol
special_terms elec pol
elec_damp screen
disp_damp overlap
pol_damp off
pol_driver direct
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
ref_energy -0.0066096
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

A01O1               -3.394000    -1.900000    -3.700000
A02H2               -3.517419    -1.130057    -3.174996
A03H3               -2.580284    -2.281411    -3.424198
A01N1               -5.515000     1.083000     0.968000
A02H2               -5.171084     0.157148     0.817415
A03H3               -4.838165     1.726200     0.612549
A04H4               -6.354118     1.191679     0.436750
A01N1                1.848000     0.114000     0.130000
A02H2                1.962492     0.657352    -0.700552
A03H3                0.930650     0.284298     0.487246
A04H4                1.908198    -0.851198    -0.120847
A01N1               -1.111000    -0.084000    -4.017000
A02H2               -1.917299     0.471666    -3.818825
A03H3               -0.331561     0.530751    -4.129749
A04H4               -0.933938    -0.666145    -3.224591
A01C1               -2.056000     0.767000    -0.301000
A02O2               -2.979940    -0.252959    -0.545947
A03H3               -1.192965     0.406624     0.250842
A04H4               -2.554557     1.516350     0.296433
A05H5               -1.714730     1.232706    -1.220716
A06H6               -2.587630    -0.929369    -1.064807
A01O1               -0.126000    -2.228000    -0.815000
A02H2                0.288547    -2.463797    -0.004923
A03H3                0.070751    -1.320158    -0.959173
A01O1               -1.850000     1.697000     3.172000
A02H2               -1.090083     1.597261     2.627709
A03H3               -2.594572     1.639020     2.601101
A01C1                1.275000    -2.447000    -4.673000
A02O2                0.721395    -3.174708    -3.615672
A03H3                2.206088    -1.965869    -4.388715
A04H4                0.563481    -1.680500    -4.943610
A05H5                1.454294    -3.071336    -5.543221
A06H6                1.308836    -3.855273    -3.346606
A01O1               -5.773000    -1.738000    -0.926000
A02H2               -5.053659    -1.949235    -1.493100
A03H3               -5.438927    -1.776829    -0.048183


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0039531505
           POLARIZATION ENERGY    -0.0026556469
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0066087975


              REFERENCE ENERGY    -0.0066095992
               COMPUTED ENERGY    -0.0066087975  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -1.45574869E-03  -2.46501149E-03  -7.42024607E-04
N F0001   -1.45575123E-03  -2.46501210E-03  -7.42025708E-04  MATCH
A D0001   -3.61280285E-04  -5.74018595E-03  -2.41314432E-03
N D0001   -3.61081984E-04  -5.74020792E-03  -2.41318129E-03  MATCH
A F0002   -2.47985110E-03  -2.76625217E-04   2.93434578E-03
N F0002   -2.47985333E-03  -2.76624869E-04   2.93434637E-03  MATCH
A D0002   -4.64422722E-03  -5.75875738E-03   4.73237250E-03
N D0002   -4.64345054E-03  -5.75846929E-03   4.73166713E-03  MATCH
A F0003    2.13414327E-03   2.37006923E-03   1.56559307E-03
N F0003    2.13414403E-03   2.37006950E-03   1.56559232E-03  MATCH
A D0003   -1.63881939E-03   2.50869784E-04   1.57673288E-03
N D0003   -1.63885146E-03   2.50760096E-04   1.57654097E-03  MATCH
A F0004   -2.00178014E-03   4.53942894E-03   1.14007646E-04
N F0004   -2.00177878E-03   4.53943082E-03   1.14006527E-04  MATCH
A D0004   -3.55565903E-03   1.61970415E-03  -1.88170819E-03
N D0004   -3.55563184E-03   1.61933381E-03  -1.88137834E-03  MATCH
A F0005   -4.99704727E-04   3.74167743E-03  -1.72265797E-03
N F0005   -4.99702538E-04   3.74167764E-03  -1.72265695E-03  MATCH
A D0005   -3.19263028E-03   1.21581088E-02  -2.10570809E-03
N D0005   -3.19206710E-03   1.21571550E-02  -2.10504913E-03  MATCH
A F0006   -4.16116227E-04  -4.68911218E-03  -1.70980532E-03
N F0006   -4.16116183E-04  -4.68911268E-03  -1.70980316E-03  MATCH
A D0006    1.05675359E-02  -3.32990520E-03   8.33260044E-03
N D0006    1.05669925E-02  -3.32953831E-03   8.33214195E-03  MATCH
A F0007    7.82896414E-04   1.74412250E-04  -6.86114695E-04
N F0007    7.82896583E-04   1.74412124E-04  -6.86114062E-04  MATCH
A D0007   -1.14716081E-03  -4.72869795E-04  -3.02866517E-03
N D0007   -1.14705431E-03  -4.72843351E-04  -3.02850328E-03  MATCH
A F0008    3.88306362E-03  -3.98837217E-03  -1.19422841E-04
N F0008    3.88306465E-03  -3.98837285E-03  -1.19423803E-04  MATCH
A D0008   -5.02333301E-04  -2.51024130E-03  -1.44911464E-03
N D0008   -5.01419376E-04  -2.51008196E-03  -1.44901462E-03  MATCH
A F0009    5.30975833E-05   5.93533209E-04   3.66078941E-04
N F0009    5.30968288E-05   5.93532402E-04   3.66078721E-04  MATCH
A D0009    2.68412573E-03  -3.11738273E-04   5.17340260E-03
N D0009    2.68396967E-03  -3.11718173E-04   5.17288639E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:47 2025
TOTAL RUN TIME IS 1 SECONDS
