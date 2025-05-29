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
WALL CLOCK TIME IS Thu May 29 00:29:47 2025

SIMULATION SETTINGS

run_type opt
coord atoms
terms qq lj
special_terms qq lj
elec_damp off
disp_damp off
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
max_steps 200
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
torch_nn ani2.pt
ml_path ../nnlib/
userml_path .
custom_nn custom_model_script.pt
aev_nn aev_scripted.pt
atom_gradient frag
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


Chosen nn_type: ani2.pt
The location of NN potential is: ../nnlib/
Model loaded from: ../nnlib/ANI2x_saved.pt

SPECIAL FRAGMENT ATOMS AND ALL FRAGMENTS ENERGY MINIMIZATION JOB


    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.863988    -0.300000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.815841     5.662265    -0.001087
A02H                -1.617526     4.721007     0.000855
A03H                -2.466117     5.768707    -0.696581


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0107342521
                     LJ ENERGY     0.0016890975

                     ML ENERGY   -76.3102273842

                  TOTAL ENERGY   -76.3192725388


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.1297887655
              MAXIMUM GRADIENT     0.2892933839



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.707907     2.839325    -0.225700
A02H                -1.621015     1.765668    -0.006454
A03H                -2.580038     2.721602    -0.781028
A01O                -1.815587     5.662002    -0.000862
A02H                -1.617949     4.720601     0.001014
A03H                -2.465561     5.769008    -0.696551


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0104613459
                     LJ ENERGY     0.0014696759

                     ML ENERGY   -76.3696164409

                  TOTAL ENERGY   -76.3786081108


                 ENERGY CHANGE    -0.0593355720
                  RMS GRADIENT     0.0385866798
              MAXIMUM GRADIENT     0.0972499618



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.717366     2.809245    -0.227264
A02H                -1.620104     1.792339    -0.009879
A03H                -2.571884     2.725445    -0.776318
A01O                -1.815273     5.661627    -0.000601
A02H                -1.616499     4.720467     0.002077
A03H                -2.464941     5.767346    -0.696772


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0096228482
                     LJ ENERGY     0.0011679624

                     ML ENERGY   -76.3799027804

                  TOTAL ENERGY   -76.3883576662


                 ENERGY CHANGE    -0.0097495554
                  RMS GRADIENT     0.0280260314
              MAXIMUM GRADIENT     0.0678545278



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.748397     2.737899    -0.235962
A02H                -1.615864     1.860563    -0.017362
A03H                -2.547343     2.732354    -0.761613
A01O                -1.813462     5.658154     0.000777
A02H                -1.608574     4.718330     0.007861
A03H                -2.461395     5.756891    -0.698032


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0077461915
                     LJ ENERGY     0.0006408466

                     ML ENERGY   -76.3855397211

                  TOTAL ENERGY   -76.3926450660


                 ENERGY CHANGE    -0.0042873998
                  RMS GRADIENT     0.0224754557
              MAXIMUM GRADIENT     0.0599906154



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.745400     2.768903    -0.238715
A02H                -1.612902     1.829920    -0.010819
A03H                -2.553129     2.731679    -0.765298
A01O                -1.813597     5.658441     0.000681
A02H                -1.609263     4.718493     0.007394
A03H                -2.461649     5.757799    -0.697930


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0085533634
                     LJ ENERGY     0.0008517109

                     ML ENERGY   -76.3880606768

                  TOTAL ENERGY   -76.3957623292


                 ENERGY CHANGE    -0.0031172632
                  RMS GRADIENT     0.0043590956
              MAXIMUM GRADIENT     0.0112099627



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.747993     2.763860    -0.239421
A02H                -1.611356     1.835123    -0.010579
A03H                -2.552626     2.732490    -0.765192
A01O                -1.813147     5.657534     0.001023
A02H                -1.607603     4.717858     0.008696
A03H                -2.460742     5.755467    -0.698213


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0084330153
                     LJ ENERGY     0.0008205570

                     ML ENERGY   -76.3882239413

                  TOTAL ENERGY   -76.3958363996


                 ENERGY CHANGE    -0.0000740703
                  RMS GRADIENT     0.0018198917
              MAXIMUM GRADIENT     0.0033933753



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.750256     2.761869    -0.240201
A02H                -1.608476     1.837942    -0.009101
A03H                -2.554154     2.733319    -0.766501
A01O                -1.812383     5.655978     0.001605
A02H                -1.605004     4.716718     0.010815
A03H                -2.459181     5.751710    -0.698672


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0084058328
                     LJ ENERGY     0.0008167950

                     ML ENERGY   -76.3882627478

                  TOTAL ENERGY   -76.3958517856


                 ENERGY CHANGE    -0.0000153861
                  RMS GRADIENT     0.0016416102
              MAXIMUM GRADIENT     0.0031228250



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.755818     2.760530    -0.242488
A02H                -1.600717     1.842787    -0.004700
A03H                -2.558951     2.734590    -0.770363
A01O                -1.810182     5.651464     0.003283
A02H                -1.598035     4.713321     0.016710
A03H                -2.454616     5.741368    -0.699940


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0084401634
                     LJ ENERGY     0.0008383916

                     ML ENERGY   -76.3882863134

                  TOTAL ENERGY   -76.3958880852


                 ENERGY CHANGE    -0.0000362996
                  RMS GRADIENT     0.0020650863
              MAXIMUM GRADIENT     0.0059731401



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.764500     2.763533    -0.246407
A02H                -1.589148     1.851090     0.001703
A03H                -2.566796     2.732616    -0.776225
A01O                -1.805883     5.642538     0.006565
A02H                -1.586837     4.706113     0.027210
A03H                -2.445441     5.723458    -0.702179


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0086429101
                     LJ ENERGY     0.0009261569

                     ML ENERGY   -76.3882587468

                  TOTAL ENERGY   -76.3959755001


                 ENERGY CHANGE    -0.0000874149
                  RMS GRADIENT     0.0020733569
              MAXIMUM GRADIENT     0.0065823448



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.783551     2.777902    -0.255040
A02H                -1.566656     1.878326     0.012496
A03H                -2.583567     2.716728    -0.787632
A01O                -1.793904     5.617539     0.015716
A02H                -1.565232     4.683914     0.052496
A03H                -2.418947     5.682845    -0.707442


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0093297527
                     LJ ENERGY     0.0012599415

                     ML ENERGY   -76.3881664127

                  TOTAL ENERGY   -76.3962362240


                 ENERGY CHANGE    -0.0002607239
                  RMS GRADIENT     0.0023006169
              MAXIMUM GRADIENT     0.0062771238



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.819908     2.812882    -0.272165
A02H                -1.527814     1.939784     0.028797
A03H                -2.613176     2.672120    -0.806303
A01O                -1.768066     5.565965     0.035603
A02H                -1.550070     4.630851     0.093396
A03H                -2.359455     5.628167    -0.715589


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0109028547
                     LJ ENERGY     0.0022769688

                     ML ENERGY   -76.3880641911

                  TOTAL ENERGY   -76.3966900770


                 ENERGY CHANGE    -0.0004538530
                  RMS GRADIENT     0.0028415838
              MAXIMUM GRADIENT     0.0051310331



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.835385     2.828745    -0.281356
A02H                -1.520039     1.967190     0.029850
A03H                -2.616675     2.645482    -0.806947
A01O                -1.756175     5.548379     0.045191
A02H                -1.567627     4.606677     0.099469
A03H                -2.330426     5.634248    -0.716886


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0116413680
                     LJ ENERGY     0.0027993278

                     ML ENERGY   -76.3881820863

                  TOTAL ENERGY   -76.3970241264


                 ENERGY CHANGE    -0.0003340495
                  RMS GRADIENT     0.0031405348
              MAXIMUM GRADIENT     0.0060540440



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.850016     2.856170    -0.290277
A02H                -1.512573     2.016397     0.027554
A03H                -2.628320     2.591968    -0.811053
A01O                -1.735404     5.522632     0.062443
A02H                -1.617268     4.568687     0.098937
A03H                -2.274285     5.667734    -0.716308


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130629535
                     LJ ENERGY     0.0038626941

                     ML ENERGY   -76.3881583763

                  TOTAL ENERGY   -76.3973586357


                 ENERGY CHANGE    -0.0003345092
                  RMS GRADIENT     0.0047609197
              MAXIMUM GRADIENT     0.0111958887



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.841645     2.841829    -0.287324
A02H                -1.523096     1.992456     0.024196
A03H                -2.616862     2.609994    -0.803980
A01O                -1.744224     5.542673     0.055730
A02H                -1.622635     4.588876     0.083784
A03H                -2.295249     5.691462    -0.713773


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0123430298
                     LJ ENERGY     0.0031416911

                     ML ENERGY   -76.3882403999

                  TOTAL ENERGY   -76.3974417385


                 ENERGY CHANGE    -0.0000831028
                  RMS GRADIENT     0.0021492444
              MAXIMUM GRADIENT     0.0037861535



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.853114     2.848053    -0.293414
A02H                -1.510630     2.005197     0.030429
A03H                -2.624621     2.600477    -0.809077
A01O                -1.737621     5.533104     0.060905
A02H                -1.622798     4.578537     0.091203
A03H                -2.279053     5.684826    -0.714809


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0126717730
                     LJ ENERGY     0.0034287615

                     ML ENERGY   -76.3882850654

                  TOTAL ENERGY   -76.3975280769


                 ENERGY CHANGE    -0.0000863384
                  RMS GRADIENT     0.0019030418
              MAXIMUM GRADIENT     0.0034654175



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.862810     2.853532    -0.299477
A02H                -1.502315     2.020735     0.033598
A03H                -2.630745     2.583564    -0.812243
A01O                -1.729447     5.527840     0.067801
A02H                -1.642195     4.570111     0.088830
A03H                -2.255273     5.703452    -0.713587


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129874882
                     LJ ENERGY     0.0036247214

                     ML ENERGY   -76.3882891336

                  TOTAL ENERGY   -76.3976519004


                 ENERGY CHANGE    -0.0001238235
                  RMS GRADIENT     0.0019296657
              MAXIMUM GRADIENT     0.0049101261



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.912677     2.869411    -0.331140
A02H                -1.460984     2.096144     0.049631
A03H                -2.660953     2.496944    -0.827734
A01O                -1.688134     5.516426     0.103519
A02H                -1.743175     4.556893     0.063957
A03H                -2.117563     5.814385    -0.699420


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0138026258
                     LJ ENERGY     0.0039423566

                     ML ENERGY   -76.3881355629

                  TOTAL ENERGY   -76.3979958321


                 ENERGY CHANGE    -0.0003439317
                  RMS GRADIENT     0.0047148261
              MAXIMUM GRADIENT     0.0114486295



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.900249     2.856433    -0.325331
A02H                -1.474976     2.074416     0.043650
A03H                -2.652177     2.509552    -0.822086
A01O                -1.695076     5.538212     0.098130
A02H                -1.744983     4.578813     0.049526
A03H                -2.134480     5.841623    -0.697335


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130617914
                     LJ ENERGY     0.0032270557

                     ML ENERGY   -76.3882938896

                  TOTAL ENERGY   -76.3981286253


                 ENERGY CHANGE    -0.0001327933
                  RMS GRADIENT     0.0016269677
              MAXIMUM GRADIENT     0.0034136788



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.912663     2.855435    -0.333145
A02H                -1.467055     2.089188     0.046581
A03H                -2.657488     2.489988    -0.824579
A01O                -1.685252     5.542562     0.106580
A02H                -1.759845     4.585666     0.042662
A03H                -2.100327     5.869194    -0.692747


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129523940
                     LJ ENERGY     0.0030319651

                     ML ENERGY   -76.3882832398

                  TOTAL ENERGY   -76.3982036687


                 ENERGY CHANGE    -0.0000750434
                  RMS GRADIENT     0.0013896669
              MAXIMUM GRADIENT     0.0032672083



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.959737     2.859210    -0.361270
A02H                -1.441573     2.150039     0.053709
A03H                -2.676226     2.410192    -0.832771
A01O                -1.646526     5.553985     0.139127
A02H                -1.781558     4.607706     0.031325
A03H                -1.972488     5.936983    -0.676325


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0128532892
                     LJ ENERGY     0.0025434020

                     ML ENERGY   -76.3881730858

                  TOTAL ENERGY   -76.3984829730


                 ENERGY CHANGE    -0.0002793042
                  RMS GRADIENT     0.0030323091
              MAXIMUM GRADIENT     0.0055371443



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.973720     2.859974    -0.368596
A02H                -1.443382     2.166852     0.049667
A03H                -2.675010     2.385598    -0.830387
A01O                -1.633753     5.561599     0.148609
A02H                -1.751686     4.612946     0.041605
A03H                -1.944610     5.936293    -0.676541


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127820442
                     LJ ENERGY     0.0023260779

                     ML ENERGY   -76.3882736553

                  TOTAL ENERGY   -76.3987296216


                 ENERGY CHANGE    -0.0002466486
                  RMS GRADIENT     0.0014213289
              MAXIMUM GRADIENT     0.0028242762



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.002828     2.865757    -0.385109
A02H                -1.437964     2.209087     0.046830
A03H                -2.679746     2.333237    -0.830101
A01O                -1.607892     5.565524     0.169027
A02H                -1.726492     4.618246     0.051137
A03H                -1.872243     5.946298    -0.669442


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127531365
                     LJ ENERGY     0.0021295779

                     ML ENERGY   -76.3882564624

                  TOTAL ENERGY   -76.3988800211


                 ENERGY CHANGE    -0.0001503995
                  RMS GRADIENT     0.0022617998
              MAXIMUM GRADIENT     0.0051700618



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.001908     2.865645    -0.384539
A02H                -1.439295     2.208293     0.046206
A03H                -2.678593     2.336089    -0.829329
A01O                -1.608726     5.563926     0.168139
A02H                -1.721645     4.615465     0.054252
A03H                -1.877105     5.939700    -0.671305


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127645369
                     LJ ENERGY     0.0021585522

                     ML ENERGY   -76.3882811635

                  TOTAL ENERGY   -76.3988871482


                 ENERGY CHANGE    -0.0000071272
                  RMS GRADIENT     0.0015130614
              MAXIMUM GRADIENT     0.0034555014



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.002245     2.865611    -0.384814
A02H                -1.439417     2.209125     0.046085
A03H                -2.678388     2.336105    -0.829084
A01O                -1.608515     5.563156     0.168281
A02H                -1.720825     4.614558     0.054930
A03H                -1.876730     5.938252    -0.671519


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127673957
                     LJ ENERGY     0.0021667747

                     ML ENERGY   -76.3882870955

                  TOTAL ENERGY   -76.3988877165


                 ENERGY CHANGE    -0.0000005683
                  RMS GRADIENT     0.0012660880
              MAXIMUM GRADIENT     0.0028631175



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 24 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.003054     2.865629    -0.385453
A02H                -1.439355     2.210936     0.045981
A03H                -2.678292     2.335358    -0.828807
A01O                -1.607915     5.562064     0.168773
A02H                -1.720701     4.613533     0.055337
A03H                -1.874733     5.937277    -0.671419


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127723579
                     LJ ENERGY     0.0021765849

                     ML ENERGY   -76.3882922331

                  TOTAL ENERGY   -76.3988880062


                 ENERGY CHANGE    -0.0000002897
                  RMS GRADIENT     0.0010100600
              MAXIMUM GRADIENT     0.0022059031



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 25 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.004442     2.865746    -0.386514
A02H                -1.439043     2.213771     0.045930
A03H                -2.678315     2.333792    -0.828502
A01O                -1.606884     5.560622     0.169642
A02H                -1.721064     4.612330     0.055604
A03H                -1.871088     5.936599    -0.671035


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127805789
                     LJ ENERGY     0.0021884609

                     ML ENERGY   -76.3882960738

                  TOTAL ENERGY   -76.3988881918


                 ENERGY CHANGE    -0.0000001856
                  RMS GRADIENT     0.0007639765
              MAXIMUM GRADIENT     0.0015632202



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 26 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.006273     2.865927    -0.387923
A02H                -1.438565     2.217494     0.045891
A03H                -2.678453     2.331410    -0.828170
A01O                -1.605471     5.558988     0.170856
A02H                -1.722066     4.611142     0.055562
A03H                -1.865858     5.936519    -0.670316


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0127899693
                     LJ ENERGY     0.0022002885

                     ML ENERGY   -76.3882986358

                  TOTAL ENERGY   -76.3988883167


                 ENERGY CHANGE    -0.0000001249
                  RMS GRADIENT     0.0005473100
              MAXIMUM GRADIENT     0.0009384594



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 27 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.009095     2.866304    -0.390110
A02H                -1.437787     2.223072     0.045860
A03H                -2.678710     2.327500    -0.827688
A01O                -1.603283     5.556743     0.172755
A02H                -1.723992     4.609693     0.055168
A03H                -1.857561     5.937058    -0.669031


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0128048054
                     LJ ENERGY     0.0022156856

                     ML ENERGY   -76.3883002221

                  TOTAL ENERGY   -76.3988893419


                 ENERGY CHANGE    -0.0000010252
                  RMS GRADIENT     0.0003548117
              MAXIMUM GRADIENT     0.0005795977



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 28 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.022782     2.868525    -0.400952
A02H                -1.434010     2.250643     0.045644
A03H                -2.680156     2.307147    -0.825312
A01O                -1.592460     5.546190     0.182282
A02H                -1.735446     4.603966     0.051635
A03H                -1.814937     5.941591    -0.661555


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0128796994
                     LJ ENERGY     0.0022864531

                     ML ENERGY   -76.3882986381

                  TOTAL ENERGY   -76.3988918844


                 ENERGY CHANGE    -0.0000025425
                  RMS GRADIENT     0.0005229753
              MAXIMUM GRADIENT     0.0015267099



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 29 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.034863     2.871461    -0.410899
A02H                -1.431257     2.273381     0.045221
A03H                -2.680764     2.288137    -0.822576
A01O                -1.583055     5.538514     0.190665
A02H                -1.745194     4.601234     0.047430
A03H                -1.776894     5.947050    -0.653980


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129475738
                     LJ ENERGY     0.0023335324

                     ML ENERGY   -76.3882987961

                  TOTAL ENERGY   -76.3989128376


                 ENERGY CHANGE    -0.0000209532
                  RMS GRADIENT     0.0005847338
              MAXIMUM GRADIENT     0.0014534961



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 30 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.041567     2.873435    -0.417007
A02H                -1.430475     2.289521     0.044250
A03H                -2.681430     2.274779    -0.820635
A01O                -1.576837     5.533049     0.196309
A02H                -1.752295     4.599592     0.044085
A03H                -1.750715     5.950409    -0.648367


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129939758
                     LJ ENERGY     0.0023735899

                     ML ENERGY   -76.3882990581

                  TOTAL ENERGY   -76.3989194440


                 ENERGY CHANGE    -0.0000066064
                  RMS GRADIENT     0.0005278859
              MAXIMUM GRADIENT     0.0010131971



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 31 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.040981     2.873397    -0.416669
A02H                -1.430514     2.287210     0.044475
A03H                -2.681117     2.276273    -0.820592
A01O                -1.577631     5.533932     0.195665
A02H                -1.752356     4.600270     0.043851
A03H                -1.753436     5.951011    -0.648751


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129918436
                     LJ ENERGY     0.0023664987

                     ML ENERGY   -76.3883008645

                  TOTAL ENERGY   -76.3989262094


                 ENERGY CHANGE    -0.0000067655
                  RMS GRADIENT     0.0001887714
              MAXIMUM GRADIENT     0.0003656509



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 32 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.039767     2.873324    -0.416071
A02H                -1.430927     2.284740     0.044520
A03H                -2.680839     2.277946    -0.820500
A01O                -1.578624     5.534824     0.194889
A02H                -1.752694     4.600979     0.043453
A03H                -1.756617     5.951705    -0.649166


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129909001
                     LJ ENERGY     0.0023624018

                     ML ENERGY   -76.3883010425

                  TOTAL ENERGY   -76.3989295408


                 ENERGY CHANGE    -0.0000033314
                  RMS GRADIENT     0.0001703278
              MAXIMUM GRADIENT     0.0004035908



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 33 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.038918     2.873625    -0.416762
A02H                -1.431446     2.284004     0.044541
A03H                -2.680577     2.278057    -0.819672
A01O                -1.579127     5.534973     0.194789
A02H                -1.755943     4.601963     0.041399
A03H                -1.755981     5.954155    -0.648365


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130019393
                     LJ ENERGY     0.0023665426

                     ML ENERGY   -76.3883007953

                  TOTAL ENERGY   -76.3989361920


                 ENERGY CHANGE    -0.0000066512
                  RMS GRADIENT     0.0001833905
              MAXIMUM GRADIENT     0.0004996325



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 34 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.037009     2.873651    -0.417928
A02H                -1.431650     2.283179     0.045156
A03H                -2.681154     2.279195    -0.818771
A01O                -1.580141     5.534432     0.194502
A02H                -1.760111     4.602391     0.038900
A03H                -1.755873     5.956253    -0.647570


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130186249
                     LJ ENERGY     0.0023804082

                     ML ENERGY   -76.3883007948

                  TOTAL ENERGY   -76.3989390114


                 ENERGY CHANGE    -0.0000028193
                  RMS GRADIENT     0.0001584153
              MAXIMUM GRADIENT     0.0003639760



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
    FINAL STATE

    GEOMETRY (ANGSTROMS)

A01O                -2.037009     2.873651    -0.417928
A02H                -1.431650     2.283179     0.045156
A03H                -2.681154     2.279195    -0.818771
A01O                -1.580141     5.534432     0.194502
A02H                -1.760111     4.602391     0.038900
A03H                -1.755873     5.956253    -0.647570


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130186249
                     LJ ENERGY     0.0023804082

                     ML ENERGY   -76.3883007948

                  TOTAL ENERGY   -76.3989390114


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0001584153
              MAXIMUM GRADIENT     0.0003639760



OPTIMIZATION CONVERGED IN 35 STEPS
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:47 2025
TOTAL RUN TIME IS 0 SECONDS
