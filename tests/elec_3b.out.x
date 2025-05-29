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
coord points
terms elec
special_terms elec
elec_damp overlap
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
ref_energy 0.00235928
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

          ELECTROSTATIC ENERGY     0.0054647581
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0031054751
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0023592831


              REFERENCE ENERGY     0.0023592829
               COMPUTED ENERGY     0.0023592831  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    1.25462951E-03  -4.73513124E-04  -5.21182365E-04
N F0001    1.25468767E-03  -4.73414804E-04  -5.21200026E-04  MATCH
A D0001   -7.14362158E-04  -6.33265241E-03  -2.29026156E-03
N D0001   -7.14167482E-04  -6.33266144E-03  -2.29031382E-03  MATCH
A F0002   -1.02414876E-03  -1.16082371E-03   1.83234914E-03
N F0002   -1.02405201E-03  -1.16085185E-03   1.83228821E-03  MATCH
A D0002   -4.58247063E-03  -5.39799523E-03   4.72541441E-03
N D0002   -4.58168095E-03  -5.39771114E-03   4.72470221E-03  MATCH
A F0003    1.31400047E-03   1.75675566E-03   1.30951613E-03
N F0003    1.31377869E-03   1.75658079E-03   1.30940342E-03  MATCH
A D0003   -1.62107956E-03   6.04001694E-04   1.51954081E-03
N D0003   -1.62120896E-03   6.03877844E-04   1.51936651E-03  MATCH
A F0004   -3.59660704E-03   1.30554032E-03   4.73988538E-04
N F0004   -3.59666667E-03   1.30544551E-03   4.74011580E-04  MATCH
A D0004   -3.82122626E-03   2.21945565E-03  -1.94043531E-03
N D0004   -3.82114171E-03   2.21906508E-03  -1.94006765E-03  MATCH
A F0005   -1.61562281E-03   3.36945098E-03  -1.38226345E-03
N F0005   -1.61559621E-03   3.36937505E-03  -1.38221432E-03  MATCH
A D0005   -4.32900803E-03   1.26323298E-02  -3.22874777E-03
N D0005   -4.32838354E-03   1.26313816E-02  -3.22786146E-03  MATCH
A F0006   -3.28237955E-04  -3.77751194E-03  -2.58872032E-03
N F0006   -3.28172032E-04  -3.77725650E-03  -2.58859713E-03  MATCH
A D0006    1.09114591E-02  -3.06049689E-03   8.80310597E-03
N D0006    1.09109299E-02  -3.06009230E-03   8.80247768E-03  MATCH
A F0007    6.33860426E-04   2.26040472E-05  -1.11200088E-03
N F0007    6.33861735E-04   2.26026420E-05  -1.11200519E-03  MATCH
A D0007   -1.33942284E-03  -2.89123671E-04  -2.58154256E-03
N D0007   -1.33929528E-03  -2.89101852E-04  -2.58142601E-03  MATCH
A F0008    2.50646910E-03  -2.44764916E-03   1.28675468E-03
N F0008    2.50647102E-03  -2.44765283E-03   1.28675154E-03  MATCH
A D0008    2.64862799E-04  -3.09436859E-03   9.78387754E-04
N D0008    2.65651921E-04  -3.09456090E-03   9.77990232E-04  MATCH
A F0009    8.55657064E-04   1.40514693E-03   7.01558524E-04
N F0009    8.55687813E-04   1.40517199E-03   7.01561916E-04  MATCH
A D0009    2.62163700E-03   4.31409630E-04   4.58494556E-03
N D0009    2.62144747E-03   4.31394673E-04   4.58447527E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:45 2025
TOTAL RUN TIME IS 1 SECONDS
