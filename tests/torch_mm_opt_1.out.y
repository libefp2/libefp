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
WALL CLOCK TIME IS Thu May 29 00:29:46 2025

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
special_fragment 1
enable_torch true
enable_elpot false
opt_special_frag 0
torch_nn ani1.pt
ml_path ../nnlib/
userml_path .
custom_nn custom_model_script.pt
aev_nn aev_scripted.pt
atom_gradient mm
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

                     ML ENERGY   -76.3883504657

                  TOTAL ENERGY   -76.3938950811


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0101329175
              MAXIMUM GRADIENT     0.0169335900



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.820555     5.670795    -0.005344
A02H                -1.615353     4.717436     0.004110
A03H                -2.472434     5.737190    -0.710722


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0061159010
                     LJ ENERGY     0.0002490076

                     ML ENERGY   -76.3884210171

                  TOTAL ENERGY   -76.3942879104


                 ENERGY CHANGE    -0.0003928294
                  RMS GRADIENT     0.0019368427
              MAXIMUM GRADIENT     0.0041007198



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.819958     5.669844    -0.005804
A02H                -1.615028     4.716938     0.005902
A03H                -2.473013     5.737671    -0.711119


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0061216510
                     LJ ENERGY     0.0002529581

                     ML ENERGY   -76.3884429516

                  TOTAL ENERGY   -76.3943116445


                 ENERGY CHANGE    -0.0000237340
                  RMS GRADIENT     0.0015915609
              MAXIMUM GRADIENT     0.0037586558



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.816219     5.664377    -0.010639
A02H                -1.613592     4.712246     0.019645
A03H                -2.475240     5.739475    -0.712030


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0062208626
                     LJ ENERGY     0.0002757613

                     ML ENERGY   -76.3884608703

                  TOTAL ENERGY   -76.3944059716


                 ENERGY CHANGE    -0.0000943272
                  RMS GRADIENT     0.0013467635
              MAXIMUM GRADIENT     0.0020789874



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.810290     5.662336    -0.013492
A02H                -1.615781     4.707753     0.031348
A03H                -2.475576     5.736156    -0.711725


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0063320789
                     LJ ENERGY     0.0002840139

                     ML ENERGY   -76.3884229012

                  TOTAL ENERGY   -76.3944709661


                 ENERGY CHANGE    -0.0000649945
                  RMS GRADIENT     0.0018294971
              MAXIMUM GRADIENT     0.0029075111



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.776939     5.648520    -0.032253
A02H                -1.632784     4.687300     0.096710
A03H                -2.471611     5.711596    -0.704233


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0068747222
                     LJ ENERGY     0.0003425693

                     ML ENERGY   -76.3882056590

                  TOTAL ENERGY   -76.3947378119


                 ENERGY CHANGE    -0.0002668458
                  RMS GRADIENT     0.0032825033
              MAXIMUM GRADIENT     0.0049791382



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.750320     5.635626    -0.043637
A02H                -1.648637     4.676885     0.140251
A03H                -2.465266     5.686712    -0.693918


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0071287427
                     LJ ENERGY     0.0004011678

                     ML ENERGY   -76.3882249150

                  TOTAL ENERGY   -76.3949524899


                 ENERGY CHANGE    -0.0002146780
                  RMS GRADIENT     0.0031583735
              MAXIMUM GRADIENT     0.0048675094



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.715297     5.601650    -0.049722
A02H                -1.659781     4.663901     0.190467
A03H                -2.451584     5.641576    -0.665502


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0072752701
                     LJ ENERGY     0.0005811040

                     ML ENERGY   -76.3884804271

                  TOTAL ENERGY   -76.3951745931


                 ENERGY CHANGE    -0.0002221033
                  RMS GRADIENT     0.0036966656
              MAXIMUM GRADIENT     0.0066889458



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.699859     5.593874    -0.053588
A02H                -1.666701     4.656787     0.212616
A03H                -2.448303     5.625867    -0.658386


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0074098021
                     LJ ENERGY     0.0006243596

                     ML ENERGY   -76.3884508734

                  TOTAL ENERGY   -76.3952363160


                 ENERGY CHANGE    -0.0000617228
                  RMS GRADIENT     0.0013159072
              MAXIMUM GRADIENT     0.0022034819



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.699289     5.593777    -0.050682
A02H                -1.664738     4.655532     0.209694
A03H                -2.448556     5.623940    -0.657229


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0074200447
                     LJ ENERGY     0.0006250680

                     ML ENERGY   -76.3884635422

                  TOTAL ENERGY   -76.3952585189


                 ENERGY CHANGE    -0.0000222029
                  RMS GRADIENT     0.0011270419
              MAXIMUM GRADIENT     0.0026577316



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.698516     5.591569    -0.040924
A02H                -1.654773     4.648243     0.200884
A03H                -2.448382     5.616740    -0.651087


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0075209870
                     LJ ENERGY     0.0006394090

                     ML ENERGY   -76.3884420706

                  TOTAL ENERGY   -76.3953236486


                 ENERGY CHANGE    -0.0000651297
                  RMS GRADIENT     0.0017948535
              MAXIMUM GRADIENT     0.0028123058



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.695746     5.581101    -0.020009
A02H                -1.629095     4.627438     0.186782
A03H                -2.445853     5.597029    -0.632602


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0078316699
                     LJ ENERGY     0.0007081420

                     ML ENERGY   -76.3883192310

                  TOTAL ENERGY   -76.3954427589


                 ENERGY CHANGE    -0.0001191103
                  RMS GRADIENT     0.0028710341
              MAXIMUM GRADIENT     0.0044885633



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.676480     5.544282     0.010238
A02H                -1.586829     4.584691     0.191011
A03H                -2.438272     5.549851    -0.591948


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0084436290
                     LJ ENERGY     0.0009776681

                     ML ENERGY   -76.3881778003

                  TOTAL ENERGY   -76.3956437612


                 ENERGY CHANGE    -0.0002010023
                  RMS GRADIENT     0.0042786442
              MAXIMUM GRADIENT     0.0064909301



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.610363     5.428924     0.078653
A02H                -1.482771     4.466176     0.235721
A03H                -2.411827     5.412489    -0.473697


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0102545555
                     LJ ENERGY     0.0022412113

                     ML ENERGY   -76.3879740186

                  TOTAL ENERGY   -76.3959873628


                 ENERGY CHANGE    -0.0003436016
                  RMS GRADIENT     0.0049729109
              MAXIMUM GRADIENT     0.0077096418



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.610006     5.428348     0.080967
A02H                -1.480461     4.463328     0.234323
A03H                -2.408654     5.410806    -0.468683


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0103403447
                     LJ ENERGY     0.0022502036

                     ML ENERGY   -76.3879166696

                  TOTAL ENERGY   -76.3960068108


                 ENERGY CHANGE    -0.0000194479
                  RMS GRADIENT     0.0042366282
              MAXIMUM GRADIENT     0.0082985372



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.609836     5.425944     0.073845
A02H                -1.485824     4.467848     0.243161
A03H                -2.407572     5.416858    -0.470559


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0102226802
                     LJ ENERGY     0.0022854567

                     ML ENERGY   -76.3881854325

                  TOTAL ENERGY   -76.3961226560


                 ENERGY CHANGE    -0.0001158452
                  RMS GRADIENT     0.0015261019
              MAXIMUM GRADIENT     0.0028311427



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.613484     5.421241     0.076052
A02H                -1.476787     4.465049     0.240769
A03H                -2.408857     5.422235    -0.468994


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0101994087
                     LJ ENERGY     0.0023614441

                     ML ENERGY   -76.3883165236

                  TOTAL ENERGY   -76.3961544882


                 ENERGY CHANGE    -0.0000318322
                  RMS GRADIENT     0.0006594225
              MAXIMUM GRADIENT     0.0014227475



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.611362     5.424633     0.071294
A02H                -1.483366     4.467941     0.246314
A03H                -2.408721     5.426334    -0.471112


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0101880133
                     LJ ENERGY     0.0023076692

                     ML ENERGY   -76.3882849192

                  TOTAL ENERGY   -76.3961652633


                 ENERGY CHANGE    -0.0000107751
                  RMS GRADIENT     0.0006310302
              MAXIMUM GRADIENT     0.0012577378



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.603875     5.422828     0.070535
A02H                -1.485840     4.466245     0.254038
A03H                -2.405900     5.426873    -0.464777


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0102389148
                     LJ ENERGY     0.0023275972

                     ML ENERGY   -76.3882703347

                  TOTAL ENERGY   -76.3961816523


                 ENERGY CHANGE    -0.0000163890
                  RMS GRADIENT     0.0007020056
              MAXIMUM GRADIENT     0.0010949568



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.573917     5.419978     0.079398
A02H                -1.486399     4.461535     0.267996
A03H                -2.392669     5.444529    -0.430381


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0103535259
                     LJ ENERGY     0.0023328957

                     ML ENERGY   -76.3882522847

                  TOTAL ENERGY   -76.3962729149


                 ENERGY CHANGE    -0.0000912627
                  RMS GRADIENT     0.0007912741
              MAXIMUM GRADIENT     0.0016490935



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.504949     5.405231     0.110874
A02H                -1.470003     4.439846     0.293826
A03H                -2.361111     5.480527    -0.340581


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0107552431
                     LJ ENERGY     0.0024512250

                     ML ENERGY   -76.3881282735

                  TOTAL ENERGY   -76.3964322917


                 ENERGY CHANGE    -0.0001593767
                  RMS GRADIENT     0.0033363276
              MAXIMUM GRADIENT     0.0063216533



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.431748     5.398661     0.160510
A02H                -1.443273     4.423898     0.297419
A03H                -2.318618     5.547529    -0.228091


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0110042837
                     LJ ENERGY     0.0023844224

                     ML ENERGY   -76.3879717266

                  TOTAL ENERGY   -76.3965915879


                 ENERGY CHANGE    -0.0001592962
                  RMS GRADIENT     0.0070912695
              MAXIMUM GRADIENT     0.0141497083



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.426726     5.407766     0.190142
A02H                -1.424227     4.428645     0.264772
A03H                -2.300898     5.584146    -0.193477


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0108497009
                     LJ ENERGY     0.0022096041

                     ML ENERGY   -76.3882625786

                  TOTAL ENERGY   -76.3969026755


                 ENERGY CHANGE    -0.0003110876
                  RMS GRADIENT     0.0028635697
              MAXIMUM GRADIENT     0.0055548704



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.368841     5.393967     0.238372
A02H                -1.391206     4.404452     0.266336
A03H                -2.255562     5.615158    -0.087305


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0113095911
                     LJ ENERGY     0.0022458420

                     ML ENERGY   -76.3879795609

                  TOTAL ENERGY   -76.3970433100


                 ENERGY CHANGE    -0.0001406345
                  RMS GRADIENT     0.0044686389
              MAXIMUM GRADIENT     0.0089257856



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 24 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.317430     5.364971     0.273994
A02H                -1.362713     4.378265     0.285239
A03H                -2.212468     5.604827     0.006557


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0117852450
                     LJ ENERGY     0.0025156016

                     ML ENERGY   -76.3880586609

                  TOTAL ENERGY   -76.3973283043


                 ENERGY CHANGE    -0.0002849943
                  RMS GRADIENT     0.0030128473
              MAXIMUM GRADIENT     0.0062696506



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 25 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.267021     5.342076     0.308252
A02H                -1.336876     4.356854     0.300335
A03H                -2.174141     5.610272     0.094510


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0121221323
                     LJ ENERGY     0.0026829633

                     ML ENERGY   -76.3880578972

                  TOTAL ENERGY   -76.3974970662


                 ENERGY CHANGE    -0.0001687619
                  RMS GRADIENT     0.0033535586
              MAXIMUM GRADIENT     0.0059072425



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 26 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.201093     5.305772     0.355587
A02H                -1.297437     4.324665     0.322876
A03H                -2.119991     5.603414     0.215336


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0126079633
                     LJ ENERGY     0.0029811348

                     ML ENERGY   -76.3880340963

                  TOTAL ENERGY   -76.3976609249


                 ENERGY CHANGE    -0.0001638587
                  RMS GRADIENT     0.0052748496
              MAXIMUM GRADIENT     0.0103476681



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 27 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.159400     5.271231     0.390013
A02H                -1.262457     4.298874     0.343254
A03H                -2.079707     5.574405     0.299682


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129364936
                     LJ ENERGY     0.0033601090

                     ML ENERGY   -76.3882857118

                  TOTAL ENERGY   -76.3978620964


                 ENERGY CHANGE    -0.0002011715
                  RMS GRADIENT     0.0045660897
              MAXIMUM GRADIENT     0.0078528584



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 28 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.079540     5.223173     0.466599
A02H                -1.194666     4.251906     0.362282
A03H                -1.999853     5.547971     0.466182


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0135668134
                     LJ ENERGY     0.0036744841

                     ML ENERGY   -76.3881567115

                  TOTAL ENERGY   -76.3980490408


                 ENERGY CHANGE    -0.0001869444
                  RMS GRADIENT     0.0051392815
              MAXIMUM GRADIENT     0.0102057490



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 29 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.023372     5.188333     0.520155
A02H                -1.144055     4.216372     0.392632
A03H                -1.935204     5.493909     0.582241


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0141596259
                     LJ ENERGY     0.0038476109

                     ML ENERGY   -76.3880386095

                  TOTAL ENERGY   -76.3983506245


                 ENERGY CHANGE    -0.0003015837
                  RMS GRADIENT     0.0023321958
              MAXIMUM GRADIENT     0.0052580001



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 30 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.968345     5.154103     0.564251
A02H                -1.102936     4.184538     0.420778
A03H                -1.881177     5.458288     0.688502


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0145235757
                     LJ ENERGY     0.0040044483

                     ML ENERGY   -76.3879427373

                  TOTAL ENERGY   -76.3984618647


                 ENERGY CHANGE    -0.0001112402
                  RMS GRADIENT     0.0030383059
              MAXIMUM GRADIENT     0.0065111947



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 31 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.907364     5.114835     0.617017
A02H                -1.051860     4.151275     0.455345
A03H                -1.815238     5.412148     0.810941


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0147215915
                     LJ ENERGY     0.0041075911

                     ML ENERGY   -76.3879389655

                  TOTAL ENERGY   -76.3985529658


                 ENERGY CHANGE    -0.0000911012
                  RMS GRADIENT     0.0043365132
              MAXIMUM GRADIENT     0.0087101280



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 32 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.879769     5.101007     0.646034
A02H                -1.025292     4.144806     0.472653
A03H                -1.778254     5.391830     0.868914


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0145580194
                     LJ ENERGY     0.0039913775

                     ML ENERGY   -76.3881545368

                  TOTAL ENERGY   -76.3987211788


                 ENERGY CHANGE    -0.0001682129
                  RMS GRADIENT     0.0023518661
              MAXIMUM GRADIENT     0.0045695943



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 33 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.765645     5.047504     0.769414
A02H                -0.919885     4.106328     0.520785
A03H                -1.634424     5.329230     1.110353


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0140765868
                     LJ ENERGY     0.0033497753

                     ML ENERGY   -76.3881096452

                  TOTAL ENERGY   -76.3988364568


                 ENERGY CHANGE    -0.0001152781
                  RMS GRADIENT     0.0048058324
              MAXIMUM GRADIENT     0.0080023679



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 34 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.740101     5.064086     0.786155
A02H                -0.918941     4.125808     0.546167
A03H                -1.595791     5.324439     1.144035


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0139171697
                     LJ ENERGY     0.0027658552

                     ML ENERGY   -76.3880023690

                  TOTAL ENERGY   -76.3991536835


                 ENERGY CHANGE    -0.0003172267
                  RMS GRADIENT     0.0024639415
              MAXIMUM GRADIENT     0.0049528997



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 35 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.683789     5.042296     0.842814
A02H                -0.874084     4.115378     0.574537
A03H                -1.524515     5.293703     1.256179


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0135236003
                     LJ ENERGY     0.0024052764

                     ML ENERGY   -76.3881127978

                  TOTAL ENERGY   -76.3992311216


                 ENERGY CHANGE    -0.0000774381
                  RMS GRADIENT     0.0021980520
              MAXIMUM GRADIENT     0.0036364936



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 36 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.667237     5.043343     0.870382
A02H                -0.859355     4.127350     0.572773
A03H                -1.493704     5.301473     1.295182


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0131334242
                     LJ ENERGY     0.0021500836

                     ML ENERGY   -76.3882737228

                  TOTAL ENERGY   -76.3992570634


                 ENERGY CHANGE    -0.0000259418
                  RMS GRADIENT     0.0021207646
              MAXIMUM GRADIENT     0.0038400744



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 37 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.666070     5.045161     0.865601
A02H                -0.866693     4.131405     0.576884
A03H                -1.493366     5.302000     1.291835


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0131485991
                     LJ ENERGY     0.0021416684

                     ML ENERGY   -76.3882987726

                  TOTAL ENERGY   -76.3993057033


                 ENERGY CHANGE    -0.0000486399
                  RMS GRADIENT     0.0010604706
              MAXIMUM GRADIENT     0.0020828554



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 38 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.644531     5.041743     0.884525
A02H                -0.859648     4.132911     0.586550
A03H                -1.464928     5.295727     1.330090


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130662169
                     LJ ENERGY     0.0019715550

                     ML ENERGY   -76.3882371433

                  TOTAL ENERGY   -76.3993318052


                 ENERGY CHANGE    -0.0000261019
                  RMS GRADIENT     0.0008697562
              MAXIMUM GRADIENT     0.0014218288



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 39 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.634623     5.043887     0.893359
A02H                -0.866224     4.141854     0.585780
A03H                -1.448857     5.302247     1.345421


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0130204903
                     LJ ENERGY     0.0018555002

                     ML ENERGY   -76.3881972585

                  TOTAL ENERGY   -76.3993622486


                 ENERGY CHANGE    -0.0000304434
                  RMS GRADIENT     0.0008661984
              MAXIMUM GRADIENT     0.0019640561



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 40 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.614701     5.039105     0.912708
A02H                -0.874429     4.151920     0.583786
A03H                -1.415912     5.309521     1.382651


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0129210049
                     LJ ENERGY     0.0017235287

                     ML ENERGY   -76.3882090146

                  TOTAL ENERGY   -76.3994064907


                 ENERGY CHANGE    -0.0000442422
                  RMS GRADIENT     0.0010904651
              MAXIMUM GRADIENT     0.0020895557



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 41 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.610905     5.021150     0.912709
A02H                -0.906848     4.144291     0.574144
A03H                -1.397545     5.310183     1.395617


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0133212786
                     LJ ENERGY     0.0019131109

                     ML ENERGY   -76.3880600216

                  TOTAL ENERGY   -76.3994681893


                 ENERGY CHANGE    -0.0000616986
                  RMS GRADIENT     0.0025738687
              MAXIMUM GRADIENT     0.0051573869



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 42 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.612828     4.992251     0.908155
A02H                -0.932586     4.126489     0.568164
A03H                -1.384599     5.298988     1.406207


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0137128148
                     LJ ENERGY     0.0023150368

                     ML ENERGY   -76.3881508656

                  TOTAL ENERGY   -76.3995486435


                 ENERGY CHANGE    -0.0000804542
                  RMS GRADIENT     0.0016113488
              MAXIMUM GRADIENT     0.0033641010



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 43 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.604611     4.963986     0.917123
A02H                -0.931512     4.102781     0.576402
A03H                -1.362127     5.271467     1.436824


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0139643216
                     LJ ENERGY     0.0026048822

                     ML ENERGY   -76.3882304797

                  TOTAL ENERGY   -76.3995899191


                 ENERGY CHANGE    -0.0000412755
                  RMS GRADIENT     0.0014092768
              MAXIMUM GRADIENT     0.0024162242



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 44 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.594835     4.943852     0.928376
A02H                -0.926922     4.085230     0.587325
A03H                -1.338967     5.245813     1.465612


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0141290477
                     LJ ENERGY     0.0027630884

                     ML ENERGY   -76.3882519075

                  TOTAL ENERGY   -76.3996178669


                 ENERGY CHANGE    -0.0000279478
                  RMS GRADIENT     0.0005068349
              MAXIMUM GRADIENT     0.0009295872



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 45 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.568532     4.918936     0.955412
A02H                -0.916282     4.069171     0.605008
A03H                -1.291841     5.215366     1.526287


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0141529141
                     LJ ENERGY     0.0027576092

                     ML ENERGY   -76.3882440118

                  TOTAL ENERGY   -76.3996393166


                 ENERGY CHANGE    -0.0000214497
                  RMS GRADIENT     0.0012281314
              MAXIMUM GRADIENT     0.0019767575



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 46 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.536694     4.897211     0.988148
A02H                -0.897676     4.057604     0.629928
A03H                -1.239290     5.178397     1.592278


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0140029864
                     LJ ENERGY     0.0026021504

                     ML ENERGY   -76.3882699957

                  TOTAL ENERGY   -76.3996708316


                 ENERGY CHANGE    -0.0000315150
                  RMS GRADIENT     0.0013906920
              MAXIMUM GRADIENT     0.0020239284



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 47 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.524757     4.893488     1.002759
A02H                -0.893823     4.060584     0.634512
A03H                -1.218118     5.172512     1.615128


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0138947503
                     LJ ENERGY     0.0024688823

                     ML ENERGY   -76.3882557157

                  TOTAL ENERGY   -76.3996815837


                 ENERGY CHANGE    -0.0000107521
                  RMS GRADIENT     0.0008027547
              MAXIMUM GRADIENT     0.0014899244



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 48 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.508323     4.876095     1.018254
A02H                -0.890329     4.050054     0.648322
A03H                -1.188869     5.144975     1.648183


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0139529489
                     LJ ENERGY     0.0024803870

                     ML ENERGY   -76.3882305793

                  TOTAL ENERGY   -76.3997031412


                 ENERGY CHANGE    -0.0000215575
                  RMS GRADIENT     0.0003979755
              MAXIMUM GRADIENT     0.0007670021



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 49 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.488647     4.854913     1.038200
A02H                -0.886767     4.038950     0.660691
A03H                -1.152897     5.117063     1.690276


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0139886636
                     LJ ENERGY     0.0024854586

                     ML ENERGY   -76.3882081857

                  TOTAL ENERGY   -76.3997113907


                 ENERGY CHANGE    -0.0000082495
                  RMS GRADIENT     0.0008805605
              MAXIMUM GRADIENT     0.0014224139



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 50 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.464673     4.828560     1.063918
A02H                -0.880527     4.028430     0.675086
A03H                -1.109704     5.079412     1.738892


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0139601470
                     LJ ENERGY     0.0024750786

                     ML ENERGY   -76.3882423950

                  TOTAL ENERGY   -76.3997274634


                 ENERGY CHANGE    -0.0000160727
                  RMS GRADIENT     0.0005956892
              MAXIMUM GRADIENT     0.0009082482



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 51 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.446964     4.802196     1.083909
A02H                -0.877839     4.015527     0.682549
A03H                -1.077698     5.042033     1.773937


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0140760881
                     LJ ENERGY     0.0025479668

                     ML ENERGY   -76.3882150523

                  TOTAL ENERGY   -76.3997431736


                 ENERGY CHANGE    -0.0000157102
                  RMS GRADIENT     0.0004756355
              MAXIMUM GRADIENT     0.0007628965



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 52 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.408683     4.750796     1.126541
A02H                -0.865963     3.990463     0.701524
A03H                -1.009953     4.968004     1.851921


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0141532994
                     LJ ENERGY     0.0026059397

                     ML ENERGY   -76.3882052166

                  TOTAL ENERGY   -76.3997525764


                 ENERGY CHANGE    -0.0000094028
                  RMS GRADIENT     0.0009299237
              MAXIMUM GRADIENT     0.0014997160



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 53 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.392481     4.721233     1.146437
A02H                -0.854265     3.977637     0.703969
A03H                -0.987431     4.918503     1.879017


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142052728
                     LJ ENERGY     0.0027033457

                     ML ENERGY   -76.3882757941

                  TOTAL ENERGY   -76.3997777212


                 ENERGY CHANGE    -0.0000251448
                  RMS GRADIENT     0.0009978075
              MAXIMUM GRADIENT     0.0018990218



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 54 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.352126     4.665585     1.191918
A02H                -0.833671     3.950402     0.720620
A03H                -0.924431     4.827942     1.953879


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142579944
                     LJ ENERGY     0.0027163296

                     ML ENERGY   -76.3882474782

                  TOTAL ENERGY   -76.3997891431


                 ENERGY CHANGE    -0.0000114219
                  RMS GRADIENT     0.0006824253
              MAXIMUM GRADIENT     0.0013905961



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 55 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.350904     4.666597     1.192378
A02H                -0.828112     3.951028     0.717429
A03H                -0.931176     4.820348     1.948453


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142820494
                     LJ ENERGY     0.0026853283

                     ML ENERGY   -76.3882098351

                  TOTAL ENERGY   -76.3998065562


                 ENERGY CHANGE    -0.0000174131
                  RMS GRADIENT     0.0002737584
              MAXIMUM GRADIENT     0.0005535430



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 56 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.325300     4.632967     1.221187
A02H                -0.806177     3.934927     0.722781
A03H                -0.901268     4.753957     1.987933


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142903058
                     LJ ENERGY     0.0026448284

                     ML ENERGY   -76.3881708881

                  TOTAL ENERGY   -76.3998163654


                 ENERGY CHANGE    -0.0000098092
                  RMS GRADIENT     0.0007065997
              MAXIMUM GRADIENT     0.0013094936



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 57 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.325430     4.631178     1.222316
A02H                -0.796716     3.933872     0.717820
A03H                -0.907530     4.743471     1.984459


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142546849
                     LJ ENERGY     0.0026536962

                     ML ENERGY   -76.3882212587

                  TOTAL ENERGY   -76.3998222474


                 ENERGY CHANGE    -0.0000058820
                  RMS GRADIENT     0.0004105647
              MAXIMUM GRADIENT     0.0007950684



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 58 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.319791     4.622055     1.229368
A02H                -0.791902     3.929094     0.718504
A03H                -0.899757     4.727294     1.994322


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142680119
                     LJ ENERGY     0.0026592765

                     ML ENERGY   -76.3882146053

                  TOTAL ENERGY   -76.3998233408


                 ENERGY CHANGE    -0.0000010933
                  RMS GRADIENT     0.0001253446
              MAXIMUM GRADIENT     0.0002338078



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    FINAL STATE

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988    -0.000000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -0.321756     4.624333     1.227168
A02H                -0.793029     3.930008     0.717339
A03H                -0.902616     4.731432     1.990984


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY    -0.0142763041
                     LJ ENERGY     0.0026671400

                     ML ENERGY   -76.3882144255

                  TOTAL ENERGY   -76.3998235897


                 ENERGY CHANGE    -0.0000002489
                  RMS GRADIENT     0.0001777991
              MAXIMUM GRADIENT     0.0002905564



OPTIMIZATION CONVERGED IN 59 STEPS
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:46 2025
TOTAL RUN TIME IS 0 SECONDS
