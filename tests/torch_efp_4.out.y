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
opt_special_frag 0
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

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005119892
             DISPERSION ENERGY    -0.0023411920
     EXCHANGE REPULSION ENERGY     0.0061976931
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006309743
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6613311768

                  TOTAL ENERGY  -115.6561564515


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0236848083
              MAXIMUM GRADIENT     0.0506311109



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.737506     0.002251    -0.000263
A02O2                0.729441    -0.072025    -0.001140
A03H3               -1.096489     0.553138     0.918872
A04H4               -1.098160    -1.040816     0.000337
A05H5               -1.098532     0.551896    -0.918333
A06H6                1.027451     0.797428     0.101350
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005639556
             DISPERSION ENERGY    -0.0023787432
     EXCHANGE REPULSION ENERGY     0.0063847571
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006528540
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6713638306

                  TOTAL ENERGY  -115.6661134387


                 ENERGY CHANGE    -0.0099569872
                  RMS GRADIENT     0.0097637582
              MAXIMUM GRADIENT     0.0253443500



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.738718     0.005193    -0.000701
A02O2                0.729250    -0.095932    -0.003329
A03H3               -1.087747     0.562617     0.920701
A04H4               -1.093874    -1.050939     0.000591
A05H5               -1.092729     0.560217    -0.919838
A06H6                1.006089     0.811877     0.104309
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005697166
             DISPERSION ENERGY    -0.0023905084
     EXCHANGE REPULSION ENERGY     0.0064289615
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006565115
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6726150513

                  TOTAL ENERGY  -115.6673416387


                 ENERGY CHANGE    -0.0012282000
                  RMS GRADIENT     0.0098370507
              MAXIMUM GRADIENT     0.0215758495



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.741201    -0.000628    -0.003176
A02O2                0.714089    -0.083343     0.000721
A03H3               -1.054717     0.571198     0.902291
A04H4               -1.082125    -1.046970     0.001354
A05H5               -1.068417     0.566856    -0.900912
A06H6                0.942499     0.789451     0.104259
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005568117
             DISPERSION ENERGY    -0.0023662186
     EXCHANGE REPULSION ENERGY     0.0063089840
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006443855
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6777496338

                  TOTAL ENERGY  -115.6725468779


                 ENERGY CHANGE    -0.0052052392
                  RMS GRADIENT     0.0118939547
              MAXIMUM GRADIENT     0.0375543688



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.742275    -0.003900    -0.004490
A02O2                0.706901    -0.079948     0.002667
A03H3               -1.035096     0.578164     0.893158
A04H4               -1.075265    -1.047037     0.001825
A05H5               -1.054218     0.572632    -0.891550
A06H6                0.902640     0.778821     0.104645
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005521488
             DISPERSION ENERGY    -0.0023560611
     EXCHANGE REPULSION ENERGY     0.0062579980
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006392173
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6805114746

                  TOTAL ENERGY  -115.6753397163


                 ENERGY CHANGE    -0.0027928384
                  RMS GRADIENT     0.0170224922
              MAXIMUM GRADIENT     0.0410072227



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.740593    -0.006265    -0.005385
A02O2                0.697893    -0.079591     0.004252
A03H3               -1.016205     0.584588     0.884277
A04H4               -1.069080    -1.047179     0.002240
A05H5               -1.039948     0.578136    -0.882338
A06H6                0.863173     0.771209     0.104931
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005459624
             DISPERSION ENERGY    -0.0023478434
     EXCHANGE REPULSION ENERGY     0.0062152073
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006347038
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6828994751

                  TOTAL ENERGY  -115.6777515898


                 ENERGY CHANGE    -0.0024118735
                  RMS GRADIENT     0.0227641737
              MAXIMUM GRADIENT     0.0537856216



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.735021    -0.009147    -0.006283
A02O2                0.687848    -0.082669     0.005361
A03H3               -0.998796     0.591706     0.877810
A04H4               -1.064260    -1.047935     0.002539
A05H5               -1.025129     0.584117    -0.874302
A06H6                0.822408     0.767209     0.104744
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005390375
             DISPERSION ENERGY    -0.0023432229
     EXCHANGE REPULSION ENERGY     0.0061887425
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006318605
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6846084595

                  TOTAL ENERGY  -115.6794726502


                 ENERGY CHANGE    -0.0017210604
                  RMS GRADIENT     0.0296656006
              MAXIMUM GRADIENT     0.0788581846



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.728495    -0.013891    -0.006353
A02O2                0.681990    -0.094748     0.004299
A03H3               -0.992345     0.596008     0.877810
A04H4               -1.065160    -1.048093     0.002690
A05H5               -1.018363     0.587664    -0.872948
A06H6                0.803342     0.778102     0.105775
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005359308
             DISPERSION ENERGY    -0.0023484686
     EXCHANGE REPULSION ENERGY     0.0062077552
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006336106
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6870498657

                  TOTAL ENERGY  -115.6818989329


                 ENERGY CHANGE    -0.0024262827
                  RMS GRADIENT     0.0155883596
              MAXIMUM GRADIENT     0.0454142759



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.718566    -0.019424    -0.005259
A02O2                0.689970    -0.099080     0.003548
A03H3               -0.995703     0.602458     0.888977
A04H4               -1.072240    -1.054352     0.002703
A05H5               -1.018232     0.594097    -0.882478
A06H6                0.791359     0.782604     0.104797
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005436777
             DISPERSION ENERGY    -0.0023648555
     EXCHANGE REPULSION ENERGY     0.0062888885
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006428754
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6890945435

                  TOTAL ENERGY  -115.6838958758


                 ENERGY CHANGE    -0.0019969429
                  RMS GRADIENT     0.0109753765
              MAXIMUM GRADIENT     0.0323943732



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.688354    -0.012728    -0.002649
A02O2                0.695948    -0.099989     0.003357
A03H3               -1.009776     0.594388     0.899973
A04H4               -1.088328    -1.046794     0.003125
A05H5               -1.024058     0.588167    -0.891487
A06H6                0.785885     0.784764     0.101199
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005446063
             DISPERSION ENERGY    -0.0023917166
     EXCHANGE REPULSION ENERGY     0.0064261976
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006577813
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6909484863

                  TOTAL ENERGY  -115.6856552053


                 ENERGY CHANGE    -0.0017593295
                  RMS GRADIENT     0.0079929951
              MAXIMUM GRADIENT     0.0236570515



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.687547    -0.006308    -0.000734
A02O2                0.713559    -0.104791     0.004338
A03H3               -1.017172     0.588985     0.906935
A04H4               -1.095977    -1.041829     0.003225
A05H5               -1.025646     0.585191    -0.896910
A06H6                0.780052     0.787720     0.097610
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005611121
             DISPERSION ENERGY    -0.0024106391
     EXCHANGE REPULSION ENERGY     0.0065229598
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006680693
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6915817261

                  TOTAL ENERGY  -115.6862373991


                 ENERGY CHANGE    -0.0005821938
                  RMS GRADIENT     0.0052459991
              MAXIMUM GRADIENT     0.0124742299



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.687765    -0.005016     0.000044
A02O2                0.711939    -0.104055     0.005950
A03H3               -1.016431     0.585365     0.905686
A04H4               -1.095941    -1.036470     0.003213
A05H5               -1.023265     0.583241    -0.895270
A06H6                0.776363     0.786583     0.095397
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005591547
             DISPERSION ENERGY    -0.0024077054
     EXCHANGE REPULSION ENERGY     0.0065077113
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006663566
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6918029785

                  TOTAL ENERGY  -115.6864672964


                 ENERGY CHANGE    -0.0002298972
                  RMS GRADIENT     0.0027408894
              MAXIMUM GRADIENT     0.0062673483



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.688567    -0.003782     0.001614
A02O2                0.711049    -0.103117     0.009671
A03H3               -1.017888     0.577924     0.906469
A04H4               -1.097706    -1.025909     0.003111
A05H5               -1.019778     0.579643    -0.894574
A06H6                0.772281     0.786469     0.090022
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005574906
             DISPERSION ENERGY    -0.0024038170
     EXCHANGE REPULSION ENERGY     0.0064884511
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006642835
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6919937134

                  TOTAL ENERGY  -115.6866696658


                 ENERGY CHANGE    -0.0002023694
                  RMS GRADIENT     0.0022425297
              MAXIMUM GRADIENT     0.0054007253



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.688845    -0.004739     0.002779
A02O2                0.710443    -0.102667     0.013701
A03H3               -1.020182     0.573185     0.910216
A04H4               -1.100899    -1.019509     0.002863
A05H5               -1.016561     0.578413    -0.896110
A06H6                0.768811     0.788444     0.084421
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005562442
             DISPERSION ENERGY    -0.0024006426
     EXCHANGE REPULSION ENERGY     0.0064732642
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006628289
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6921005249

                  TOTAL ENERGY  -115.6867857888


                 ENERGY CHANGE    -0.0001161230
                  RMS GRADIENT     0.0020562060
              MAXIMUM GRADIENT     0.0048408006



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.692153    -0.003495     0.007656
A02O2                0.705901    -0.100282     0.026546
A03H3               -1.025554     0.563325     0.920340
A04H4               -1.111620    -1.013914     0.001284
A05H5               -1.007078     0.578635    -0.900880
A06H6                0.761705     0.795044     0.068011
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005493664
             DISPERSION ENERGY    -0.0023858867
     EXCHANGE REPULSION ENERGY     0.0063990935
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006550127
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922760010

                  TOTAL ENERGY  -115.6870059857


                 ENERGY CHANGE    -0.0002201969
                  RMS GRADIENT     0.0013452005
              MAXIMUM GRADIENT     0.0027138388



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.696325    -0.005160     0.010945
A02O2                0.702159    -0.097552     0.034954
A03H3               -1.032350     0.561922     0.924823
A04H4               -1.117409    -1.014623    -0.000785
A05H5               -1.004936     0.581469    -0.901518
A06H6                0.763018     0.798143     0.058604
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005433409
             DISPERSION ENERGY    -0.0023734535
     EXCHANGE REPULSION ENERGY     0.0063373461
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006486036
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923141479

                  TOTAL ENERGY  -115.6870810123


                 ENERGY CHANGE    -0.0000750265
                  RMS GRADIENT     0.0014052377
              MAXIMUM GRADIENT     0.0026855045



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.698709    -0.003780     0.013253
A02O2                0.700018    -0.096427     0.040706
A03H3               -1.037121     0.562867     0.925819
A04H4               -1.120516    -1.017024    -0.002387
A05H5               -1.003985     0.584266    -0.899816
A06H6                0.759776     0.798512     0.052977
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005394575
             DISPERSION ENERGY    -0.0023658799
     EXCHANGE REPULSION ENERGY     0.0062985409
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006444464
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923446655

                  TOTAL ENERGY  -115.6871347208


                 ENERGY CHANGE    -0.0000537086
                  RMS GRADIENT     0.0009955241
              MAXIMUM GRADIENT     0.0021728277



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.702603    -0.002775     0.016585
A02O2                0.694148    -0.096304     0.048060
A03H3               -1.043350     0.565757     0.924079
A04H4               -1.122789    -1.020636    -0.004761
A05H5               -1.003908     0.588531    -0.895126
A06H6                0.756962     0.799865     0.046777
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005314546
             DISPERSION ENERGY    -0.0023533496
     EXCHANGE REPULSION ENERGY     0.0062338886
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006373596
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923446655

                  TOTAL ENERGY  -115.6871717531


                 ENERGY CHANGE    -0.0000370322
                  RMS GRADIENT     0.0012923985
              MAXIMUM GRADIENT     0.0027206563



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.704152    -0.003376     0.017483
A02O2                0.694094    -0.096074     0.049330
A03H3               -1.046456     0.568447     0.922367
A04H4               -1.122647    -1.021340    -0.005311
A05H5               -1.006232     0.590293    -0.893204
A06H6                0.755863     0.798779     0.046898
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005308068
             DISPERSION ENERGY    -0.0023511196
     EXCHANGE REPULSION ENERGY     0.0062223042
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006361423
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923599243

                  TOTAL ENERGY  -115.6871945011


                 ENERGY CHANGE    -0.0000227481
                  RMS GRADIENT     0.0009070962
              MAXIMUM GRADIENT     0.0019275934



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.705100    -0.003634     0.018146
A02O2                0.693692    -0.096271     0.050550
A03H3               -1.048609     0.568991     0.921527
A04H4               -1.122935    -1.019985    -0.005480
A05H5               -1.007385     0.590730    -0.892206
A06H6                0.754535     0.798697     0.046553
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005301322
             DISPERSION ENERGY    -0.0023492894
     EXCHANGE REPULSION ENERGY     0.0062128806
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006351219
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923675537

                  TOTAL ENERGY  -115.6872080290


                 ENERGY CHANGE    -0.0000135279
                  RMS GRADIENT     0.0007939305
              MAXIMUM GRADIENT     0.0016366541



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.706682    -0.003566     0.019390
A02O2                0.690618    -0.096416     0.053685
A03H3               -1.054949     0.570406     0.919686
A04H4               -1.124151    -1.016086    -0.005418
A05H5               -1.011303     0.591436    -0.890162
A06H6                0.750923     0.798410     0.046732
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005267488
             DISPERSION ENERGY    -0.0023428637
     EXCHANGE REPULSION ENERGY     0.0061802993
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006315329
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923675537

                  TOTAL ENERGY  -115.6872272121


                 ENERGY CHANGE    -0.0000191831
                  RMS GRADIENT     0.0011629308
              MAXIMUM GRADIENT     0.0028818692



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.711352    -0.001514     0.020143
A02O2                0.688638    -0.097384     0.057303
A03H3               -1.062646     0.572579     0.918999
A04H4               -1.126814    -1.013944    -0.004872
A05H5               -1.016212     0.592377    -0.889275
A06H6                0.746937     0.799489     0.047954
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005251732
             DISPERSION ENERGY    -0.0023350868
     EXCHANGE REPULSION ENERGY     0.0061405313
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006270429
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923599243

                  TOTAL ENERGY  -115.6872455082


                 ENERGY CHANGE    -0.0000182961
                  RMS GRADIENT     0.0019867920
              MAXIMUM GRADIENT     0.0053103731



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.711503    -0.000920     0.020127
A02O2                0.687314    -0.096683     0.057768
A03H3               -1.063037     0.572386     0.919691
A04H4               -1.127644    -1.014331    -0.004689
A05H5               -1.016133     0.592347    -0.889910
A06H6                0.746809     0.799591     0.047937
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005240902
             DISPERSION ENERGY    -0.0023330482
     EXCHANGE REPULSION ENERGY     0.0061309324
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006259648
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923675537

                  TOTAL ENERGY  -115.6872585368


                 ENERGY CHANGE    -0.0000130286
                  RMS GRADIENT     0.0012184430
              MAXIMUM GRADIENT     0.0032867665



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.716587     0.002709     0.020776
A02O2                0.680110    -0.094539     0.062252
A03H3               -1.071139     0.573913     0.921029
A04H4               -1.132738    -1.013534    -0.003362
A05H5               -1.020535     0.592999    -0.891316
A06H6                0.742875     0.800526     0.049828
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005185037
             DISPERSION ENERGY    -0.0023179199
     EXCHANGE REPULSION ENERGY     0.0060580509
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006177365
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923675537

                  TOTAL ENERGY  -115.6873024753


                 ENERGY CHANGE    -0.0000439385
                  RMS GRADIENT     0.0010463503
              MAXIMUM GRADIENT     0.0036567040



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 24 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.726793     0.007972     0.022235
A02O2                0.669314    -0.091760     0.069594
A03H3               -1.085290     0.577525     0.921918
A04H4               -1.140828    -1.011460    -0.001187
A05H5               -1.028725     0.594468    -0.892694
A06H6                0.735303     0.802222     0.053802
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0005107294
             DISPERSION ENERGY    -0.0022932967
     EXCHANGE REPULSION ENERGY     0.0059418674
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0006045607
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6923446655

                  TOTAL ENERGY  -115.6873501972


                 ENERGY CHANGE    -0.0000477219
                  RMS GRADIENT     0.0016709712
              MAXIMUM GRADIENT     0.0047997523



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 25 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.751918     0.017251     0.026685
A02O2                0.643907    -0.085186     0.086419
A03H3               -1.117202     0.586780     0.922814
A04H4               -1.160530    -1.005494     0.003807
A05H5               -1.046209     0.598443    -0.895168
A06H6                0.715049     0.807220     0.063406
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0004938446
             DISPERSION ENERGY    -0.0022366425
     EXCHANGE REPULSION ENERGY     0.0056885977
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005756685
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922912598

                  TOTAL ENERGY  -115.6874476300


                 ENERGY CHANGE    -0.0000974328
                  RMS GRADIENT     0.0021429516
              MAXIMUM GRADIENT     0.0043291405



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 26 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.808884     0.036686     0.036871
A02O2                0.584568    -0.070289     0.125430
A03H3               -1.193413     0.613077     0.922950
A04H4               -1.213659    -0.991960     0.015937
A05H5               -1.086452     0.608377    -0.898048
A06H6                0.656918     0.821591     0.089221
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0004599239
             DISPERSION ENERGY    -0.0021141231
     EXCHANGE REPULSION ENERGY     0.0052017832
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0005192973
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6922302246

                  TOTAL ENERGY  -115.6876605981


                 ENERGY CHANGE    -0.0002129681
                  RMS GRADIENT     0.0030125673
              MAXIMUM GRADIENT     0.0063744841



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 27 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -0.926367     0.066297     0.055529
A02O2                0.462041    -0.034322     0.196130
A03H3               -1.332165     0.660114     0.917864
A04H4               -1.324633    -0.960199     0.041299
A05H5               -1.158483     0.620528    -0.900524
A06H6                0.549349     0.856605     0.146418
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0004065977
             DISPERSION ENERGY    -0.0019019568
     EXCHANGE REPULSION ENERGY     0.0045409493
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0004407129
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6921615601

                  TOTAL ENERGY  -115.6879086904


                 ENERGY CHANGE    -0.0002480924
                  RMS GRADIENT     0.0037410592
              MAXIMUM GRADIENT     0.0114358708



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 28 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.047338     0.098094     0.076360
A02O2                0.350191     0.002391     0.272077
A03H3               -1.485248     0.714852     0.907705
A04H4               -1.442809    -0.924238     0.066404
A05H5               -1.240031     0.635861    -0.897287
A06H6                0.423195     0.885751     0.206225
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003709898
             DISPERSION ENERGY    -0.0017319641
     EXCHANGE REPULSION ENERGY     0.0041487984
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003933736
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6921081543

                  TOTAL ENERGY  -115.6879944958


                 ENERGY CHANGE    -0.0000858053
                  RMS GRADIENT     0.0089498825
              MAXIMUM GRADIENT     0.0254749091



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 29 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.034240     0.094190     0.074874
A02O2                0.356300    -0.002669     0.264968
A03H3               -1.472036     0.712152     0.907407
A04H4               -1.437390    -0.928001     0.064738
A05H5               -1.232202     0.634423    -0.896486
A06H6                0.429024     0.887866     0.203379
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003727855
             DISPERSION ENERGY    -0.0017446972
     EXCHANGE REPULSION ENERGY     0.0041739043
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003963943
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6924285889

                  TOTAL ENERGY  -115.6883073739


                 ENERGY CHANGE    -0.0003128781
                  RMS GRADIENT     0.0022885362
              MAXIMUM GRADIENT     0.0052115183



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 30 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.053178     0.096735     0.078628
A02O2                0.333125     0.003966     0.276103
A03H3               -1.496163     0.722551     0.903262
A04H4               -1.463858    -0.921172     0.069781
A05H5               -1.244173     0.635436    -0.894147
A06H6                0.403272     0.897749     0.217346
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003668562
             DISPERSION ENERGY    -0.0017174340
     EXCHANGE REPULSION ENERGY     0.0041196906
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003898608
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6925125122

                  TOTAL ENERGY  -115.6884057850


                 ENERGY CHANGE    -0.0000984111
                  RMS GRADIENT     0.0014716115
              MAXIMUM GRADIENT     0.0030966740



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 31 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.100556     0.108622     0.087741
A02O2                0.282459     0.019210     0.305733
A03H3               -1.557295     0.744821     0.897339
A04H4               -1.517519    -0.905913     0.080852
A05H5               -1.276754     0.639961    -0.892431
A06H6                0.349565     0.914140     0.245243
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003542000
             DISPERSION ENERGY    -0.0016574816
     EXCHANGE REPULSION ENERGY     0.0040093724
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003766286
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6925582886

                  TOTAL ENERGY  -115.6884760386


                 ENERGY CHANGE    -0.0000702537
                  RMS GRADIENT     0.0017308412
              MAXIMUM GRADIENT     0.0044290493



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 32 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.111700     0.111547     0.090190
A02O2                0.267614     0.024362     0.312711
A03H3               -1.571642     0.749938     0.895364
A04H4               -1.532022    -0.901785     0.083915
A05H5               -1.284659     0.640522    -0.892150
A06H6                0.335637     0.918186     0.253303
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003507606
             DISPERSION ENERGY    -0.0016423281
     EXCHANGE REPULSION ENERGY     0.0039835122
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003735463
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6925735474

                  TOTAL ENERGY  -115.6884954825


                 ENERGY CHANGE    -0.0000194439
                  RMS GRADIENT     0.0009812808
              MAXIMUM GRADIENT     0.0026280749



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 33 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.184380     0.131522     0.103369
A02O2                0.191483     0.047291     0.358372
A03H3               -1.663736     0.782048     0.888272
A04H4               -1.609070    -0.879386     0.100439
A05H5               -1.334375     0.647794    -0.891279
A06H6                0.258357     0.940808     0.293464
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003346454
             DISPERSION ENERGY    -0.0015630704
     EXCHANGE REPULSION ENERGY     0.0038589232
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003588966
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6926040649

                  TOTAL ENERGY  -115.6885405664


                 ENERGY CHANGE    -0.0000450839
                  RMS GRADIENT     0.0008786523
              MAXIMUM GRADIENT     0.0021695811



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 34 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.240024     0.149864     0.110839
A02O2                0.132451     0.064740     0.393021
A03H3               -1.731153     0.804780     0.881715
A04H4               -1.667769    -0.861901     0.113613
A05H5               -1.372380     0.651095    -0.889089
A06H6                0.199172     0.958183     0.325602
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003243184
             DISPERSION ENERGY    -0.0015089394
     EXCHANGE REPULSION ENERGY     0.0037844508
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003503587
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6926345825

                  TOTAL ENERGY  -115.6885725606


                 ENERGY CHANGE    -0.0000319942
                  RMS GRADIENT     0.0007367615
              MAXIMUM GRADIENT     0.0022488092



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 35 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.262768     0.156461     0.114197
A02O2                0.107000     0.071902     0.407398
A03H3               -1.759131     0.814686     0.880265
A04H4               -1.690450    -0.854877     0.119106
A05H5               -1.388411     0.653255    -0.889950
A06H6                0.175866     0.964863     0.338646
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003200814
             DISPERSION ENERGY    -0.0014879064
     EXCHANGE REPULSION ENERGY     0.0037577382
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003473536
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6926498413

                  TOTAL ENERGY  -115.6885862568


                 ENERGY CHANGE    -0.0000136962
                  RMS GRADIENT     0.0004610601
              MAXIMUM GRADIENT     0.0015256529



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 36 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.276974     0.160910     0.116061
A02O2                0.090292     0.075841     0.416042
A03H3               -1.775227     0.820806     0.879051
A04H4               -1.702669    -0.850197     0.122641
A05H5               -1.398650     0.654442    -0.890603
A06H6                0.161457     0.968463     0.347105
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003173864
             DISPERSION ENERGY    -0.0014751512
     EXCHANGE REPULSION ENERGY     0.0037420844
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003456060
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6926651001

                  TOTAL ENERGY  -115.6885999716


                 ENERGY CHANGE    -0.0000137148
                  RMS GRADIENT     0.0002235801
              MAXIMUM GRADIENT     0.0005555605



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 37 STEPS

    GEOMETRY (ANGSTROMS)

A01C1               -1.293611     0.166142     0.118400
A02O2                0.071712     0.080430     0.426640
A03H3               -1.796162     0.828977     0.877402
A04H4               -1.718639    -0.845157     0.126595
A05H5               -1.410777     0.656195    -0.890213
A06H6                0.143232     0.972976     0.356670
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003145144
             DISPERSION ENERGY    -0.0014607844
     EXCHANGE REPULSION ENERGY     0.0037249406
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003437094
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6926727295

                  TOTAL ENERGY  -115.6886056095


                 ENERGY CHANGE    -0.0000056378
                  RMS GRADIENT     0.0002164325
              MAXIMUM GRADIENT     0.0004794220



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

A01C1               -1.293611     0.166142     0.118400
A02O2                0.071712     0.080430     0.426640
A03H3               -1.796162     0.828977     0.877402
A04H4               -1.718639    -0.845157     0.126595
A05H5               -1.410777     0.656195    -0.890213
A06H6                0.143232     0.972976     0.356670
A01O1                3.394000    -0.900000    -0.700000
A02H2                3.517419    -0.130057    -0.174996
A03H3                3.580284    -1.281411    -0.424198
A01O1                4.394000    -3.900000    -0.700000
A02H2                4.517419    -3.130057    -0.174996
A03H3                3.580284    -4.281411    -0.424198


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024611876
           POLARIZATION ENERGY    -0.0003145144
             DISPERSION ENERGY    -0.0014607844
     EXCHANGE REPULSION ENERGY     0.0037249406
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0003437094
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY  -115.6926727295

                  TOTAL ENERGY  -115.6886056095


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0002164325
              MAXIMUM GRADIENT     0.0004794220



OPTIMIZATION CONVERGED IN 38 STEPS
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:43 2025
TOTAL RUN TIME IS 0 SECONDS
