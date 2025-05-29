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
ref_energy -0.00395315
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
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0039531505


              REFERENCE ENERGY    -0.0039531505
               COMPUTED ENERGY    -0.0039531505  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -9.34594695E-04  -2.27454769E-03  -4.43186937E-04
N F0001   -9.34597013E-04  -2.27454828E-03  -4.43187898E-04  MATCH
A D0001   -5.75474194E-04  -5.93804283E-03  -2.30472103E-03
N D0001   -5.75238273E-04  -5.93804143E-03  -2.30477540E-03  MATCH
A F0002   -2.22115078E-03  -3.30558450E-04   2.76756912E-03
N F0002   -2.22115275E-03  -3.30558197E-04   2.76756964E-03  MATCH
A D0002   -4.70733670E-03  -5.65677169E-03   4.86060505E-03
N D0002   -4.70653485E-03  -5.65648825E-03   4.85988140E-03  MATCH
A F0003    1.83898556E-03   2.27477960E-03   1.43384282E-03
N F0003    1.83898612E-03   2.27477979E-03   1.43384209E-03  MATCH
A D0003   -1.57603844E-03   5.66347549E-04   1.57274131E-03
N D0003   -1.57616705E-03   5.66194662E-04   1.57255342E-03  MATCH
A F0004   -2.38037722E-03   4.27040648E-03   3.18313268E-04
N F0004   -2.38037587E-03   4.27040834E-03   3.18312170E-04  MATCH
A D0004   -3.53869255E-03   2.27980953E-03  -1.91513195E-03
N D0004   -3.53866823E-03   2.27938595E-03  -1.91479251E-03  MATCH
A F0005   -4.29256108E-04   3.70257917E-03  -1.62507095E-03
N F0005   -4.29254003E-04   3.70257922E-03  -1.62507008E-03  MATCH
A D0005   -2.89900034E-03   1.23171758E-02  -1.77263243E-03
N D0005   -2.89842720E-03   1.23162892E-02  -1.77192417E-03  MATCH
A F0006   -5.93607972E-04  -4.45390743E-03  -1.98131120E-03
N F0006   -5.93607885E-04  -4.45390777E-03  -1.98130950E-03  MATCH
A D0006    1.04625734E-02  -3.17287805E-03   8.12522390E-03
N D0006    1.04620640E-02  -3.17252071E-03   8.12483638E-03  MATCH
A F0007    6.86536008E-04   7.34980184E-05  -8.82349731E-04
N F0007    6.86536125E-04   7.34978953E-05  -8.82349189E-04  MATCH
A D0007   -1.35114324E-03  -2.75582819E-04  -2.70991902E-03
N D0007   -1.35102168E-03  -2.75562070E-04  -2.70979630E-03  MATCH
A F0008    3.81124034E-03  -3.98143816E-03   5.10971365E-05
N F0008    3.81124114E-03  -3.98143877E-03   5.10965549E-05  MATCH
A D0008   -2.38449971E-04  -2.84500402E-03  -9.26479237E-04
N D0008   -2.37562642E-04  -2.84484345E-03  -9.26424715E-04  MATCH
A F0009    2.22224875E-04   7.19188466E-04   3.61096483E-04
N F0009    2.22224140E-04   7.19187769E-04   3.61096216E-04  MATCH
A D0009    2.82794640E-03   3.19587999E-04   4.64671978E-03
N D0009    2.82777442E-03   3.19554326E-04   4.64623228E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:44 2025
TOTAL RUN TIME IS 0 SECONDS
