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
WALL CLOCK TIME IS Thu May 29 00:29:42 2025

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
max_steps 100
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
enable_elpot false
opt_special_frag 1
torch_nn ani1.pt
ml_path ../nnlib/
userml_path .
custom_nn custom_model_script.pt
aev_nn aev_scripted.pt
atom_gradient frag
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


Chosen nn_type: ani1.pt
The location of NN potential is: ../nnlib/
Model loaded from: ../nnlib/ANI1x_saved2.pt

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

          ELECTROSTATIC ENERGY     0.0111974555
           POLARIZATION ENERGY    -0.0008904092
             DISPERSION ENERGY    -0.0023411920
     EXCHANGE REPULSION ENERGY     0.0061976931
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006309743
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6797036886

                  TOTAL ENERGY  -115.6661711155


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0070589947
              MAXIMUM GRADIENT     0.0218586641



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.717877     0.018698     0.001026
A02O2                0.681461    -0.084945    -0.000204
A03H3               -1.100380     0.524274     0.890658
A04H4               -1.097105    -1.006544     0.000119
A05H5               -1.099597     0.524067    -0.891048
A06H6                1.057513     0.816968     0.101336
A01O1                3.387350    -0.874024    -0.714804
A02H2                3.503889    -0.101186    -0.192487
A03H3                3.726298    -1.589883    -0.208508
A01O1                4.397242    -3.909628    -0.700363
A02H2                4.541881    -3.145074    -0.172905
A03H3                3.579274    -4.276283    -0.417227


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0109522772
           POLARIZATION ENERGY    -0.0008582265
             DISPERSION ENERGY    -0.0023266546
     EXCHANGE REPULSION ENERGY     0.0059286713
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006038137
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802122609

                  TOTAL ENERGY  -115.6671200072


                 ENERGY CHANGE    -0.0009488917
                  RMS GRADIENT     0.0059854849
              MAXIMUM GRADIENT     0.0172823475



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.720317     0.017792     0.001010
A02O2                0.687128    -0.080774     0.001713
A03H3               -1.102796     0.525897     0.893410
A04H4               -1.098034    -1.007657     0.000275
A05H5               -1.101464     0.525318    -0.893655
A06H6                1.055777     0.812989     0.100347
A01O1                3.388884    -0.869825    -0.716265
A02H2                3.501499    -0.095455    -0.195360
A03H3                3.725643    -1.583939    -0.206059
A01O1                4.399180    -3.915380    -0.700581
A02H2                4.556891    -3.154303    -0.171843
A03H3                3.578711    -4.272785    -0.412888


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0107496653
           POLARIZATION ENERGY    -0.0008380029
             DISPERSION ENERGY    -0.0023107479
     EXCHANGE REPULSION ENERGY     0.0057568311
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005872723
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805658885

                  TOTAL ENERGY  -115.6677954154


                 ENERGY CHANGE    -0.0006754081
                  RMS GRADIENT     0.0037099212
              MAXIMUM GRADIENT     0.0088597588



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.724075     0.017384     0.001603
A02O2                0.694770    -0.074410     0.007746
A03H3               -1.110480     0.529948     0.900162
A04H4               -1.100693    -1.011223     0.000865
A05H5               -1.106914     0.528150    -0.900302
A06H6                1.053386     0.807761     0.097723
A01O1                3.395104    -0.854505    -0.721871
A02H2                3.493153    -0.074695    -0.206161
A03H3                3.722860    -1.562342    -0.197260
A01O1                4.406311    -3.936544    -0.701377
A02H2                4.612724    -3.190011    -0.168688
A03H3                3.577649    -4.258991    -0.396380


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0100254431
           POLARIZATION ENERGY    -0.0007621589
             DISPERSION ENERGY    -0.0022498643
     EXCHANGE REPULSION ENERGY     0.0051732377
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005299466
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805100278

                  TOTAL ENERGY  -115.6688533167


                 ENERGY CHANGE    -0.0010579014
                  RMS GRADIENT     0.0037197237
              MAXIMUM GRADIENT     0.0112054577



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.729034     0.018485     0.002788
A02O2                0.695666    -0.070983     0.015636
A03H3               -1.119179     0.532865     0.904445
A04H4               -1.103105    -1.012953     0.001769
A05H5               -1.111892     0.529304    -0.904463
A06H6                1.052623     0.806795     0.094544
A01O1                3.404894    -0.833671    -0.730021
A02H2                3.483219    -0.046981    -0.221436
A03H3                3.717894    -1.533456    -0.185957
A01O1                4.416064    -3.965502    -0.702425
A02H2                4.689674    -3.243536    -0.166163
A03H3                3.579200    -4.238598    -0.372650


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0091182966
           POLARIZATION ENERGY    -0.0006687295
             DISPERSION ENERGY    -0.0021637922
     EXCHANGE REPULSION ENERGY     0.0045029121
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004628666
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802255797

                  TOTAL ENERGY  -115.6698997593


                 ENERGY CHANGE    -0.0010464426
                  RMS GRADIENT     0.0051383390
              MAXIMUM GRADIENT     0.0169744617



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.742310     0.022099     0.008050
A02O2                0.682219    -0.063671     0.038492
A03H3               -1.140659     0.535805     0.905135
A04H4               -1.108236    -1.009072     0.004842
A05H5               -1.120239     0.527115    -0.905083
A06H6                1.050724     0.808962     0.084564
A01O1                3.437641    -0.776305    -0.754523
A02H2                3.464341     0.026782    -0.266658
A03H3                3.697339    -1.456548    -0.159963
A01O1                4.442927    -4.044861    -0.704884
A02H2                4.894326    -3.418377    -0.168759
A03H3                3.604169    -4.182148    -0.303248


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0071305289
           POLARIZATION ENERGY    -0.0004806682
             DISPERSION ENERGY    -0.0019320583
     EXCHANGE REPULSION ENERGY     0.0032518968
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003336259
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801721853

                  TOTAL ENERGY  -115.6725361120


                 ENERGY CHANGE    -0.0026363527
                  RMS GRADIENT     0.0054137812
              MAXIMUM GRADIENT     0.0166621533



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.737571     0.039475     0.008577
A02O2                0.669453    -0.062545     0.061652
A03H3               -1.166806     0.540525     0.901285
A04H4               -1.121796    -1.014285     0.011895
A05H5               -1.118465     0.522521    -0.891493
A06H6                1.031139     0.812242     0.067801
A01O1                3.483504    -0.734881    -0.781546
A02H2                3.476014     0.067474    -0.291807
A03H3                3.673057    -1.419561    -0.165950
A01O1                4.461981    -4.102426    -0.705218
A02H2                5.015004    -3.560162    -0.172498
A03H3                3.637124    -4.160218    -0.258064


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0058641834
           POLARIZATION ENERGY    -0.0003809175
             DISPERSION ENERGY    -0.0017571216
     EXCHANGE REPULSION ENERGY     0.0025922654
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002609279
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6797342933

                  TOTAL ENERGY  -115.6736768114


                 ENERGY CHANGE    -0.0011406994
                  RMS GRADIENT     0.0073939527
              MAXIMUM GRADIENT     0.0204859442



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.755705     0.035533     0.024069
A02O2                0.646260    -0.061129     0.095664
A03H3               -1.199053     0.545134     0.895620
A04H4               -1.130423    -1.001444     0.018766
A05H5               -1.124500     0.521074    -0.888982
A06H6                1.021940     0.824767     0.048547
A01O1                3.542582    -0.660186    -0.818846
A02H2                3.480302     0.157294    -0.358929
A03H3                3.625609    -1.328054    -0.162544
A01O1                4.497521    -4.201434    -0.705996
A02H2                5.206804    -3.850189    -0.198828
A03H3                3.728070    -4.130352    -0.170678


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0044558770
           POLARIZATION ENERGY    -0.0002865519
             DISPERSION ENERGY    -0.0015097088
     EXCHANGE REPULSION ENERGY     0.0018592852
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0001812015
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805379161

                  TOTAL ENERGY  -115.6762002160


                 ENERGY CHANGE    -0.0025234047
                  RMS GRADIENT     0.0029441263
              MAXIMUM GRADIENT     0.0089250515



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.781057     0.035789     0.038925
A02O2                0.620366    -0.052876     0.138817
A03H3               -1.239948     0.551505     0.888421
A04H4               -1.144162    -0.989377     0.029499
A05H5               -1.127036     0.517089    -0.880945
A06H6                1.003556     0.835103     0.024005
A01O1                3.622640    -0.567489    -0.866500
A02H2                3.506621     0.267999    -0.451561
A03H3                3.551768    -1.213185    -0.186994
A01O1                4.544373    -4.320289    -0.704685
A02H2                5.363175    -4.235981    -0.250669
A03H3                3.871088    -4.150041    -0.071142


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0030718757
           POLARIZATION ENERGY    -0.0002262165
             DISPERSION ENERGY    -0.0012503217
     EXCHANGE REPULSION ENERGY     0.0012279767
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0001143375
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804044631

                  TOTAL ENERGY  -115.6776954865


                 ENERGY CHANGE    -0.0014952705
                  RMS GRADIENT     0.0033690678
              MAXIMUM GRADIENT     0.0110460740



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.808964     0.038894     0.061067
A02O2                0.585998    -0.035271     0.196025
A03H3               -1.299684     0.563860     0.883531
A04H4               -1.168971    -0.983328     0.046494
A05H5               -1.130307     0.514438    -0.876666
A06H6                0.972116     0.845956    -0.006219
A01O1                3.738360    -0.438273    -0.932063
A02H2                3.578212     0.425561    -0.597671
A03H3                3.432618    -1.037661    -0.275610
A01O1                4.617967    -4.482172    -0.698777
A02H2                5.444505    -4.767341    -0.353542
A03H3                4.076859    -4.278868     0.042535


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0013627739
           POLARIZATION ENERGY    -0.0001998553
             DISPERSION ENERGY    -0.0009695675
     EXCHANGE REPULSION ENERGY     0.0007051583
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000628003
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6798848293

                  TOTAL ENERGY  -115.6790491201


                 ENERGY CHANGE    -0.0013536336
                  RMS GRADIENT     0.0056446564
              MAXIMUM GRADIENT     0.0174766003



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.859123     0.043611     0.076240
A02O2                0.546686    -0.001173     0.257364
A03H3               -1.370453     0.579755     0.879593
A04H4               -1.200109    -0.977358     0.071185
A05H5               -1.130200     0.506336    -0.867963
A06H6                0.929033     0.854848    -0.026496
A01O1                3.883701    -0.273928    -1.011335
A02H2                3.730507     0.629651    -0.802165
A03H3                3.285466    -0.773020    -0.485316
A01O1                4.728279    -4.690846    -0.684730
A02H2                5.381040    -5.346114    -0.516795
A03H3                4.265852    -4.563845     0.123792


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0000888711
           POLARIZATION ENERGY    -0.0002086764
             DISPERSION ENERGY    -0.0007092054
     EXCHANGE REPULSION ENERGY     0.0004311024
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000374204
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6795843468

                  TOTAL ENERGY  -115.6801974178


                 ENERGY CHANGE    -0.0011482977
                  RMS GRADIENT     0.0051582724
              MAXIMUM GRADIENT     0.0127352507



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.860771     0.047328     0.090177
A02O2                0.530364     0.020444     0.263651
A03H3               -1.385536     0.583843     0.878068
A04H4               -1.212107    -0.985038     0.080435
A05H5               -1.134568     0.507350    -0.880013
A06H6                0.909882     0.850783    -0.016241
A01O1                3.926956    -0.228651    -1.034333
A02H2                3.786333     0.684373    -0.860298
A03H3                3.249951    -0.693216    -0.576602
A01O1                4.761342    -4.751716    -0.679379
A02H2                5.345795    -5.478509    -0.561647
A03H3                4.294969    -4.652510     0.130763


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0002413000
           POLARIZATION ENERGY    -0.0002060760
             DISPERSION ENERGY    -0.0006513269
     EXCHANGE REPULSION ENERGY     0.0003917664
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000336180
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6797126699

                  TOTAL ENERGY  -115.6804532242


                 ENERGY CHANGE    -0.0002558064
                  RMS GRADIENT     0.0045216003
              MAXIMUM GRADIENT     0.0174838608



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.858336     0.048263     0.079176
A02O2                0.538747     0.012352     0.261530
A03H3               -1.380914     0.584700     0.882586
A04H4               -1.209167    -0.986323     0.078645
A05H5               -1.135128     0.506635    -0.877575
A06H6                0.914076     0.853405    -0.016309
A01O1                3.913817    -0.243678    -1.027333
A02H2                3.767381     0.666053    -0.841268
A03H3                3.258986    -0.720642    -0.550492
A01O1                4.750055    -4.731954    -0.681078
A02H2                5.358241    -5.435960    -0.546323
A03H3                4.286697    -4.622975     0.129538


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0002361441
           POLARIZATION ENERGY    -0.0002087355
             DISPERSION ENERGY    -0.0006705040
     EXCHANGE REPULSION ENERGY     0.0004061847
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000350705
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801231298

                  TOTAL ENERGY  -115.6808673992


                 ENERGY CHANGE    -0.0004141750
                  RMS GRADIENT     0.0011096481
              MAXIMUM GRADIENT     0.0026256919



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.858197     0.048637     0.075535
A02O2                0.541908     0.011215     0.259597
A03H3               -1.377065     0.584698     0.884235
A04H4               -1.207860    -0.987342     0.078612
A05H5               -1.137224     0.506210    -0.879730
A06H6                0.914741     0.854233    -0.012477
A01O1                3.909453    -0.247903    -1.025257
A02H2                3.761519     0.660933    -0.836027
A03H3                3.259031    -0.727967    -0.545502
A01O1                4.746771    -4.726681    -0.681486
A02H2                5.361837    -5.423795    -0.542199
A03H3                4.284750    -4.614678     0.129481


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0002459469
           POLARIZATION ENERGY    -0.0002101792
             DISPERSION ENERGY    -0.0006769760
     EXCHANGE REPULSION ENERGY     0.0004127192
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000357169
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801808654

                  TOTAL ENERGY  -115.6809369651


                 ENERGY CHANGE    -0.0000695659
                  RMS GRADIENT     0.0009279118
              MAXIMUM GRADIENT     0.0021989800



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.859032     0.049942     0.071648
A02O2                0.543100     0.011040     0.260642
A03H3               -1.373503     0.585622     0.886408
A04H4               -1.207613    -0.989101     0.080708
A05H5               -1.143534     0.504615    -0.885833
A06H6                0.912219     0.858139    -0.005271
A01O1                3.911831    -0.242861    -1.027247
A02H2                3.765099     0.667094    -0.842513
A03H3                3.248738    -0.718487    -0.560596
A01O1                4.750007    -4.734149    -0.680785
A02H2                5.358411    -5.438152    -0.546996
A03H3                4.289167    -4.624007     0.131107


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0002990356
           POLARIZATION ENERGY    -0.0002129261
             DISPERSION ENERGY    -0.0006735499
     EXCHANGE REPULSION ENERGY     0.0004147465
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000359688
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802331618

                  TOTAL ENERGY  -115.6810398957


                 ENERGY CHANGE    -0.0001029306
                  RMS GRADIENT     0.0011152531
              MAXIMUM GRADIENT     0.0024296894



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.858253     0.049610     0.066353
A02O2                0.544534     0.011354     0.256176
A03H3               -1.364067     0.585732     0.886848
A04H4               -1.204978    -0.988882     0.082495
A05H5               -1.151301     0.500345    -0.891511
A06H6                0.910039     0.863481     0.007904
A01O1                3.908862    -0.243071    -1.026830
A02H2                3.760218     0.666686    -0.842649
A03H3                3.236795    -0.718733    -0.573238
A01O1                4.748939    -4.735599    -0.680534
A02H2                5.359731    -5.437344    -0.545769
A03H3                4.291253    -4.622531     0.132739


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0003551279
           POLARIZATION ENERGY    -0.0002171201
             DISPERSION ENERGY    -0.0006779292
     EXCHANGE REPULSION ENERGY     0.0004247233
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000369898
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802886377

                  TOTAL ENERGY  -115.6811510814


                 ENERGY CHANGE    -0.0001111857
                  RMS GRADIENT     0.0014422292
              MAXIMUM GRADIENT     0.0042779472



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.859781     0.053015     0.059638
A02O2                0.544266     0.011410     0.243401
A03H3               -1.347711     0.587667     0.883633
A04H4               -1.201472    -0.991235     0.089400
A05H5               -1.169709     0.486021    -0.903318
A06H6                0.901143     0.885025     0.043732
A01O1                3.913226    -0.228616    -1.032599
A02H2                3.764172     0.684224    -0.864728
A03H3                3.194707    -0.691094    -0.640782
A01O1                4.756943    -4.760279    -0.678099
A02H2                5.351222    -5.478471    -0.556822
A03H3                4.306689    -4.647690     0.139379


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0005342203
           POLARIZATION ENERGY    -0.0002289927
             DISPERSION ENERGY    -0.0006730291
     EXCHANGE REPULSION ENERGY     0.0004402425
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000385735
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6803367186

                  TOTAL ENERGY  -115.6813712917


                 ENERGY CHANGE    -0.0002202103
                  RMS GRADIENT     0.0021853308
              MAXIMUM GRADIENT     0.0071717972



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.856578     0.046690     0.053847
A02O2                0.546029     0.013030     0.223056
A03H3               -1.334927     0.591246     0.881489
A04H4               -1.196011    -0.989407     0.093709
A05H5               -1.181896     0.474055    -0.910312
A06H6                0.895583     0.902056     0.077125
A01O1                3.909095    -0.225735    -1.033301
A02H2                3.755175     0.687900    -0.874383
A03H3                3.165867    -0.684311    -0.685458
A01O1                4.756763    -4.769578    -0.677031
A02H2                5.351413    -5.487581    -0.556459
A03H3                4.315095    -4.650259     0.144168


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0006761023
           POLARIZATION ENERGY    -0.0002394034
             DISPERSION ENERGY    -0.0006819670
     EXCHANGE REPULSION ENERGY     0.0004648355
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000410042
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804273219

                  TOTAL ENERGY  -115.6816009633


                 ENERGY CHANGE    -0.0002296715
                  RMS GRADIENT     0.0018943643
              MAXIMUM GRADIENT     0.0051081523



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.853355     0.043685     0.052765
A02O2                0.549068     0.017991     0.196317
A03H3               -1.327652     0.594708     0.874722
A04H4               -1.191450    -0.989931     0.098169
A05H5               -1.188992     0.460640    -0.910836
A06H6                0.888188     0.917616     0.111231
A01O1                3.905927    -0.221545    -1.034579
A02H2                3.746863     0.693436    -0.889030
A03H3                3.138426    -0.674907    -0.736116
A01O1                4.757577    -4.781483    -0.675825
A02H2                5.350031    -5.501540    -0.556698
A03H3                4.325133    -4.654592     0.149139


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0008298940
           POLARIZATION ENERGY    -0.0002492447
             DISPERSION ENERGY    -0.0006913869
     EXCHANGE REPULSION ENERGY     0.0004910721
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000434832
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805794977

                  TOTAL ENERGY  -115.6819024344


                 ENERGY CHANGE    -0.0003014711
                  RMS GRADIENT     0.0015275578
              MAXIMUM GRADIENT     0.0036405040



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.847100     0.040483     0.049619
A02O2                0.560237     0.022553     0.156020
A03H3               -1.321878     0.599402     0.867472
A04H4               -1.181868    -0.996041     0.105241
A05H5               -1.195820     0.447471    -0.911053
A06H6                0.880560     0.938101     0.155015
A01O1                3.892498    -0.223634    -1.031847
A02H2                3.723109     0.691799    -0.901601
A03H3                3.105573    -0.676284    -0.787853
A01O1                4.753051    -4.788262    -0.675307
A02H2                5.353672    -5.500112    -0.548035
A03H3                4.335589    -4.641987     0.154153


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0010816641
           POLARIZATION ENERGY    -0.0002665349
             DISPERSION ENERGY    -0.0007188065
     EXCHANGE REPULSION ENERGY     0.0005458287
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000487066
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806365947

                  TOTAL ENERGY  -115.6822064781


                 ENERGY CHANGE    -0.0003040437
                  RMS GRADIENT     0.0018964206
              MAXIMUM GRADIENT     0.0068905903



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.845863     0.040307     0.050429
A02O2                0.562540     0.029197     0.150117
A03H3               -1.326131     0.599741     0.864905
A04H4               -1.179203    -0.998771     0.107640
A05H5               -1.194100     0.446973    -0.908131
A06H6                0.877952     0.937329     0.158335
A01O1                3.890818    -0.221842    -1.031968
A02H2                3.720712     0.694249    -0.907407
A03H3                3.098783    -0.672438    -0.801059
A01O1                4.753980    -4.793147    -0.675192
A02H2                5.351522    -5.507483    -0.547356
A03H3                4.339828    -4.642017     0.155056


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0011318211
           POLARIZATION ENERGY    -0.0002680195
             DISPERSION ENERGY    -0.0007216567
     EXCHANGE REPULSION ENERGY     0.0005546847
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000495766
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806747689

                  TOTAL ENERGY  -115.6822911581


                 ENERGY CHANGE    -0.0000846800
                  RMS GRADIENT     0.0005968118
              MAXIMUM GRADIENT     0.0014278252



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.843239     0.039057     0.046492
A02O2                0.567506     0.032459     0.135386
A03H3               -1.320298     0.600055     0.862737
A04H4               -1.172928    -1.001380     0.110781
A05H5               -1.198474     0.442449    -0.910078
A06H6                0.875477     0.944357     0.176213
A01O1                3.881721    -0.225622    -1.029175
A02H2                3.706300     0.690189    -0.910046
A03H3                3.085500    -0.677969    -0.816833
A01O1                4.749925    -4.792592    -0.675356
A02H2                5.355404    -5.498853    -0.540206
A03H3                4.342764    -4.629566     0.156099


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0012510843
           POLARIZATION ENERGY    -0.0002758306
             DISPERSION ENERGY    -0.0007368375
     EXCHANGE REPULSION ENERGY     0.0005829775
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000523894
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806381768

                  TOTAL ENERGY  -115.6823713412


                 ENERGY CHANGE    -0.0000801830
                  RMS GRADIENT     0.0006094831
              MAXIMUM GRADIENT     0.0014916465



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.836397     0.036514     0.040165
A02O2                0.575354     0.039694     0.111451
A03H3               -1.309026     0.597684     0.859287
A04H4               -1.158000    -1.006157     0.115474
A05H5               -1.205421     0.437698    -0.914953
A06H6                0.872980     0.953990     0.203822
A01O1                3.859944    -0.237631    -1.021380
A02H2                3.673348     0.676643    -0.907536
A03H3                3.061893    -0.696790    -0.831742
A01O1                4.739106    -4.785467    -0.676435
A02H2                5.366058    -5.468356    -0.520649
A03H3                4.344033    -4.593518     0.154678


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0014691262
           POLARIZATION ENERGY    -0.0002912820
             DISPERSION ENERGY    -0.0007713330
     EXCHANGE REPULSION ENERGY     0.0006457048
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000587240
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805424057

                  TOTAL ENERGY  -115.6824871661


                 ENERGY CHANGE    -0.0001158249
                  RMS GRADIENT     0.0010418036
              MAXIMUM GRADIENT     0.0036829905



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.830322     0.034060     0.029882
A02O2                0.582844     0.049662     0.092405
A03H3               -1.297535     0.590803     0.856964
A04H4               -1.135880    -1.010349     0.118230
A05H5               -1.209023     0.435529    -0.916807
A06H6                0.873844     0.960865     0.223921
A01O1                3.829186    -0.256708    -1.009404
A02H2                3.630390     0.654955    -0.895276
A03H3                3.034371    -0.725826    -0.830874
A01O1                4.723635    -4.771346    -0.678610
A02H2                5.381215    -5.416283    -0.490675
A03H3                4.338885    -4.536698     0.146365


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0017175432
           POLARIZATION ENERGY    -0.0003102704
             DISPERSION ENERGY    -0.0008169614
     EXCHANGE REPULSION ENERGY     0.0007313048
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000676318
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804387704

                  TOTAL ENERGY  -115.6826198724


                 ENERGY CHANGE    -0.0001327063
                  RMS GRADIENT     0.0013519942
              MAXIMUM GRADIENT     0.0041970528



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 24 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.818888     0.031830     0.023458
A02O2                0.592689     0.063466     0.073476
A03H3               -1.285483     0.577646     0.854519
A04H4               -1.103656    -1.017288     0.117574
A05H5               -1.210630     0.438154    -0.920928
A06H6                0.878463     0.966132     0.238398
A01O1                3.781873    -0.288311    -0.990079
A02H2                3.568486     0.618863    -0.866888
A03H3                2.996475    -0.772350    -0.809718
A01O1                4.699883    -4.745624    -0.682169
A02H2                5.404487    -5.320213    -0.443308
A03H3                4.317923    -4.445572     0.122660


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0020383266
           POLARIZATION ENERGY    -0.0003390294
             DISPERSION ENERGY    -0.0008909033
     EXCHANGE REPULSION ENERGY     0.0008804916
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000832613
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6803169363

                  TOTAL ENERGY  -115.6827879653


                 ENERGY CHANGE    -0.0001680929
                  RMS GRADIENT     0.0010531116
              MAXIMUM GRADIENT     0.0028801791



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 25 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.801706     0.029938     0.014461
A02O2                0.606633     0.082792     0.045741
A03H3               -1.269808     0.562456     0.852009
A04H4               -1.063889    -1.026969     0.112979
A05H5               -1.212892     0.434523    -0.922960
A06H6                0.882706     0.978495     0.262255
A01O1                3.719822    -0.327425    -0.965501
A02H2                3.493803     0.576233    -0.839039
A03H3                2.939039    -0.822427    -0.795130
A01O1                4.671441    -4.717612    -0.685390
A02H2                5.430495    -5.184744    -0.386561
A03H3                4.277805    -4.335305     0.077870


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0025343742
           POLARIZATION ENERGY    -0.0003841434
             DISPERSION ENERGY    -0.0009983530
     EXCHANGE REPULSION ENERGY     0.0011386374
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0001104396
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6800915042

                  TOTAL ENERGY  -115.6829801769


                 ENERGY CHANGE    -0.0001922116
                  RMS GRADIENT     0.0013558080
              MAXIMUM GRADIENT     0.0037841671



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 26 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.746222     0.014935    -0.008524
A02O2                0.661717     0.154129    -0.029802
A03H3               -1.224092     0.506728     0.850699
A04H4               -0.926807    -1.054109     0.080065
A05H5               -1.211064     0.422811    -0.924934
A06H6                0.901918     1.020172     0.317828
A01O1                3.497938    -0.468489    -0.877012
A02H2                3.252710     0.427943    -0.735775
A03H3                2.725571    -0.981995    -0.723922
A01O1                4.585710    -4.616878    -0.686543
A02H2                5.425108    -4.557466    -0.267549
A03H3                4.001157    -4.075966    -0.187156


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0044760523
           POLARIZATION ENERGY    -0.0006108094
             DISPERSION ENERGY    -0.0014762565
     EXCHANGE REPULSION ENERGY     0.0028619212
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002915535
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6793370169

                  TOTAL ENERGY  -115.6833297674


                 ENERGY CHANGE    -0.0003495906
                  RMS GRADIENT     0.0025771120
              MAXIMUM GRADIENT     0.0049276777



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 27 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.741654     0.018772    -0.008624
A02O2                0.660784     0.158986    -0.022395
A03H3               -1.225164     0.500964     0.852751
A04H4               -0.921669    -1.057946     0.073351
A05H5               -1.205943     0.422594    -0.921546
A06H6                0.903976     1.021881     0.307986
A01O1                3.486713    -0.476848    -0.872414
A02H2                3.255080     0.423001    -0.729963
A03H3                2.708128    -0.979332    -0.714336
A01O1                4.582477    -4.611821    -0.686609
A02H2                5.419194    -4.522161    -0.267633
A03H3                3.985658    -4.067018    -0.206326


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0045804102
           POLARIZATION ENERGY    -0.0006267836
             DISPERSION ENERGY    -0.0014973049
     EXCHANGE REPULSION ENERGY     0.0029858777
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003050344
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6794383702

                  TOTAL ENERGY  -115.6834620256


                 ENERGY CHANGE    -0.0001322582
                  RMS GRADIENT     0.0024570368
              MAXIMUM GRADIENT     0.0072336806



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 28 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.749721     0.025830     0.000028
A02O2                0.648730     0.148916    -0.003912
A03H3               -1.234601     0.513751     0.854120
A04H4               -0.960536    -1.056483     0.071783
A05H5               -1.204258     0.412277    -0.917594
A06H6                0.892758     1.027199     0.301002
A01O1                3.538785    -0.441593    -0.895158
A02H2                3.350840     0.472871    -0.785132
A03H3                2.727505    -0.897095    -0.760926
A01O1                4.602827    -4.649156    -0.687760
A02H2                5.449052    -4.709211    -0.282828
A03H3                4.084475    -4.090588    -0.137316


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0045295565
           POLARIZATION ENERGY    -0.0005972215
             DISPERSION ENERGY    -0.0013652732
     EXCHANGE REPULSION ENERGY     0.0025127929
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002561984
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6797052693

                  TOTAL ENERGY  -115.6839407261


                 ENERGY CHANGE    -0.0004787005
                  RMS GRADIENT     0.0032467150
              MAXIMUM GRADIENT     0.0115231960



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 29 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.748480     0.019582     0.014473
A02O2                0.646847     0.153369     0.030844
A03H3               -1.244674     0.507840     0.864164
A04H4               -0.972470    -1.051125     0.043729
A05H5               -1.189974     0.403799    -0.909727
A06H6                0.891335     1.044388     0.267752
A01O1                3.540303    -0.442418    -0.897113
A02H2                3.441580     0.488202    -0.808370
A03H3                2.685841    -0.813074    -0.769895
A01O1                4.607080    -4.661187    -0.689062
A02H2                5.455725    -4.736036    -0.291728
A03H3                4.112047    -4.072782    -0.148325


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0050212972
           POLARIZATION ENERGY    -0.0006555872
             DISPERSION ENERGY    -0.0013410358
     EXCHANGE REPULSION ENERGY     0.0026467662
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0002712675
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6799594148

                  TOTAL ENERGY  -115.6846018364


                 ENERGY CHANGE    -0.0006611102
                  RMS GRADIENT     0.0030906495
              MAXIMUM GRADIENT     0.0089162498



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 30 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.712969     0.012606     0.018332
A02O2                0.684773     0.204497     0.044186
A03H3               -1.226289     0.452879     0.879804
A04H4               -0.899458    -1.071356    -0.023962
A05H5               -1.163120     0.382205    -0.898569
A06H6                0.896833     1.112657     0.249061
A01O1                3.389242    -0.543093    -0.840053
A02H2                3.468948     0.391951    -0.785161
A03H3                2.474331    -0.737259    -0.745645
A01O1                4.565111    -4.609073    -0.682656
A02H2                5.383792    -4.294331    -0.344464
A03H3                3.907791    -4.002753    -0.392861


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0081692728
           POLARIZATION ENERGY    -0.0011560621
             DISPERSION ENERGY    -0.0016870097
     EXCHANGE REPULSION ENERGY     0.0054605035
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005719041
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6794683157

                  TOTAL ENERGY  -115.6855920610


                 ENERGY CHANGE    -0.0009902247
                  RMS GRADIENT     0.0041442507
              MAXIMUM GRADIENT     0.0097432937



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 31 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.707347     0.008248     0.023478
A02O2                0.685225     0.199287     0.084433
A03H3               -1.235764     0.435147     0.892682
A04H4               -0.894101    -1.071955    -0.044413
A05H5               -1.148157     0.391066    -0.897095
A06H6                0.896516     1.136390     0.207010
A01O1                3.372156    -0.562460    -0.833406
A02H2                3.553606     0.358530    -0.783138
A03H3                2.442815    -0.655843    -0.727201
A01O1                4.561772    -4.602102    -0.682647
A02H2                5.374364    -4.242042    -0.376499
A03H3                3.891540    -3.990182    -0.437663


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0089761656
           POLARIZATION ENERGY    -0.0013372840
             DISPERSION ENERGY    -0.0017096120
     EXCHANGE REPULSION ENERGY     0.0061510243
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006477902
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6796164733

                  TOTAL ENERGY  -115.6861363009


                 ENERGY CHANGE    -0.0005442399
                  RMS GRADIENT     0.0036258175
              MAXIMUM GRADIENT     0.0094116461



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 32 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.704467     0.001823     0.021837
A02O2                0.691953     0.189876     0.126574
A03H3               -1.243667     0.404377     0.902938
A04H4               -0.866536    -1.072717    -0.053373
A05H5               -1.132346     0.423707    -0.901220
A06H6                0.900462     1.150090     0.153775
A01O1                3.336812    -0.604998    -0.815948
A02H2                3.593839     0.296854    -0.750575
A03H3                2.412425    -0.630222    -0.646989
A01O1                4.549217    -4.565227    -0.681814
A02H2                5.320254    -4.090130    -0.429900
A03H3                3.819875    -3.997837    -0.509179


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0099889416
           POLARIZATION ENERGY    -0.0015692686
             DISPERSION ENERGY    -0.0017898342
     EXCHANGE REPULSION ENERGY     0.0071945429
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007628031
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6799115376

                  TOTAL ENERGY  -115.6868278422


                 ENERGY CHANGE    -0.0006915413
                  RMS GRADIENT     0.0053208908
              MAXIMUM GRADIENT     0.0175924320



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 33 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.693568    -0.000888     0.010441
A02O2                0.702441     0.205171     0.109039
A03H3               -1.232211     0.384901     0.896640
A04H4               -0.831778    -1.079480    -0.043509
A05H5               -1.133689     0.439382    -0.906323
A06H6                0.897141     1.148719     0.167222
A01O1                3.296208    -0.645185    -0.797649
A02H2                3.552854     0.255959    -0.721835
A03H3                2.375489    -0.675356    -0.610459
A01O1                4.534155    -4.527513    -0.677946
A02H2                5.238175    -3.934820    -0.486253
A03H3                3.738616    -4.039455    -0.565730


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0107605796
           POLARIZATION ENERGY    -0.0017251959
             DISPERSION ENERGY    -0.0019169673
     EXCHANGE REPULSION ENERGY     0.0083293671
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0008842703
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804771678

                  TOTAL ENERGY  -115.6874348137


                 ENERGY CHANGE    -0.0006069715
                  RMS GRADIENT     0.0027574619
              MAXIMUM GRADIENT     0.0067089651



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 34 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.709411     0.004293     0.013727
A02O2                0.695013     0.197847     0.134437
A03H3               -1.242093     0.379798     0.889205
A04H4               -0.853092    -1.076773    -0.029337
A05H5               -1.127892     0.456795    -0.904384
A06H6                0.877903     1.143258     0.149266
A01O1                3.344564    -0.634479    -0.815996
A02H2                3.664610     0.247011    -0.751026
A03H3                2.425656    -0.598018    -0.621180
A01O1                4.543677    -4.547509    -0.681924
A02H2                5.306181    -4.041941    -0.465910
A03H3                3.803683    -3.985776    -0.538608


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0104202101
           POLARIZATION ENERGY    -0.0016185897
             DISPERSION ENERGY    -0.0017586269
     EXCHANGE REPULSION ENERGY     0.0069901730
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007383009
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805039549

                  TOTAL ENERGY  -115.6880495096


                 ENERGY CHANGE    -0.0006146959
                  RMS GRADIENT     0.0027008092
              MAXIMUM GRADIENT     0.0076264560



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 35 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.690499     0.001003     0.011867
A02O2                0.699863     0.223144     0.164910
A03H3               -1.249044     0.338876     0.893273
A04H4               -0.819794    -1.084757    -0.052752
A05H5               -1.102247     0.470417    -0.891069
A06H6                0.864850     1.173361     0.115557
A01O1                3.295568    -0.697507    -0.795709
A02H2                3.756857     0.120201    -0.748383
A03H3                2.398650    -0.508472    -0.587193
A01O1                4.528113    -4.508916    -0.677639
A02H2                5.223489    -3.881473    -0.597372
A03H3                3.725217    -4.021879    -0.634886


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0114348126
           POLARIZATION ENERGY    -0.0019056206
             DISPERSION ENERGY    -0.0018468761
     EXCHANGE REPULSION ENERGY     0.0081106608
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0008639873
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804913739

                  TOTAL ENERGY  -115.6884320097


                 ENERGY CHANGE    -0.0003825001
                  RMS GRADIENT     0.0023317542
              MAXIMUM GRADIENT     0.0062685449



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 36 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.680713    -0.004686     0.019246
A02O2                0.692036     0.240857     0.168872
A03H3               -1.261335     0.321619     0.886786
A04H4               -0.802636    -1.084353    -0.060861
A05H5               -1.090841     0.479509    -0.881067
A06H6                0.853620     1.186820     0.110536
A01O1                3.296226    -0.741058    -0.793319
A02H2                3.801264     0.050560    -0.749156
A03H3                2.415216    -0.506699    -0.564033
A01O1                4.519639    -4.484244    -0.676589
A02H2                5.189030    -3.824309    -0.667829
A03H3                3.697612    -4.028253    -0.672282


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0114079905
           POLARIZATION ENERGY    -0.0018602000
             DISPERSION ENERGY    -0.0018214958
     EXCHANGE REPULSION ENERGY     0.0075698945
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0008043951
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6803859041

                  TOTAL ENERGY  -115.6887100909


                 ENERGY CHANGE    -0.0002780812
                  RMS GRADIENT     0.0024274855
              MAXIMUM GRADIENT     0.0058524496



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 37 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.679255    -0.007351     0.020098
A02O2                0.692279     0.255268     0.174652
A03H3               -1.274763     0.312888     0.886460
A04H4               -0.790297    -1.085111    -0.069601
A05H5               -1.085201     0.481983    -0.873076
A06H6                0.844067     1.199215     0.109048
A01O1                3.305542    -0.777620    -0.794546
A02H2                3.831117     0.000552    -0.751021
A03H3                2.435039    -0.523919    -0.546481
A01O1                4.513172    -4.464854    -0.676202
A02H2                5.168808    -3.792550    -0.718910
A03H3                3.681938    -4.026310    -0.696273


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0113864222
           POLARIZATION ENERGY    -0.0017888945
             DISPERSION ENERGY    -0.0017843881
     EXCHANGE REPULSION ENERGY     0.0068746029
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007290294
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6803221172

                  TOTAL ENERGY  -115.6891362484


                 ENERGY CHANGE    -0.0004261575
                  RMS GRADIENT     0.0023623164
              MAXIMUM GRADIENT     0.0052998078



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 38 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.671325    -0.005431     0.030509
A02O2                0.695576     0.291884     0.196065
A03H3               -1.307260     0.283462     0.885400
A04H4               -0.744891    -1.094494    -0.100347
A05H5               -1.076572     0.489974    -0.860653
A06H6                0.821582     1.240880     0.102038
A01O1                3.321106    -0.896777    -0.792392
A02H2                3.883422    -0.144854    -0.746717
A03H3                2.481662    -0.619992    -0.472396
A01O1                4.489588    -4.391429    -0.674819
A02H2                5.075942    -3.688522    -0.888792
A03H3                3.619456    -4.045547    -0.757950


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0112551173
           POLARIZATION ENERGY    -0.0015946432
             DISPERSION ENERGY    -0.0017366559
     EXCHANGE REPULSION ENERGY     0.0053729277
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005626695
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6800289032

                  TOTAL ENERGY  -115.6898050614


                 ENERGY CHANGE    -0.0006688129
                  RMS GRADIENT     0.0022890690
              MAXIMUM GRADIENT     0.0059661123



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 39 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.686473    -0.004554     0.018853
A02O2                0.681133     0.297858     0.208146
A03H3               -1.313725     0.297254     0.881464
A04H4               -0.753164    -1.076248    -0.093646
A05H5               -1.099742     0.477863    -0.862950
A06H6                0.804631     1.243951     0.126537
A01O1                3.404674    -0.932943    -0.820517
A02H2                3.898538    -0.135855    -0.754006
A03H3                2.554974    -0.749078    -0.462917
A01O1                4.488415    -4.384636    -0.678667
A02H2                5.148192    -3.735003    -0.840982
A03H3                3.660306    -3.946243    -0.754304


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0105153794
           POLARIZATION ENERGY    -0.0012727205
             DISPERSION ENERGY    -0.0015738963
     EXCHANGE REPULSION ENERGY     0.0035872211
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003690710
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801211052

                  TOTAL ENERGY  -115.6902649515


                 ENERGY CHANGE    -0.0004598901
                  RMS GRADIENT     0.0039841173
              MAXIMUM GRADIENT     0.0113092710



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 40 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.685457     0.001070     0.022369
A02O2                0.682507     0.299651     0.203574
A03H3               -1.307997     0.297223     0.880622
A04H4               -0.752093    -1.081820    -0.094063
A05H5               -1.105135     0.474539    -0.869786
A06H6                0.803510     1.247628     0.135795
A01O1                3.404035    -0.938376    -0.820585
A02H2                3.893534    -0.138739    -0.752431
A03H3                2.551044    -0.757932    -0.469129
A01O1                4.486843    -4.381279    -0.678294
A02H2                5.146228    -3.731706    -0.842431
A03H3                3.658475    -3.943552    -0.754957


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0105527712
           POLARIZATION ENERGY    -0.0012774258
             DISPERSION ENERGY    -0.0015807124
     EXCHANGE REPULSION ENERGY     0.0036018298
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003700145
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804343064

                  TOTAL ENERGY  -115.6906134005


                 ENERGY CHANGE    -0.0003484491
                  RMS GRADIENT     0.0015963902
              MAXIMUM GRADIENT     0.0045805927



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 41 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.683496     0.003315     0.021760
A02O2                0.683407     0.305793     0.207670
A03H3               -1.302276     0.290220     0.881112
A04H4               -0.745089    -1.083744    -0.096960
A05H5               -1.109299     0.472515    -0.876323
A06H6                0.797779     1.259316     0.141986
A01O1                3.403338    -0.962240    -0.819819
A02H2                3.906133    -0.170738    -0.753515
A03H3                2.554615    -0.767738    -0.465541
A01O1                4.481621    -4.366238    -0.677720
A02H2                5.132763    -3.715823    -0.869157
A03H3                3.647990    -3.940688    -0.765125


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0105842392
           POLARIZATION ENERGY    -0.0012744713
             DISPERSION ENERGY    -0.0015898380
     EXCHANGE REPULSION ENERGY     0.0035301934
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003615663
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805043640

                  TOTAL ENERGY  -115.6907842854


                 ENERGY CHANGE    -0.0001708849
                  RMS GRADIENT     0.0010673955
              MAXIMUM GRADIENT     0.0024767892



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 42 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.681549     0.004317     0.019597
A02O2                0.683575     0.312432     0.206084
A03H3               -1.295588     0.286570     0.882445
A04H4               -0.739448    -1.083915    -0.099103
A05H5               -1.113541     0.467230    -0.882143
A06H6                0.794767     1.267472     0.152166
A01O1                3.401379    -0.982286    -0.818982
A02H2                3.907309    -0.192849    -0.751912
A03H3                2.553355    -0.784694    -0.464740
A01O1                4.476697    -4.352509    -0.677141
A02H2                5.122113    -3.701368    -0.884814
A03H3                3.639490    -3.935387    -0.770780


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0106037732
           POLARIZATION ENERGY    -0.0012704474
             DISPERSION ENERGY    -0.0016028460
     EXCHANGE REPULSION ENERGY     0.0034838232
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003562001
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805283833

                  TOTAL ENERGY  -115.6908778269


                 ENERGY CHANGE    -0.0000935415
                  RMS GRADIENT     0.0013277121
              MAXIMUM GRADIENT     0.0031177700



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 43 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.679327     0.003944     0.015012
A02O2                0.684361     0.320964     0.190641
A03H3               -1.282641     0.281478     0.884334
A04H4               -0.729541    -1.081672    -0.099930
A05H5               -1.117924     0.454225    -0.891664
A06H6                0.788241     1.286636     0.180218
A01O1                3.396043    -1.022579    -0.818076
A02H2                3.914021    -0.240927    -0.751793
A03H3                2.548953    -0.809640    -0.470556
A01O1                4.466216    -4.323780    -0.675989
A02H2                5.113083    -3.678830    -0.897970
A03H3                3.630009    -3.906330    -0.776830


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0107955951
           POLARIZATION ENERGY    -0.0012966901
             DISPERSION ENERGY    -0.0016426178
     EXCHANGE REPULSION ENERGY     0.0035064465
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003572811
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805212383

                  TOTAL ENERGY  -115.6911069758


                 ENERGY CHANGE    -0.0002291489
                  RMS GRADIENT     0.0025656427
              MAXIMUM GRADIENT     0.0080032952



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 44 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.676600     0.004632     0.009860
A02O2                0.687947     0.333272     0.174006
A03H3               -1.271627     0.278116     0.886929
A04H4               -0.721330    -1.081577    -0.099854
A05H5               -1.121660     0.442316    -0.900275
A06H6                0.781320     1.297927     0.207160
A01O1                3.389480    -1.058725    -0.817200
A02H2                3.921287    -0.286254    -0.752815
A03H3                2.543781    -0.827494    -0.478084
A01O1                4.456456    -4.297181    -0.674929
A02H2                5.109699    -3.660692    -0.902590
A03H3                3.624408    -3.872618    -0.780368


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0110286298
           POLARIZATION ENERGY    -0.0013342199
             DISPERSION ENERGY    -0.0016865547
     EXCHANGE REPULSION ENERGY     0.0035789301
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003641610
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805476386

                  TOTAL ENERGY  -115.6913822738


                 ENERGY CHANGE    -0.0002752980
                  RMS GRADIENT     0.0022216304
              MAXIMUM GRADIENT     0.0064360544



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 45 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.657596     0.003979    -0.004213
A02O2                0.690123     0.353335     0.120199
A03H3               -1.250098     0.283748     0.888481
A04H4               -0.707774    -1.082299    -0.091245
A05H5               -1.131733     0.415362    -0.913168
A06H6                0.760473     1.315654     0.278680
A01O1                3.376982    -1.134160    -0.820264
A02H2                3.952265    -0.392670    -0.766272
A03H3                2.536433    -0.840163    -0.519069
A01O1                4.434735    -4.240146    -0.672943
A02H2                5.150921    -3.659239    -0.855422
A03H3                3.649713    -3.732638    -0.772195


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0119300284
           POLARIZATION ENERGY    -0.0015137895
             DISPERSION ENERGY    -0.0018060944
     EXCHANGE REPULSION ENERGY     0.0040327943
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004122653
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801669578

                  TOTAL ENERGY  -115.6917963413


                 ENERGY CHANGE    -0.0004140674
                  RMS GRADIENT     0.0050244135
              MAXIMUM GRADIENT     0.0137678746



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 46 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.659186     0.001197    -0.006088
A02O2                0.698759     0.365783     0.101017
A03H3               -1.245339     0.287276     0.883577
A04H4               -0.702810    -1.083536    -0.085938
A05H5               -1.130546     0.410358    -0.911656
A06H6                0.750347     1.310866     0.298422
A01O1                3.370305    -1.158433    -0.822137
A02H2                3.977339    -0.442103    -0.776794
A03H3                2.540295    -0.821092    -0.537603
A01O1                4.427074    -4.219734    -0.672596
A02H2                5.181637    -3.679571    -0.822703
A03H3                3.677679    -3.659355    -0.762361


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0125463896
           POLARIZATION ENERGY    -0.0016483980
             DISPERSION ENERGY    -0.0018546840
     EXCHANGE REPULSION ENERGY     0.0043574933
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004471240
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804855634

                  TOTAL ENERGY  -115.6926246657


                 ENERGY CHANGE    -0.0008283244
                  RMS GRADIENT     0.0018560980
              MAXIMUM GRADIENT     0.0036082149



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 47 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.654092    -0.000412    -0.013058
A02O2                0.706541     0.383715     0.061180
A03H3               -1.234480     0.297650     0.874888
A04H4               -0.692809    -1.086887    -0.074577
A05H5               -1.135301     0.396957    -0.911475
A06H6                0.729842     1.308523     0.346061
A01O1                3.364761    -1.210168    -0.828747
A02H2                4.019456    -0.536415    -0.795473
A03H3                2.554171    -0.804847    -0.579081
A01O1                4.411306    -4.177230    -0.672278
A02H2                5.238875    -3.739453    -0.756870
A03H3                3.751215    -3.510794    -0.734055


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0138003580
           POLARIZATION ENERGY    -0.0019673461
             DISPERSION ENERGY    -0.0019594088
     EXCHANGE REPULSION ENERGY     0.0052731214
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005452337
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801989618

                  TOTAL ENERGY  -115.6931981870


                 ENERGY CHANGE    -0.0005735212
                  RMS GRADIENT     0.0020293027
              MAXIMUM GRADIENT     0.0039463270



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 48 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.652680    -0.001223    -0.012939
A02O2                0.704213     0.385646     0.061825
A03H3               -1.236485     0.300442     0.872575
A04H4               -0.690786    -1.088749    -0.072646
A05H5               -1.135503     0.399751    -0.909379
A06H6                0.729902     1.301771     0.344193
A01O1                3.363775    -1.210206    -0.829977
A02H2                4.025085    -0.542845    -0.798766
A03H3                2.556831    -0.795650    -0.583686
A01O1                4.410505    -4.175212    -0.672591
A02H2                5.253747    -3.765740    -0.742946
A03H3                3.775021    -3.484607    -0.726443


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0139130529
           POLARIZATION ENERGY    -0.0020107227
             DISPERSION ENERGY    -0.0019605382
     EXCHANGE REPULSION ENERGY     0.0053783712
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005562057
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802300896

                  TOTAL ENERGY  -115.6932922380


                 ENERGY CHANGE    -0.0000940511
                  RMS GRADIENT     0.0020096816
              MAXIMUM GRADIENT     0.0053709866



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 49 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.651478    -0.001395    -0.013821
A02O2                0.702619     0.391088     0.056087
A03H3               -1.232612     0.301953     0.869084
A04H4               -0.681885    -1.091609    -0.070907
A05H5               -1.139191     0.397985    -0.911308
A06H6                0.728137     1.301626     0.354712
A01O1                3.358765    -1.227847    -0.830911
A02H2                4.030038    -0.570410    -0.801868
A03H3                2.556983    -0.798915    -0.592504
A01O1                4.404431    -4.159227    -0.672414
A02H2                5.268760    -3.794098    -0.729795
A03H3                3.806944    -3.435031    -0.719567


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0143028629
           POLARIZATION ENERGY    -0.0021378470
             DISPERSION ENERGY    -0.0020008973
     EXCHANGE REPULSION ENERGY     0.0058297925
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006044926
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802241607

                  TOTAL ENERGY  -115.6934404680


                 ENERGY CHANGE    -0.0001482300
                  RMS GRADIENT     0.0017073682
              MAXIMUM GRADIENT     0.0054194902



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 50 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.655037    -0.000763    -0.018963
A02O2                0.700540     0.388883     0.067030
A03H3               -1.232944     0.302046     0.866651
A04H4               -0.662940    -1.097019    -0.072727
A05H5               -1.146672     0.401534    -0.911892
A06H6                0.737396     1.301784     0.351746
A01O1                3.346130    -1.238021    -0.829829
A02H2                4.010961    -0.574125    -0.799548
A03H3                2.539811    -0.816879    -0.592838
A01O1                4.397653    -4.144325    -0.672228
A02H2                5.290816    -3.855054    -0.719743
A03H3                3.865614    -3.370571    -0.715966


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0147611934
           POLARIZATION ENERGY    -0.0023010637
             DISPERSION ENERGY    -0.0020414647
     EXCHANGE REPULSION ENERGY     0.0063802634
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006637827
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802992252

                  TOTAL ENERGY  -115.6936864662


                 ENERGY CHANGE    -0.0002459982
                  RMS GRADIENT     0.0021214625
              MAXIMUM GRADIENT     0.0062269713



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 51 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.655047    -0.005546    -0.009020
A02O2                0.701815     0.376350     0.088575
A03H3               -1.238888     0.295511     0.863632
A04H4               -0.648877    -1.094016    -0.081462
A05H5               -1.153669     0.410364    -0.916525
A06H6                0.754325     1.304212     0.331610
A01O1                3.329365    -1.227394    -0.825446
A02H2                3.959368    -0.530733    -0.787578
A03H3                2.503668    -0.851963    -0.578564
A01O1                4.394627    -4.143259    -0.671832
A02H2                5.303377    -3.908481    -0.724049
A03H3                3.909695    -3.339631    -0.723777


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0149474335
           POLARIZATION ENERGY    -0.0023624526
             DISPERSION ENERGY    -0.0020555329
     EXCHANGE REPULSION ENERGY     0.0065204217
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006806070
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802200531

                  TOTAL ENERGY  -115.6937456573


                 ENERGY CHANGE    -0.0000591911
                  RMS GRADIENT     0.0031597380
              MAXIMUM GRADIENT     0.0105643249



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 52 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.656503    -0.002319    -0.012459
A02O2                0.702569     0.370136     0.093924
A03H3               -1.242918     0.294896     0.865762
A04H4               -0.654070    -1.093891    -0.082542
A05H5               -1.149315     0.410853    -0.910843
A06H6                0.756698     1.303830     0.322619
A01O1                3.330838    -1.214198    -0.825064
A02H2                3.951536    -0.509335    -0.785352
A03H3                2.500866    -0.851152    -0.574028
A01O1                4.397858    -4.153134    -0.672036
A02H2                5.303489    -3.907013    -0.726179
A03H3                3.902733    -3.355813    -0.725002


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0147926832
           POLARIZATION ENERGY    -0.0023022661
             DISPERSION ENERGY    -0.0020318057
     EXCHANGE REPULSION ENERGY     0.0062731028
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006537162
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804337010

                  TOTAL ENERGY  -115.6939410694


                 ENERGY CHANGE    -0.0001954121
                  RMS GRADIENT     0.0012671219
              MAXIMUM GRADIENT     0.0035960863



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 53 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.655030    -0.002313    -0.013399
A02O2                0.704750     0.367102     0.094710
A03H3               -1.245915     0.294066     0.865848
A04H4               -0.656922    -1.092135    -0.083291
A05H5               -1.145353     0.410201    -0.906629
A06H6                0.757656     1.302677     0.318452
A01O1                3.327660    -1.209393    -0.824949
A02H2                3.942524    -0.499484    -0.784384
A03H3                2.494487    -0.853235    -0.574652
A01O1                4.397304    -4.153381    -0.672131
A02H2                5.309196    -3.929885    -0.718779
A03H3                3.922936    -3.343181    -0.719304


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0148475131
           POLARIZATION ENERGY    -0.0023278873
             DISPERSION ENERGY    -0.0020350639
     EXCHANGE REPULSION ENERGY     0.0063180507
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006583783
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804841085

                  TOTAL ENERGY  -115.6940349004


                 ENERGY CHANGE    -0.0000938310
                  RMS GRADIENT     0.0009711723
              MAXIMUM GRADIENT     0.0023530249



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 54 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.652987    -0.000988    -0.009882
A02O2                0.707654     0.360123     0.103356
A03H3               -1.250981     0.288418     0.866451
A04H4               -0.661950    -1.090402    -0.087973
A05H5               -1.137664     0.411632    -0.902249
A06H6                0.763673     1.302245     0.303030
A01O1                3.319638    -1.195722    -0.822712
A02H2                3.913157    -0.468134    -0.777710
A03H3                2.476893    -0.866690    -0.567381
A01O1                4.396888    -4.157262    -0.672106
A02H2                5.314733    -3.959098    -0.716457
A03H3                3.945311    -3.334103    -0.718597


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0148324175
           POLARIZATION ENERGY    -0.0023278275
             DISPERSION ENERGY    -0.0020348387
     EXCHANGE REPULSION ENERGY     0.0062885385
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006554166
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805459485

                  TOTAL ENERGY  -115.6941079103


                 ENERGY CHANGE    -0.0000730100
                  RMS GRADIENT     0.0012086387
              MAXIMUM GRADIENT     0.0031900088



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 55 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.648730    -0.006230    -0.008439
A02O2                0.712732     0.361207     0.110114
A03H3               -1.250946     0.279012     0.870526
A04H4               -0.666296    -1.088968    -0.093973
A05H5               -1.125265     0.411327    -0.902093
A06H6                0.769256     1.304466     0.291387
A01O1                3.302729    -1.195808    -0.818901
A02H2                3.871533    -0.449099    -0.768268
A03H3                2.449550    -0.897262    -0.560771
A01O1                4.389030    -4.144510    -0.671608
A02H2                5.318139    -4.006936    -0.710410
A03H3                3.992808    -3.293208    -0.715957


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150055769
           POLARIZATION ENERGY    -0.0024102909
             DISPERSION ENERGY    -0.0020764056
     EXCHANGE REPULSION ENERGY     0.0065750202
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006880228
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805863008

                  TOTAL ENERGY  -115.6941915769


                 ENERGY CHANGE    -0.0000836665
                  RMS GRADIENT     0.0015620762
              MAXIMUM GRADIENT     0.0041464271



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 56 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.646931    -0.004435    -0.005578
A02O2                0.713139     0.360230     0.115227
A03H3               -1.248868     0.273760     0.871798
A04H4               -0.667105    -1.091832    -0.097285
A05H5               -1.120914     0.412602    -0.904127
A06H6                0.771512     1.306630     0.284895
A01O1                3.296302    -1.195389    -0.816535
A02H2                3.853292    -0.440051    -0.762670
A03H3                2.439188    -0.912095    -0.554286
A01O1                4.385901    -4.140460    -0.671257
A02H2                5.315775    -4.009486    -0.714326
A03H3                3.995276    -3.286867    -0.720928


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150352315
           POLARIZATION ENERGY    -0.0024207449
             DISPERSION ENERGY    -0.0020913666
     EXCHANGE REPULSION ENERGY     0.0066539241
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006971436
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806477485

                  TOTAL ENERGY  -115.6942383109


                 ENERGY CHANGE    -0.0000467341
                  RMS GRADIENT     0.0005579904
              MAXIMUM GRADIENT     0.0011994540



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 57 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.646159    -0.004889    -0.005249
A02O2                0.712913     0.361699     0.116717
A03H3               -1.245172     0.271370     0.872835
A04H4               -0.666697    -1.093929    -0.098186
A05H5               -1.118646     0.413558    -0.906484
A06H6                0.770655     1.308059     0.283931
A01O1                3.293494    -1.199285    -0.815209
A02H2                3.848665    -0.442683    -0.760314
A03H3                2.436091    -0.918822    -0.550871
A01O1                4.383045    -4.135498    -0.670953
A02H2                5.312147    -4.000412    -0.717808
A03H3                3.988227    -3.284082    -0.724663


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150985798
           POLARIZATION ENERGY    -0.0024373809
             DISPERSION ENERGY    -0.0021047077
     EXCHANGE REPULSION ENERGY     0.0067468632
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007077821
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806568598

                  TOTAL ENERGY  -115.6942584471


                 ENERGY CHANGE    -0.0000201362
                  RMS GRADIENT     0.0006181012
              MAXIMUM GRADIENT     0.0016249206



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 58 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.644500    -0.006629    -0.005717
A02O2                0.713319     0.360920     0.120216
A03H3               -1.240823     0.268085     0.873885
A04H4               -0.664940    -1.096038    -0.099568
A05H5               -1.114710     0.415987    -0.908109
A06H6                0.769445     1.309978     0.280293
A01O1                3.287755    -1.203784    -0.812994
A02H2                3.840052    -0.445196    -0.756540
A03H3                2.430003    -0.927861    -0.545035
A01O1                4.378051    -4.127237    -0.670469
A02H2                5.307089    -3.992983    -0.720857
A03H3                3.983559    -3.275938    -0.728267


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0152133790
           POLARIZATION ENERGY    -0.0024752855
             DISPERSION ENERGY    -0.0021294074
     EXCHANGE REPULSION ENERGY     0.0069268451
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007283877
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806638796

                  TOTAL ENERGY  -115.6942834941


                 ENERGY CHANGE    -0.0000250470
                  RMS GRADIENT     0.0007909129
              MAXIMUM GRADIENT     0.0022412719



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 59 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.641012    -0.009144    -0.006857
A02O2                0.716632     0.359734     0.128201
A03H3               -1.232754     0.262086     0.874540
A04H4               -0.662204    -1.100510    -0.102072
A05H5               -1.104814     0.421912    -0.907920
A06H6                0.764138     1.308445     0.269427
A01O1                3.276937    -1.209986    -0.808333
A02H2                3.828395    -0.450965    -0.749544
A03H3                2.420899    -0.937958    -0.531070
A01O1                4.367358    -4.111368    -0.669357
A02H2                5.294332    -3.965987    -0.726444
A03H3                3.961837    -3.265741    -0.733718


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0154628219
           POLARIZATION ENERGY    -0.0025508828
             DISPERSION ENERGY    -0.0021790897
     EXCHANGE REPULSION ENERGY     0.0072966589
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007710139
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806579397

                  TOTAL ENERGY  -115.6943250892


                 ENERGY CHANGE    -0.0000415951
                  RMS GRADIENT     0.0012364404
              MAXIMUM GRADIENT     0.0035285922



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 60 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.636646    -0.012193    -0.006812
A02O2                0.719036     0.354056     0.133918
A03H3               -1.231580     0.258676     0.874891
A04H4               -0.660466    -1.101079    -0.104574
A05H5               -1.098531     0.425900    -0.905878
A06H6                0.762838     1.308732     0.259772
A01O1                3.268932    -1.209977    -0.805313
A02H2                3.819356    -0.450323    -0.745043
A03H3                2.414034    -0.941235    -0.521408
A01O1                4.360800    -4.102826    -0.668621
A02H2                5.287429    -3.955993    -0.727565
A03H3                3.953697    -3.258106    -0.734865


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0156135383
           POLARIZATION ENERGY    -0.0026034122
             DISPERSION ENERGY    -0.0022114881
     EXCHANGE REPULSION ENERGY     0.0075368384
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0007988263
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806757621

                  TOTAL ENERGY  -115.6943661886


                 ENERGY CHANGE    -0.0000410994
                  RMS GRADIENT     0.0007057812
              MAXIMUM GRADIENT     0.0018141876



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 61 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.635056    -0.013395    -0.006654
A02O2                0.721117     0.351068     0.135461
A03H3               -1.233520     0.258592     0.873932
A04H4               -0.659503    -1.100424    -0.105573
A05H5               -1.096398     0.426991    -0.902607
A06H6                0.762542     1.306771     0.255277
A01O1                3.266646    -1.207950    -0.804499
A02H2                3.822041    -0.451865    -0.744950
A03H3                2.414345    -0.934193    -0.517592
A01O1                4.358381    -4.100598    -0.668255
A02H2                5.284377    -3.949342    -0.725938
A03H3                3.947451    -3.257588    -0.732640


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0156830285
           POLARIZATION ENERGY    -0.0026268147
             DISPERSION ENERGY    -0.0022219523
     EXCHANGE REPULSION ENERGY     0.0076247656
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0008090132
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806852259

                  TOTAL ENERGY  -115.6944012690


                 ENERGY CHANGE    -0.0000350804
                  RMS GRADIENT     0.0005601225
              MAXIMUM GRADIENT     0.0012877567



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 62 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.633176    -0.014875    -0.005670
A02O2                0.723657     0.348613     0.137492
A03H3               -1.235665     0.257428     0.872843
A04H4               -0.657478    -1.100682    -0.107935
A05H5               -1.093404     0.427482    -0.899156
A06H6                0.764209     1.304789     0.249679
A01O1                3.262102    -1.207094    -0.803047
A02H2                3.826376    -0.457513    -0.744754
A03H3                2.414411    -0.924227    -0.511362
A01O1                4.353552    -4.094947    -0.667490
A02H2                5.278628    -3.937743    -0.724027
A03H3                3.937399    -3.254362    -0.730004


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0158073423
           POLARIZATION ENERGY    -0.0026716290
             DISPERSION ENERGY    -0.0022426013
     EXCHANGE REPULSION ENERGY     0.0078071613
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0008299169
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806879607

                  TOTAL ENERGY  -115.6944322890


                 ENERGY CHANGE    -0.0000310200
                  RMS GRADIENT     0.0005642177
              MAXIMUM GRADIENT     0.0015864372



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 63 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.629482    -0.017179    -0.004241
A02O2                0.727179     0.345603     0.142871
A03H3               -1.237992     0.252760     0.872346
A04H4               -0.652677    -1.102845    -0.113321
A05H5               -1.088081     0.427474    -0.895550
A06H6                0.770769     1.302916     0.239339
A01O1                3.251114    -1.207599    -0.799694
A02H2                3.831679    -0.470403    -0.743464
A03H3                2.412644    -0.908476    -0.497754
A01O1                4.342246    -4.081000    -0.665587
A02H2                5.265265    -3.912059    -0.721880
A03H3                3.915534    -3.245619    -0.726666


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0160550447
           POLARIZATION ENERGY    -0.0027656914
             DISPERSION ENERGY    -0.0022900488
     EXCHANGE REPULSION ENERGY     0.0082246338
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0008778050
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806913380

                  TOTAL ENERGY  -115.6944552942


                 ENERGY CHANGE    -0.0000230052
                  RMS GRADIENT     0.0006415649
              MAXIMUM GRADIENT     0.0017493879



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 64 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.628719    -0.019179    -0.002693
A02O2                0.729087     0.344218     0.145760
A03H3               -1.238013     0.249649     0.871346
A04H4               -0.649918    -1.102695    -0.115408
A05H5               -1.086273     0.427562    -0.895099
A06H6                0.774519     1.302116     0.234713
A01O1                3.245571    -1.207546    -0.798273
A02H2                3.833484    -0.476122    -0.743028
A03H3                2.411482    -0.901112    -0.491566
A01O1                4.336472    -4.074241    -0.664488
A02H2                5.258571    -3.900167    -0.720231
A03H3                3.905213    -3.241118    -0.724458


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0161756916
           POLARIZATION ENERGY    -0.0028120058
             DISPERSION ENERGY    -0.0023129909
     EXCHANGE REPULSION ENERGY     0.0084282338
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0009012593
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806927546

                  TOTAL ENERGY  -115.6944664685


                 ENERGY CHANGE    -0.0000111743
                  RMS GRADIENT     0.0006526648
              MAXIMUM GRADIENT     0.0019861605



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 65 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.628155    -0.019370    -0.002538
A02O2                0.729478     0.343946     0.146886
A03H3               -1.238064     0.248336     0.871384
A04H4               -0.648837    -1.103230    -0.116344
A05H5               -1.085562     0.427290    -0.895009
A06H6                0.776326     1.301977     0.233107
A01O1                3.243321    -1.207781    -0.797697
A02H2                3.834205    -0.478726    -0.742848
A03H3                2.411030    -0.898386    -0.489085
A01O1                4.334095    -4.071388    -0.664025
A02H2                5.255750    -3.894985    -0.719779
A03H3                3.900740    -3.239337    -0.723779


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0162190589
           POLARIZATION ENERGY    -0.0028295753
             DISPERSION ENERGY    -0.0023223380
     EXCHANGE REPULSION ENERGY     0.0085119174
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0009108637
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806970481

                  TOTAL ENERGY  -115.6944669666


                 ENERGY CHANGE    -0.0000004982
                  RMS GRADIENT     0.0005737007
              MAXIMUM GRADIENT     0.0016292519



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 66 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.628137    -0.019380    -0.002544
A02O2                0.729484     0.343948     0.146919
A03H3               -1.238061     0.248292     0.871392
A04H4               -0.648803    -1.103242    -0.116365
A05H5               -1.085549     0.427278    -0.895019
A06H6                0.776389     1.301973     0.233070
A01O1                3.243255    -1.207783    -0.797685
A02H2                3.834218    -0.478791    -0.742846
A03H3                2.411011    -0.898310    -0.489023
A01O1                4.334021    -4.071308    -0.664009
A02H2                5.255664    -3.894836    -0.719757
A03H3                3.900607    -3.239288    -0.723751


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0162201061
           POLARIZATION ENERGY    -0.0028300211
             DISPERSION ENERGY    -0.0023225919
     EXCHANGE REPULSION ENERGY     0.0085141272
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0009111195
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806972572

                  TOTAL ENERGY  -115.6944669685


                 ENERGY CHANGE    -0.0000000019
                  RMS GRADIENT     0.0005720370
              MAXIMUM GRADIENT     0.0016313506



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 67 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.627374    -0.019335    -0.002577
A02O2                0.730081     0.343273     0.148833
A03H3               -1.237479     0.245622     0.871432
A04H4               -0.646836    -1.104190    -0.117429
A05H5               -1.084555     0.426732    -0.895500
A06H6                0.779399     1.301990     0.230856
A01O1                3.239461    -1.207580    -0.797038
A02H2                3.834226    -0.481655    -0.742615
A03H3                2.409644    -0.894466    -0.485530
A01O1                4.329791    -4.066889    -0.663017
A02H2                5.250689    -3.886461    -0.718397
A03H3                3.892871    -3.236648    -0.721975


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0162873446
           POLARIZATION ENERGY    -0.0028566322
             DISPERSION ENERGY    -0.0023374359
     EXCHANGE REPULSION ENERGY     0.0086439137
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0009260286
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807052852

                  TOTAL ENERGY  -115.6944688127


                 ENERGY CHANGE    -0.0000018441
                  RMS GRADIENT     0.0004371428
              MAXIMUM GRADIENT     0.0008515074



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
    STATE AFTER 68 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.627372    -0.019336    -0.002578
A02O2                0.730082     0.343273     0.148837
A03H3               -1.237477     0.245616     0.871433
A04H4               -0.646831    -1.104191    -0.117431
A05H5               -1.084554     0.426730    -0.895502
A06H6                0.779407     1.301990     0.230852
A01O1                3.239452    -1.207579    -0.797037
A02H2                3.834226    -0.481661    -0.742616
A03H3                2.409641    -0.894456    -0.485523
A01O1                4.329781    -4.066879    -0.663014
A02H2                5.250677    -3.886442    -0.718393
A03H3                3.892853    -3.236642    -0.721970


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0162874697
           POLARIZATION ENERGY    -0.0028566851
             DISPERSION ENERGY    -0.0023374675
     EXCHANGE REPULSION ENERGY     0.0086441829
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0009260598
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807053275

                  TOTAL ENERGY  -115.6944688266


                 ENERGY CHANGE    -0.0000000139
                  RMS GRADIENT     0.0004367325
              MAXIMUM GRADIENT     0.0008502942



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
    STATE AFTER 69 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.627372    -0.019336    -0.002578
A02O2                0.730082     0.343273     0.148837
A03H3               -1.237477     0.245616     0.871433
A04H4               -0.646831    -1.104191    -0.117431
A05H5               -1.084554     0.426730    -0.895502
A06H6                0.779407     1.301990     0.230852
A01O1                3.239452    -1.207579    -0.797037
A02H2                3.834226    -0.481661    -0.742616
A03H3                2.409641    -0.894456    -0.485523
A01O1                4.329781    -4.066879    -0.663014
A02H2                5.250677    -3.886442    -0.718393
A03H3                3.892853    -3.236642    -0.721970


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0162874697
           POLARIZATION ENERGY    -0.0028566851
             DISPERSION ENERGY    -0.0023374675
     EXCHANGE REPULSION ENERGY     0.0086441829
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0009260598
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807053275

                  TOTAL ENERGY  -115.6944688266


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0004367325
              MAXIMUM GRADIENT     0.0008502942



L-BFGS-B is unable to make an optimization step

OPTIMIZATION HAS NOT CONVERGED
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:43 2025
TOTAL RUN TIME IS 1 SECONDS
