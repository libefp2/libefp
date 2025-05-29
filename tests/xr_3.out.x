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
coord points
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
gtest_tol 5e-06
ref_energy 0.0301402
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

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0301401951
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0301401951


              REFERENCE ENERGY     0.0301402098
               COMPUTED ENERGY     0.0301401951  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    7.85399918E-03   6.97155113E-03   6.83213456E-04
N F0001    7.85291200E-03   6.97031525E-03   6.83506983E-04  MATCH
A D0001    4.43393470E-04   2.03699834E-04   2.51717239E-04
N D0001    4.43682876E-04   2.03819809E-04   2.51644260E-04  MATCH
A F0002    4.15120137E-03  -4.51361482E-03  -3.70956854E-03
N F0002    4.15145670E-03  -4.51377203E-03  -3.70981396E-03  MATCH
A D0002   -1.29154802E-03   2.07689559E-04   1.48714120E-03
N D0002   -1.29125606E-03   2.07673145E-04   1.48686488E-03  MATCH
A F0003   -1.07744498E-02  -7.06474617E-03  -3.59380156E-03
N F0003   -1.07740335E-02  -7.06447438E-03  -3.59344773E-03  MATCH
A D0003   -3.16337719E-03  -1.23522447E-03   2.52245776E-03
N D0003   -3.16371448E-03  -1.23522735E-03   2.52211576E-03  MATCH
A F0004   -3.42072881E-03  -1.08539329E-02   1.77491636E-03
N F0004   -3.41993173E-03  -1.08522258E-02   1.77489287E-03  MATCH
A D0004    1.04083261E-03   1.29283142E-03   2.47374073E-04
N D0004    1.04040520E-03   1.29225047E-03   2.46697846E-04  MATCH
A F0005   -1.64018402E-03  -2.45642203E-03   8.59206174E-04
N F0005   -1.64023702E-03  -2.45652495E-03   8.59411379E-04  MATCH
A D0005   -5.87599431E-03   4.11604067E-03  -5.83929888E-03
N D0005   -5.87419969E-03   4.11674277E-03  -5.83832271E-03  MATCH
A F0006    6.72898717E-03   8.61366086E-03   4.91427866E-04
N F0006    6.72843068E-03   8.61358266E-03   4.91111819E-04  MATCH
A D0006   -3.07360484E-03   3.36184966E-04  -5.17893069E-03
N D0006   -3.07353190E-03   3.35433028E-04  -5.17707861E-03  MATCH
A F0007   -2.76035872E-04  -5.45004543E-04  -2.68238803E-03
N F0007   -2.76043110E-04  -5.44999785E-04  -2.68237831E-03  MATCH
A D0007   -2.27136127E-05   4.70740475E-05  -6.45932885E-04
N D0007   -2.27155202E-05   4.70713619E-05  -6.45881434E-04  MATCH
A F0008   -5.86899255E-03   5.36336724E-03   4.74715905E-03
N F0008   -5.86872033E-03   5.36289183E-03   4.74690925E-03  MATCH
A D0008    5.72036029E-03  -1.38701168E-03   1.22597997E-02
N D0008    5.72054146E-03  -1.38638213E-03   1.22612358E-02  MATCH
A F0009    3.24620334E-03   4.48514127E-03   1.42983522E-03
N F0009    3.24616630E-03   4.48520725E-03   1.42980770E-03  MATCH
A D0009    1.14450417E-03  -6.11780321E-04   2.64568691E-04
N D0009    1.14442962E-03  -6.11865027E-04   2.64700277E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:55:21 2025
TOTAL RUN TIME IS 0 SECONDS
