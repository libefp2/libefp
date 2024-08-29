chosen nn_type: ani1.pt
EFPMD ver. 1.8.0
Copyright (c) 2012-2017 Ilya Kaliman

LIBEFP ver. 1.8.0
Copyright (c) 2012-2017 Ilya Kaliman
              2018-2022 Lyudmila Slipchenko

Journal References:
  - Kaliman and Slipchenko, JCC 2013.
    DOI: http://dx.doi.org/10.1002/jcc.23375
  - Kaliman and Slipchenko, JCC 2015.
    DOI: http://dx.doi.org/10.1002/jcc.23772

Project web site: https://github.com/libefp2/libefp/

RUNNING 1 MPI PROCESSES WITH 1 OPENMP THREADS EACH
WALL CLOCK TIME IS Sat Aug 24 00:02:55 2024

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
xr_cutoff 0
max_steps 20
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc false
periodic_box 30.0 30.0 30.0 90.0 90.0 90.0
opt_tol 0.0003
opt_energy_tol 1e-06
gtest_tol 1e-06
ref_energy 0
hess_central false
num_step_dist 0.001
num_step_angle 0.01
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
opt_special_frag 0
torch_nn ani1.pt
atom_gradient mm
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


xr_cutoff is set to 10.000000 

SPECIAL FRAGMENT ENERGY MINIMIZATION JOB



 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196739        -1.815220     2.663988    -0.000000        0.017719    -0.012082     0.016828
   1      -0.595936        -1.617480     1.725461     0.001936       -0.005939     0.014791    -0.003156
   1      -0.595675        -2.476026     2.736906    -0.714908       -0.011780    -0.002708    -0.013672
   Total TORCH energy   -76.388351
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0058237165
                     LJ ENERGY     0.0002791012

                     ML ENERGY   -76.3883506060

                  TOTAL ENERGY   -76.3938952213


    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0058237165
                     LJ ENERGY     0.0002791012

                     ML ENERGY   -76.3883506060

                  TOTAL ENERGY   -76.3938952213


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0077987483
              MAXIMUM GRADIENT     0.0131076358



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.192833        -2.046773     2.892702    -0.296469       -0.171492    -0.032405    -0.136337
   1      -0.483832        -1.524690     1.558657     0.080062        0.053931    -0.099054     0.039937
   1      -0.451706        -2.355556     2.719512    -0.545041        0.117561     0.131459     0.096399
   Total TORCH energy   -76.128371
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -2.046773     2.892702    -0.296469
A02H                -1.524690     1.558657     0.080062
A03H                -2.355556     2.719512    -0.545041
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0111781668
                     LJ ENERGY     0.0018980443

                     ML ENERGY   -76.1283707619

                  TOTAL ENERGY   -76.1376508844



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196739        -1.819204     2.667923    -0.005100        0.000747     0.004175     0.001778
   1      -0.595879        -1.615884     1.722591     0.003280       -0.002017    -0.000862    -0.002423
   1      -0.595893        -2.473953     2.736607    -0.711986        0.001270    -0.003313     0.000645
   Total TORCH energy   -76.388512
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.819204     2.667923    -0.005100
A02H                -1.615884     1.722591     0.003280
A03H                -2.473953     2.736607    -0.711986
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0059212107
                     LJ ENERGY     0.0002958880

                     ML ENERGY   -76.3885118365

                  TOTAL ENERGY   -76.3941371592



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.819204     2.667923    -0.005100
A02H                -1.615884     1.722591     0.003280
A03H                -2.473953     2.736607    -0.711986
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0059212107
                     LJ ENERGY     0.0002958880

                     ML ENERGY   -76.3885118365

                  TOTAL ENERGY   -76.3941371592


                 ENERGY CHANGE    -0.0002419378
                  RMS GRADIENT     0.0022836030
              MAXIMUM GRADIENT     0.0051296086



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196724        -1.820112     2.668941    -0.008160       -0.003503     0.006151    -0.002466
   1      -0.595863        -1.614699     1.722909     0.005001       -0.000905    -0.003341    -0.001744
   1      -0.595922        -2.474669     2.736371    -0.711833        0.004408    -0.002810     0.004210
   Total TORCH energy   -76.388509
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.820112     2.668941    -0.008160
A02H                -1.614699     1.722909     0.005001
A03H                -2.474668     2.736371    -0.711833
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0059560168
                     LJ ENERGY     0.0003002720

                     ML ENERGY   -76.3885093331

                  TOTAL ENERGY   -76.3941650779



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.820112     2.668941    -0.008160
A02H                -1.614699     1.722909     0.005001
A03H                -2.474668     2.736371    -0.711833
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0059560168
                     LJ ENERGY     0.0003002720

                     ML ENERGY   -76.3885093331

                  TOTAL ENERGY   -76.3941650779


                 ENERGY CHANGE    -0.0000279187
                  RMS GRADIENT     0.0020635877
              MAXIMUM GRADIENT     0.0032279905



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.821158     2.672033    -0.017675       -0.010554     0.008121    -0.009670
   1      -0.595858        -1.610674     1.725505     0.011364        0.001935    -0.007637     0.000490
   1      -0.595977        -2.479386     2.735064    -0.713377        0.008619    -0.000484     0.009181
   Total TORCH energy   -76.388475
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.821158     2.672033    -0.017675
A02H                -1.610674     1.725505     0.011364
A03H                -2.479386     2.735064    -0.713377
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0060713680
                     LJ ENERGY     0.0003136918

                     ML ENERGY   -76.3884750009

                  TOTAL ENERGY   -76.3942326770



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.821158     2.672033    -0.017675
A02H                -1.610674     1.725505     0.011364
A03H                -2.479386     2.735064    -0.713377
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0060713680
                     LJ ENERGY     0.0003136918

                     ML ENERGY   -76.3884750009

                  TOTAL ENERGY   -76.3942326770


                 ENERGY CHANGE    -0.0000675991
                  RMS GRADIENT     0.0033390389
              MAXIMUM GRADIENT     0.0054275601



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196457        -1.820690     2.678682    -0.034931       -0.015702     0.008867    -0.014673
   1      -0.595876        -1.603573     1.732562     0.023531        0.005857    -0.012365     0.003884
   1      -0.596065        -2.490663     2.730740    -0.718246        0.009845     0.003498     0.010789
   Total TORCH energy   -76.388398
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.820690     2.678682    -0.034931
A02H                -1.603573     1.732562     0.023531
A03H                -2.490663     2.730740    -0.718245
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0063154673
                     LJ ENERGY     0.0003431699

                     ML ENERGY   -76.3883980513

                  TOTAL ENERGY   -76.3943703486



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.820690     2.678682    -0.034931
A02H                -1.603573     1.732562     0.023531
A03H                -2.490663     2.730740    -0.718245
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0063154673
                     LJ ENERGY     0.0003431699

                     ML ENERGY   -76.3883980513

                  TOTAL ENERGY   -76.3943703486


                 ENERGY CHANGE    -0.0001376716
                  RMS GRADIENT     0.0047831639
              MAXIMUM GRADIENT     0.0073501769



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196106        -1.816082     2.697617    -0.076782       -0.019100     0.010524    -0.016853
   1      -0.595877        -1.590079     1.756333     0.050507        0.011074    -0.019055     0.008628
   1      -0.596198        -2.518608     2.713118    -0.729503        0.008026     0.008531     0.008226
   Total TORCH energy   -76.388181
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.816082     2.697617    -0.076782
A02H                -1.590079     1.756333     0.050507
A03H                -2.518608     2.713118    -0.729503
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0069783267
                     LJ ENERGY     0.0004318245

                     ML ENERGY   -76.3881813288

                  TOTAL ENERGY   -76.3947278310



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.816082     2.697617    -0.076782
A02H                -1.590079     1.756333     0.050507
A03H                -2.518608     2.713118    -0.729503
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0069783267
                     LJ ENERGY     0.0004318245

                     ML ENERGY   -76.3881813288

                  TOTAL ENERGY   -76.3947278310


                 ENERGY CHANGE    -0.0003574824
                  RMS GRADIENT     0.0061822831
              MAXIMUM GRADIENT     0.0107866046



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.195496        -1.799024     2.754926    -0.211637       -0.006990     0.036061    -0.011620
   1      -0.595332        -1.557359     1.849619     0.126620        0.023603    -0.046444     0.025233
   1      -0.596349        -2.600564     2.645220    -0.754863       -0.016613     0.010382    -0.013612
   Total TORCH energy   -76.387176
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.799024     2.754926    -0.211637
A02H                -1.557359     1.849619     0.126620
A03H                -2.600564     2.645219    -0.754863
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0088854032
                     LJ ENERGY     0.0007341206

                     ML ENERGY   -76.3871763349

                  TOTAL ENERGY   -76.3953276174



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.195839        -1.808054     2.724589    -0.140250       -0.018971     0.012325    -0.015787
   1      -0.595845        -1.574679     1.800236     0.086328        0.015278    -0.023935     0.013301
   1      -0.596293        -2.557179     2.681163    -0.741438        0.003693     0.011609     0.002487
   Total TORCH energy   -76.387977
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.808054     2.724589    -0.140250
A02H                -1.574680     1.800236     0.086328
A03H                -2.557179     2.681162    -0.741438
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0079028465
                     LJ ENERGY     0.0005680389

                     ML ENERGY   -76.3879765272

                  TOTAL ENERGY   -76.3953113348



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.808054     2.724589    -0.140250
A02H                -1.574680     1.800236     0.086328
A03H                -2.557179     2.681162    -0.741438
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0079028465
                     LJ ENERGY     0.0005680389

                     ML ENERGY   -76.3879765272

                  TOTAL ENERGY   -76.3953113348


                 ENERGY CHANGE    -0.0005835038
                  RMS GRADIENT     0.0070629524
              MAXIMUM GRADIENT     0.0134730541



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.195526        -1.788043     2.787635    -0.312798        0.016328     0.055207    -0.011747
   1      -0.594922        -1.543408     1.938788     0.168693        0.024933    -0.054714     0.036598
   1      -0.595882        -2.650657     2.588787    -0.758363       -0.041261    -0.000493    -0.024851
   Total TORCH energy   -76.386331
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.788043     2.787635    -0.312798
A02H                -1.543408     1.938788     0.168693
A03H                -2.650657     2.588787    -0.758363
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0098211983
                     LJ ENERGY     0.0009056901

                     ML ENERGY   -76.3863305449

                  TOTAL ENERGY   -76.3952460532



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.195755        -1.797252     2.758621    -0.233390       -0.009040     0.020752    -0.010857
   1      -0.595766        -1.557799     1.875025     0.130788        0.018358    -0.030339     0.019339
   1      -0.596305        -2.607638     2.631299    -0.750574       -0.009317     0.009588    -0.008482
   Total TORCH energy   -76.387826
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.797252     2.758621    -0.233390
A02H                -1.557799     1.875025     0.130788
A03H                -2.607638     2.631299    -0.750574
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0089958810
                     LJ ENERGY     0.0007480131

                     ML ENERGY   -76.3878259659

                  TOTAL ENERGY   -76.3960738338



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.797252     2.758621    -0.233390
A02H                -1.557799     1.875025     0.130788
A03H                -2.607638     2.631299    -0.750574
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0089958810
                     LJ ENERGY     0.0007480131

                     ML ENERGY   -76.3878259659

                  TOTAL ENERGY   -76.3960738338


                 ENERGY CHANGE    -0.0007624990
                  RMS GRADIENT     0.0083792862
              MAXIMUM GRADIENT     0.0168343040



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196060        -1.795651     2.769930    -0.309566       -0.006533    -0.012271     0.000834
   1      -0.596114        -1.551678     1.960354     0.154862        0.008129     0.003708     0.003482
   1      -0.596106        -2.636040     2.588408    -0.748377       -0.001597     0.008563    -0.004316
   Total TORCH energy   -76.388280
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.795651     2.769930    -0.309566
A02H                -1.551678     1.960354     0.154862
A03H                -2.636040     2.588408    -0.748377
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0092853718
                     LJ ENERGY     0.0007768962

                     ML ENERGY   -76.3882802725

                  TOTAL ENERGY   -76.3967887481



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.795651     2.769930    -0.309566
A02H                -1.551678     1.960354     0.154862
A03H                -2.636040     2.588408    -0.748377
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0092853718
                     LJ ENERGY     0.0007768962

                     ML ENERGY   -76.3882802725

                  TOTAL ENERGY   -76.3967887481


                 ENERGY CHANGE    -0.0007149144
                  RMS GRADIENT     0.0040097772
              MAXIMUM GRADIENT     0.0094244786



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.195763        -1.785642     2.811691    -0.437740        0.044856     0.067126    -0.020439
   1      -0.595078        -1.537079     2.080631     0.205172        0.015986    -0.047156     0.041443
   1      -0.594961        -2.694297     2.514006    -0.751817       -0.060841    -0.019971    -0.021004
   Total TORCH energy   -76.385802
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.785642     2.811691    -0.437740
A02H                -1.537079     2.080631     0.205172
A03H                -2.694297     2.514006    -0.751817
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0101651475
                     LJ ENERGY     0.0009650943

                     ML ENERGY   -76.3858016133

                  TOTAL ENERGY   -76.3950016666



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196121        -1.792925     2.781302    -0.344471        0.004307     0.004167     0.000580
   1      -0.596106        -1.547703     1.993108     0.168562        0.010102    -0.007671     0.009526
   1      -0.596071        -2.651904     2.568147    -0.749314       -0.014409     0.003504    -0.010105
   Total TORCH energy   -76.388298
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.792926     2.781302    -0.344471
A02H                -1.547703     1.993108     0.168562
A03H                -2.651904     2.568147    -0.749314
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0095556855
                     LJ ENERGY     0.0008301334

                     ML ENERGY   -76.3882980943

                  TOTAL ENERGY   -76.3970236463



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.792926     2.781302    -0.344471
A02H                -1.547703     1.993108     0.168562
A03H                -2.651904     2.568147    -0.749314
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0095556855
                     LJ ENERGY     0.0008301334

                     ML ENERGY   -76.3882980943

                  TOTAL ENERGY   -76.3970236463


                 ENERGY CHANGE    -0.0002348982
                  RMS GRADIENT     0.0045299923
              MAXIMUM GRADIENT     0.0079846114



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196381        -1.793815     2.787232    -0.355841        0.004125     0.001760     0.001555
   1      -0.596063        -1.550702     2.009969     0.168680        0.005364    -0.003172     0.004705
   1      -0.596018        -2.652332     2.556944    -0.746249       -0.009489     0.001413    -0.006260
   Total TORCH energy   -76.388462
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.793815     2.787232    -0.355841
A02H                -1.550702     2.009969     0.168680
A03H                -2.652332     2.556944    -0.746249
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0096644398
                     LJ ENERGY     0.0008639481

                     ML ENERGY   -76.3884617090

                  TOTAL ENERGY   -76.3972622007



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.793815     2.787232    -0.355841
A02H                -1.550702     2.009969     0.168680
A03H                -2.652332     2.556944    -0.746249
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0096644398
                     LJ ENERGY     0.0008639481

                     ML ENERGY   -76.3884617090

                  TOTAL ENERGY   -76.3972622007


                 ENERGY CHANGE    -0.0002385543
                  RMS GRADIENT     0.0029783463
              MAXIMUM GRADIENT     0.0054121050



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196701        -1.800172     2.801295    -0.374176       -0.001499     0.003693    -0.002819
   1      -0.595893        -1.553401     2.039955     0.169871       -0.001059    -0.002746     0.000803
   1      -0.595929        -2.651921     2.536483    -0.742756        0.002558    -0.000947     0.002016
   Total TORCH energy   -76.388523
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.800172     2.801295    -0.374176
A02H                -1.553401     2.039955     0.169871
A03H                -2.651921     2.536483    -0.742756
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0099337241
                     LJ ENERGY     0.0009554124

                     ML ENERGY   -76.3885232806

                  TOTAL ENERGY   -76.3975015922



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.800172     2.801295    -0.374176
A02H                -1.553401     2.039955     0.169871
A03H                -2.651921     2.536483    -0.742756
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0099337241
                     LJ ENERGY     0.0009554124

                     ML ENERGY   -76.3885232806

                  TOTAL ENERGY   -76.3975015922


                 ENERGY CHANGE    -0.0002393916
                  RMS GRADIENT     0.0014286230
              MAXIMUM GRADIENT     0.0025664393



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196762        -1.805080     2.808528    -0.377719        0.002255     0.001048     0.000815
   1      -0.595879        -1.551516     2.055425     0.169390       -0.003941     0.001456    -0.003144
   1      -0.595865        -2.653652     2.527208    -0.743598        0.001686    -0.002504     0.002329
   Total TORCH energy   -76.388506
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.805080     2.808528    -0.377719
A02H                -1.551516     2.055425     0.169390
A03H                -2.653652     2.527208    -0.743598
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0100749858
                     LJ ENERGY     0.0010109849

                     ML ENERGY   -76.3885059357

                  TOTAL ENERGY   -76.3975699366



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.805080     2.808528    -0.377719
A02H                -1.551516     2.055425     0.169390
A03H                -2.653652     2.527208    -0.743598
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0100749858
                     LJ ENERGY     0.0010109849

                     ML ENERGY   -76.3885059357

                  TOTAL ENERGY   -76.3975699366


                 ENERGY CHANGE    -0.0000683443
                  RMS GRADIENT     0.0018210925
              MAXIMUM GRADIENT     0.0032297576



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196793        -1.829768     2.839992    -0.401159        0.010655     0.006941     0.003121
   1      -0.595858        -1.537606     2.122961     0.174390       -0.006805     0.000393    -0.004599
   1      -0.595782        -2.664178     2.488188    -0.749124       -0.003850    -0.007333     0.001478
   Total TORCH energy   -76.388433
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.829768     2.839992    -0.401159
A02H                -1.537606     2.122960     0.174390
A03H                -2.664178     2.488188    -0.749124
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0106773848
                     LJ ENERGY     0.0012654455

                     ML ENERGY   -76.3884327412

                  TOTAL ENERGY   -76.3978446804



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.829768     2.839992    -0.401159
A02H                -1.537606     2.122960     0.174390
A03H                -2.664178     2.488188    -0.749124
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0106773848
                     LJ ENERGY     0.0012654455

                     ML ENERGY   -76.3884327412

                  TOTAL ENERGY   -76.3978446804


                 ENERGY CHANGE    -0.0002747438
                  RMS GRADIENT     0.0032764726
              MAXIMUM GRADIENT     0.0073136706



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196625        -1.904891     2.910798    -0.414188        0.022286     0.021785     0.007025
   1      -0.595994        -1.498103     2.257486     0.173074       -0.002965    -0.004422    -0.000269
   1      -0.595645        -2.673519     2.413429    -0.767413       -0.019321    -0.017363    -0.006756
   Total TORCH energy   -76.388263
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.904891     2.910798    -0.414188
A02H                -1.498103     2.257486     0.173074
A03H                -2.673519     2.413429    -0.767413
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0119752361
                     LJ ENERGY     0.0020602304

                     ML ENERGY   -76.3882628679

                  TOTAL ENERGY   -76.3981778736



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.904891     2.910798    -0.414188
A02H                -1.498103     2.257486     0.173074
A03H                -2.673519     2.413429    -0.767413
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0119752361
                     LJ ENERGY     0.0020602304

                     ML ENERGY   -76.3882628679

                  TOTAL ENERGY   -76.3981778736


                 ENERGY CHANGE    -0.0003331932
                  RMS GRADIENT     0.0074077113
              MAXIMUM GRADIENT     0.0122377372



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196869        -1.907693     2.897949    -0.368879        0.003115    -0.010741     0.005847
   1      -0.595779        -1.500498     2.209871     0.158245       -0.010481     0.010297    -0.011112
   1      -0.595767        -2.656088     2.443037    -0.767957        0.007366     0.000443     0.005265
   Total TORCH energy   -76.388415
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.907693     2.897949    -0.368879
A02H                -1.500498     2.209871     0.158245
A03H                -2.656088     2.443037    -0.767957
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0117811617
                     LJ ENERGY     0.0019715108

                     ML ENERGY   -76.3884146214

                  TOTAL ENERGY   -76.3982242722



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.907693     2.897949    -0.368879
A02H                -1.500498     2.209871     0.158245
A03H                -2.656088     2.443037    -0.767957
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0117811617
                     LJ ENERGY     0.0019715108

                     ML ENERGY   -76.3884146214

                  TOTAL ENERGY   -76.3982242722


                 ENERGY CHANGE    -0.0000463986
                  RMS GRADIENT     0.0042769746
              MAXIMUM GRADIENT     0.0059939840



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196732        -1.927571     2.912973    -0.371475        0.000642    -0.000965     0.000770
   1      -0.595898        -1.487559     2.239015     0.159912       -0.003294     0.001400    -0.002885
   1      -0.595890        -2.658952     2.428230    -0.773581        0.002651    -0.000435     0.002115
   Total TORCH energy   -76.388520
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.927571     2.912973    -0.371475
A02H                -1.487559     2.239015     0.159912
A03H                -2.658951     2.428230    -0.773581
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0120421720
                     LJ ENERGY     0.0021685065

                     ML ENERGY   -76.3885198832

                  TOTAL ENERGY   -76.3983935487



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.927571     2.912973    -0.371475
A02H                -1.487559     2.239015     0.159912
A03H                -2.658951     2.428230    -0.773581
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0120421720
                     LJ ENERGY     0.0021685065

                     ML ENERGY   -76.3885198832

                  TOTAL ENERGY   -76.3983935487


                 ENERGY CHANGE    -0.0001692765
                  RMS GRADIENT     0.0010423457
              MAXIMUM GRADIENT     0.0020859923



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196632        -1.942782     2.922854    -0.366707        0.000975     0.003725    -0.000231
   1      -0.595949        -1.477790     2.256800     0.158781        0.000723    -0.001944     0.001054
   1      -0.595947        -2.659394     2.419644    -0.778405       -0.001699    -0.001782    -0.000823
   Total TORCH energy   -76.388528
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942782     2.922854    -0.366707
A02H                -1.477790     2.256800     0.158781
A03H                -2.659394     2.419644    -0.778405
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0122096202
                     LJ ENERGY     0.0023173384

                     ML ENERGY   -76.3885276318

                  TOTAL ENERGY   -76.3984199135



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.942782     2.922854    -0.366707
A02H                -1.477790     2.256800     0.158781
A03H                -2.659394     2.419644    -0.778405
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0122096202
                     LJ ENERGY     0.0023173384

                     ML ENERGY   -76.3885276318

                  TOTAL ENERGY   -76.3984199135


                 ENERGY CHANGE    -0.0000263648
                  RMS GRADIENT     0.0010627824
              MAXIMUM GRADIENT     0.0025313406



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196648        -1.939250     2.918858    -0.364089        0.000196     0.000512     0.000014
   1      -0.595945        -1.478985     2.249026     0.158506       -0.000167    -0.000205    -0.000073
   1      -0.595944        -2.658624     2.423844    -0.777873       -0.000029    -0.000307     0.000058
   Total TORCH energy   -76.388536
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.939250     2.918858    -0.364089
A02H                -1.478985     2.249026     0.158506
A03H                -2.658624     2.423844    -0.777873
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121421059
                     LJ ENERGY     0.0022638678

                     ML ENERGY   -76.3885363936

                  TOTAL ENERGY   -76.3984146317



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809


                 ENERGY CHANGE    -0.0000046673
                  RMS GRADIENT     0.0009231860
              MAXIMUM GRADIENT     0.0022232027



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196632        -1.940182     2.917999    -0.359579       -0.000077    -0.000882     0.000162
   1      -0.595951        -1.477454     2.246197     0.157601       -0.000102     0.000520    -0.000207
   1      -0.595950        -2.657650     2.425372    -0.778689        0.000179     0.000363     0.000045
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.940182     2.917999    -0.359579
A02H                -1.477454     2.246197     0.157601
A03H                -2.657650     2.425372    -0.778689
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121303967
                     LJ ENERGY     0.0022593440

                     ML ENERGY   -76.3885340095

                  TOTAL ENERGY   -76.3984050622



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942021     2.921816    -0.365662        0.000750     0.002792    -0.000157
   1      -0.595949        -1.477935     2.254674     0.158631        0.000501    -0.001447     0.000754
   1      -0.595947        -2.659119     2.420792    -0.778353       -0.001250    -0.001345    -0.000597
   Total TORCH energy   -76.388535
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942021     2.921816    -0.365662
A02H                -1.477935     2.254674     0.158631
A03H                -2.659119     2.420792    -0.778353
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121924294
                     LJ ENERGY     0.0023040192

                     ML ENERGY   -76.3885353208

                  TOTAL ENERGY   -76.3984237309



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942185     2.922158    -0.366206        0.000834     0.003133    -0.000184
   1      -0.595948        -1.477978     2.255433     0.158723        0.000558    -0.001625     0.000845
   1      -0.595946        -2.659251     2.420382    -0.778323       -0.001392    -0.001507    -0.000661
   Total TORCH energy   -76.388535
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942185     2.922158    -0.366206
A02H                -1.477978     2.255433     0.158723
A03H                -2.659251     2.420382    -0.778323
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121979273
                     LJ ENERGY     0.0023080361

                     ML ENERGY   -76.3885345459

                  TOTAL ENERGY   -76.3984244371



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942206     2.922200    -0.366274        0.000844     0.003175    -0.000188
   1      -0.595948        -1.477984     2.255527     0.158735        0.000566    -0.001648     0.000857
   1      -0.595946        -2.659267     2.420332    -0.778319       -0.001409    -0.001527    -0.000669
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942206     2.922200    -0.366274
A02H                -1.477984     2.255526     0.158735
A03H                -2.659267     2.420332    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986078
                     LJ ENERGY     0.0023085340

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245601



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255536     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922204    -0.366281
A02H                -1.477984     2.255536     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986786
                     LJ ENERGY     0.0023085857

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245791



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001651     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986845
                     LJ ENERGY     0.0023085901

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245807



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001651     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986850
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245808



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER FG STEP ---

 TORCH CALL 
-------------------------
   Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
--------------------------------
   8     -75.196640        -1.942208     2.922204    -0.366281        0.000845     0.003180    -0.000189
   1      -0.595948        -1.477984     2.255537     0.158736        0.000566    -0.001650     0.000859
   1      -0.595946        -2.659269     2.420326    -0.778319       -0.001411    -0.001530    -0.000670
   Total TORCH energy   -76.388534
----------------------------------

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809



--- OPTIMIZER NEW_X STEP ---
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.942208     2.922205    -0.366281
A02H                -1.477984     2.255537     0.158736
A03H                -2.659269     2.420326    -0.778319
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121986851
                     LJ ENERGY     0.0023085905

                     ML ENERGY   -76.3885344863

                  TOTAL ENERGY   -76.3984245809


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0009231860
              MAXIMUM GRADIENT     0.0022232027


ERROR: unable to make an optimization step
