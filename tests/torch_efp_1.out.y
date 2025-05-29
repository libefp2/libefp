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
WALL CLOCK TIME IS Thu May 29 00:29:38 2025

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
enable_elpot false
opt_special_frag 0
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

SPECIAL FRAGMENT ENERGY MINIMIZATION JOB


    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01C1               -0.717119     0.013446    -0.000001
A02O2                0.678635    -0.063043    -0.000001
A03H3               -1.094134     0.520396     0.883227
A04H4               -1.094993    -0.998593    -0.000048
A05H5               -1.094156     0.520490    -0.883163
A06H6                1.051482     0.798141     0.100000
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0058236599
           POLARIZATION ENERGY    -0.0006268233
             DISPERSION ENERGY    -0.0023411920
     EXCHANGE REPULSION ENERGY     0.0061976931
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006309743
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6797036886

                  TOTAL ENERGY  -115.6712813253


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0079958818
              MAXIMUM GRADIENT     0.0210249823



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.717627     0.017593     0.000806
A02O2                0.681255    -0.080822    -0.000294
A03H3               -1.099421     0.523555     0.889534
A04H4               -1.096715    -1.005345     0.000005
A05H5               -1.098759     0.523538    -0.889782
A06H6                1.056544     0.814084     0.101190
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0059188550
           POLARIZATION ENERGY    -0.0006332689
             DISPERSION ENERGY    -0.0023519636
     EXCHANGE REPULSION ENERGY     0.0062394766
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006346618
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6803671070

                  TOTAL ENERGY  -115.6718286697


                 ENERGY CHANGE    -0.0005473445
                  RMS GRADIENT     0.0050754256
              MAXIMUM GRADIENT     0.0119786059



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.719416     0.016707     0.000749
A02O2                0.685661    -0.076472     0.001131
A03H3               -1.101046     0.524570     0.891364
A04H4               -1.097288    -1.005978     0.000068
A05H5               -1.099998     0.524365    -0.891466
A06H6                1.054905     0.810356     0.100407
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0059027467
           POLARIZATION ENERGY    -0.0006361097
             DISPERSION ENERGY    -0.0023518535
     EXCHANGE REPULSION ENERGY     0.0062419871
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006353209
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805906040

                  TOTAL ENERGY  -115.6720691543


                 ENERGY CHANGE    -0.0002404845
                  RMS GRADIENT     0.0018242521
              MAXIMUM GRADIENT     0.0036904083



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.720440     0.016764     0.000972
A02O2                0.688096    -0.074461     0.003113
A03H3               -1.103833     0.525824     0.893737
A04H4               -1.098087    -1.007460     0.000181
A05H5               -1.101981     0.525351    -0.893781
A06H6                1.054230     0.809413     0.099599
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0058925365
           POLARIZATION ENERGY    -0.0006374112
             DISPERSION ENERGY    -0.0023512502
     EXCHANGE REPULSION ENERGY     0.0062402111
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006353459
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806390881

                  TOTAL ENERGY  -115.6721303478


                 ENERGY CHANGE    -0.0000611936
                  RMS GRADIENT     0.0009370962
              MAXIMUM GRADIENT     0.0021077706



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.721414     0.017266     0.001356
A02O2                0.687861    -0.073509     0.005350
A03H3               -1.106584     0.526518     0.895079
A04H4               -1.098586    -1.008244     0.000337
A05H5               -1.103606     0.525725    -0.895088
A06H6                1.054187     0.810073     0.098786
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0058811716
           POLARIZATION ENERGY    -0.0006363658
             DISPERSION ENERGY    -0.0023485858
     EXCHANGE REPULSION ENERGY     0.0062272945
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006340244
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806470693

                  TOTAL ENERGY  -115.6721575792


                 ENERGY CHANGE    -0.0000272313
                  RMS GRADIENT     0.0009954050
              MAXIMUM GRADIENT     0.0024529467



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.728111     0.020180     0.003587
A02O2                0.683758    -0.068538     0.016795
A03H3               -1.119537     0.528407     0.898489
A04H4               -1.100228    -1.009416     0.001239
A05H5               -1.110056     0.525882    -0.898239
A06H6                1.053638     0.814014     0.094545
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0058151833
           POLARIZATION ENERGY    -0.0006284333
             DISPERSION ENERGY    -0.0023310924
     EXCHANGE REPULSION ENERGY     0.0061428186
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006250932
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806354629

                  TOTAL ENERGY  -115.6722620799


                 ENERGY CHANGE    -0.0001045007
                  RMS GRADIENT     0.0015551088
              MAXIMUM GRADIENT     0.0041093896



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.740765     0.025385     0.009051
A02O2                0.671119    -0.057575     0.041425
A03H3               -1.147877     0.531583     0.902233
A04H4               -1.103711    -1.008358     0.003667
A05H5               -1.121767     0.524962    -0.900915
A06H6                1.049372     0.823300     0.084981
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0056552928
           POLARIZATION ENERGY    -0.0006081867
             DISPERSION ENERGY    -0.0022914757
     EXCHANGE REPULSION ENERGY     0.0059577481
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006052971
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805657271

                  TOTAL ENERGY  -115.6724576457


                 ENERGY CHANGE    -0.0001955658
                  RMS GRADIENT     0.0021697782
              MAXIMUM GRADIENT     0.0041615207



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.777050     0.044158     0.023863
A02O2                0.645671    -0.033813     0.099689
A03H3               -1.214569     0.537389     0.903827
A04H4               -1.114315    -1.006329     0.011202
A05H5               -1.143736     0.521220    -0.899791
A06H6                1.029799     0.848114     0.061399
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0052923397
           POLARIZATION ENERGY    -0.0005679784
             DISPERSION ENERGY    -0.0022015941
     EXCHANGE REPULSION ENERGY     0.0055677510
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005624373
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802273440

                  TOTAL ENERGY  -115.6726992631


                 ENERGY CHANGE    -0.0002416174
                  RMS GRADIENT     0.0040105692
              MAXIMUM GRADIENT     0.0093737057



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.790690     0.044729     0.032090
A02O2                0.623431    -0.017190     0.132058
A03H3               -1.252467     0.541741     0.903367
A04H4               -1.120317    -0.998475     0.016554
A05H5               -1.153679     0.519880    -0.896892
A06H6                1.014388     0.861863     0.048025
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0050454367
           POLARIZATION ENERGY    -0.0005400746
             DISPERSION ENERGY    -0.0021495678
     EXCHANGE REPULSION ENERGY     0.0053636058
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005399162
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802526945

                  TOTAL ENERGY  -115.6730732106


                 ENERGY CHANGE    -0.0003739475
                  RMS GRADIENT     0.0025319654
              MAXIMUM GRADIENT     0.0062826324



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.800888     0.046405     0.040402
A02O2                0.602656     0.000274     0.158175
A03H3               -1.282439     0.544229     0.896318
A04H4               -1.127984    -0.990933     0.023278
A05H5               -1.155845     0.518200    -0.888038
A06H6                0.990438     0.872513     0.037088
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0048167463
           POLARIZATION ENERGY    -0.0005171625
             DISPERSION ENERGY    -0.0021049828
     EXCHANGE REPULSION ENERGY     0.0051996112
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005214323
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6803202759

                  TOTAL ENERGY  -115.6734474960


                 ENERGY CHANGE    -0.0003742854
                  RMS GRADIENT     0.0019459042
              MAXIMUM GRADIENT     0.0048630418



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.835855     0.056764     0.058909
A02O2                0.564058     0.034332     0.225576
A03H3               -1.357901     0.552878     0.889337
A04H4               -1.146348    -0.982603     0.038221
A05H5               -1.168330     0.516392    -0.878113
A06H6                0.942443     0.904486     0.010097
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0043471621
           POLARIZATION ENERGY    -0.0004747588
             DISPERSION ENERGY    -0.0020077445
     EXCHANGE REPULSION ENERGY     0.0048720894
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004836972
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6800324902

                  TOTAL ENERGY  -115.6737794393


                 ENERGY CHANGE    -0.0003319433
                  RMS GRADIENT     0.0040495707
              MAXIMUM GRADIENT     0.0099104641



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.842781     0.057161     0.063909
A02O2                0.556372     0.046284     0.235320
A03H3               -1.368121     0.555203     0.883086
A04H4               -1.154480    -0.983607     0.045130
A05H5               -1.161934     0.517889    -0.873946
A06H6                0.917768     0.910976     0.008836
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0042340917
           POLARIZATION ENERGY    -0.0004693895
             DISPERSION ENERGY    -0.0019884814
     EXCHANGE REPULSION ENERGY     0.0048130793
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004767215
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801910570

                  TOTAL ENERGY  -115.6740784784


                 ENERGY CHANGE    -0.0002990391
                  RMS GRADIENT     0.0020870481
              MAXIMUM GRADIENT     0.0042534165



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.864323     0.062116     0.074625
A02O2                0.534078     0.072944     0.273496
A03H3               -1.410432     0.562766     0.880191
A04H4               -1.169343    -0.984446     0.057369
A05H5               -1.164715     0.518816    -0.872080
A06H6                0.879264     0.930020    -0.002241
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0039520388
           POLARIZATION ENERGY    -0.0004492081
             DISPERSION ENERGY    -0.0019332830
     EXCHANGE REPULSION ENERGY     0.0046512514
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004575608
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801026877

                  TOTAL ENERGY  -115.6743394495


                 ENERGY CHANGE    -0.0002609711
                  RMS GRADIENT     0.0016509083
              MAXIMUM GRADIENT     0.0038132139



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.885032     0.066063     0.082268
A02O2                0.508452     0.101076     0.303688
A03H3               -1.441051     0.571620     0.881248
A04H4               -1.183322    -0.988359     0.071997
A05H5               -1.166011     0.516696    -0.878594
A06H6                0.842276     0.950457    -0.002599
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0037185708
           POLARIZATION ENERGY    -0.0004324281
             DISPERSION ENERGY    -0.0018818462
     EXCHANGE REPULSION ENERGY     0.0045123567
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004407802
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6800293926

                  TOTAL ENERGY  -115.6745535195


                 ENERGY CHANGE    -0.0002140700
                  RMS GRADIENT     0.0010888091
              MAXIMUM GRADIENT     0.0020427960



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.909996     0.069300     0.086939
A02O2                0.487390     0.129655     0.336818
A03H3               -1.477883     0.580358     0.882641
A04H4               -1.193279    -0.984016     0.085127
A05H5               -1.176062     0.509638    -0.882671
A06H6                0.812445     0.969552    -0.002943
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0034914095
           POLARIZATION ENERGY    -0.0004175721
             DISPERSION ENERGY    -0.0018327010
     EXCHANGE REPULSION ENERGY     0.0043887313
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004257768
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6798352938

                  TOTAL ENERGY  -115.6746312029


                 ENERGY CHANGE    -0.0000776834
                  RMS GRADIENT     0.0023842090
              MAXIMUM GRADIENT     0.0051015186



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.907202     0.070711     0.087016
A02O2                0.485126     0.129430     0.332409
A03H3               -1.473137     0.580318     0.882285
A04H4               -1.192624    -0.985003     0.086145
A05H5               -1.176869     0.507390    -0.885288
A06H6                0.813592     0.970374     0.002324
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0035168991
           POLARIZATION ENERGY    -0.0004181502
             DISPERSION ENERGY    -0.0018342257
     EXCHANGE REPULSION ENERGY     0.0043928458
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004261986
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6799266298

                  TOTAL ENERGY  -115.6746954594


                 ENERGY CHANGE    -0.0000642564
                  RMS GRADIENT     0.0013373877
              MAXIMUM GRADIENT     0.0024259255



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.916904     0.076729     0.092183
A02O2                0.467564     0.144945     0.346992
A03H3               -1.491341     0.584629     0.879142
A04H4               -1.197157    -0.982316     0.095407
A05H5               -1.186090     0.498981    -0.888533
A06H6                0.798154     0.984258     0.008340
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0034259185
           POLARIZATION ENERGY    -0.0004093700
             DISPERSION ENERGY    -0.0018076764
     EXCHANGE REPULSION ENERGY     0.0043300425
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004183865
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6799073063

                  TOTAL ENERGY  -115.6747867782


                 ENERGY CHANGE    -0.0000913188
                  RMS GRADIENT     0.0013715299
              MAXIMUM GRADIENT     0.0024693245



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.932474     0.084840     0.095847
A02O2                0.444467     0.170121     0.361544
A03H3               -1.514116     0.592760     0.874164
A04H4               -1.201671    -0.976583     0.111830
A05H5               -1.203236     0.481082    -0.895575
A06H6                0.776577     1.005738     0.028503
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0033248077
           POLARIZATION ENERGY    -0.0004011586
             DISPERSION ENERGY    -0.0017724898
     EXCHANGE REPULSION ENERGY     0.0042511139
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004085236
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6798754934

                  TOTAL ENERGY  -115.6748817439


                 ENERGY CHANGE    -0.0000949657
                  RMS GRADIENT     0.0022783090
              MAXIMUM GRADIENT     0.0047800670



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.981704     0.103487     0.114376
A02O2                0.384680     0.237128     0.426126
A03H3               -1.601044     0.613744     0.860019
A04H4               -1.221575    -0.965257     0.150948
A05H5               -1.239006     0.451576    -0.902058
A06H6                0.707383     1.061681     0.048401
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0029534798
           POLARIZATION ENERGY    -0.0003746833
             DISPERSION ENERGY    -0.0016764853
     EXCHANGE REPULSION ENERGY     0.0040548867
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003842627
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6796934327

                  TOTAL ENERGY  -115.6751204975


                 ENERGY CHANGE    -0.0002387536
                  RMS GRADIENT     0.0025081862
              MAXIMUM GRADIENT     0.0048113024



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.061995     0.127513     0.141514
A02O2                0.277776     0.352527     0.521892
A03H3               -1.751400     0.655017     0.824286
A04H4               -1.254923    -0.943843     0.228701
A05H5               -1.296146     0.398271    -0.902322
A06H6                0.579724     1.167994     0.098416
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024777904
           POLARIZATION ENERGY    -0.0003432834
             DISPERSION ENERGY    -0.0015411743
     EXCHANGE REPULSION ENERGY     0.0038268239
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003566198
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6795427561

                  TOTAL ENERGY  -115.6754792194


                 ENERGY CHANGE    -0.0003587218
                  RMS GRADIENT     0.0032552373
              MAXIMUM GRADIENT     0.0068736599



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.129825     0.144929     0.161421
A02O2                0.197672     0.436782     0.565246
A03H3               -1.856124     0.689962     0.777984
A04H4               -1.274835    -0.927529     0.305844
A05H5               -1.340116     0.348095    -0.898821
A06H6                0.478306     1.268188     0.171624
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0022995772
           POLARIZATION ENERGY    -0.0003337910
             DISPERSION ENERGY    -0.0014627568
     EXCHANGE REPULSION ENERGY     0.0037210092
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003442844
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6798912551

                  TOTAL ENERGY  -115.6760115010


                 ENERGY CHANGE    -0.0005322816
                  RMS GRADIENT     0.0019845572
              MAXIMUM GRADIENT     0.0039360416



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.156223     0.147507     0.165532
A02O2                0.157048     0.466101     0.558141
A03H3               -1.903644     0.711509     0.742118
A04H4               -1.283342    -0.917785     0.363835
A05H5               -1.350466     0.321453    -0.890212
A06H6                0.413822     1.337500     0.232938
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0023097954
           POLARIZATION ENERGY    -0.0003366066
             DISPERSION ENERGY    -0.0014362294
     EXCHANGE REPULSION ENERGY     0.0036900098
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003408027
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6801585890

                  TOTAL ENERGY  -115.6762724225


                 ENERGY CHANGE    -0.0002609215
                  RMS GRADIENT     0.0034284917
              MAXIMUM GRADIENT     0.0083297664



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.191920     0.157566     0.179358
A02O2                0.112924     0.512661     0.586959
A03H3               -1.967437     0.729722     0.720172
A04H4               -1.297924    -0.908717     0.407975
A05H5               -1.369119     0.298631    -0.891398
A06H6                0.349018     1.391699     0.266214
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0022039421
           POLARIZATION ENERGY    -0.0003311815
             DISPERSION ENERGY    -0.0013997627
     EXCHANGE REPULSION ENERGY     0.0036493760
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003363179
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6802245396

                  TOTAL ENERGY  -115.6764384837


                 ENERGY CHANGE    -0.0001660612
                  RMS GRADIENT     0.0026621860
              MAXIMUM GRADIENT     0.0052903614



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.197886     0.161092     0.188309
A02O2                0.114745     0.515290     0.585929
A03H3               -1.977213     0.726112     0.712826
A04H4               -1.305016    -0.901018     0.422425
A05H5               -1.358763     0.299852    -0.893609
A06H6                0.319253     1.401561     0.271075
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0021837803
           POLARIZATION ENERGY    -0.0003337065
             DISPERSION ENERGY    -0.0013984426
     EXCHANGE REPULSION ENERGY     0.0036487665
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003362350
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6804344907

                  TOTAL ENERGY  -115.6766703281


                 ENERGY CHANGE    -0.0002318444
                  RMS GRADIENT     0.0022651312
              MAXIMUM GRADIENT     0.0061661039



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 24 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.213489     0.169534     0.190340
A02O2                0.090617     0.539635     0.598447
A03H3               -2.007343     0.734683     0.702363
A04H4               -1.314947    -0.891242     0.450053
A05H5               -1.367543     0.281737    -0.895176
A06H6                0.276759     1.434211     0.296066
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0021378328
           POLARIZATION ENERGY    -0.0003322863
             DISPERSION ENERGY    -0.0013809885
     EXCHANGE REPULSION ENERGY     0.0036307999
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003342859
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805249765

                  TOTAL ENERGY  -115.6768039044


                 ENERGY CHANGE    -0.0001335764
                  RMS GRADIENT     0.0016060773
              MAXIMUM GRADIENT     0.0033302875



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 25 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.227588     0.175695     0.190234
A02O2                0.065050     0.564677     0.605412
A03H3               -2.031406     0.743283     0.691417
A04H4               -1.327525    -0.873232     0.482586
A05H5               -1.374864     0.256062    -0.899070
A06H6                0.224475     1.474969     0.332616
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0021012522
           POLARIZATION ENERGY    -0.0003326799
             DISPERSION ENERGY    -0.0013645969
     EXCHANGE REPULSION ENERGY     0.0036147064
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003325634
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806233848

                  TOTAL ENERGY  -115.6769372664


                 ENERGY CHANGE    -0.0001333620
                  RMS GRADIENT     0.0015126970
              MAXIMUM GRADIENT     0.0034459263



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 26 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.239251     0.181311     0.191569
A02O2                0.049541     0.583830     0.611833
A03H3               -2.044292     0.748129     0.684230
A04H4               -1.337881    -0.864054     0.500324
A05H5               -1.376669     0.239600    -0.897890
A06H6                0.188728     1.499963     0.352684
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0020666044
           POLARIZATION ENERGY    -0.0003326845
             DISPERSION ENERGY    -0.0013536794
     EXCHANGE REPULSION ENERGY     0.0036044952
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003314783
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806678214

                  TOTAL ENERGY  -115.6770145640


                 ENERGY CHANGE    -0.0000772976
                  RMS GRADIENT     0.0012355734
              MAXIMUM GRADIENT     0.0032208142



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 27 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.265680     0.188769     0.203085
A02O2                0.010732     0.625944     0.628507
A03H3               -2.083506     0.762169     0.664255
A04H4               -1.356776    -0.847920     0.537154
A05H5               -1.384530     0.209996    -0.894087
A06H6                0.118643     1.553680     0.390804
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0019989405
           POLARIZATION ENERGY    -0.0003302245
             DISPERSION ENERGY    -0.0013293879
     EXCHANGE REPULSION ENERGY     0.0035829593
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003292348
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806692036

                  TOTAL ENERGY  -115.6770761511


                 ENERGY CHANGE    -0.0000615871
                  RMS GRADIENT     0.0011157262
              MAXIMUM GRADIENT     0.0036288416



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 28 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.265320     0.188028     0.205202
A02O2                0.008862     0.630752     0.628336
A03H3               -2.083683     0.763089     0.662850
A04H4               -1.359761    -0.846702     0.537005
A05H5               -1.381428     0.208266    -0.890321
A06H6                0.110541     1.555901     0.392102
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0019887570
           POLARIZATION ENERGY    -0.0003302343
             DISPERSION ENERGY    -0.0013281714
     EXCHANGE REPULSION ENERGY     0.0035817749
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003291141
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806862509

                  TOTAL ENERGY  -115.6771032388


                 ENERGY CHANGE    -0.0000270877
                  RMS GRADIENT     0.0011269640
              MAXIMUM GRADIENT     0.0022182676



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 29 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.271928     0.190342     0.209271
A02O2               -0.000564     0.640647     0.630588
A03H3               -2.093282     0.766944     0.654828
A04H4               -1.364770    -0.844406     0.546797
A05H5               -1.380381     0.201849    -0.884929
A06H6                0.089542     1.571751     0.401787
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0019747978
           POLARIZATION ENERGY    -0.0003299260
             DISPERSION ENERGY    -0.0013227596
     EXCHANGE REPULSION ENERGY     0.0035773616
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003286608
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806934349

                  TOTAL ENERGY  -115.6771226219


                 ENERGY CHANGE    -0.0000193831
                  RMS GRADIENT     0.0004166408
              MAXIMUM GRADIENT     0.0007792538



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 30 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.278115     0.192124     0.212092
A02O2               -0.009339     0.650372     0.636449
A03H3               -2.104470     0.770035     0.650054
A04H4               -1.367108    -0.842923     0.553650
A05H5               -1.382795     0.198154    -0.882481
A06H6                0.077213     1.580780     0.406506
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0019582099
           POLARIZATION ENERGY    -0.0003287203
             DISPERSION ENERGY    -0.0013174067
     EXCHANGE REPULSION ENERGY     0.0035729205
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003282057
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806871982

                  TOTAL ENERGY  -115.6771304005


                 ENERGY CHANGE    -0.0000077786
                  RMS GRADIENT     0.0005204335
              MAXIMUM GRADIENT     0.0010933977



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 31 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.281237     0.193765     0.214435
A02O2               -0.016258     0.656417     0.642556
A03H3               -2.111877     0.770553     0.647324
A04H4               -1.367674    -0.841070     0.556793
A05H5               -1.383851     0.197225    -0.880047
A06H6                0.069963     1.584914     0.406236
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0019457234
           POLARIZATION ENERGY    -0.0003272552
             DISPERSION ENERGY    -0.0013136211
     EXCHANGE REPULSION ENERGY     0.0035697863
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003278851
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806914369

                  TOTAL ENERGY  -115.6771446885


                 ENERGY CHANGE    -0.0000142880
                  RMS GRADIENT     0.0004962229
              MAXIMUM GRADIENT     0.0009434396



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 32 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.300935     0.201902     0.225487
A02O2               -0.052601     0.689588     0.673645
A03H3               -2.149560     0.772453     0.633563
A04H4               -1.372840    -0.829338     0.576702
A05H5               -1.387943     0.189836    -0.869298
A06H6                0.028584     1.611335     0.408705
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0018823063
           POLARIZATION ENERGY    -0.0003206551
             DISPERSION ENERGY    -0.0012940312
     EXCHANGE REPULSION ENERGY     0.0035544508
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003263270
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806866077

                  TOTAL ENERGY  -115.6771908639


                 ENERGY CHANGE    -0.0000461754
                  RMS GRADIENT     0.0007327180
              MAXIMUM GRADIENT     0.0016527605



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 33 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.324208     0.214951     0.239902
A02O2               -0.101334     0.733630     0.708477
A03H3               -2.194956     0.771677     0.617982
A04H4               -1.381553    -0.816301     0.605443
A05H5               -1.389455     0.180639    -0.858966
A06H6               -0.022888     1.645272     0.414084
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0018219685
           POLARIZATION ENERGY    -0.0003135152
             DISPERSION ENERGY    -0.0012709722
     EXCHANGE REPULSION ENERGY     0.0035382422
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003246996
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806619518

                  TOTAL ENERGY  -115.6772109281


                 ENERGY CHANGE    -0.0000200642
                  RMS GRADIENT     0.0014738217
              MAXIMUM GRADIENT     0.0031808798



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 34 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.334589     0.217831     0.244386
A02O2               -0.120527     0.751990     0.723349
A03H3               -2.212160     0.769574     0.612731
A04H4               -1.385926    -0.808736     0.616771
A05H5               -1.387082     0.177625    -0.853055
A06H6               -0.044636     1.660361     0.414797
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0017944035
           POLARIZATION ENERGY    -0.0003109049
             DISPERSION ENERGY    -0.0012621638
     EXCHANGE REPULSION ENERGY     0.0035324490
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003241236
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6806867713

                  TOTAL ENERGY  -115.6772571112


                 ENERGY CHANGE    -0.0000461831
                  RMS GRADIENT     0.0008676499
              MAXIMUM GRADIENT     0.0019203690



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 35 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.364402     0.227649     0.258591
A02O2               -0.174926     0.806283     0.758995
A03H3               -2.261705     0.766096     0.595734
A04H4               -1.401393    -0.789235     0.653600
A05H5               -1.380792     0.164931    -0.838673
A06H6               -0.111035     1.708038     0.426060
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0017325504
           POLARIZATION ENERGY    -0.0003052477
             DISPERSION ENERGY    -0.0012390643
     EXCHANGE REPULSION ENERGY     0.0035188119
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003227778
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807022302

                  TOTAL ENERGY  -115.6773179576


                 ENERGY CHANGE    -0.0000608463
                  RMS GRADIENT     0.0006687663
              MAXIMUM GRADIENT     0.0013677071



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 36 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.374278     0.232978     0.263142
A02O2               -0.198768     0.829839     0.771151
A03H3               -2.280608     0.759198     0.590417
A04H4               -1.409253    -0.779430     0.670813
A05H5               -1.372634     0.161275    -0.831486
A06H6               -0.138594     1.728234     0.429988
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0017134085
           POLARIZATION ENERGY    -0.0003033263
             DISPERSION ENERGY    -0.0012303074
     EXCHANGE REPULSION ENERGY     0.0035141350
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003223177
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807060960

                  TOTAL ENERGY  -115.6773345039


                 ENERGY CHANGE    -0.0000165463
                  RMS GRADIENT     0.0006825716
              MAXIMUM GRADIENT     0.0020853410



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 37 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.393336     0.241029     0.274734
A02O2               -0.236187     0.866873     0.794365
A03H3               -2.316866     0.757083     0.576664
A04H4               -1.419186    -0.766177     0.696627
A05H5               -1.369372     0.152538    -0.820874
A06H6               -0.184868     1.760881     0.438868
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016836344
           POLARIZATION ENERGY    -0.0003000317
             DISPERSION ENERGY    -0.0012165938
     EXCHANGE REPULSION ENERGY     0.0035075215
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003216701
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807060737

                  TOTAL ENERGY  -115.6773532135


                 ENERGY CHANGE    -0.0000187096
                  RMS GRADIENT     0.0006315735
              MAXIMUM GRADIENT     0.0014345429



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 38 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.399986     0.244971     0.280576
A02O2               -0.249142     0.879980     0.801894
A03H3               -2.329686     0.755344     0.569653
A04H4               -1.421118    -0.761202     0.705132
A05H5               -1.368836     0.150315    -0.815412
A06H6               -0.200723     1.770870     0.441693
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016759695
           POLARIZATION ENERGY    -0.0002988864
             DISPERSION ENERGY    -0.0012120461
     EXCHANGE REPULSION ENERGY     0.0035055451
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003214766
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807128068

                  TOTAL ENERGY  -115.6773637014


                 ENERGY CHANGE    -0.0000104879
                  RMS GRADIENT     0.0005764658
              MAXIMUM GRADIENT     0.0011772288



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 39 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.409192     0.250903     0.286779
A02O2               -0.269985     0.898637     0.815254
A03H3               -2.348670     0.752244     0.561228
A04H4               -1.424148    -0.753911     0.718110
A05H5               -1.367628     0.147506    -0.807480
A06H6               -0.223391     1.786428     0.443892
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016652796
           POLARIZATION ENERGY    -0.0002969544
             DISPERSION ENERGY    -0.0012052725
     EXCHANGE REPULSION ENERGY     0.0035026816
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003211958
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807141272

                  TOTAL ENERGY  -115.6773695888


                 ENERGY CHANGE    -0.0000058874
                  RMS GRADIENT     0.0005126373
              MAXIMUM GRADIENT     0.0010231197



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 40 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.409307     0.251097     0.287588
A02O2               -0.272763     0.900959     0.815637
A03H3               -2.350008     0.750948     0.559774
A04H4               -1.423889    -0.752330     0.719762
A05H5               -1.366925     0.147770    -0.805649
A06H6               -0.225607     1.787989     0.444371
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016658804
           POLARIZATION ENERGY    -0.0002967754
             DISPERSION ENERGY    -0.0012046083
     EXCHANGE REPULSION ENERGY     0.0035023851
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003211666
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807171104

                  TOTAL ENERGY  -115.6773713953


                 ENERGY CHANGE    -0.0000018065
                  RMS GRADIENT     0.0002980318
              MAXIMUM GRADIENT     0.0005758198



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 41 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.420581     0.255853     0.293961
A02O2               -0.297325     0.924703     0.829647
A03H3               -2.370340     0.747654     0.550878
A04H4               -1.428616    -0.742956     0.736223
A05H5               -1.364036     0.143427    -0.797549
A06H6               -0.253615     1.807592     0.449380
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016533820
           POLARIZATION ENERGY    -0.0002949243
             DISPERSION ENERGY    -0.0011969815
     EXCHANGE REPULSION ENERGY     0.0034993565
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003208684
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807165945

                  TOTAL ENERGY  -115.6773766301


                 ENERGY CHANGE    -0.0000052348
                  RMS GRADIENT     0.0003065977
              MAXIMUM GRADIENT     0.0008289916



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 42 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.433253     0.261361     0.301110
A02O2               -0.325669     0.950649     0.845385
A03H3               -2.390924     0.742973     0.540954
A04H4               -1.432872    -0.731927     0.754940
A05H5               -1.360259     0.138919    -0.788628
A06H6               -0.284554     1.829889     0.454437
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016428062
           POLARIZATION ENERGY    -0.0002928684
             DISPERSION ENERGY    -0.0011887983
     EXCHANGE REPULSION ENERGY     0.0034963849
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003205743
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807166917

                  TOTAL ENERGY  -115.6773797417


                 ENERGY CHANGE    -0.0000031116
                  RMS GRADIENT     0.0003084738
              MAXIMUM GRADIENT     0.0009182471



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 43 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.435570     0.262988     0.302705
A02O2               -0.332671     0.957010     0.849232
A03H3               -2.395918     0.742192     0.538306
A04H4               -1.433087    -0.729387     0.759421
A05H5               -1.359714     0.137882    -0.786096
A06H6               -0.292115     1.834586     0.455583
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016409394
           POLARIZATION ENERGY    -0.0002923645
             DISPERSION ENERGY    -0.0011869135
     EXCHANGE REPULSION ENERGY     0.0034957241
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003205084
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807176363

                  TOTAL ENERGY  -115.6773807593


                 ENERGY CHANGE    -0.0000010176
                  RMS GRADIENT     0.0001664017
              MAXIMUM GRADIENT     0.0004097375



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    FINAL STATE

    GEOMETRY (ANGSTROMS)

A01C1               -1.437493     0.264367     0.304484
A02O2               -0.339139     0.962791     0.852498
A03H3               -2.400117     0.741461     0.535922
A04H4               -1.433221    -0.726724     0.763677
A05H5               -1.358755     0.136729    -0.783934
A06H6               -0.299595     1.839327     0.456819
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0016394515
           POLARIZATION ENERGY    -0.0002919351
             DISPERSION ENERGY    -0.0011852294
     EXCHANGE REPULSION ENERGY     0.0034951462
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003204507
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6807179496

                  TOTAL ENERGY  -115.6773809671


                 ENERGY CHANGE    -0.0000002078
                  RMS GRADIENT     0.0001309330
              MAXIMUM GRADIENT     0.0003003676



OPTIMIZATION CONVERGED IN 44 STEPS
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:38 2025
TOTAL RUN TIME IS 0 SECONDS
