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
WALL CLOCK TIME IS Thu May 29 00:29:08 2025

SIMULATION SETTINGS

run_type gtest
coord points
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
ref_energy -0.0173897
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
             DISPERSION ENERGY    -0.0173897265
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0173897265


              REFERENCE ENERGY    -0.0173897265
               COMPUTED ENERGY    -0.0173897265  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -1.32312143E-03  -1.20320608E-03  -6.27929991E-04
N F0001   -1.32312166E-03  -1.20320605E-03  -6.27930224E-04  MATCH
A D0001   -4.03544754E-05  -4.33308022E-05  -1.95544842E-05
N D0001   -4.03548190E-05  -4.33273320E-05  -1.95515097E-05  MATCH
A F0002   -1.43094427E-03   9.91780466E-04   9.50904538E-04
N F0002   -1.43094468E-03   9.91780564E-04   9.50904423E-04  MATCH
A D0002    5.70515218E-05  -1.70967614E-04  -6.68206742E-05
N D0002    5.70429434E-05  -1.70950738E-04  -6.68107493E-05  MATCH
A F0003    1.54704891E-03   8.06272349E-04   5.36171795E-04
N F0003    1.54704919E-03   8.06272444E-04   5.36171717E-04  MATCH
A D0003    1.24814108E-04  -1.26843277E-04  -6.10924817E-05
N D0003    1.24805414E-04  -1.26830858E-04  -6.10833140E-05  MATCH
A F0004    3.22743859E-04   2.13710198E-03  -1.01143723E-03
N F0004    3.22743979E-04   2.13710210E-03  -1.01143756E-03  MATCH
A D0004   -3.82788651E-05  -6.18764871E-05  -4.93461690E-05
N D0004   -3.82730854E-05  -6.18733667E-05  -4.93387519E-05  MATCH
A F0005    4.21750026E-04   1.00792135E-03   3.78174329E-05
N F0005    4.21750254E-04   1.00792144E-03   3.78175675E-05  MATCH
A D0005    1.18721213E-03  -5.81735047E-04   7.85045421E-04
N D0005    1.18710218E-03  -5.81713846E-04   7.84986458E-04  MATCH
A F0006   -1.83818396E-04  -1.50325272E-03   6.35933809E-04
N F0006   -1.83818275E-04  -1.50325293E-03   6.35934253E-04  MATCH
A D0006   -8.45742984E-06   3.06031540E-05   3.26533789E-05
N D0006   -8.46225778E-06   3.05998250E-05   3.26436070E-05  MATCH
A F0007    1.62797182E-04   2.74245477E-04   9.23185156E-04
N F0007    1.62797200E-04   2.74245429E-04   9.23185451E-04  MATCH
A D0007   -2.46296853E-06  -1.79799346E-05   1.16419114E-05
N D0007   -2.46277899E-06  -1.79784091E-05   1.16398989E-05  MATCH
A F0008    1.48704965E-03  -1.48867667E-03  -1.22530825E-03
N F0008    1.48704969E-03  -1.48867673E-03  -1.22530846E-03  MATCH
A D0008   -6.56908738E-04   3.25303880E-05  -1.24147996E-03
N D0008   -6.56860658E-04   3.25584555E-05  -1.24147527E-03  MATCH
A F0009   -1.00350552E-03  -1.02218615E-03  -2.19337257E-04
N F0009   -1.00350570E-03  -1.02218626E-03  -2.19337166E-04  MATCH
A D0009   -6.66772993E-05   4.87657368E-05  -9.13954305E-06
N D0009   -6.66737147E-05   4.87630647E-05  -9.13795559E-06  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:08 2025
TOTAL RUN TIME IS 0 SECONDS
