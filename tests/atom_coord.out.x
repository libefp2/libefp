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
WALL CLOCK TIME IS Wed May 28 22:54:42 2025

SIMULATION SETTINGS

run_type gtest
coord atoms
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
ref_energy 0.00614088
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

          ELECTROSTATIC ENERGY    -0.0039531403
           POLARIZATION ENERGY    -0.0026552981
             DISPERSION ENERGY    -0.0173897267
     EXCHANGE REPULSION ENERGY     0.0301401961
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0061420310


              REFERENCE ENERGY     0.0061408841
               COMPUTED ENERGY     0.0061420310  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    5.07512987E-03   3.30337631E-03  -6.86669933E-04
N F0001    5.07404205E-03   3.30213870E-03  -6.86378136E-04  MATCH
A D0001    4.18248773E-05  -5.57978821E-03  -2.18094951E-03
N D0001    4.23171463E-05  -5.57969541E-03  -2.18105938E-03  MATCH
A F0002    2.40426607E-04  -3.79847406E-03   1.75663424E-04
N F0002    2.40679285E-04  -3.79862956E-03   1.75417582E-04  MATCH
A D0002   -5.87880050E-03  -5.72202248E-03   6.15277143E-03
N D0002   -5.87773433E-03  -5.72173072E-03   6.15179381E-03  MATCH
A F0003   -7.09470639E-03  -3.88899452E-03  -1.49275107E-03
N F0003   -7.09428730E-03  -3.88872102E-03  -1.49239605E-03  MATCH
A D0003   -4.67857870E-03  -1.11088665E-03   4.03854994E-03
N D0003   -4.67895672E-03  -1.11098941E-03   4.03802514E-03  MATCH
A F0004   -5.09987678E-03  -4.17737561E-03   8.77498932E-04
N F0004   -5.09908181E-03  -4.17566201E-03   8.77472397E-04  MATCH
A D0004   -2.55312764E-03   2.85064413E-03  -1.68366539E-03
N D0004   -2.55351952E-03   2.84969355E-03  -1.68400302E-03  MATCH
A F0005   -1.71793066E-03   2.29313890E-03  -8.25583318E-04
N F0005   -1.71798379E-03   2.29303727E-03  -8.25376250E-04  MATCH
A D0005   -7.88145457E-03   1.56926254E-02  -7.15999543E-03
N D0005   -7.87921629E-03   1.56924019E-02  -7.15843027E-03  MATCH
A F0006    6.13027643E-03   2.42194020E-03  -5.81743991E-04
N F0006    6.12972029E-03   2.42185741E-03  -5.82060016E-04  MATCH
A D0006    7.48348158E-03  -2.96307054E-03   3.18400802E-03
N D0006    7.48300662E-03  -2.96346069E-03   3.18539673E-03  MATCH
A F0007    6.69655194E-04  -9.63616133E-05  -2.44537279E-03
N F0007    6.69648464E-04  -9.63566142E-05  -2.44536147E-03  MATCH
A D0007   -1.17235008E-03  -4.43743155E-04  -3.66299805E-03
N D0007   -1.17224505E-03  -4.43718548E-04  -3.66278534E-03  MATCH
A F0008   -4.98816041E-04  -1.13751109E-04   3.40241865E-03
N F0008   -4.98541149E-04  -1.14231627E-04   3.40216905E-03  MATCH
A D0008    4.56102235E-03  -3.86472285E-03   9.56898614E-03
N D0008    4.56217109E-03  -3.86390548E-03   9.57053311E-03  MATCH
A F0009    2.29584177E-03   4.05650150E-03   1.57654010E-03
N F0009    2.29580400E-03   4.05656763E-03   1.57651313E-03  MATCH
A D0009    3.76197026E-03  -8.74703468E-04   5.42879706E-03
N D0009    3.76175077E-03  -8.74765153E-04   5.42841717E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:43 2025
TOTAL RUN TIME IS 1 SECONDS
