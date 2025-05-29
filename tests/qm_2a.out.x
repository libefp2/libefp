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
WALL CLOCK TIME IS Wed May 28 22:54:47 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
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
ref_energy -0.231426
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

A01C1                0.286201    -1.298316    -0.586121
A02O2               -0.225087    -0.708194     0.573327
A03H3               -0.017874    -2.336650    -0.679029
A04H4                1.363696    -1.263095    -0.517023
A05H5               -0.017951    -0.762456    -1.480309
A06H6               -1.163319    -0.716973     0.556084
A01C                -3.955071    10.850817     0.427287
A02S                -5.149255    11.900152    -0.392503
A03C                -4.355679    13.473853    -0.087647
A04O                -6.357450    11.876272     0.425821
A05H                -4.328817     9.838873     0.368304
A06H                -3.865511    11.146305     1.463838
A07H                -3.000581    10.916430    -0.078580
A08H                -5.000775    14.238566    -0.495402
A09H                -3.395686    13.503411    -0.586441
A10H                -4.243587    13.621823     0.977863
A01C                 1.174165    -2.671946     3.947010
A02S                -0.043528    -2.656000     5.257049
A03C                 0.298666    -4.272826     5.941163
A04O                -1.350482    -2.742990     4.613415
A05H                 1.057797    -1.750762     3.394673
A06H                 0.991190    -3.514159     3.293582
A07H                 2.168750    -2.718974     4.371093
A08H                -0.410709    -4.435967     6.739517
A09H                 1.305283    -4.297845     6.337841
A10H                 0.164931    -5.025007     5.175585
A01C                -4.343244    -2.827321    -5.566161
A02C                -4.940346    -4.085000    -4.977649
A03C                -6.430279    -4.070514    -4.723641
A04O                -4.274556    -5.033660    -4.728216
A05H                -3.280173    -2.951850    -5.704019
A06H                -4.531079    -1.984361    -4.909779
A07H                -4.812103    -2.603756    -6.518486
A08H                -6.743580    -5.014880    -4.305733
A09H                -6.963400    -3.885113    -5.649987
A10H                -6.683066    -3.266323    -4.040926
A01C                -8.781276    -5.566998     1.522593
A02H                -7.812187    -5.625632     1.978703
A03H                -9.420778    -6.362040     1.853424
A04CL               -8.577883    -5.713750    -0.224098
A05CL               -9.519281    -4.034391     1.991961
A01C                 5.774036    -1.823759    10.229939
A02C                 7.043582    -1.914332    11.045219
A03C                 7.660843    -3.287079    11.183742
A04O                 7.529997    -0.958207    11.549872
A05H                 5.426108    -0.802665    10.199176
A06H                 5.008320    -2.458607    10.662776
A07H                 5.954060    -2.179635     9.221140
A08H                 8.557188    -3.231061    11.782122
A09H                 7.898856    -3.688068    10.204320
A10H                 6.953897    -3.967453    11.646390
A01C                -9.428931    -8.362507    -9.294338
A02C                -8.904989    -6.986027    -8.954605
A03C                -9.803043    -5.818666    -9.294309
A04O                -7.844602    -6.830088    -8.447937
A05H                -8.708610    -9.113548    -9.008494
A06H                -9.627933    -8.432224   -10.358405
A07H               -10.367093    -8.540488    -8.779645
A08H                -9.329388    -4.892041    -9.008568
A09H               -10.752762    -5.918370    -8.779718
A10H               -10.013589    -5.809124   -10.358407
Q0001                4.000000     5.000000     5.000000
Q0002                8.000000     5.000000     6.000000
Q0003                5.000000     8.000000     5.000000
Q0004                8.000000     9.000000     8.000000
Q0005                5.000000     8.000000     8.000000


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0014297643
           POLARIZATION ENERGY    -0.2099351700
             DISPERSION ENERGY    -0.0017442579
     EXCHANGE REPULSION ENERGY     0.0002267699
          POINT CHARGES ENERGY    -0.0185437591
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.2314261814


              REFERENCE ENERGY    -0.2314262632
               COMPUTED ENERGY    -0.2314261814  MATCH


    COMPUTING NUMERICAL GRADIENT

A Q0001    4.41384475E-03   1.18628591E-02  -1.85386300E-03
N Q0001    4.41384484E-03   1.18628593E-02  -1.85386303E-03  MATCH
A Q0002    8.87721893E-03   1.14474484E-02  -8.04744187E-03
N Q0002    8.87721892E-03   1.14474482E-02  -8.04744167E-03  MATCH
A Q0003    3.42872777E-04   1.04821685E-03  -2.34444529E-04
N Q0003    3.42872838E-04   1.04821686E-03  -2.34444348E-04  MATCH
A Q0004    6.87598454E-04   1.75483528E-03  -1.47885944E-04
N Q0004    6.87598453E-04   1.75483527E-03  -1.47885937E-04  MATCH
A Q0005    2.35221432E-04   2.33920154E-03   6.33730603E-05
N Q0005    2.35221447E-04   2.33920154E-03   6.33730724E-05  MATCH
A F0001   -5.14891272E-03  -5.55393090E-03  -3.95227825E-03
N F0001   -5.14891022E-03  -5.55393058E-03  -3.95228049E-03  MATCH
A D0001    1.03165950E-03   1.16145641E-02   1.29848493E-02
N D0001    1.03133234E-03   1.16142474E-02   1.29837198E-02  MATCH
A F0002   -1.79148536E-03  -1.19432265E-04   5.69624991E-05
N F0002   -1.79148538E-03  -1.19432240E-04   5.69625108E-05  MATCH
A D0002   -2.44556323E-02  -4.11854381E-03  -2.80817457E-02
N D0002   -2.44552751E-02  -4.11844472E-03  -2.80813684E-02  MATCH
A F0003   -7.67172252E-03  -7.26785510E-03  -7.90338333E-04
N F0003   -7.67172494E-03  -7.26785593E-03  -7.90336162E-04  MATCH
A D0003    6.09308646E-02  -1.28638900E-02  -3.93126771E-02
N D0003    6.09303067E-02  -1.28650615E-02  -3.93125512E-02  MATCH
A F0004   -2.55511221E-04  -3.35163561E-04  -2.74979131E-04
N F0004   -2.55510238E-04  -3.35163576E-04  -2.74978171E-04  MATCH
A D0004   -2.14973400E-02  -1.04610484E-02  -1.47445576E-02
N D0004   -2.14970313E-02  -1.04609398E-02  -1.47442781E-02  MATCH
A F0005   -5.26119354E-04  -7.74718195E-05  -1.55665182E-04
N F0005   -5.26119428E-04  -7.74715577E-05  -1.55665833E-04  MATCH
A D0005    9.60815227E-03   6.01908801E-03  -3.00537640E-03
N D0005    9.60795509E-03   6.01900675E-03  -3.00535944E-03  MATCH
A F0006    1.04910719E-03  -1.39946109E-02   1.61488530E-02
N F0006    1.04910670E-03  -1.39946110E-02   1.61488529E-02  MATCH
A D0006   -1.36419491E-02   3.25091639E-02  -6.25231562E-02
N D0006   -1.36411685E-02   3.25091945E-02  -6.25217548E-02  MATCH
A F0007   -2.12112358E-04  -1.10409666E-03  -8.12292283E-04
N F0007   -2.12113394E-04  -1.10409685E-03  -8.12292452E-04  MATCH
A D0007   -8.15414119E-03   5.39695211E-03   8.92819327E-03
N D0007   -8.15389143E-03   5.39674620E-03   8.92786321E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:49 2025
TOTAL RUN TIME IS 2 SECONDS
