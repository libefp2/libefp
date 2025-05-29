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
WALL CLOCK TIME IS Wed May 28 22:54:43 2025

SIMULATION SETTINGS

run_type gtest
coord points
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
gtest_tol 5e-06
ref_energy 0.144894
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
           POLARIZATION ENERGY    -0.0026552983
             DISPERSION ENERGY    -0.0173897265
     EXCHANGE REPULSION ENERGY     0.0301401951
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.1448936577


              REFERENCE ENERGY     0.1448936577
               COMPUTED ENERGY     0.1448936577  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -6.20805798E-02   2.63091450E-02  -1.24499432E-01
N F0001   -6.20816698E-02   2.63079086E-02  -1.24499140E-01  MATCH
A D0001    4.18265762E-05  -5.57979623E-03  -2.18095070E-03
N D0001    4.23140609E-05  -5.57969473E-03  -2.18105768E-03  MATCH
A F0002    2.40427169E-04  -3.79847191E-03   1.75662232E-04
N F0002    2.40679878E-04  -3.79862865E-03   1.75417269E-04  MATCH
A D0002   -5.87879171E-03  -5.72201281E-03   6.15276586E-03
N D0002   -5.87773162E-03  -5.72172425E-03   6.15179411E-03  MATCH
A F0003   -4.41256063E-02  -7.96461295E-02   1.49736278E-02
N F0003   -4.41251889E-02  -7.96458573E-02   1.49739808E-02  MATCH
A D0003   -4.67858147E-03  -1.11088917E-03   4.03854955E-03
N D0003   -4.67896066E-03  -1.11098921E-03   4.03802478E-03  MATCH
A F0004   -5.09988447E-03  -4.17736644E-03   8.77498822E-04
N F0004   -5.09908590E-03  -4.17565731E-03   8.77473801E-04  MATCH
A D0004   -2.55313527E-03   2.85064100E-03  -1.68367615E-03
N D0004   -2.55352965E-03   2.84969283E-03  -1.68401507E-03  MATCH
A F0005   -1.71793315E-03   2.29314071E-03  -8.25580778E-04
N F0005   -1.71798372E-03   2.29303806E-03  -8.25374482E-04  MATCH
A D0005   -7.88146190E-03   1.56926330E-02  -7.16000192E-03
N D0005   -7.87921365E-03   1.56924027E-02  -7.15842538E-03  MATCH
A F0006    6.13027945E-03   2.42193881E-03  -5.81745051E-04
N F0006    6.12972317E-03   2.42185994E-03  -5.82058475E-04  MATCH
A D0006    7.48347319E-03  -2.96307229E-03   3.18399970E-03
N D0006    7.48299690E-03  -2.96346067E-03   3.18538191E-03  MATCH
A F0007    6.69655136E-04  -9.63615153E-05  -2.44537341E-03
N F0007    6.69648027E-04  -9.63567981E-05  -2.44536273E-03  MATCH
A D0007   -1.17235043E-03  -4.43743683E-04  -3.66299820E-03
N D0007   -1.17224565E-03  -4.43718398E-04  -3.66278693E-03  MATCH
A F0008   -4.98808394E-04  -1.13761029E-04   3.40241720E-03
N F0008   -4.98535100E-04  -1.14237171E-04   3.40216621E-03  MATCH
A D0008    4.56102928E-03  -3.86472512E-03   9.56899052E-03
N D0008    4.56217252E-03  -3.86390817E-03   9.57053161E-03  MATCH
A F0009    2.29584146E-03   4.05650190E-03   1.57654196E-03
N F0009    2.29580343E-03   4.05656691E-03   1.57651430E-03  MATCH
A D0009    3.76197491E-03  -8.74699077E-04   5.42879983E-03
N D0009    3.76174789E-03  -8.74766391E-04   5.42841681E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:43 2025
TOTAL RUN TIME IS 0 SECONDS
