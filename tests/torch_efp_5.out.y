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
WALL CLOCK TIME IS Thu May 29 00:29:43 2025

SIMULATION SETTINGS

run_type opt
coord atoms
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp overlap
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
max_steps 50
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc false
periodic_box 30.0 30.0 30.0 90.0 90.0 90.0
opt_tol 0.0005
opt_energy_tol 1e-06
gtest_tol 1e-06
ref_energy 0
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
special_fragment 0
enable_torch true
enable_elpot true
opt_special_frag 1
torch_nn ani.pt
ml_path ../nnlib/
userml_path .
custom_nn custom_model_script.pt
aev_nn aev_scripted.pt
atom_gradient frag
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


Chosen nn_type: Custom model using AEV + electrostatic potential
The location of NN potential is: ../nnlib/
AEV loaded from: ../nnlib/aev_scripted.pt
Custom model loaded from: ../nnlib/custom_model_script.pt

SPECIAL FRAGMENT ATOMS AND ALL FRAGMENTS ENERGY MINIMIZATION JOB


    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01C1               -0.717119     0.013446    -0.000001
A02O2                0.678635    -0.063043    -0.000001
A03H3               -1.094134     0.520396     0.883227
A04H4               -1.094993    -0.998593    -0.000048
A05H5               -1.094156     0.520490    -0.883163
A06H6                1.051482     0.798141     0.100000
A01O1                3.385297    -0.881097    -0.712522
A02H2                3.508717    -0.111154    -0.187517
A03H3                3.727102    -1.600315    -0.212951
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0072203229
           POLARIZATION ENERGY    -0.0007178228
             DISPERSION ENERGY    -0.0023411920
     EXCHANGE REPULSION ENERGY     0.0061976931
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006309743
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6649093628

                  TOTAL ENERGY  -115.6551813358


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0186107320
              MAXIMUM GRADIENT     0.0513860705



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.737732     0.000902     0.000009
A02O2                0.732007    -0.071912    -0.001306
A03H3               -1.096711     0.554051     0.920275
A04H4               -1.098010    -1.040442     0.000365
A05H5               -1.099228     0.552716    -0.920070
A06H6                1.025755     0.796594     0.101579
A01O1                3.387425    -0.873765    -0.714887
A02H2                3.503714    -0.100822    -0.192671
A03H3                3.726267    -1.589501    -0.208346
A01O1                4.397361    -3.909980    -0.700376
A02H2                4.542773    -3.145632    -0.172832
A03H3                3.579244    -4.276096    -0.416971


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0068699733
           POLARIZATION ENERGY    -0.0007215221
             DISPERSION ENERGY    -0.0023528491
     EXCHANGE REPULSION ENERGY     0.0060689331
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006218396
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6747970581

                  TOTAL ENERGY  -115.6655543625


                 ENERGY CHANGE    -0.0103730267
                  RMS GRADIENT     0.0088214873
              MAXIMUM GRADIENT     0.0268994210



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.736909     0.005692    -0.000796
A02O2                0.731920    -0.096567    -0.003647
A03H3               -1.087670     0.563590     0.922173
A04H4               -1.094146    -1.051407     0.000681
A05H5               -1.093506     0.560804    -0.921452
A06H6                1.002426     0.810956     0.104811
A01O1                3.390274    -0.867255    -0.717462
A02H2                3.498817    -0.091509    -0.197740
A03H3                3.725915    -1.579570    -0.204016
A01O1                4.400502    -3.919299    -0.700742
A02H2                4.567186    -3.160624    -0.171305
A03H3                3.578355    -4.270232    -0.409890


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0065605908
           POLARIZATION ENERGY    -0.0006895208
             DISPERSION ENERGY    -0.0023397064
     EXCHANGE REPULSION ENERGY     0.0058360905
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005977697
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6760177612

                  TOTAL ENERGY  -115.6672480768


                 ENERGY CHANGE    -0.0016937143
                  RMS GRADIENT     0.0089806419
              MAXIMUM GRADIENT     0.0238186653



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.733365     0.004756    -0.007200
A02O2                0.697903    -0.101719     0.000998
A03H3               -1.006349     0.591272     0.885555
A04H4               -1.066548    -1.056883     0.002949
A05H5               -1.035856     0.582316    -0.883590
A06H6                0.837640     0.781549     0.109683
A01O1                3.412726    -0.824284    -0.735669
A02H2                3.470509    -0.031632    -0.233634
A03H3                3.720243    -1.514997    -0.177079
A01O1                4.421219    -3.980843    -0.703082
A02H2                4.729121    -3.273175    -0.166354
A03H3                3.581540    -4.227867    -0.360164


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0048822129
           POLARIZATION ENERGY    -0.0004720582
             DISPERSION ENERGY    -0.0021422103
     EXCHANGE REPULSION ENERGY     0.0042770036
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004392198
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6878204346

                  TOTAL ENERGY  -115.6817147064


                 ENERGY CHANGE    -0.0144666296
                  RMS GRADIENT     0.0160570016
              MAXIMUM GRADIENT     0.0485615439



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.725408     0.002141    -0.008274
A02O2                0.687648    -0.101985     0.002620
A03H3               -0.980574     0.601882     0.876199
A04H4               -1.059327    -1.058644     0.003727
A05H5               -1.017239     0.591454    -0.874031
A06H6                0.778258     0.769317     0.110481
A01O1                3.420778    -0.809499    -0.741977
A02H2                3.461664    -0.011364    -0.247020
A03H3                3.716949    -1.492773    -0.168309
A01O1                4.428270    -4.001745    -0.703814
A02H2                4.782701    -3.316789    -0.166332
A03H3                3.586702    -4.213712    -0.342555


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0044466113
           POLARIZATION ENERGY    -0.0004170066
             DISPERSION ENERGY    -0.0020851427
     EXCHANGE REPULSION ENERGY     0.0039324179
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004038079
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6879730225

                  TOTAL ENERGY  -115.6824999505


                 ENERGY CHANGE    -0.0007852441
                  RMS GRADIENT     0.0156429490
              MAXIMUM GRADIENT     0.0469355635



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.713239    -0.004454    -0.005412
A02O2                0.690215    -0.102071     0.000782
A03H3               -0.995411     0.598062     0.885450
A04H4               -1.067625    -1.052913     0.003551
A05H5               -1.026249     0.589160    -0.883586
A06H6                0.797842     0.775718     0.109438
A01O1                3.419489    -0.813664    -0.740645
A02H2                3.464480    -0.017359    -0.243103
A03H3                3.717825    -1.499443    -0.171103
A01O1                4.426358    -3.996117    -0.703620
A02H2                4.769002    -3.304854    -0.166568
A03H3                3.584962    -4.216659    -0.347125


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0045576919
           POLARIZATION ENERGY    -0.0004291903
             DISPERSION ENERGY    -0.0021092770
     EXCHANGE REPULSION ENERGY     0.0040661042
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004177960
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6911315918

                  TOTAL ENERGY  -115.6854640590


                 ENERGY CHANGE    -0.0029641086
                  RMS GRADIENT     0.0073317737
              MAXIMUM GRADIENT     0.0226810779



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.699768    -0.009765    -0.004422
A02O2                0.698962    -0.107965    -0.000314
A03H3               -1.002653     0.599180     0.896529
A04H4               -1.075983    -1.048844     0.003877
A05H5               -1.027960     0.590972    -0.892268
A06H6                0.789398     0.780845     0.107641
A01O1                3.423236    -0.810480    -0.742896
A02H2                3.463436    -0.013637    -0.245804
A03H3                3.716827    -1.495524    -0.170014
A01O1                4.428009    -4.001083    -0.703787
A02H2                4.782814    -3.315597    -0.167226
A03H3                3.586111    -4.211758    -0.342542


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0044596296
           POLARIZATION ENERGY    -0.0004228202
             DISPERSION ENERGY    -0.0021144701
     EXCHANGE REPULSION ENERGY     0.0040815380
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004194267
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923904419

                  TOTAL ENERGY  -115.6868059913


                 ENERGY CHANGE    -0.0013419323
                  RMS GRADIENT     0.0059888850
              MAXIMUM GRADIENT     0.0151968561



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.682413    -0.010270    -0.002926
A02O2                0.707925    -0.104554     0.000207
A03H3               -1.015365     0.590973     0.907209
A04H4               -1.089387    -1.035262     0.004441
A05H5               -1.030369     0.585115    -0.899175
A06H6                0.786517     0.779684     0.102476
A01O1                3.429272    -0.807451    -0.746125
A02H2                3.463393    -0.010786    -0.248293
A03H3                3.715702    -1.492722    -0.169900
A01O1                4.429753    -4.006408    -0.703958
A02H2                4.798627    -3.327453    -0.168582
A03H3                3.587280    -4.205020    -0.337263


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0043592357
           POLARIZATION ENERGY    -0.0004130480
             DISPERSION ENERGY    -0.0021135795
     EXCHANGE REPULSION ENERGY     0.0040747361
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004184408
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6929168701

                  TOTAL ENERGY  -115.6874279666


                 ENERGY CHANGE    -0.0006219753
                  RMS GRADIENT     0.0061156647
              MAXIMUM GRADIENT     0.0174258346



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.681601    -0.008561    -0.001772
A02O2                0.713533    -0.108769     0.000988
A03H3               -1.015677     0.587806     0.909473
A04H4               -1.093398    -1.030492     0.004731
A05H5               -1.027316     0.583847    -0.900326
A06H6                0.776998     0.782991     0.100157
A01O1                3.433948    -0.803737    -0.748871
A02H2                3.462303    -0.006478    -0.251630
A03H3                3.714505    -1.488190    -0.168797
A01O1                4.431698    -4.012262    -0.704146
A02H2                4.814631    -3.340563    -0.169489
A03H3                3.589049    -4.199359    -0.331841


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0042529904
           POLARIZATION ENERGY    -0.0004040518
             DISPERSION ENERGY    -0.0021026901
     EXCHANGE REPULSION ENERGY     0.0040119963
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004112357
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6930999756

                  TOTAL ENERGY  -115.6877529665


                 ENERGY CHANGE    -0.0003249999
                  RMS GRADIENT     0.0037202129
              MAXIMUM GRADIENT     0.0117697395



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.683062    -0.005489     0.000133
A02O2                0.716136    -0.109735     0.003534
A03H3               -1.015262     0.579485     0.909160
A04H4               -1.098547    -1.020555     0.004997
A05H5               -1.021603     0.579209    -0.898601
A06H6                0.768306     0.785575     0.095564
A01O1                3.441341    -0.799004    -0.752999
A02H2                3.461478    -0.001377    -0.255948
A03H3                3.712791    -1.482947    -0.168010
A01O1                4.434271    -4.020053    -0.704386
A02H2                4.836261    -3.358464    -0.171114
A03H3                3.591637    -4.191138    -0.324423


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0041193380
           POLARIZATION ENERGY    -0.0003884105
             DISPERSION ENERGY    -0.0020775794
     EXCHANGE REPULSION ENERGY     0.0038813535
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003965392
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6931610107

                  TOTAL ENERGY  -115.6880228484


                 ENERGY CHANGE    -0.0002698819
                  RMS GRADIENT     0.0034535620
              MAXIMUM GRADIENT     0.0109722785



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.684275    -0.004034     0.002355
A02O2                0.715931    -0.107863     0.008850
A03H3               -1.016291     0.569067     0.912207
A04H4               -1.107425    -1.009805     0.005002
A05H5               -1.013539     0.574570    -0.898308
A06H6                0.760740     0.789262     0.087216
A01O1                3.453909    -0.791968    -0.759836
A02H2                3.460901     0.005690    -0.262475
A03H3                3.709733    -1.475885    -0.167817
A01O1                4.438172    -4.031930    -0.704724
A02H2                4.869112    -3.386641    -0.174095
A03H3                3.596274    -4.178186    -0.312945


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0039315005
           POLARIZATION ENERGY    -0.0003620394
             DISPERSION ENERGY    -0.0020328539
     EXCHANGE REPULSION ENERGY     0.0036627053
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003721763
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6929931641

                  TOTAL ENERGY  -115.6881660278


                 ENERGY CHANGE    -0.0001431793
                  RMS GRADIENT     0.0035604894
              MAXIMUM GRADIENT     0.0102976750



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.693943    -0.002133     0.010016
A02O2                0.715022    -0.100347     0.024836
A03H3               -1.021093     0.551479     0.925526
A04H4               -1.130582    -1.002156     0.003299
A05H5               -0.996673     0.572307    -0.904252
A06H6                0.753078     0.799247     0.064807
A01O1                3.489042    -0.774471    -0.778560
A02H2                3.460974     0.021699    -0.279561
A03H3                3.699504    -1.460651    -0.171487
A01O1                4.447949    -4.061878    -0.705432
A02H2                4.949240    -3.462131    -0.183237
A03H3                3.612052    -4.146073    -0.283696


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0035348545
           POLARIZATION ENERGY    -0.0003015073
             DISPERSION ENERGY    -0.0019127668
     EXCHANGE REPULSION ENERGY     0.0031296265
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003124175
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923065186

                  TOTAL ENERGY  -115.6881687291


                 ENERGY CHANGE    -0.0000027013
                  RMS GRADIENT     0.0047550265
              MAXIMUM GRADIENT     0.0140940560



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.693743    -0.001997     0.010364
A02O2                0.714024    -0.100271     0.025695
A03H3               -1.021068     0.550844     0.925963
A04H4               -1.131487    -1.001845     0.003174
A05H5               -0.995673     0.572363    -0.904235
A06H6                0.751894     0.799759     0.063710
A01O1                3.491236    -0.773238    -0.779756
A02H2                3.460871     0.022888    -0.280821
A03H3                3.698702    -1.459501    -0.171747
A01O1                4.448612    -4.063897    -0.705473
A02H2                4.954338    -3.467400    -0.183835
A03H3                3.613331    -4.144194    -0.281761


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0035116539
           POLARIZATION ENERGY    -0.0002975094
             DISPERSION ENERGY    -0.0019051885
     EXCHANGE REPULSION ENERGY     0.0030981677
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003088866
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922683716

                  TOTAL ENERGY  -115.6881701345


                 ENERGY CHANGE    -0.0000014054
                  RMS GRADIENT     0.0046668657
              MAXIMUM GRADIENT     0.0130339122



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.694662    -0.002798     0.012194
A02O2                0.710314    -0.098914     0.030054
A03H3               -1.022220     0.548908     0.928755
A04H4               -1.135413    -1.001179     0.002273
A05H5               -0.992242     0.573631    -0.904832
A06H6                0.748828     0.801471     0.058440
A01O1                3.502532    -0.767417    -0.785860
A02H2                3.460647     0.028041    -0.286693
A03H3                3.694350    -1.454728    -0.173909
A01O1                4.451756    -4.073554    -0.705639
A02H2                4.978259    -3.492783    -0.186819
A03H3                3.619716    -4.135395    -0.272556


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0034071128
           POLARIZATION ENERGY    -0.0002791200
             DISPERSION ENERGY    -0.0018675198
     EXCHANGE REPULSION ENERGY     0.0029461945
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002918119
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6920928955

                  TOTAL ENERGY  -115.6881780399


                 ENERGY CHANGE    -0.0000079054
                  RMS GRADIENT     0.0040089624
              MAXIMUM GRADIENT     0.0097877203



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.694728    -0.002825     0.012276
A02O2                0.710150    -0.098853     0.030279
A03H3               -1.022329     0.548863     0.928874
A04H4               -1.135585    -1.001194     0.002216
A05H5               -0.992139     0.573717    -0.904829
A06H6                0.748731     0.801533     0.058189
A01O1                3.503154    -0.767108    -0.786197
A02H2                3.460637     0.028293    -0.286994
A03H3                3.694086    -1.454505    -0.174065
A01O1                4.451920    -4.074065    -0.705645
A02H2                4.979485    -3.494126    -0.186973
A03H3                3.620064    -4.134963    -0.272078


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0034018597
           POLARIZATION ENERGY    -0.0002781827
             DISPERSION ENERGY    -0.0018655364
     EXCHANGE REPULSION ENERGY     0.0029383714
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002909281
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6920852661

                  TOTAL ENERGY  -115.6881796822


                 ENERGY CHANGE    -0.0000016423
                  RMS GRADIENT     0.0039798623
              MAXIMUM GRADIENT     0.0096674272



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.690039    -0.004695     0.011907
A02O2                0.705034    -0.094864     0.031211
A03H3               -1.024189     0.551662     0.929989
A04H4               -1.134983    -1.004031     0.001678
A05H5               -0.994212     0.575800    -0.905202
A06H6                0.751055     0.797666     0.057777
A01O1                3.505225    -0.766547    -0.787342
A02H2                3.460732     0.028145    -0.287184
A03H3                3.692872    -1.454937    -0.175311
A01O1                4.452211    -4.075116    -0.705615
A02H2                4.981467    -3.496486    -0.187204
A03H3                3.620639    -4.134465    -0.271288


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033920807
           POLARIZATION ENERGY    -0.0002723836
             DISPERSION ENERGY    -0.0018578641
     EXCHANGE REPULSION ENERGY     0.0029094416
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002877706
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6921081543

                  TOTAL ENERGY  -115.6882246502


                 ENERGY CHANGE    -0.0000449680
                  RMS GRADIENT     0.0056950719
              MAXIMUM GRADIENT     0.0192437085



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.690793    -0.005162     0.011834
A02O2                0.704573    -0.096981     0.031426
A03H3               -1.024618     0.552350     0.929965
A04H4               -1.134503    -1.004658     0.001509
A05H5               -0.994739     0.576281    -0.905013
A06H6                0.752245     0.799812     0.057762
A01O1                3.505944    -0.766349    -0.787742
A02H2                3.460762     0.028093    -0.287247
A03H3                3.692439    -1.455091    -0.175754
A01O1                4.452312    -4.075484    -0.705604
A02H2                4.982156    -3.497313    -0.187282
A03H3                3.620842    -4.134299    -0.271010


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033886383
           POLARIZATION ENERGY    -0.0002716633
             DISPERSION ENERGY    -0.0018561587
     EXCHANGE REPULSION ENERGY     0.0029015367
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002868061
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922302246

                  TOTAL ENERGY  -115.6883546777


                 ENERGY CHANGE    -0.0001300275
                  RMS GRADIENT     0.0025517852
              MAXIMUM GRADIENT     0.0061585698



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.691412    -0.006452     0.011657
A02O2                0.702831    -0.098356     0.032184
A03H3               -1.025919     0.554503     0.930080
A04H4               -1.133322    -1.006675     0.001012
A05H5               -0.996312     0.577839    -0.904638
A06H6                0.754837     0.801086     0.057550
A01O1                3.508054    -0.765766    -0.788912
A02H2                3.460854     0.027937    -0.287433
A03H3                3.691158    -1.455545    -0.177068
A01O1                4.452610    -4.076563    -0.705571
A02H2                4.984171    -3.499736    -0.187510
A03H3                3.621438    -4.133818    -0.270198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033785439
           POLARIZATION ENERGY    -0.0002685964
             DISPERSION ENERGY    -0.0018499843
     EXCHANGE REPULSION ENERGY     0.0028762531
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002838766
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922378540

                  TOTAL ENERGY  -115.6883855144


                 ENERGY CHANGE    -0.0000308366
                  RMS GRADIENT     0.0024289794
              MAXIMUM GRADIENT     0.0059888309



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.691908    -0.006877     0.011621
A02O2                0.702350    -0.098548     0.032537
A03H3               -1.026450     0.555428     0.930030
A04H4               -1.132780    -1.007563     0.000790
A05H5               -0.996969     0.578514    -0.904405
A06H6                0.755780     0.801131     0.057440
A01O1                3.509033    -0.765493    -0.789456
A02H2                3.460896     0.027863    -0.287516
A03H3                3.690552    -1.455760    -0.177690
A01O1                4.452748    -4.077065    -0.705556
A02H2                4.985104    -3.500863    -0.187614
A03H3                3.621717    -4.133601    -0.269820


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033738303
           POLARIZATION ENERGY    -0.0002672843
             DISPERSION ENERGY    -0.0018470988
     EXCHANGE REPULSION ENERGY     0.0028647422
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002825461
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922378540

                  TOTAL ENERGY  -115.6883962107


                 ENERGY CHANGE    -0.0000106963
                  RMS GRADIENT     0.0026151426
              MAXIMUM GRADIENT     0.0075699710



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.693488    -0.007529     0.011655
A02O2                0.701508    -0.098835     0.033481
A03H3               -1.027781     0.557763     0.929594
A04H4               -1.131306    -1.009916     0.000200
A05H5               -0.998646     0.580231    -0.903583
A06H6                0.757825     0.800764     0.057139
A01O1                3.511794    -0.764713    -0.790994
A02H2                3.461008     0.027647    -0.287744
A03H3                3.688795    -1.456379    -0.179485
A01O1                4.453139    -4.078484    -0.705509
A02H2                4.987723    -3.504046    -0.187902
A03H3                3.622510    -4.133012    -0.268751


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033604499
           POLARIZATION ENERGY    -0.0002638314
             DISPERSION ENERGY    -0.0018392175
     EXCHANGE REPULSION ENERGY     0.0028336410
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002789242
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884104773


                 ENERGY CHANGE    -0.0000142666
                  RMS GRADIENT     0.0027971757
              MAXIMUM GRADIENT     0.0093223888



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.693809    -0.007566     0.011706
A02O2                0.701285    -0.098929     0.033722
A03H3               -1.028126     0.558325     0.929395
A04H4               -1.130922    -1.010500     0.000050
A05H5               -0.999074     0.580649    -0.903314
A06H6                0.758214     0.800612     0.057062
A01O1                3.512580    -0.764487    -0.791435
A02H2                3.461037     0.027581    -0.287802
A03H3                3.688271    -1.456564    -0.180013
A01O1                4.453250    -4.078890    -0.705495
A02H2                4.988463    -3.504955    -0.187981
A03H3                3.622738    -4.132857    -0.268445


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033565930
           POLARIZATION ENERGY    -0.0002628608
             DISPERSION ENERGY    -0.0018370827
     EXCHANGE REPULSION ENERGY     0.0028252787
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002779376
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922149658

                  TOTAL ENERGY  -115.6884109752


                 ENERGY CHANGE    -0.0000004979
                  RMS GRADIENT     0.0028221143
              MAXIMUM GRADIENT     0.0095295597



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.693812    -0.007566     0.011707
A02O2                0.701283    -0.098930     0.033724
A03H3               -1.028129     0.558330     0.929392
A04H4               -1.130919    -1.010504     0.000049
A05H5               -0.999077     0.580652    -0.903311
A06H6                0.758216     0.800610     0.057061
A01O1                3.512588    -0.764485    -0.791439
A02H2                3.461037     0.027580    -0.287802
A03H3                3.688265    -1.456566    -0.180018
A01O1                4.453251    -4.078894    -0.705494
A02H2                4.988471    -3.504964    -0.187982
A03H3                3.622741    -4.132855    -0.268442


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033565531
           POLARIZATION ENERGY    -0.0002628515
             DISPERSION ENERGY    -0.0018370620
     EXCHANGE REPULSION ENERGY     0.0028251986
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002779281
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922149658

                  TOTAL ENERGY  -115.6884110556


                 ENERGY CHANGE    -0.0000000804
                  RMS GRADIENT     0.0028220863
              MAXIMUM GRADIENT     0.0095305705



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.694334    -0.007283     0.011832
A02O2                0.701712    -0.097843     0.033902
A03H3               -1.028241     0.558586     0.929067
A04H4               -1.130666    -1.010800    -0.000038
A05H5               -0.999244     0.580860    -0.903018
A06H6                0.757947     0.799152     0.056975
A01O1                3.513154    -0.764315    -0.791760
A02H2                3.461064     0.027529    -0.287831
A03H3                3.687856    -1.456711    -0.180416
A01O1                4.453331    -4.079189    -0.705483
A02H2                4.988999    -3.505620    -0.188034
A03H3                3.622907    -4.132757    -0.268219


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033537133
           POLARIZATION ENERGY    -0.0002622706
             DISPERSION ENERGY    -0.0018354011
     EXCHANGE REPULSION ENERGY     0.0028193363
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002772503
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922302246

                  TOTAL ENERGY  -115.6884320970


                 ENERGY CHANGE    -0.0000210414
                  RMS GRADIENT     0.0017178431
              MAXIMUM GRADIENT     0.0049452941



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695575    -0.006664     0.012102
A02O2                0.702348    -0.097401     0.034258
A03H3               -1.028561     0.559136     0.928297
A04H4               -1.130038    -1.011452    -0.000235
A05H5               -0.999682     0.581287    -0.902310
A06H6                0.757757     0.797952     0.056839
A01O1                3.514494    -0.763914    -0.792520
A02H2                3.461115     0.027404    -0.287901
A03H3                3.686883    -1.457054    -0.181363
A01O1                4.453522    -4.079888    -0.705455
A02H2                4.990248    -3.507172    -0.188157
A03H3                3.623301    -4.132528    -0.267692


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033469788
           POLARIZATION ENERGY    -0.0002610342
             DISPERSION ENERGY    -0.0018319655
     EXCHANGE REPULSION ENERGY     0.0028063346
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002756878
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884379692


                 ENERGY CHANGE    -0.0000058723
                  RMS GRADIENT     0.0019307497
              MAXIMUM GRADIENT     0.0051637152



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 24 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695586    -0.006658     0.012105
A02O2                0.702352    -0.097402     0.034262
A03H3               -1.028565     0.559143     0.928289
A04H4               -1.130031    -1.011460    -0.000238
A05H5               -0.999688     0.581293    -0.902302
A06H6                0.757757     0.797944     0.056837
A01O1                3.514511    -0.763909    -0.792530
A02H2                3.461116     0.027403    -0.287902
A03H3                3.686871    -1.457059    -0.181375
A01O1                4.453524    -4.079896    -0.705455
A02H2                4.990263    -3.507192    -0.188159
A03H3                3.623306    -4.132525    -0.267685


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033468947
           POLARIZATION ENERGY    -0.0002610176
             DISPERSION ENERGY    -0.0018319241
     EXCHANGE REPULSION ENERGY     0.0028061756
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002756685
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884381351


                 ENERGY CHANGE    -0.0000001659
                  RMS GRADIENT     0.0019328129
              MAXIMUM GRADIENT     0.0051795175



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 25 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695587    -0.006658     0.012105
A02O2                0.702352    -0.097402     0.034262
A03H3               -1.028565     0.559143     0.928288
A04H4               -1.130030    -1.011460    -0.000238
A05H5               -0.999688     0.581293    -0.902302
A06H6                0.757757     0.797944     0.056837
A01O1                3.514512    -0.763909    -0.792530
A02H2                3.461116     0.027403    -0.287902
A03H3                3.686870    -1.457059    -0.181375
A01O1                4.453524    -4.079897    -0.705455
A02H2                4.990264    -3.507193    -0.188159
A03H3                3.623306    -4.132525    -0.267685


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033468913
           POLARIZATION ENERGY    -0.0002610169
             DISPERSION ENERGY    -0.0018319224
     EXCHANGE REPULSION ENERGY     0.0028061692
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002756677
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884381417


                 ENERGY CHANGE    -0.0000000066
                  RMS GRADIENT     0.0019327715
              MAXIMUM GRADIENT     0.0051794010



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 26 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695587    -0.006657     0.012105
A02O2                0.702352    -0.097402     0.034262
A03H3               -1.028565     0.559143     0.928288
A04H4               -1.130030    -1.011460    -0.000238
A05H5               -0.999688     0.581293    -0.902302
A06H6                0.757757     0.797944     0.056837
A01O1                3.514512    -0.763909    -0.792530
A02H2                3.461116     0.027403    -0.287902
A03H3                3.686870    -1.457059    -0.181375
A01O1                4.453524    -4.079897    -0.705455
A02H2                4.990264    -3.507193    -0.188159
A03H3                3.623306    -4.132525    -0.267685


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033468908
           POLARIZATION ENERGY    -0.0002610167
             DISPERSION ENERGY    -0.0018319222
     EXCHANGE REPULSION ENERGY     0.0028061683
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002756676
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884381427


                 ENERGY CHANGE    -0.0000000010
                  RMS GRADIENT     0.0019327623
              MAXIMUM GRADIENT     0.0051793766



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 27 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695770    -0.006539     0.012168
A02O2                0.702264    -0.097992     0.034347
A03H3               -1.028711     0.559306     0.928092
A04H4               -1.129843    -1.011629    -0.000293
A05H5               -0.999856     0.581412    -0.902108
A06H6                0.757867     0.798361     0.056818
A01O1                3.514929    -0.763783    -0.792768
A02H2                3.461128     0.027362    -0.287923
A03H3                3.686559    -1.457168    -0.181675
A01O1                4.453584    -4.080115    -0.705446
A02H2                4.990651    -3.507676    -0.188196
A03H3                3.623429    -4.132458    -0.267520


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033447806
           POLARIZATION ENERGY    -0.0002605982
             DISPERSION ENERGY    -0.0018310184
     EXCHANGE REPULSION ENERGY     0.0028024139
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002751961
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884422135


                 ENERGY CHANGE    -0.0000040707
                  RMS GRADIENT     0.0015395119
              MAXIMUM GRADIENT     0.0049638497



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 28 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695776    -0.006534     0.012171
A02O2                0.702260    -0.098006     0.034352
A03H3               -1.028718     0.559314     0.928083
A04H4               -1.129835    -1.011638    -0.000296
A05H5               -0.999864     0.581418    -0.902099
A06H6                0.757870     0.798367     0.056817
A01O1                3.514950    -0.763777    -0.792780
A02H2                3.461129     0.027360    -0.287924
A03H3                3.686544    -1.457174    -0.181690
A01O1                4.453587    -4.080126    -0.705445
A02H2                4.990670    -3.507700    -0.188198
A03H3                3.623436    -4.132455    -0.267512


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033446746
           POLARIZATION ENERGY    -0.0002605751
             DISPERSION ENERGY    -0.0018309694
     EXCHANGE REPULSION ENERGY     0.0028022193
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002751722
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884424179


                 ENERGY CHANGE    -0.0000002045
                  RMS GRADIENT     0.0015356262
              MAXIMUM GRADIENT     0.0049639716



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 29 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695776    -0.006534     0.012171
A02O2                0.702260    -0.098006     0.034352
A03H3               -1.028719     0.559315     0.928083
A04H4               -1.129834    -1.011638    -0.000296
A05H5               -0.999864     0.581419    -0.902099
A06H6                0.757870     0.798367     0.056817
A01O1                3.514950    -0.763777    -0.792780
A02H2                3.461129     0.027360    -0.287924
A03H3                3.686543    -1.457174    -0.181691
A01O1                4.453587    -4.080126    -0.705445
A02H2                4.990670    -3.507700    -0.188198
A03H3                3.623436    -4.132455    -0.267512


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033446724
           POLARIZATION ENERGY    -0.0002605746
             DISPERSION ENERGY    -0.0018309684
     EXCHANGE REPULSION ENERGY     0.0028022153
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002751717
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884424222


                 ENERGY CHANGE    -0.0000000043
                  RMS GRADIENT     0.0015355770
              MAXIMUM GRADIENT     0.0049639742



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 30 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695776    -0.006534     0.012171
A02O2                0.702260    -0.098006     0.034352
A03H3               -1.028719     0.559315     0.928083
A04H4               -1.129834    -1.011638    -0.000296
A05H5               -0.999864     0.581419    -0.902099
A06H6                0.757870     0.798367     0.056817
A01O1                3.514950    -0.763777    -0.792780
A02H2                3.461129     0.027360    -0.287924
A03H3                3.686543    -1.457174    -0.181691
A01O1                4.453587    -4.080126    -0.705445
A02H2                4.990670    -3.507701    -0.188198
A03H3                3.623436    -4.132455    -0.267512


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033446723
           POLARIZATION ENERGY    -0.0002605745
             DISPERSION ENERGY    -0.0018309683
     EXCHANGE REPULSION ENERGY     0.0028022151
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002751717
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884424223


                 ENERGY CHANGE    -0.0000000001
                  RMS GRADIENT     0.0015355736
              MAXIMUM GRADIENT     0.0049639743



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 31 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.695776    -0.006534     0.012171
A02O2                0.702260    -0.098006     0.034352
A03H3               -1.028719     0.559315     0.928083
A04H4               -1.129834    -1.011638    -0.000296
A05H5               -0.999864     0.581419    -0.902099
A06H6                0.757870     0.798367     0.056817
A01O1                3.514950    -0.763777    -0.792780
A02H2                3.461129     0.027360    -0.287924
A03H3                3.686543    -1.457174    -0.181691
A01O1                4.453587    -4.080126    -0.705445
A02H2                4.990670    -3.507701    -0.188198
A03H3                3.623436    -4.132455    -0.267512


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033446723
           POLARIZATION ENERGY    -0.0002605745
             DISPERSION ENERGY    -0.0018309683
     EXCHANGE REPULSION ENERGY     0.0028022151
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002751717
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922225952

                  TOTAL ENERGY  -115.6884424223


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0015355736
              MAXIMUM GRADIENT     0.0049639743



L-BFGS-B is unable to make an optimization step

OPTIMIZATION HAS NOT CONVERGED
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:44 2025
TOTAL RUN TIME IS 1 SECONDS
