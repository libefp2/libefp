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
WALL CLOCK TIME IS Mon Aug 12 23:41:32 2024

SIMULATION SETTINGS

run_type opt
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp screen
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
max_steps 200
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc false
periodic_box 30.0 30.0 30.0 90.0 90.0 90.0
opt_tol 0.0001
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
symm_frag frag
update_params 0
update_params_cutoff 0
print 0
verbose 5


xr_cutoff is set to 10.000000 

SPECIAL FRAGMENT ENERGY MINIMIZATION JOB


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397059
           POLARIZATION ENERGY    -0.0000429508
             DISPERSION ENERGY    -0.0001897219
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850092



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000000     0.063030     0.000000        0.000000    -0.074893     0.000000
   1      -0.595260        -0.752652    -0.500166     0.000000        0.038270     0.037446     0.000000
   1      -0.595260         0.752652    -0.500166     0.000000       -0.038270     0.037446     0.000000
   Total TORCH energy   -76.387023
--------------------------------

    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01O1                0.000000     0.063030     0.000000
A02H2               -0.752652    -0.500166     0.000000
A03H3                0.752652    -0.500166     0.000000
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   0.000000e+00   1.794358e-11   0.000000e+00   1.110223e-16   0.000000e+00   0.000000e+00

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397059
           POLARIZATION ENERGY    -0.0000429508
             DISPERSION ENERGY    -0.0001897219
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.3871079813


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0003648926
              MAXIMUM GRADIENT     0.0005516232



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0012764657
           POLARIZATION ENERGY    -0.0000345480
             DISPERSION ENERGY    -0.0001961886
     EXCHANGE REPULSION ENERGY     0.0000073032
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0014998990



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.195045         0.190747     0.002566     0.266660        0.253223    -0.036006     0.024176
   1      -0.565745        -0.910613    -0.276815    -0.090979       -0.175199    -0.060884    -0.066413
   1      -0.593087         0.594691    -0.731136    -0.086416       -0.078024     0.096891     0.042237
   Total TORCH energy   -76.353878
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001319953
           POLARIZATION ENERGY    -0.0000427885
             DISPERSION ENERGY    -0.0001897518
     EXCHANGE REPULSION ENERGY     0.0000079423
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000926027



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.001073     0.062690     0.001500        0.002966    -0.075517    -0.000268
   1      -0.595277        -0.753540    -0.498910    -0.000512        0.037109     0.036485     0.000130
   1      -0.595223         0.751764    -0.501465    -0.000486       -0.040075     0.039032     0.000138
   Total TORCH energy   -76.387003
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001392459
           POLARIZATION ENERGY    -0.0000429411
             DISPERSION ENERGY    -0.0001897237
     EXCHANGE REPULSION ENERGY     0.0000079567
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000854622



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000064     0.063010     0.000089        0.000177    -0.074930    -0.000016
   1      -0.595261        -0.752705    -0.500091    -0.000031        0.038202     0.037389     0.000008
   1      -0.595258         0.752599    -0.500243    -0.000029       -0.038379     0.037541     0.000008
   Total TORCH energy   -76.387022
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396772
           POLARIZATION ENERGY    -0.0000429502
             DISPERSION ENERGY    -0.0001897221
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850375



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000004     0.063029     0.000006        0.000011    -0.074895    -0.000001
   1      -0.595260        -0.752655    -0.500161    -0.000002        0.038266     0.037443     0.000000
   1      -0.595260         0.752649    -0.500171    -0.000002       -0.038277     0.037452     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397049
           POLARIZATION ENERGY    -0.0000429507
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850102



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000000     0.063030     0.000000        0.000001    -0.074893    -0.000000
   1      -0.595260        -0.752652    -0.500166    -0.000000        0.038270     0.037446     0.000000
   1      -0.595260         0.752652    -0.500166    -0.000000       -0.038271     0.037447     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397044
           POLARIZATION ENERGY    -0.0000429507
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850107



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000000     0.063030     0.000000        0.000001    -0.074893    -0.000000
   1      -0.595260        -0.752652    -0.500166    -0.000000        0.038270     0.037446     0.000000
   1      -0.595260         0.752652    -0.500166    -0.000000       -0.038271     0.037447     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396908
           POLARIZATION ENERGY    -0.0000429504
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850241



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000003        0.000006    -0.074894    -0.000001
   1      -0.595260        -0.752654    -0.500163    -0.000001        0.038268     0.037445     0.000000
   1      -0.595260         0.752650    -0.500169    -0.000001       -0.038274     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397039
           POLARIZATION ENERGY    -0.0000429507
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850111



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000000     0.063030     0.000000        0.000001    -0.074893    -0.000000
   1      -0.595260        -0.752652    -0.500166    -0.000000        0.038270     0.037446     0.000000
   1      -0.595260         0.752652    -0.500166    -0.000000       -0.038271     0.037447     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001397035
           POLARIZATION ENERGY    -0.0000429507
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850115



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000000     0.063030     0.000000        0.000001    -0.074893    -0.000000
   1      -0.595260        -0.752652    -0.500166    -0.000000        0.038270     0.037446     0.000000
   1      -0.595260         0.752652    -0.500166    -0.000000       -0.038271     0.037447     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396971
           POLARIZATION ENERGY    -0.0000429506
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850178



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000001     0.063030     0.000002        0.000003    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500165    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752651    -0.500167    -0.000001       -0.038272     0.037448     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396970
           POLARIZATION ENERGY    -0.0000429506
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850179



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000001     0.063030     0.000002        0.000003    -0.074893    -0.000000
   1      -0.595260        -0.752653    -0.500165    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752651    -0.500167    -0.000001       -0.038273     0.037448     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396970
           POLARIZATION ENERGY    -0.0000429506
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850179



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000001     0.063030     0.000002        0.000003    -0.074893    -0.000000
   1      -0.595260        -0.752653    -0.500165    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752651    -0.500167    -0.000001       -0.038273     0.037448     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396939
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850210



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000002        0.000004    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500164    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752650    -0.500168    -0.000001       -0.038273     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396924
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850225



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000003        0.000005    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500164    -0.000001        0.038268     0.037445     0.000000
   1      -0.595260         0.752650    -0.500168    -0.000001       -0.038273     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396939
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850210



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000002        0.000004    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500164    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752650    -0.500168    -0.000001       -0.038273     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396939
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850210



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000002        0.000004    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500164    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752650    -0.500168    -0.000001       -0.038273     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396931
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850218



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000002        0.000005    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500164    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752650    -0.500168    -0.000001       -0.038273     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396939
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0000850210



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.196503         0.000002     0.063029     0.000002        0.000004    -0.074894    -0.000000
   1      -0.595260        -0.752653    -0.500164    -0.000001        0.038269     0.037445     0.000000
   1      -0.595260         0.752650    -0.500168    -0.000001       -0.038273     0.037449     0.000000
   Total TORCH energy   -76.387023
--------------------------------

 NEW_X step
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                0.000002     0.063029     0.000002
A02H2               -0.752653    -0.500164    -0.000001
A03H3                0.752651    -0.500168    -0.000001
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.325260e-06  -4.727423e-07   1.981850e-06  -4.807600e-03   5.511476e-06   4.803547e-03

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001396939
           POLARIZATION ENERGY    -0.0000429505
             DISPERSION ENERGY    -0.0001897220
     EXCHANGE REPULSION ENERGY     0.0000079576
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.3871079931


                 ENERGY CHANGE    -0.0000000118
                  RMS GRADIENT     0.0003648920
              MAXIMUM GRADIENT     0.0005516177



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0057255453
           POLARIZATION ENERGY    -0.0008835747
             DISPERSION ENERGY    -0.0002870870
     EXCHANGE REPULSION ENERGY     0.0001194268
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0067767803



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.200226         1.931556    -0.843380     2.376282       -0.002708    -0.001773    -0.003191
   1      -0.605137        -2.209685     1.745434    -0.768704       -0.001727     0.005347     0.000085
   1      -0.602373        -0.796178    -2.629970    -0.838078        0.004435    -0.003573     0.003106
   Total TORCH energy   -76.407736
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0050586854
           POLARIZATION ENERGY    -0.0002661500
             DISPERSION ENERGY    -0.0002293464
     EXCHANGE REPULSION ENERGY     0.0000391866
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0055149953



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.164169         0.882164    -0.350938     1.085276       -0.090591     0.084999    -0.023438
   1      -0.468463        -1.418096     0.525426    -0.351076        0.167680    -0.110911     0.073845
   1      -0.441600         0.045283    -1.472872    -0.382760       -0.077089     0.025912    -0.050406
   Total TORCH energy   -76.074233
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0057312884
           POLARIZATION ENERGY    -0.0008819927
             DISPERSION ENERGY    -0.0002870831
     EXCHANGE REPULSION ENERGY     0.0001194475
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0067809167



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.200211         1.928075    -0.841746     2.371999       -0.002496    -0.001637    -0.002943
   1      -0.605158        -2.207059     1.741386    -0.767318       -0.001794     0.005544     0.000088
   1      -0.602368        -0.793387    -2.626131    -0.836567        0.004290    -0.003907     0.002855
   Total TORCH energy   -76.407736
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0060332247
           POLARIZATION ENERGY    -0.0004879726
             DISPERSION ENERGY    -0.0002558430
     EXCHANGE REPULSION ENERGY     0.0000753253
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0067017151



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.198837         1.237774    -0.517813     1.522762       -0.077908    -0.074820    -0.110499
   1      -0.582022        -1.686343     0.938852    -0.492598        0.042738    -0.086715    -0.003249
   1      -0.525016        -0.239865    -1.864980    -0.537055        0.035170     0.161536     0.113748
   Total TORCH energy   -76.305875
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0057392882
           POLARIZATION ENERGY    -0.0008797773
             DISPERSION ENERGY    -0.0002870744
     EXCHANGE REPULSION ENERGY     0.0001194718
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0067866682



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.200195         1.923216    -0.839466     2.366022       -0.002199    -0.001444    -0.002594
   1      -0.605188        -2.203393     1.735738    -0.765384       -0.001886     0.005811     0.000092
   1      -0.602362        -0.789491    -2.620774    -0.834459        0.004084    -0.004367     0.002502
   Total TORCH energy   -76.407745
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0062047098
           POLARIZATION ENERGY    -0.0006358420
             DISPERSION ENERGY    -0.0002716773
     EXCHANGE REPULSION ENERGY     0.0000986378
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0070135913



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.201164         1.470824    -0.627175     1.809470       -0.022718    -0.014755    -0.027963
   1      -0.596932        -1.862140     1.209793    -0.585346        0.007323    -0.012845     0.001502
   1      -0.592062        -0.426737    -2.121950    -0.638172        0.015395     0.027600     0.026460
   Total TORCH energy   -76.390158
--------------------------------

 NEW_X step
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                1.470824    -0.627175     1.809470
A02H2               -1.862140     1.209793    -0.585346
A03H3               -0.426737    -2.121950    -0.638172
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.178137e+00  -6.080265e-01   1.538498e+00  -1.150064e+00   8.073262e-01   1.865479e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0062047098
           POLARIZATION ENERGY    -0.0006358420
             DISPERSION ENERGY    -0.0002716773
     EXCHANGE REPULSION ENERGY     0.0000986378
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.3971718869


                 ENERGY CHANGE    -0.0100638938
                  RMS GRADIENT     0.0009475901
              MAXIMUM GRADIENT     0.0021710864



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0120288375
           POLARIZATION ENERGY    -0.0012662874
             DISPERSION ENERGY    -0.0006274408
     EXCHANGE REPULSION ENERGY     0.0006037871
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0133187785



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.199799         1.791754    -0.102795     0.956781       -0.040218    -0.026070    -0.027044
   1      -0.594687        -1.735357     1.148122    -0.793864        0.014510    -0.016011     0.005294
   1      -0.590063        -0.379893    -2.166994    -0.618817        0.025707     0.042081     0.021750
   Total TORCH energy   -76.384548
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0046726308
           POLARIZATION ENERGY    -0.0009547189
             DISPERSION ENERGY    -0.0006128179
     EXCHANGE REPULSION ENERGY     0.0003963934
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0058437742



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.200211         3.075476     1.994722    -2.453973       -0.002194    -0.000557     0.000421
   1      -0.596638        -1.228222     0.901437    -1.627935        0.006939    -0.014326     0.004557
   1      -0.599245        -0.192517    -2.347170    -0.541398       -0.004745     0.014883    -0.004978
   Total TORCH energy   -76.396094
--------------------------------

 NEW_X step
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                3.075476     1.994722    -2.453973
A02H2               -1.228222     0.901437    -1.627935
A03H3               -0.192517    -2.347170    -0.541398
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   2.651783e+00   1.690584e+00  -2.300727e+00   2.877539e+00   3.624067e-01   3.041219e+00

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0046726308
           POLARIZATION ENERGY    -0.0009547189
             DISPERSION ENERGY    -0.0006128179
     EXCHANGE REPULSION ENERGY     0.0003963934
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.4019375599


                 ENERGY CHANGE    -0.0047656730
                  RMS GRADIENT     0.0010784497
              MAXIMUM GRADIENT     0.0026645073



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0609567969
           POLARIZATION ENERGY    -0.0113320374
             DISPERSION ENERGY    -0.1486813900
     EXCHANGE REPULSION ENERGY     0.7680986060
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.5471283816



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         5.361731     1.646577    -0.805000        0.000000     0.000000     0.000000
   1      -0.605276        -1.752206     1.869540    -2.308061        0.000000     0.000000     0.000000
   1      -0.605276        -0.809097    -3.474853    -0.744279        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0067766510
           POLARIZATION ENERGY    -0.0011315172
             DISPERSION ENERGY    -0.0009037453
     EXCHANGE REPULSION ENERGY     0.0010027030
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0078092106



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.200653         3.357580     1.951764    -2.250504       -0.003151    -0.000631     0.000365
   1      -0.599698        -1.292877     1.020893    -1.711857        0.009920    -0.022545     0.007204
   1      -0.601578        -0.268597    -2.486316    -0.566432       -0.006769     0.023176    -0.007569
   Total TORCH energy   -76.401929
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0068861364
           POLARIZATION ENERGY    -0.0011412699
             DISPERSION ENERGY    -0.0009227967
     EXCHANGE REPULSION ENERGY     0.0010502707
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0078999322



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.200623         3.371284     1.949677    -2.240619       -0.002387    -0.000472     0.000268
   1      -0.599920        -1.296018     1.026696    -1.715934        0.009381    -0.023574     0.007576
   1      -0.601740        -0.272293    -2.493076    -0.567648       -0.006994     0.024046    -0.007845
   Total TORCH energy   -76.402283
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0215426038
           POLARIZATION ENERGY    -0.0023191242
             DISPERSION ENERGY    -0.0066681876
     EXCHANGE REPULSION ENERGY     0.0421455441
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0116156285



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         4.366508     1.798127    -1.522810        0.000000     0.000000     0.000000
   1      -0.604907        -1.524112     1.448118    -2.011997       -0.000209     0.000944    -0.000289
   1      -0.604907        -0.540695    -2.983964    -0.655963        0.000209    -0.000944     0.000289
   Total TORCH energy   -76.407491
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0099673537
           POLARIZATION ENERGY    -0.0014217870
             DISPERSION ENERGY    -0.0016350288
     EXCHANGE REPULSION ENERGY     0.0034862620
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0095379075



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197723         3.709827     1.898125    -1.996444        0.000942     0.000135    -0.000033
   1      -0.605656        -1.373608     1.170050    -1.816645        0.002202    -0.012056     0.003827
   1      -0.605678        -0.363595    -2.660060    -0.597690       -0.003144     0.011921    -0.003794
   Total TORCH energy   -76.409058
--------------------------------

 NEW_X step
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                3.709827     1.898125    -1.996444
A02H2               -1.373608     1.170050    -1.816645
A03H3               -0.363595    -2.660060    -0.597690
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   3.197433e+00   1.602319e+00  -1.908112e+00  -3.110427e+00   3.059013e-01   2.615644e+00

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0099673537
           POLARIZATION ENERGY    -0.0014217870
             DISPERSION ENERGY    -0.0016350288
     EXCHANGE REPULSION ENERGY     0.0034862620
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.4185960612


                 ENERGY CHANGE    -0.0166585012
                  RMS GRADIENT     0.0005140354
              MAXIMUM GRADIENT     0.0012257908



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0147112409
           POLARIZATION ENERGY    -0.0019322538
             DISPERSION ENERGY    -0.0032516708
     EXCHANGE REPULSION ENERGY     0.0133099283
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0065852371



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         4.218935     2.065148    -1.666532        0.000000     0.000000     0.000000
   1      -0.604998        -1.480404     1.530987    -1.844296       -0.000716     0.003443    -0.000855
   1      -0.604998        -0.558482    -2.902336    -0.743839        0.000716    -0.003443     0.000855
   Total TORCH energy   -76.407673
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0103688856
           POLARIZATION ENERGY    -0.0014650835
             DISPERSION ENERGY    -0.0017433837
     EXCHANGE REPULSION ENERGY     0.0039617842
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0096155686



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         3.757637     1.913810    -1.965462        0.000070     0.000010    -0.000002
   1      -0.605917        -1.383638     1.203945    -1.819242        0.001721    -0.006958     0.002161
   1      -0.605918        -0.381897    -2.682812    -0.611415       -0.001791     0.006948    -0.002159
   Total TORCH energy   -76.409513
--------------------------------

 NEW_X step
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                3.757637     1.913810    -1.965462
A02H2               -1.383638     1.203945    -1.819242
A03H3               -0.381897    -2.682812    -0.611415
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   3.238307e+00   1.616872e+00  -1.881511e+00  -3.096146e+00   2.982974e-01   2.595163e+00

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0103688856
           POLARIZATION ENERGY    -0.0014650835
             DISPERSION ENERGY    -0.0017433837
     EXCHANGE REPULSION ENERGY     0.0039617842
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.4191282672


                 ENERGY CHANGE    -0.0005322061
                  RMS GRADIENT     0.0004689736
              MAXIMUM GRADIENT     0.0010599717



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0117172548
           POLARIZATION ENERGY    -0.0017062975
             DISPERSION ENERGY    -0.0020460102
     EXCHANGE REPULSION ENERGY     0.0055538378
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0099157246



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         4.030072     2.171685    -1.803538        0.000000     0.000000     0.000000
   1      -0.605396        -1.441183     1.494339    -1.765503       -0.001456     0.006860    -0.001605
   1      -0.605396        -0.526586    -2.813311    -0.757672        0.001456    -0.006860     0.001605
   Total TORCH energy   -76.408470
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0105410058
           POLARIZATION ENERGY    -0.0014908923
             DISPERSION ENERGY    -0.0017810044
     EXCHANGE REPULSION ENERGY     0.0041345665
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0096783359



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         3.788121     1.942664    -1.947344        0.000000     0.000000     0.000000
   1      -0.606018        -1.390077     1.236439    -1.813229        0.000937    -0.003714     0.001119
   1      -0.606018        -0.398087    -2.697414    -0.627780       -0.000937     0.003714    -0.001119
   Total TORCH energy   -76.409713
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0105575497
           POLARIZATION ENERGY    -0.0014934201
             DISPERSION ENERGY    -0.0017846351
     EXCHANGE REPULSION ENERGY     0.0041515375
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0096840674



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         3.791091     1.945476    -1.945578        0.000000     0.000000     0.000000
   1      -0.606024        -1.390704     1.239605    -1.812643        0.000860    -0.003418     0.001027
   1      -0.606024        -0.399664    -2.698837    -0.629375       -0.000860     0.003418    -0.001027
   Total TORCH energy   -76.409726
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0111838996
           POLARIZATION ENERGY    -0.0015972794
             DISPERSION ENERGY    -0.0019240902
     EXCHANGE REPULSION ENERGY     0.0048487349
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0098565343



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         3.910582     2.058580    -1.874558        0.000000     0.000000     0.000000
   1      -0.605913        -1.415943     1.366972    -1.789073       -0.001217     0.005265    -0.001399
   1      -0.605913        -0.463125    -2.756074    -0.693523        0.001217    -0.005265     0.001399
   Total TORCH energy   -76.409503
--------------------------------

 NEW_X step
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                3.910582     2.058580    -1.874558
A02H2               -1.415943     1.366972    -1.789073
A03H3               -0.463125    -2.756074    -0.693523
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   3.367782e+00   1.750464e+00  -1.803687e+00  -3.073212e+00   2.564150e-01   2.561979e+00

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0111838996
           POLARIZATION ENERGY    -0.0015972794
             DISPERSION ENERGY    -0.0019240902
     EXCHANGE REPULSION ENERGY     0.0048487349
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.4193592790


                 ENERGY CHANGE    -0.0002310118
                  RMS GRADIENT     0.0005747454
              MAXIMUM GRADIENT     0.0015680904



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0113037203
           POLARIZATION ENERGY    -0.0051919182
             DISPERSION ENERGY    -0.0004067339
     EXCHANGE REPULSION ENERGY     0.0002930230
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0166093493



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         6.144252     4.130188    -1.392307        0.000000     0.000000     0.000000
   1      -0.605276        -1.775534     3.327984    -1.705166        0.000000     0.000000     0.000000
   1      -0.605276        -1.454654    -3.788129    -1.659164        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0018795890
           POLARIZATION ENERGY    -0.0007628370
             DISPERSION ENERGY    -0.0000129039
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0026553237



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        15.078933    12.416621     0.536697        0.000000     0.000000     0.000000
   1      -0.605276        -3.213898    11.172032    -1.369540        0.000000     0.000000     0.000000
   1      -0.605276        -5.420770    -7.916345    -5.521728        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0064418004
           POLARIZATION ENERGY    -0.0028402339
             DISPERSION ENERGY    -0.0000180615
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0093000895



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.497911     8.167973    -0.452349        0.000000     0.000000     0.000000
   1      -0.605276        -2.476415     7.150204    -1.541624        0.000000     0.000000     0.000000
   1      -0.605276        -3.387249    -5.799712    -3.541301        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0139076221
           POLARIZATION ENERGY    -0.0060850746
             DISPERSION ENERGY    -0.0000332277
     EXCHANGE REPULSION ENERGY     0.0000000089
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0200259156



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.899963     6.685962    -0.797347        0.000000     0.000000     0.000000
   1      -0.605276        -2.219167     5.747313    -1.601650        0.000000     0.000000     0.000000
   1      -0.605276        -2.677918    -5.061389    -2.850490        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O1                8.667916     6.470751    -0.847446
A02H2               -2.181811     5.543592    -1.610366
A03H3               -2.574912    -4.954173    -2.750173
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   7.431673e+00   5.779560e+00  -9.966091e-01  -5.226952e-01   1.220516e-01  -3.095278e-02

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -76.4300817487


                 ENERGY CHANGE    -0.0107224697
                  RMS GRADIENT     0.0026859683
              MAXIMUM GRADIENT     0.0060418977



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0005035104
           POLARIZATION ENERGY    -0.0003821431
             DISPERSION ENERGY    -0.0000126720
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001087015



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        18.390905    14.039874    -0.231252        0.000000     0.000000     0.000000
   1      -0.605276        -3.540334    12.518106    -2.365024        0.000000     0.000000     0.000000
   1      -0.605276        -6.192527    -9.413499    -5.937768        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0061745093
           POLARIZATION ENERGY    -0.0028770411
             DISPERSION ENERGY    -0.0000179074
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0090694516



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.667429     8.027327    -0.720727        0.000000     0.000000     0.000000
   1      -0.605276        -2.461188     6.977887    -1.765560        0.000000     0.000000     0.000000
   1      -0.605276        -3.318867    -5.871224    -3.405696        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0138889227
           POLARIZATION ENERGY    -0.0060035405
             DISPERSION ENERGY    -0.0000330766
     EXCHANGE REPULSION ENERGY     0.0000000088
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0199255311



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.925643     6.671386    -0.831113        0.000000     0.000000     0.000000
   1      -0.605276        -2.217821     5.728466    -1.630370        0.000000     0.000000     0.000000
   1      -0.605276        -2.670804    -5.072376    -2.834667        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0149608069
           POLARIZATION ENERGY    -0.0066659163
             DISPERSION ENERGY    -0.0000376010
     EXCHANGE REPULSION ENERGY     0.0000000083
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0216643158



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.693202     6.490436    -0.845844        0.000000     0.000000     0.000000
   1      -0.605276        -2.185344     5.561730    -1.612329        0.000000     0.000000     0.000000
   1      -0.605276        -2.584320    -4.965770    -2.758463        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150617823
           POLARIZATION ENERGY    -0.0067340618
             DISPERSION ENERGY    -0.0000381048
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218339408



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.670285     6.472595    -0.847296        0.000000     0.000000     0.000000
   1      -0.605276        -2.182142     5.545291    -1.610550        0.000000     0.000000     0.000000
   1      -0.605276        -2.575794    -4.955259    -2.750950        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150711943
           POLARIZATION ENERGY    -0.0067404730
             DISPERSION ENERGY    -0.0000381526
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218498118



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.668138     6.470923    -0.847432        0.000000     0.000000     0.000000
   1      -0.605276        -2.181842     5.543750    -1.610384        0.000000     0.000000     0.000000
   1      -0.605276        -2.574994    -4.954274    -2.750246        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150720717
           POLARIZATION ENERGY    -0.0067410712
             DISPERSION ENERGY    -0.0000381571
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218512918



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667937     6.470767    -0.847445        0.000000     0.000000     0.000000
   1      -0.605276        -2.181814     5.543606    -1.610368        0.000000     0.000000     0.000000
   1      -0.605276        -2.574920    -4.954183    -2.750180        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721535
           POLARIZATION ENERGY    -0.0067411270
             DISPERSION ENERGY    -0.0000381575
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514298



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667918     6.470753    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543593    -1.610367        0.000000     0.000000     0.000000
   1      -0.605276        -2.574913    -4.954174    -2.750174        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721611
           POLARIZATION ENERGY    -0.0067411322
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514427



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514439



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150721619
           POLARIZATION ENERGY    -0.0067411327
             DISPERSION ENERGY    -0.0000381576
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218514440



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.667916     6.470751    -0.847446        0.000000     0.000000     0.000000
   1      -0.605276        -2.181811     5.543592    -1.610366        0.000000     0.000000     0.000000
   1      -0.605276        -2.574912    -4.954173    -2.750173        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0150921552
           POLARIZATION ENERGY    -0.0067496961
             DISPERSION ENERGY    -0.0000381347
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0218799778



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.671114     6.470236    -0.845314        0.000000     0.000000     0.000000
   1      -0.605276        -2.181618     5.543111    -1.609565        0.000000     0.000000     0.000000
   1      -0.605276        -2.574384    -4.954719    -2.748885        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0151721364
           POLARIZATION ENERGY    -0.0067841270
             DISPERSION ENERGY    -0.0000380434
     EXCHANGE REPULSION ENERGY     0.0000000082
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0219942986



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.683903     6.468174    -0.836783        0.000000     0.000000     0.000000
   1      -0.605276        -2.180846     5.541191    -1.606360        0.000000     0.000000     0.000000
   1      -0.605276        -2.572274    -4.956901    -2.743731        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0154921882
           POLARIZATION ENERGY    -0.0069248231
             DISPERSION ENERGY    -0.0000376790
     EXCHANGE REPULSION ENERGY     0.0000000081
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0224546822



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.735059     6.459926    -0.802661        0.000000     0.000000     0.000000
   1      -0.605276        -2.177761     5.533509    -1.593541        0.000000     0.000000     0.000000
   1      -0.605276        -2.563833    -4.965631    -2.723114        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0167745177
           POLARIZATION ENERGY    -0.0075450733
             DISPERSION ENERGY    -0.0000362331
     EXCHANGE REPULSION ENERGY     0.0000000079
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0243558162



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.939681     6.426933    -0.666170        0.000000     0.000000     0.000000
   1      -0.605276        -2.165421     5.502778    -1.542264        0.000000     0.000000     0.000000
   1      -0.605276        -2.530070    -5.000549    -2.640650        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0220196756
           POLARIZATION ENERGY    -0.0122759336
             DISPERSION ENERGY    -0.0000306429
     EXCHANGE REPULSION ENERGY     0.0000000080
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0343262441



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         9.758173     6.294962    -0.120210        0.000000     0.000000     0.000000
   1      -0.605276        -2.116059     5.379858    -1.337155        0.000000     0.000000     0.000000
   1      -0.605276        -2.395014    -5.140223    -2.310791        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0400885279
           POLARIZATION ENERGY    -0.0356978139
             DISPERSION ENERGY    -0.0000164598
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0758027953



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        13.032142     5.767081     2.063631        0.000000     0.000000     0.000000
   1      -0.605276        -1.918610     4.888178    -0.516718        0.000000     0.000000     0.000000
   1      -0.605276        -1.854792    -5.698918    -0.991359        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0237849566
           POLARIZATION ENERGY    -0.0155058532
             DISPERSION ENERGY    -0.0000290279
     EXCHANGE REPULSION ENERGY     0.0000000081
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0393198297



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.008045     6.254674     0.046462        0.000000     0.000000     0.000000
   1      -0.605276        -2.100989     5.342333    -1.274538        0.000000     0.000000     0.000000
   1      -0.605276        -2.353784    -5.182863    -2.210092        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY   -14.5327143832
           POLARIZATION ENERGY    -0.0750765461
             DISPERSION ENERGY    -0.0000190821
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -14.6078100049



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.039550     5.927122     1.401541        0.000000     0.000000     0.000000
   1      -0.605276        -1.978472     5.037244    -0.765455        0.000000     0.000000     0.000000
   1      -0.605276        -2.018575    -5.529534    -1.391380        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0413061477
           POLARIZATION ENERGY    -0.0357183436
             DISPERSION ENERGY    -0.0000164680
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0770409531



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        13.028112     5.767731     2.060943        0.000000     0.000000     0.000000
   1      -0.605276        -1.918853     4.888783    -0.517727        0.000000     0.000000     0.000000
   1      -0.605276        -1.855457    -5.698230    -0.992982        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -2.8321594346
           POLARIZATION ENERGY    -0.0540905062
             DISPERSION ENERGY    -0.0000183042
     EXCHANGE REPULSION ENERGY     0.0000000064
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -2.8862682386



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.288168     5.887036     1.567376        0.000000     0.000000     0.000000
   1      -0.605276        -1.963478     4.999907    -0.703153        0.000000     0.000000     0.000000
   1      -0.605276        -1.977552    -5.571960    -1.291186        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY   -14.5327143832
           POLARIZATION ENERGY    -0.0750765461
             DISPERSION ENERGY    -0.0000190821
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -14.6078100049



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.039550     5.927122     1.401541        0.000000     0.000000     0.000000
   1      -0.605276        -1.978472     5.037244    -0.765455        0.000000     0.000000     0.000000
   1      -0.605276        -2.018575    -5.529534    -1.391380        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.039550     5.927122     1.401540
A02H2               -1.978472     5.037244    -0.765455
A03H3               -2.018575    -5.529534    -1.391380
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.046848e+01   5.236242e+00   1.123996e+00  -1.199940e+00   1.604747e-01   6.246459e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY   -14.5327143832
           POLARIZATION ENERGY    -0.0750765461
             DISPERSION ENERGY    -0.0000190821
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -91.0160403097


                 ENERGY CHANGE   -14.5859585610
                  RMS GRADIENT    23.8021342243
              MAXIMUM GRADIENT    45.5338484018



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0002669837
           POLARIZATION ENERGY    -0.0000181445
             DISPERSION ENERGY    -0.0000125746
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0002362709



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        28.416252   -18.168352    -0.215304        0.000000     0.000000     0.000000
   1      -0.605276        -0.048543    -9.565601    -1.303477        0.000000     0.000000     0.000000
   1      -0.605276         9.975523   -20.099228    -3.133875        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0161273776
           POLARIZATION ENERGY    -0.0019919856
             DISPERSION ENERGY    -0.0000132785
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0141221198



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        17.467348    -2.058940     0.865663        0.000000     0.000000     0.000000
   1      -0.605276        -1.338827     0.197363    -0.943774        0.000000     0.000000     0.000000
   1      -0.605276         1.956678   -10.358428    -1.968902        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0052175933
           POLARIZATION ENERGY    -0.0075514304
             DISPERSION ENERGY    -0.0000181637
     EXCHANGE REPULSION ENERGY     0.0000000064
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0023519943



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        13.818024     3.310407     1.225955        0.000000     0.000000     0.000000
   1      -0.605276        -1.768886     3.451407    -0.823883        0.000000     0.000000     0.000000
   1      -0.605276        -0.716043    -7.111771    -1.580611        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.3787240006
           POLARIZATION ENERGY    -0.0142705769
             DISPERSION ENERGY    -0.0000192990
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.3930138700



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.602660     5.098604     1.345946        0.000000     0.000000     0.000000
   1      -0.605276        -1.912111     4.535128    -0.783955        0.000000     0.000000     0.000000
   1      -0.605276        -1.606160    -6.030510    -1.451295        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    66.7208473562
           POLARIZATION ENERGY    -0.0297820199
             DISPERSION ENERGY    -0.0000191856
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    66.6910461573



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.201687     5.688566     1.385533        0.000000     0.000000     0.000000
   1      -0.605276        -1.959364     4.892669    -0.770782        0.000000     0.000000     0.000000
   1      -0.605276        -1.899828    -5.673781    -1.408632        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY   -56.8579092391
           POLARIZATION ENERGY    -0.0595127391
             DISPERSION ENERGY    -0.0000191192
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -56.9174410910



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.092925     5.848590     1.396271        0.000000     0.000000     0.000000
   1      -0.605276        -1.972182     4.989650    -0.767209        0.000000     0.000000     0.000000
   1      -0.605276        -1.979484    -5.577020    -1.397059        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -116.7623084777
           POLARIZATION ENERGY    -0.0516852828
             DISPERSION ENERGY    -0.0000191363
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -116.8140128903



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.118952     5.810297     1.393701        0.000000     0.000000     0.000000
   1      -0.605276        -1.969114     4.966442    -0.768064        0.000000     0.000000     0.000000
   1      -0.605276        -1.960422    -5.600175    -1.399829        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -162.5529480735
           POLARIZATION ENERGY    -0.0473226729
             DISPERSION ENERGY    -0.0000191456
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -162.6002898855



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.133712     5.788580     1.392244        0.000000     0.000000     0.000000
   1      -0.605276        -1.967375     4.953281    -0.768549        0.000000     0.000000     0.000000
   1      -0.605276        -1.949612    -5.613307    -1.401399        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -185.8126886856
           POLARIZATION ENERGY    -0.0446921910
             DISPERSION ENERGY    -0.0000191513
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -185.8574000214



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.142812     5.775192     1.391346        0.000000     0.000000     0.000000
   1      -0.605276        -1.966303     4.945168    -0.768848        0.000000     0.000000     0.000000
   1      -0.605276        -1.942948    -5.621402    -1.402367        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -118.2774468489
           POLARIZATION ENERGY    -0.0366774797
             DISPERSION ENERGY    -0.0000191689
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -118.3141434910



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.172249     5.731879     1.388439        0.000000     0.000000     0.000000
   1      -0.605276        -1.962834     4.918918    -0.769815        0.000000     0.000000     0.000000
   1      -0.605276        -1.921388    -5.647592    -1.405500        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -194.2369237870
           POLARIZATION ENERGY    -0.0427387525
             DISPERSION ENERGY    -0.0000191555
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -194.2796816885



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.149709     5.765044     1.390665        0.000000     0.000000     0.000000
   1      -0.605276        -1.965490     4.939017    -0.769074        0.000000     0.000000     0.000000
   1      -0.605276        -1.937896    -5.627538    -1.403101        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -192.4187558493
           POLARIZATION ENERGY    -0.0413529621
             DISPERSION ENERGY    -0.0000191585
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -192.4601279635



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.154692     5.757712     1.390173        0.000000     0.000000     0.000000
   1      -0.605276        -1.964903     4.934574    -0.769238        0.000000     0.000000     0.000000
   1      -0.605276        -1.934247    -5.631971    -1.403631        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -194.2369237870
           POLARIZATION ENERGY    -0.0427387525
             DISPERSION ENERGY    -0.0000191555
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -194.2796816885



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.149709     5.765044     1.390665        0.000000     0.000000     0.000000
   1      -0.605276        -1.965490     4.939017    -0.769074        0.000000     0.000000     0.000000
   1      -0.605276        -1.937896    -5.627538    -1.403101        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.149708     5.765044     1.390665
A02H2               -1.965490     4.939018    -0.769074
A03H3               -1.937896    -5.627538    -1.403101
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.057155e+01   5.081322e+00   1.113479e+00  -1.186811e+00   1.598383e-01   6.067318e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -194.2369237870
           POLARIZATION ENERGY    -0.0427387525
             DISPERSION ENERGY    -0.0000191555
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -270.6879119932


                 ENERGY CHANGE  -179.6718716835
                  RMS GRADIENT  1040.9694775032
              MAXIMUM GRADIENT  2333.8831959005



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000929139
           POLARIZATION ENERGY    -0.0000028534
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000774955



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     -1222.888062 -1054.785522     3.855365        0.000000     0.000000     0.000000
   1      -0.605276       -78.536201   -39.229713   -17.434669        0.000000     0.000000     0.000000
   1      -0.605276      -131.462692   -64.688972   227.825241        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001529427
           POLARIZATION ENERGY    -0.0000027523
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001376254



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678      -399.513153  -347.737701     2.212199        0.000000     0.000000     0.000000
   1      -0.605276       -27.488043    -9.783307    -6.324051        0.000000     0.000000     0.000000
   1      -0.605276       -45.111111   -25.313898    75.003304        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0005485387
           POLARIZATION ENERGY    -0.0000126129
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0005233608



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678      -125.054848  -112.055122     1.664477        0.000000     0.000000     0.000000
   1      -0.605276       -10.471991     0.032163    -2.620512        0.000000     0.000000     0.000000
   1      -0.605276       -16.327248   -12.188873    24.062654        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0011275296
           POLARIZATION ENERGY    -0.0002449317
             DISPERSION ENERGY    -0.0000125715
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0008700327



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678       -33.568748   -33.494267     1.481903        0.000000     0.000000     0.000000
   1      -0.605276        -4.799974     3.303986    -1.385999        0.000000     0.000000     0.000000
   1      -0.605276        -6.732627    -7.813865     7.082441        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0018660121
           POLARIZATION ENERGY    -0.0014051209
             DISPERSION ENERGY    -0.0000138421
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0032849689



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.182800        -3.073393    -7.307324     1.421045        0.068616    -0.141658    -0.000198
   1      -0.605276        -2.909302     4.394593    -0.974495        0.000000     0.000000     0.000000
   1      -0.593522        -3.534422    -6.355530     1.422372       -0.068616     0.141658     0.000198
   Total TORCH energy   -76.381598
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0144471873
           POLARIZATION ENERGY    -0.0148903505
             DISPERSION ENERGY    -0.0263496777
     EXCHANGE REPULSION ENERGY     0.2012911827
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.1456039672



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         7.091691     1.421628     1.400759        0.000000     0.000000     0.000000
   1      -0.605276        -2.279080     4.758128    -0.837327        0.000000     0.000000     0.000000
   1      -0.605276        -2.468357    -5.869420    -0.464311        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0356799228
           POLARIZATION ENERGY    -0.0167188346
             DISPERSION ENERGY    -0.0000481937
     EXCHANGE REPULSION ENERGY     0.0000000107
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0189129053



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.479901     4.331149     1.393997        0.000000     0.000000     0.000000
   1      -0.605276        -2.069016     4.879300    -0.791607        0.000000     0.000000     0.000000
   1      -0.605276        -2.113018    -5.707391    -1.093178        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.9458070752
           POLARIZATION ENERGY    -0.0167504216
             DISPERSION ENERGY    -0.0000233065
     EXCHANGE REPULSION ENERGY     0.0000000073
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.9625807960



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.609038     5.300760     1.391744        0.000000     0.000000     0.000000
   1      -0.605276        -1.999011     4.919682    -0.776370        0.000000     0.000000     0.000000
   1      -0.605276        -1.994599    -5.653393    -1.302750        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -157.8414038172
           POLARIZATION ENERGY    -0.0315638830
             DISPERSION ENERGY    -0.0000201804
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -157.8729878739



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.984322     5.623023     1.390995        0.000000     0.000000     0.000000
   1      -0.605276        -1.975744     4.933103    -0.771306        0.000000     0.000000     0.000000
   1      -0.605276        -1.955241    -5.635447    -1.372405        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -223.3341722855
           POLARIZATION ENERGY    -0.0424255735
             DISPERSION ENERGY    -0.0000191871
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -223.3766170396



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.144156     5.760276     1.390676        0.000000     0.000000     0.000000
   1      -0.605276        -1.965834     4.938819    -0.769149        0.000000     0.000000     0.000000
   1      -0.605276        -1.938479    -5.627803    -1.402071        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -262.2941132388
           POLARIZATION ENERGY    -0.0420685677
             DISPERSION ENERGY    -0.0000192227
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -262.3362010227



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.137950     5.754947     1.390688        0.000000     0.000000     0.000000
   1      -0.605276        -1.966219     4.938597    -0.769233        0.000000     0.000000     0.000000
   1      -0.605276        -1.939130    -5.628100    -1.400919        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -2686.7510306914
           POLARIZATION ENERGY    -0.0371125801
             DISPERSION ENERGY    -0.0000196823
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -2686.7881629473



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.061136     5.688984     1.390841        0.000000     0.000000     0.000000
   1      -0.605276        -1.970981     4.935850    -0.770269        0.000000     0.000000     0.000000
   1      -0.605276        -1.947186    -5.631773    -1.386662        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -3773.7103615889
           POLARIZATION ENERGY    -0.0362484197
             DISPERSION ENERGY    -0.0000197591
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -3773.7466297611



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.048877     5.678458     1.390866        0.000000     0.000000     0.000000
   1      -0.605276        -1.971741     4.935411    -0.770435        0.000000     0.000000     0.000000
   1      -0.605276        -1.948471    -5.632360    -1.384386        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -4579.9450941902
           POLARIZATION ENERGY    -0.0355987731
             DISPERSION ENERGY    -0.0000198168
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -4579.9807127734



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.039782     5.670648     1.390884        0.000000     0.000000     0.000000
   1      -0.605276        -1.972305     4.935086    -0.770558        0.000000     0.000000     0.000000
   1      -0.605276        -1.949425    -5.632794    -1.382698        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -3761.2041521419
           POLARIZATION ENERGY    -0.0335881583
             DISPERSION ENERGY    -0.0000199959
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -3761.2377602895



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.012052     5.646836     1.390939        0.000000     0.000000     0.000000
   1      -0.605276        -1.974024     4.934094    -0.770932        0.000000     0.000000     0.000000
   1      -0.605276        -1.952333    -5.634120    -1.377552        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -5133.8683228896
           POLARIZATION ENERGY    -0.0346968796
             DISPERSION ENERGY    -0.0000198968
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -5133.9030396595



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.027284     5.659915     1.390909        0.000000     0.000000     0.000000
   1      -0.605276        -1.973080     4.934639    -0.770726        0.000000     0.000000     0.000000
   1      -0.605276        -1.950736    -5.633392    -1.380379        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -5070.6690045907
           POLARIZATION ENERGY    -0.0350011094
             DISPERSION ENERGY    -0.0000198698
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -5070.7040255633



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.031487     5.663524     1.390901        0.000000     0.000000     0.000000
   1      -0.605276        -1.972820     4.934790    -0.770670        0.000000     0.000000     0.000000
   1      -0.605276        -1.950295    -5.633191    -1.381158        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -5133.8683228896
           POLARIZATION ENERGY    -0.0346968796
             DISPERSION ENERGY    -0.0000198968
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -5133.9030396595



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.027284     5.659915     1.390909        0.000000     0.000000     0.000000
   1      -0.605276        -1.973080     4.934639    -0.770726        0.000000     0.000000     0.000000
   1      -0.605276        -1.950736    -5.633392    -1.380379        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.027284     5.659915     1.390909
A02H2               -1.973080     4.934639    -0.770726
A03H3               -1.950736    -5.633392    -1.380379
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.046168e+01   4.987386e+00   1.114875e+00  -1.204888e+00   1.607278e-01   6.180374e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -5133.8683228896
           POLARIZATION ENERGY    -0.0346968796
             DISPERSION ENERGY    -0.0000198968
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -5210.3112699642


                 ENERGY CHANGE -4939.6233579710
                  RMS GRADIENT 53007.9043690839
              MAXIMUM GRADIENT 84040.2897513775



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -485.9514643604
           POLARIZATION ENERGY    -0.0404083680
             DISPERSION ENERGY    -0.0000193502
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -485.9918920721



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.117536     5.734385     1.389955        0.000000     0.000000     0.000000
   1      -0.605276        -1.967431     4.936680    -0.769570        0.000000     0.000000     0.000000
   1      -0.605276        -1.940393    -5.630235    -1.397663        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -4726.6277283895
           POLARIZATION ENERGY    -0.0355059987
             DISPERSION ENERGY    -0.0000198213
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -4726.6632542030



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.039274     5.669809     1.390782        0.000000     0.000000     0.000000
   1      -0.605276        -1.972330     4.934910    -0.770573        0.000000     0.000000     0.000000
   1      -0.605276        -1.949362    -5.632973    -1.382675        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -5135.9517588075
           POLARIZATION ENERGY    -0.0349012027
             DISPERSION ENERGY    -0.0000198778
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -5135.9866798814



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.030299     5.662404     1.390877        0.000000     0.000000     0.000000
   1      -0.605276        -1.972891     4.934708    -0.770688        0.000000     0.000000     0.000000
   1      -0.605276        -1.950390    -5.633287    -1.380956        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.030299     5.662403     1.390877
A02H2               -1.972891     4.934708    -0.770688
A03H3               -1.950390    -5.633287    -1.380956
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.046439e+01   4.989605e+00   1.114817e+00  -1.204431e+00   1.607046e-01   6.177443e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -5135.9517588075
           POLARIZATION ENERGY    -0.0349012027
             DISPERSION ENERGY    -0.0000198778
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -5212.3949101861


                 ENERGY CHANGE    -2.0836402219
                  RMS GRADIENT 49974.1732632658
              MAXIMUM GRADIENT 86190.6684598585



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -68863.6409900088
           POLARIZATION ENERGY    -0.0304938523
             DISPERSION ENERGY    -0.0000199583
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -68863.6715038127



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.035869     5.631157     1.382222        0.000000     0.000000     0.000000
   1      -0.605276        -1.971905     4.920776    -0.771336        0.000000     0.000000     0.000000
   1      -0.605276        -1.939431    -5.646846    -1.387777        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY   -29.0076478044
           POLARIZATION ENERGY    -0.0180816119
             DISPERSION ENERGY    -0.0000202883
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   -29.0257496980



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.058147     5.506174     1.347599        0.000000     0.000000     0.000000
   1      -0.605276        -1.967958     4.865050    -0.773932        0.000000     0.000000     0.000000
   1      -0.605276        -1.895593    -5.701083    -1.415062        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -177337.9567560770
           POLARIZATION ENERGY    -0.0260079461
             DISPERSION ENERGY    -0.0000200516
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -177337.9827840681



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.042254     5.595332     1.372297        0.000000     0.000000     0.000000
   1      -0.605276        -1.970773     4.904803    -0.772080        0.000000     0.000000     0.000000
   1      -0.605276        -1.926865    -5.662393    -1.395598        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 12411.7718233924
           POLARIZATION ENERGY    -0.0229826990
             DISPERSION ENERGY    -0.0000201256
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 12411.7488205745



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.047269     5.567197     1.364504        0.000000     0.000000     0.000000
   1      -0.605276        -1.969885     4.892259    -0.772665        0.000000     0.000000     0.000000
   1      -0.605276        -1.916997    -5.674602    -1.401740        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -403345.9913076980
           POLARIZATION ENERGY    -0.0251048816
             DISPERSION ENERGY    -0.0000200724
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -403346.0164326454



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.043674     5.587369     1.370092        0.000000     0.000000     0.000000
   1      -0.605276        -1.970522     4.901252    -0.772246        0.000000     0.000000     0.000000
   1      -0.605276        -1.924072    -5.665848    -1.397337        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -422754.0905089042
           POLARIZATION ENERGY    -0.0252260334
             DISPERSION ENERGY    -0.0000200696
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -422754.1157550006



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.043480     5.588456     1.370393        0.000000     0.000000     0.000000
   1      -0.605276        -1.970556     4.901737    -0.772223        0.000000     0.000000     0.000000
   1      -0.605276        -1.924453    -5.665377    -1.397099        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -422754.0905089042
           POLARIZATION ENERGY    -0.0252260334
             DISPERSION ENERGY    -0.0000200696
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -422754.1157550006



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.043480     5.588456     1.370393        0.000000     0.000000     0.000000
   1      -0.605276        -1.970556     4.901737    -0.772223        0.000000     0.000000     0.000000
   1      -0.605276        -1.924453    -5.665377    -1.397099        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.043480     5.588456     1.370393
A02H2               -1.970556     4.901737    -0.772223
A03H3               -1.924453    -5.665376    -1.397099
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.047768e+01   4.920293e+00   1.095636e+00  -1.191418e+00   1.600592e-01   6.019078e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -422754.0905089042
           POLARIZATION ENERGY    -0.0252260334
             DISPERSION ENERGY    -0.0000200696
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -422830.5239853053


                 ENERGY CHANGE -417618.1290751192
                  RMS GRADIENT 17436705.3618277013
              MAXIMUM GRADIENT 33490605.3858590834



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0034325265
           POLARIZATION ENERGY    -0.0050091698
             DISPERSION ENERGY    -0.0013362067
     EXCHANGE REPULSION ENERGY     0.0019809000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0077970032



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         6.149355    -1.167138     3.178497        0.000000     0.000000     0.000000
   1      -0.605276        -2.286340     3.972199    -0.873285        0.000000     0.000000     0.000000
   1      -0.605276        -2.301444    -6.785537     1.576867        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0111252819
           POLARIZATION ENERGY    -0.0114359949
             DISPERSION ENERGY    -0.0000876215
     EXCHANGE REPULSION ENERGY     0.0000011978
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0226477004



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.080654     3.338748     1.972517        0.000000     0.000000     0.000000
   1      -0.605276        -2.075716     4.592188    -0.805878        0.000000     0.000000     0.000000
   1      -0.605276        -2.049996    -6.038406    -0.406727        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.3993482574
           POLARIZATION ENERGY    -0.0152929170
             DISPERSION ENERGY    -0.0000273099
     EXCHANGE REPULSION ENERGY     0.0000000076
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.4146684767



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.391082     4.840706     1.570525        0.000000     0.000000     0.000000
   1      -0.605276        -2.005509     4.798851    -0.783409        0.000000     0.000000     0.000000
   1      -0.605276        -1.966181    -5.789362    -1.067923        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     6.9216264365
           POLARIZATION ENERGY    -0.0141839337
             DISPERSION ENERGY    -0.0000218639
     EXCHANGE REPULSION ENERGY     0.0000000070
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     6.9074206460



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.827881     5.341346     1.436530        0.000000     0.000000     0.000000
   1      -0.605276        -1.982107     4.867736    -0.775920        0.000000     0.000000     0.000000
   1      -0.605276        -1.938243    -5.706350    -1.288316        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  2651.6980962911
           POLARIZATION ENERGY    -0.0196436650
             DISPERSION ENERGY    -0.0000206035
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  2651.6784320293



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.973449     5.508190     1.391876        0.000000     0.000000     0.000000
   1      -0.605276        -1.974308     4.890693    -0.773424        0.000000     0.000000     0.000000
   1      -0.605276        -1.928932    -5.678685    -1.361764        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1322200.4865822790
           POLARIZATION ENERGY    -0.0233407650
             DISPERSION ENERGY    -0.0000202295
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1322200.5099432666



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.021901     5.563724     1.377012        0.000000     0.000000     0.000000
   1      -0.605276        -1.971712     4.898334    -0.772593        0.000000     0.000000     0.000000
   1      -0.605276        -1.925833    -5.669477    -1.386212        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -44715.4731182481
           POLARIZATION ENERGY    -0.0221221697
             DISPERSION ENERGY    -0.0000203418
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -44715.4952607529



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.007071     5.546726     1.381562        0.000000     0.000000     0.000000
   1      -0.605276        -1.972507     4.895996    -0.772847        0.000000     0.000000     0.000000
   1      -0.605276        -1.926782    -5.672296    -1.378729        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1378055.0787849077
           POLARIZATION ENERGY    -0.0230075354
             DISPERSION ENERGY    -0.0000202594
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1378055.1018126956



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.017928     5.559170     1.378231        0.000000     0.000000     0.000000
   1      -0.605276        -1.971925     4.897707    -0.772661        0.000000     0.000000     0.000000
   1      -0.605276        -1.926087    -5.670232    -1.384207        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1739037.8268668633
           POLARIZATION ENERGY    -0.0231789934
             DISPERSION ENERGY    -0.0000202439
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1739037.8500660937



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.019979     5.561521     1.377602        0.000000     0.000000     0.000000
   1      -0.605276        -1.971815     4.898031    -0.772626        0.000000     0.000000     0.000000
   1      -0.605276        -1.925956    -5.669843    -1.385242        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1739037.8268668633
           POLARIZATION ENERGY    -0.0231789934
             DISPERSION ENERGY    -0.0000202439
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1739037.8500660937



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.019979     5.561521     1.377602        0.000000     0.000000     0.000000
   1      -0.605276        -1.971815     4.898031    -0.772626        0.000000     0.000000     0.000000
   1      -0.605276        -1.925956    -5.669843    -1.385242        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.019980     5.561521     1.377602
A02H2               -1.971815     4.898031    -0.772626
A03H3               -1.925956    -5.669843    -1.385242
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045666e+01   4.895915e+00   1.102679e+00  -1.200239e+00   1.604933e-01   6.090978e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1739037.8268668633
           POLARIZATION ENERGY    -0.0231789934
             DISPERSION ENERGY    -0.0000202439
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1739114.2582963984


                 ENERGY CHANGE -1316283.7343110931
                  RMS GRADIENT 113648664.5006704479
              MAXIMUM GRADIENT 204826307.5133594275



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0051207887
           POLARIZATION ENERGY    -0.0107876869
             DISPERSION ENERGY    -0.0000406582
     EXCHANGE REPULSION ENERGY    -0.0000000177
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0159491516



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.771641     3.489204     2.965669        0.000000     0.000000     0.000000
   1      -0.605276        -2.015209     4.416011    -0.799222        0.000000     0.000000     0.000000
   1      -0.605276        -1.973280    -6.269350     0.469348        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.2035309305
           POLARIZATION ENERGY    -0.0161952745
             DISPERSION ENERGY    -0.0000246309
     EXCHANGE REPULSION ENERGY     0.0000000074
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.2197508286



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.608294     4.878096     1.901327        0.000000     0.000000     0.000000
   1      -0.605276        -1.986126     4.739067    -0.781397        0.000000     0.000000     0.000000
   1      -0.605276        -1.941563    -5.867553    -0.773621        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -6.4964422899
           POLARIZATION ENERGY    -0.0146561409
             DISPERSION ENERGY    -0.0000214514
     EXCHANGE REPULSION ENERGY     0.0000000069
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -6.5111198754



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.887083     5.340905     1.546665        0.000000     0.000000     0.000000
   1      -0.605276        -1.976435     4.846715    -0.775457        0.000000     0.000000     0.000000
   1      -0.605276        -1.930994    -5.733665    -1.187805        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -286.8877570464
           POLARIZATION ENERGY    -0.0185001613
             DISPERSION ENERGY    -0.0000205908
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -286.9062777918



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.979744     5.494727     1.428787        0.000000     0.000000     0.000000
   1      -0.605276        -1.973214     4.882494    -0.773483        0.000000     0.000000     0.000000
   1      -0.605276        -1.927482    -5.689166    -1.325466        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24187.8471297904
           POLARIZATION ENERGY    -0.0218416939
             DISPERSION ENERGY    -0.0000203292
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24187.8689918068



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.009922     5.544824     1.390397        0.000000     0.000000     0.000000
   1      -0.605276        -1.972165     4.894147    -0.772840        0.000000     0.000000     0.000000
   1      -0.605276        -1.926338    -5.674673    -1.370299        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1703602.7625024884
           POLARIZATION ENERGY    -0.0229768701
             DISPERSION ENERGY    -0.0000202564
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1703602.7854996081



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.018508     5.559078     1.379474        0.000000     0.000000     0.000000
   1      -0.605276        -1.971866     4.897462    -0.772657        0.000000     0.000000     0.000000
   1      -0.605276        -1.926012    -5.670549    -1.383055        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1872928.4986525767
           POLARIZATION ENERGY    -0.0230759837
             DISPERSION ENERGY    -0.0000202503
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1872928.5217488038



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.019232     5.560279     1.378554        0.000000     0.000000     0.000000
   1      -0.605276        -1.971841     4.897742    -0.772642        0.000000     0.000000     0.000000
   1      -0.605276        -1.925985    -5.670202    -1.384130        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1846330.5537413720
           POLARIZATION ENERGY    -0.0231344678
             DISPERSION ENERGY    -0.0000202467
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1846330.5768960798



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.019657     5.560985     1.378013        0.000000     0.000000     0.000000
   1      -0.605276        -1.971826     4.897906    -0.772633        0.000000     0.000000     0.000000
   1      -0.605276        -1.925968    -5.669998    -1.384762        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.019657     5.560985     1.378013
A02H2               -1.971826     4.897906    -0.772633
A03H3               -1.925968    -5.669998    -1.384762
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045637e+01   4.895424e+00   1.103070e+00  -1.200587e+00   1.605108e-01   6.094153e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1846330.5537413720
           POLARIZATION ENERGY    -0.0231344678
             DISPERSION ENERGY    -0.0000202467
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1846406.9851263845


                 ENERGY CHANGE -107292.7268299861
                  RMS GRADIENT 111830706.4759286493
              MAXIMUM GRADIENT 208590905.8012305200



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  -342.7896063099
           POLARIZATION ENERGY    -0.0332468066
             DISPERSION ENERGY    -0.0000204961
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -342.8228736059



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.919049     5.614686     1.363922        0.000000     0.000000     0.000000
   1      -0.605276        -1.980972     4.950418    -0.771451        0.000000     0.000000     0.000000
   1      -0.605276        -1.971494    -5.616961    -1.390385        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -200307.9603792841
           POLARIZATION ENERGY    -0.0254157637
             DISPERSION ENERGY    -0.0000203110
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -200307.9858153521



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.993629     5.574878     1.374367        0.000000     0.000000     0.000000
   1      -0.605276        -1.974192     4.911491    -0.772327        0.000000     0.000000     0.000000
   1      -0.605276        -1.937746    -5.656277    -1.386217        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -566571.3894726050
           POLARIZATION ENERGY    -0.0235175833
             DISPERSION ENERGY    -0.0000202580
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -566571.4130104396



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.015049     5.563445     1.377367        0.000000     0.000000     0.000000
   1      -0.605276        -1.972245     4.900311    -0.772579        0.000000     0.000000     0.000000
   1      -0.605276        -1.928053    -5.667569    -1.385020        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1981779.7127947740
           POLARIZATION ENERGY    -0.0232220887
             DISPERSION ENERGY    -0.0000202493
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1981779.7360371051



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.018593     5.561553     1.377864        0.000000     0.000000     0.000000
   1      -0.605276        -1.971923     4.898462    -0.772620        0.000000     0.000000     0.000000
   1      -0.605276        -1.926450    -5.669437    -1.384822        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.018593     5.561553     1.377864
A02H2               -1.971923     4.898462    -0.772620
A03H3               -1.926450    -5.669437    -1.384822
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045539e+01   4.895990e+00   1.102935e+00  -1.200577e+00   1.605102e-01   6.094090e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1981779.7127947740
           POLARIZATION ENERGY    -0.0232220887
             DISPERSION ENERGY    -0.0000202493
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1981856.1442674098


                 ENERGY CHANGE -135449.1591410253
                  RMS GRADIENT 137012585.7634475231
              MAXIMUM GRADIENT 246264936.4311311841



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  5055.4322980797
           POLARIZATION ENERGY    -0.0309053896
             DISPERSION ENERGY    -0.0000201535
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  5055.4013725433



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.990956     5.620541     1.401729        0.000000     0.000000     0.000000
   1      -0.605276        -1.975065     4.929807    -0.771312        0.000000     0.000000     0.000000
   1      -0.605276        -1.953611    -5.639357    -1.362529        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -6765591.7383311726
           POLARIZATION ENERGY    -0.0253190245
             DISPERSION ENERGY    -0.0000202202
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -6765591.7636704110



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010187     5.579494     1.385123        0.000000     0.000000     0.000000
   1      -0.605276        -1.972879     4.907995    -0.772222        0.000000     0.000000     0.000000
   1      -0.605276        -1.934711    -5.660288    -1.378041        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 19215284.4993537813
           POLARIZATION ENERGY    -0.0241005047
             DISPERSION ENERGY    -0.0000202367
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 19215284.4752330482



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.014959     5.569308     1.381001        0.000000     0.000000     0.000000
   1      -0.605276        -1.972336     4.902583    -0.772448        0.000000     0.000000     0.000000
   1      -0.605276        -1.930021    -5.665482    -1.381891        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7039319.4490927653
           POLARIZATION ENERGY    -0.0252930851
             DISPERSION ENERGY    -0.0000202205
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7039319.4744060645



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010286     5.579284     1.385037        0.000000     0.000000     0.000000
   1      -0.605276        -1.972867     4.907883    -0.772227        0.000000     0.000000     0.000000
   1      -0.605276        -1.934614    -5.660396    -1.378121        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7092316.7227203641
           POLARIZATION ENERGY    -0.0252876889
             DISPERSION ENERGY    -0.0000202206
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7092316.7480282672



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010306     5.579239     1.385019        0.000000     0.000000     0.000000
   1      -0.605276        -1.972865     4.907860    -0.772228        0.000000     0.000000     0.000000
   1      -0.605276        -1.934594    -5.660418    -1.378137        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 25724431.2227447145
           POLARIZATION ENERGY    -0.0246854973
             DISPERSION ENERGY    -0.0000202287
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 25724431.1980389953



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.012633     5.574274     1.383010        0.000000     0.000000     0.000000
   1      -0.605276        -1.972601     4.905221    -0.772338        0.000000     0.000000     0.000000
   1      -0.605276        -1.932307    -5.662950    -1.380014        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7348401.5727956304
           POLARIZATION ENERGY    -0.0252586360
             DISPERSION ENERGY    -0.0000202210
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7348401.5980744809



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010418     5.579003     1.384924        0.000000     0.000000     0.000000
   1      -0.605276        -1.972853     4.907734    -0.772233        0.000000     0.000000     0.000000
   1      -0.605276        -1.934485    -5.660538    -1.378227        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.010417     5.579003     1.384924
A02H2               -1.972853     4.907735    -0.772233
A03H3               -1.934485    -5.660538    -1.378227
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.044763e+01   4.912505e+00   1.109596e+00  -1.205774e+00   1.607729e-01   6.151664e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7348401.5727956304
           POLARIZATION ENERGY    -0.0252586360
             DISPERSION ENERGY    -0.0000202210
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7348478.0063047856


                 ENERGY CHANGE -5366621.8620373756
                  RMS GRADIENT 580350014.8742094040
              MAXIMUM GRADIENT 1468832124.7033329010



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 83063.8977953460
           POLARIZATION ENERGY    -0.0282915084
             DISPERSION ENERGY    -0.0000201377
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 83063.8694837065



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.009053     5.605159     1.391872        0.000000     0.000000     0.000000
   1      -0.605276        -1.973417     4.918388    -0.771699        0.000000     0.000000     0.000000
   1      -0.605276        -1.942537    -5.650154    -1.373206        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1921418.6593548839
           POLARIZATION ENERGY    -0.0258673925
             DISPERSION ENERGY    -0.0000202034
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1921418.6852424731



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010131     5.584496     1.386383        0.000000     0.000000     0.000000
   1      -0.605276        -1.972971     4.909972    -0.772121        0.000000     0.000000     0.000000
   1      -0.605276        -1.936176    -5.658358    -1.377172        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7126994.7268633284
           POLARIZATION ENERGY    -0.0253413916
             DISPERSION ENERGY    -0.0000202186
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7126994.7522249324



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010378     5.579758     1.385124        0.000000     0.000000     0.000000
   1      -0.605276        -1.972869     4.908042    -0.772218        0.000000     0.000000     0.000000
   1      -0.605276        -1.934718    -5.660238    -1.378082        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7345372.3880023370
           POLARIZATION ENERGY    -0.0252749352
             DISPERSION ENERGY    -0.0000202205
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7345372.4132974865



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010409     5.579152     1.384963        0.000000     0.000000     0.000000
   1      -0.605276        -1.972856     4.907795    -0.772230        0.000000     0.000000     0.000000
   1      -0.605276        -1.934531    -5.660479    -1.378198        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7349640.6440360881
           POLARIZATION ENERGY    -0.0252622351
             DISPERSION ENERGY    -0.0000202209
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7349640.6693185372



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010415     5.579036     1.384933        0.000000     0.000000     0.000000
   1      -0.605276        -1.972853     4.907748    -0.772233        0.000000     0.000000     0.000000
   1      -0.605276        -1.934495    -5.660525    -1.378221        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7348311.6864600321
           POLARIZATION ENERGY    -0.0252706164
             DISPERSION ENERGY    -0.0000202207
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7348311.7117508631



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010411     5.579113     1.384953        0.000000     0.000000     0.000000
   1      -0.605276        -1.972855     4.907779    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.934519    -5.660495    -1.378206        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7349848.8381535569
           POLARIZATION ENERGY    -0.0252640299
             DISPERSION ENERGY    -0.0000202208
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7349848.8634378016



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010414     5.579053     1.384937        0.000000     0.000000     0.000000
   1      -0.605276        -1.972854     4.907754    -0.772232        0.000000     0.000000     0.000000
   1      -0.605276        -1.934500    -5.660519    -1.378217        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7349237.0003257357
           POLARIZATION ENERGY    -0.0252683768
             DISPERSION ENERGY    -0.0000202207
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7349237.0256143268



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.010412     5.579092     1.384948        0.000000     0.000000     0.000000
   1      -0.605276        -1.972854     4.907771    -0.772232        0.000000     0.000000     0.000000
   1      -0.605276        -1.934512    -5.660503    -1.378210        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.010413     5.579092     1.384947
A02H2               -1.972854     4.907771    -0.772232
A03H3               -1.934513    -5.660503    -1.378210
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.044762e+01   4.912588e+00   1.109618e+00  -1.205787e+00   1.607736e-01   6.151836e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -7349237.0003257357
           POLARIZATION ENERGY    -0.0252683768
             DISPERSION ENERGY    -0.0000202207
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -7349313.4338446315


                 ENERGY CHANGE  -835.4275398459
                  RMS GRADIENT 570610345.7542811632
              MAXIMUM GRADIENT 1451246727.9570903778



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -882410552.8436067104
           POLARIZATION ENERGY    -0.0248331218
             DISPERSION ENERGY    -0.0000201757
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -882410552.8684599400



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022113     5.578627     1.383965        0.000000     0.000000     0.000000
   1      -0.605276        -1.971929     4.904027    -0.772272        0.000000     0.000000     0.000000
   1      -0.605276        -1.930430    -5.664114    -1.380545        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -9954.5167603265
           POLARIZATION ENERGY    -0.0231904808
             DISPERSION ENERGY    -0.0000199983
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -9954.5399707990



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.068910     5.576763     1.380038        0.000000     0.000000     0.000000
   1      -0.605276        -1.968228     4.889050    -0.772435        0.000000     0.000000     0.000000
   1      -0.605276        -1.914098    -5.678560    -1.389888        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -6953801.2359595336
           POLARIZATION ENERGY    -0.0242830005
             DISPERSION ENERGY    -0.0000201178
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -6953801.2602626448



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.037258     5.578023     1.382694        0.000000     0.000000     0.000000
   1      -0.605276        -1.970731     4.899179    -0.772325        0.000000     0.000000     0.000000
   1      -0.605276        -1.925144    -5.668790    -1.383569        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 3366655412.9795384407
           POLARIZATION ENERGY    -0.0246633057
             DISPERSION ENERGY    -0.0000201580
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 3366655412.9548549652



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.026741     5.578442     1.383577        0.000000     0.000000     0.000000
   1      -0.605276        -1.971563     4.902545    -0.772288        0.000000     0.000000     0.000000
   1      -0.605276        -1.928814    -5.665544    -1.381469        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1032366030.9119913578
           POLARIZATION ENERGY    -0.0248166833
             DISPERSION ENERGY    -0.0000201740
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1032366030.9368281364



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022558     5.578609     1.383928        0.000000     0.000000     0.000000
   1      -0.605276        -1.971894     4.903884    -0.772274        0.000000     0.000000     0.000000
   1      -0.605276        -1.930274    -5.664252    -1.380634        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 5645508356.7817459106
           POLARIZATION ENERGY    -0.0247153232
             DISPERSION ENERGY    -0.0000201634
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 5645508356.7570104599



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.025319     5.578499     1.383696        0.000000     0.000000     0.000000
   1      -0.605276        -1.971676     4.903000    -0.772283        0.000000     0.000000     0.000000
   1      -0.605276        -1.929310    -5.665104    -1.381186        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1056046927.1280192137
           POLARIZATION ENERGY    -0.0247980729
             DISPERSION ENERGY    -0.0000201721
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1056046927.1528373957



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.023065     5.578588     1.383886        0.000000     0.000000     0.000000
   1      -0.605276        -1.971854     4.903722    -0.772276        0.000000     0.000000     0.000000
   1      -0.605276        -1.930097    -5.664409    -1.380735        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1038549895.5852831602
           POLARIZATION ENERGY    -0.0247962304
             DISPERSION ENERGY    -0.0000201719
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1038549895.6100995541



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.023115     5.578587     1.383881        0.000000     0.000000     0.000000
   1      -0.605276        -1.971850     4.903706    -0.772276        0.000000     0.000000     0.000000
   1      -0.605276        -1.930080    -5.664423    -1.380745        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1056046927.1280192137
           POLARIZATION ENERGY    -0.0247980729
             DISPERSION ENERGY    -0.0000201721
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1056046927.1528373957



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.023065     5.578588     1.383886        0.000000     0.000000     0.000000
   1      -0.605276        -1.971854     4.903722    -0.772276        0.000000     0.000000     0.000000
   1      -0.605276        -1.930097    -5.664409    -1.380735        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.023064     5.578589     1.383886
A02H2               -1.971854     4.903722    -0.772276
A03H3               -1.930097    -5.664408    -1.380735
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045916e+01   4.911695e+00   1.108531e+00  -1.203652e+00   1.606658e-01   6.132759e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1056046927.1280192137
           POLARIZATION ENERGY    -0.0247980729
             DISPERSION ENERGY    -0.0000201721
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1056047003.5610677004


                 ENERGY CHANGE -1048697690.1272230148
                  RMS GRADIENT 374972090872.2493286133
              MAXIMUM GRADIENT 977187406583.3330078125



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0012980150
           POLARIZATION ENERGY    -0.0023437684
             DISPERSION ENERGY    -0.0000154912
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0010612383



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         9.932578    10.016020    -2.002390        0.000000     0.000000     0.000000
   1      -0.605276        -2.255560     7.393739    -0.703229        0.000000     0.000000     0.000000
   1      -0.605276        -3.396698    -2.955664    -4.764549        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0111821494
           POLARIZATION ENERGY    -0.0173281936
             DISPERSION ENERGY    -0.0000185229
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0285288596



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.326388     7.057407     0.255375        0.000000     0.000000     0.000000
   1      -0.605276        -2.066402     5.733545    -0.749265        0.000000     0.000000     0.000000
   1      -0.605276        -2.418857    -4.761692    -2.508425        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.2919994988
           POLARIZATION ENERGY    -0.0750351073
             DISPERSION ENERGY    -0.0000197321
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.3670543316



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.790992     6.071204     1.007963        0.000000     0.000000     0.000000
   1      -0.605276        -2.003349     5.180147    -0.764610        0.000000     0.000000     0.000000
   1      -0.605276        -2.092910    -5.363701    -1.756385        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    24.2249465971
           POLARIZATION ENERGY    -0.0501957160
             DISPERSION ENERGY    -0.0000200460
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    24.1747308417



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.945860     5.742469     1.258826        0.000000     0.000000     0.000000
   1      -0.605276        -1.982332     4.995682    -0.769726        0.000000     0.000000     0.000000
   1      -0.605276        -1.984261    -5.564370    -1.505705        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  3601.6352588566
           POLARIZATION ENERGY    -0.0325614515
             DISPERSION ENERGY    -0.0000201328
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  3601.6026772789



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.997482     5.632892     1.342445        0.000000     0.000000     0.000000
   1      -0.605276        -1.975326     4.934194    -0.771431        0.000000     0.000000     0.000000
   1      -0.605276        -1.948045    -5.631259    -1.422146        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 782952.0652101975
           POLARIZATION ENERGY    -0.0271329871
             DISPERSION ENERGY    -0.0000201595
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 782952.0380570574



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.014687     5.596371     1.370316        0.000000     0.000000     0.000000
   1      -0.605276        -1.972991     4.913700    -0.771999        0.000000     0.000000     0.000000
   1      -0.605276        -1.935974    -5.653553    -1.394295        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 215396947.8857008517
           POLARIZATION ENERGY    -0.0255106173
             DISPERSION ENERGY    -0.0000201681
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 215396947.8601700664



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.020417     5.584208     1.379598        0.000000     0.000000     0.000000
   1      -0.605276        -1.972213     4.906875    -0.772188        0.000000     0.000000     0.000000
   1      -0.605276        -1.931954    -5.660978    -1.385020        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 17249472937.4898529053
           POLARIZATION ENERGY    -0.0249879993
             DISPERSION ENERGY    -0.0000201710
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 17249472937.4648475647



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022349     5.580105     1.382728        0.000000     0.000000     0.000000
   1      -0.605276        -1.971951     4.904572    -0.772252        0.000000     0.000000     0.000000
   1      -0.605276        -1.930598    -5.663483    -1.381892        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1109871764.3442101479
           POLARIZATION ENERGY    -0.0248014045
             DISPERSION ENERGY    -0.0000201720
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1109871764.3690319061



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.023052     5.578615     1.383865        0.000000     0.000000     0.000000
   1      -0.605276        -1.971856     4.903737    -0.772275        0.000000     0.000000     0.000000
   1      -0.605276        -1.930106    -5.664392    -1.380756        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 587119232.4662485123
           POLARIZATION ENERGY    -0.0248681815
             DISPERSION ENERGY    -0.0000201717
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 587119232.4413602352



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022799     5.579150     1.383457        0.000000     0.000000     0.000000
   1      -0.605276        -1.971890     4.904037    -0.772267        0.000000     0.000000     0.000000
   1      -0.605276        -1.930283    -5.664065    -1.381164        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1295860393.9884443283
           POLARIZATION ENERGY    -0.0248180207
             DISPERSION ENERGY    -0.0000201720
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1295860394.0132825375



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022988     5.578749     1.383763        0.000000     0.000000     0.000000
   1      -0.605276        -1.971864     4.903811    -0.772273        0.000000     0.000000     0.000000
   1      -0.605276        -1.930150    -5.664310    -1.380857        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.022989     5.578748     1.383763
A02H2               -1.971864     4.903812    -0.772273
A03H3               -1.930150    -5.664311    -1.380857
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045909e+01   4.911848e+00   1.108416e+00  -1.203568e+00   1.606615e-01   6.131974e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1295860393.9884443283
           POLARIZATION ENERGY    -0.0248180207
             DISPERSION ENERGY    -0.0000201720
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1295860470.4215128422


                 ENERGY CHANGE -239813466.8604451418
                  RMS GRADIENT 818902273329.3094482422
              MAXIMUM GRADIENT 1786563205223.4511718750



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0002948040
           POLARIZATION ENERGY    -0.0000009653
             DISPERSION ENERGY    -0.0000125719
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0002812730



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         8.206074    40.886135   -17.413485        0.000000     0.000000     0.000000
   1      -0.605276        -3.143331    20.589323    -0.206384        0.000000     0.000000     0.000000
   1      -0.605276       -10.292724    11.350273   -21.890621        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0013569545
           POLARIZATION ENERGY    -0.0001362902
             DISPERSION ENERGY    -0.0000127397
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0012079309



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.750725    17.347496    -4.881783        0.000000     0.000000     0.000000
   1      -0.605276        -2.362340    10.132147    -0.583649        0.000000     0.000000     0.000000
   1      -0.605276        -4.717585     0.007034    -8.217224        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0033801326
           POLARIZATION ENERGY    -0.0050624848
             DISPERSION ENERGY    -0.0000146686
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0084572798



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.598942     9.501284    -0.704550        0.000000     0.000000     0.000000
   1      -0.605276        -2.102010     6.646421    -0.709405        0.000000     0.000000     0.000000
   1      -0.605276        -2.859205    -3.774045    -3.659425        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0183112372
           POLARIZATION ENERGY    -0.0410241400
             DISPERSION ENERGY    -0.0000175253
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0593528962



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.881681     6.885880     0.687861        0.000000     0.000000     0.000000
   1      -0.605276        -2.015234     5.484512    -0.751323        0.000000     0.000000     0.000000
   1      -0.605276        -2.239745    -5.034405    -2.140159        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.4606928012
           POLARIZATION ENERGY    -0.0762237332
             DISPERSION ENERGY    -0.0000191939
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.5369357218



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.975927     6.014079     1.151998        0.000000     0.000000     0.000000
   1      -0.605276        -1.986308     5.097210    -0.765296        0.000000     0.000000     0.000000
   1      -0.605276        -2.033258    -5.454525    -1.633737        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    80.6054844016
           POLARIZATION ENERGY    -0.0451157890
             DISPERSION ENERGY    -0.0000198378
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    80.5603487814



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.007343     5.723480     1.306710        0.000000     0.000000     0.000000
   1      -0.605276        -1.976666     4.968109    -0.769953        0.000000     0.000000     0.000000
   1      -0.605276        -1.964430    -5.594565    -1.464930        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 13794.5679944294
           POLARIZATION ENERGY    -0.0307926626
             DISPERSION ENERGY    -0.0000200605
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 13794.5371817129



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.017815     5.626615     1.358280        0.000000     0.000000     0.000000
   1      -0.605276        -1.973452     4.925076    -0.771506        0.000000     0.000000     0.000000
   1      -0.605276        -1.941487    -5.641244    -1.408663        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 4406300.4970407737
           POLARIZATION ENERGY    -0.0266315344
             DISPERSION ENERGY    -0.0000201356
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 4406300.4703891110



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.021304     5.594333     1.375467        0.000000     0.000000     0.000000
   1      -0.605276        -1.972381     4.910735    -0.772023        0.000000     0.000000     0.000000
   1      -0.605276        -1.933841    -5.656801    -1.389910        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 2153814836.8145828247
           POLARIZATION ENERGY    -0.0253661249
             DISPERSION ENERGY    -0.0000201607
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 2153814836.7891964912



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022466     5.583586     1.381188        0.000000     0.000000     0.000000
   1      -0.605276        -1.972025     4.905961    -0.772196        0.000000     0.000000     0.000000
   1      -0.605276        -1.931296    -5.661980    -1.383668        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 2783428471.6503858566
           POLARIZATION ENERGY    -0.0249249455
             DISPERSION ENERGY    -0.0000201697
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 2783428471.6254410744



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022885     5.579702     1.383256        0.000000     0.000000     0.000000
   1      -0.605276        -1.971896     4.904235    -0.772258        0.000000     0.000000     0.000000
   1      -0.605276        -1.930376    -5.663851    -1.381411        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1441893976.4416420460
           POLARIZATION ENERGY    -0.0248307220
             DISPERSION ENERGY    -0.0000201717
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1441893976.4664931297



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022977     5.578862     1.383703        0.000000     0.000000     0.000000
   1      -0.605276        -1.971868     4.903862    -0.772271        0.000000     0.000000     0.000000
   1      -0.605276        -1.930177    -5.664256    -1.380923        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1512279207.6077547073
           POLARIZATION ENERGY    -0.0248399405
             DISPERSION ENERGY    -0.0000201715
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1512279207.6326148510



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022967     5.578944     1.383659        0.000000     0.000000     0.000000
   1      -0.605276        -1.971871     4.903898    -0.772270        0.000000     0.000000     0.000000
   1      -0.605276        -1.930197    -5.664216    -1.380971        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -896233146.6300630569
           POLARIZATION ENERGY    -0.0248824008
             DISPERSION ENERGY    -0.0000201706
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -896233146.6549656391



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022927     5.579323     1.383458        0.000000     0.000000     0.000000
   1      -0.605276        -1.971883     4.904067    -0.772264        0.000000     0.000000     0.000000
   1      -0.605276        -1.930286    -5.664033    -1.381191        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1534120198.6775705814
           POLARIZATION ENERGY    -0.0248462161
             DISPERSION ENERGY    -0.0000201714
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1534120198.7024371624



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022962     5.579000     1.383629        0.000000     0.000000     0.000000
   1      -0.605276        -1.971872     4.903924    -0.772269        0.000000     0.000000     0.000000
   1      -0.605276        -1.930210    -5.664189    -1.381004        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.022962     5.579000     1.383629
A02H2               -1.971872     4.903923    -0.772269
A03H3               -1.930210    -5.664189    -1.381004
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045906e+01   4.912085e+00   1.108289e+00  -1.203466e+00   1.606563e-01   6.131063e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1534120198.6775705814
           POLARIZATION ENERGY    -0.0248462161
             DISPERSION ENERGY    -0.0000201714
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1534120275.1106674671


                 ENERGY CHANGE -238259804.6891546249
                  RMS GRADIENT 1889036090264.9616699219
              MAXIMUM GRADIENT 3498268639280.5385742188



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000976470
           POLARIZATION ENERGY    -0.0000027946
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000822874



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678       -33.432438   183.296265   -73.257652        0.000000     0.000000     0.000000
   1      -0.605276        -9.764351    91.402504     2.246525        0.000000     0.000000     0.000000
   1      -0.605276       -54.902256    86.141991   -81.935135        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001651481
           POLARIZATION ENERGY    -0.0000019608
             DISPERSION ENERGY    -0.0000125713
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001506223



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        -3.128723    64.817635   -23.496609        0.000000     0.000000     0.000000
   1      -0.605276        -4.569345    33.736561     0.233988        0.000000     0.000000     0.000000
   1      -0.605276       -19.587423    24.937637   -28.232174        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0003799215
           POLARIZATION ENERGY    -0.0000061816
             DISPERSION ENERGY    -0.0000125961
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0003611500



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678         6.972517    25.324759    -6.909593        0.000000     0.000000     0.000000
   1      -0.605276        -2.837677    14.514582    -0.436858        0.000000     0.000000     0.000000
   1      -0.605276        -7.815813     4.536185   -10.331188        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0019179250
           POLARIZATION ENERGY    -0.0014957075
             DISPERSION ENERGY    -0.0000138813
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0004083425



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.339597    12.160466    -1.380588        0.000000     0.000000     0.000000
   1      -0.605276        -2.260454     8.107256    -0.660473        0.000000     0.000000     0.000000
   1      -0.605276        -3.891942    -2.264299    -4.364193        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0237587858
           POLARIZATION ENERGY    -0.0151661358
             DISPERSION ENERGY    -0.0000167713
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0389416868



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.461956     7.772369     0.462414        0.000000     0.000000     0.000000
   1      -0.605276        -2.068046     5.971480    -0.735011        0.000000     0.000000     0.000000
   1      -0.605276        -2.583985    -4.531127    -2.375195        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.3869065717
           POLARIZATION ENERGY    -0.0864489424
             DISPERSION ENERGY    -0.0000188707
     EXCHANGE REPULSION ENERGY     0.0000000064
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.4733743785



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.836076     6.309670     1.076748        0.000000     0.000000     0.000000
   1      -0.605276        -2.003911     5.259555    -0.759857        0.000000     0.000000     0.000000
   1      -0.605276        -2.148000    -5.286736    -1.712195        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     1.7243868960
           POLARIZATION ENERGY    -0.0619960128
             DISPERSION ENERGY    -0.0000197288
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     1.6623711610



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.960782     5.822104     1.281526        0.000000     0.000000     0.000000
   1      -0.605276        -1.982532     5.022247    -0.768140        0.000000     0.000000     0.000000
   1      -0.605276        -2.002671    -5.538605    -1.491196        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY   796.8243988060
           POLARIZATION ENERGY    -0.0360155128
             DISPERSION ENERGY    -0.0000200242
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY   796.7883632757



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.002351     5.659584     1.349784        0.000000     0.000000     0.000000
   1      -0.605276        -1.975406     4.943145    -0.770900        0.000000     0.000000     0.000000
   1      -0.605276        -1.954229    -5.622561    -1.417530        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 182971.8541596116
           POLARIZATION ENERGY    -0.0281379352
             DISPERSION ENERGY    -0.0000201231
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 182971.8260015599



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.016205     5.605415     1.372535        0.000000     0.000000     0.000000
   1      -0.605276        -1.973031     4.916780    -0.771820        0.000000     0.000000     0.000000
   1      -0.605276        -1.938083    -5.650543    -1.392977        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 63953983.8224188238
           POLARIZATION ENERGY    -0.0258436005
             DISPERSION ENERGY    -0.0000201561
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 63953983.7965550795



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.020820     5.587374     1.380113        0.000000     0.000000     0.000000
   1      -0.605276        -1.972239     4.908000    -0.772127        0.000000     0.000000     0.000000
   1      -0.605276        -1.932706    -5.659863    -1.384799        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -23543851422.7677268982
           POLARIZATION ENERGY    -0.0251240940
             DISPERSION ENERGY    -0.0000201670
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -23543851422.7928695679



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022356     5.581371     1.382634        0.000000     0.000000     0.000000
   1      -0.605276        -1.971976     4.905077    -0.772229        0.000000     0.000000     0.000000
   1      -0.605276        -1.930917    -5.662965    -1.382078        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -1491496647.9319243431
           POLARIZATION ENERGY    -0.0249289043
             DISPERSION ENERGY    -0.0000201701
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -1491496647.9568734169



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022780     5.579709     1.383332        0.000000     0.000000     0.000000
   1      -0.605276        -1.971903     4.904268    -0.772257        0.000000     0.000000     0.000000
   1      -0.605276        -1.930421    -5.663823    -1.381325        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.3982467651
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4233779907



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 NEW_X step
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               12.022383     5.581264     1.382679
A02H2               -1.971972     4.905025    -0.772231
A03H3               -1.930884    -5.663020    -1.382030
A01O1                5.047701    -0.041199     0.000000
A02H2                5.113439     0.896539     0.000000
A03H3                4.129507    -0.242679     0.000000
A01N1                0.000000     5.000000    -0.063177
A02H2                0.929426     4.912005     0.292603
A03H3               -0.540919     4.239091     0.292603
A04H4               -0.388507     5.848904     0.292603


    RESTART DATA

fragment H2O_L
   1.045851e+01   4.914222e+00   1.107389e+00  -1.202767e+00   1.606207e-01   6.124964e-01

fragment H2O_L
   5.000000e+00   0.000000e+00   0.000000e+00  -2.283185e+00   0.000000e+00   0.000000e+00

fragment NH3_L
   0.000000e+00   5.000000e+00   0.000000e+00   2.000000e+00   0.000000e+00   0.000000e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.3982467651
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379265.8316078186


                 ENERGY CHANGE -23249258990.7209396362
                  RMS GRADIENT 9825975355997.1074218750
              MAXIMUM GRADIENT 26025977748195.4648437500



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001373146
           POLARIZATION ENERGY    -0.0024214846
             DISPERSION ENERGY    -0.0000142831
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0022984470



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        10.696317    11.069581    -0.961309        0.000000     0.000000     0.000000
   1      -0.605276        -2.206827     7.553456    -0.679395        0.000000     0.000000     0.000000
   1      -0.605276        -3.536839    -2.847813    -3.917099        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0310094369
           POLARIZATION ENERGY    -0.0240503184
             DISPERSION ENERGY    -0.0000171744
     EXCHANGE REPULSION ENERGY     0.0000000063
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0550769234



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.582117     7.403435     0.604454        0.000000     0.000000     0.000000
   1      -0.605276        -2.049946     5.784328    -0.741408        0.000000     0.000000     0.000000
   1      -0.605276        -2.464076    -4.728346    -2.223696        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.8816905530
           POLARIZATION ENERGY    -0.0895360664
             DISPERSION ENERGY    -0.0000190658
     EXCHANGE REPULSION ENERGY     0.0000000065
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    -0.9712456787



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.877369     6.181444     1.126350        0.000000     0.000000     0.000000
   1      -0.605276        -1.997654     5.194647    -0.762078        0.000000     0.000000     0.000000
   1      -0.605276        -2.106505    -5.355161    -1.659254        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    10.1166653198
           POLARIZATION ENERGY    -0.0544857875
             DISPERSION ENERGY    -0.0000198061
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY    10.0621597328



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        11.975746     5.774284     1.300243        0.000000     0.000000     0.000000
   1      -0.605276        -1.980231     4.998168    -0.768966        0.000000     0.000000     0.000000
   1      -0.605276        -1.987365    -5.564012    -1.471186        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY  3385.5529825354
           POLARIZATION ENERGY    -0.0328467409
             DISPERSION ENERGY    -0.0000200587
     EXCHANGE REPULSION ENERGY     0.0000000066
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  3385.5201157424



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.008421     5.639050     1.357999        0.000000     0.000000     0.000000
   1      -0.605276        -1.974444     4.932910    -0.771253        0.000000     0.000000     0.000000
   1      -0.605276        -1.947793    -5.633379    -1.408721        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY 2305228.9826137568
           POLARIZATION ENERGY    -0.0268126290
             DISPERSION ENERGY    -0.0000201410
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY 2305228.9557809937



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.019008     5.595233     1.376712        0.000000     0.000000     0.000000
   1      -0.605276        -1.972569     4.911767    -0.771994        0.000000     0.000000     0.000000
   1      -0.605276        -1.934972    -5.655855    -1.388482        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -846507240.6762990952
           POLARIZATION ENERGY    -0.0253254920
             DISPERSION ENERGY    -0.0000201638
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -846507240.7016447783



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.021945     5.583077     1.381904        0.000000     0.000000     0.000000
   1      -0.605276        -1.972049     4.905900    -0.772200        0.000000     0.000000     0.000000
   1      -0.605276        -1.931415    -5.662089    -1.382867        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24290640199.4070701599
           POLARIZATION ENERGY    -0.0251175186
             DISPERSION ENERGY    -0.0000201671
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24290640199.4322052002



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022370     5.581316     1.382657        0.000000     0.000000     0.000000
   1      -0.605276        -1.971974     4.905050    -0.772230        0.000000     0.000000     0.000000
   1      -0.605276        -1.930900    -5.662993    -1.382053        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24767880686.3073730469
           POLARIZATION ENERGY    -0.0251116533
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24767880686.3325042725



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022382     5.581266     1.382678        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905026    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930885    -5.663019    -1.382031        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24782795475.0735168457
           POLARIZATION ENERGY    -0.0251114377
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24782795475.0986480713



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783357042.6508636475
           POLARIZATION ENERGY    -0.0251114296
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783357042.6759948730



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783378348.9651718140
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783378348.9903030396



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379157.5070419312
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379157.5321731567



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379188.2269210815
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379188.2520523071



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.3888244629
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4139556885



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.4034652710
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4285964966



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.4034652710
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4285964966



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.4257545471
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4508857727



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.4301910400
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4553222656



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY -24783379189.4301910400
           POLARIZATION ENERGY    -0.0251114293
             DISPERSION ENERGY    -0.0000201672
     EXCHANGE REPULSION ENERGY     0.0000000067
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY -24783379189.4553222656



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678        12.022383     5.581264     1.382679        0.000000     0.000000     0.000000
   1      -0.605276        -1.971972     4.905025    -0.772231        0.000000     0.000000     0.000000
   1      -0.605276        -1.930884    -5.663020    -1.382030        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     13772353699840.000000 5819448950784.000000 149013479424.000000        0.000000     0.000000     0.000000
   1      -0.605276     970435264512.000000 -1853571465216.000000 39495585792.000000        0.000000     0.000000     0.000000
   1      -0.605276     2943340511232.000000 -1732313350144.000000 -1929021489152.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     4590784741376.000000 1939816448000.000000 49671159808.000000        0.000000     0.000000     0.000000
   1      -0.605276     323478454272.000000 -617857155072.000000 13165195264.000000        0.000000     0.000000     0.000000
   1      -0.605276     981113503744.000000 -577437827072.000000 -643007184896.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     1530261536768.000000 646605504512.000000 16557052928.000000        0.000000     0.000000     0.000000
   1      -0.605276     107826143232.000000 -205952385024.000000 4388398080.000000        0.000000     0.000000     0.000000
   1      -0.605276     327037845504.000000 -192479264768.000000 -214335717376.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     510087200768.000000 215535173632.000000 5519017472.000000        0.000000     0.000000     0.000000
   1      -0.605276     35942047744.000000 -68650795008.000000 1462799488.000000        0.000000     0.000000     0.000000
   1      -0.605276     109012606976.000000 -64159756288.000000 -71445241856.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     170029056000.000000 71845052416.000000 1839672448.000000        0.000000     0.000000     0.000000
   1      -0.605276     11980683264.000000 -22883598336.000000 487599808.000000        0.000000     0.000000     0.000000
   1      -0.605276     36337537024.000000 -21386586112.000000 -23815077888.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     56676356096.000000 23948349440.000000 613224192.000000        0.000000     0.000000     0.000000
   1      -0.605276     3993560832.000000 -7627866112.000000 162533264.000000        0.000000     0.000000     0.000000
   1      -0.605276     12112512000.000000 -7128861696.000000 -7938359808.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     18892118016.000000 7982784000.000000 204408048.000000        0.000000     0.000000     0.000000
   1      -0.605276     1331187072.000000 -2542622208.000000 54177756.000000        0.000000     0.000000     0.000000
   1      -0.605276     4037504000.000000 -2376287232.000000 -2646119936.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     6297372672.000000 2660928000.000000 68136016.000000        0.000000     0.000000     0.000000
   1      -0.605276     443728992.000000 -847540672.000000 18059250.000000        0.000000     0.000000     0.000000
   1      -0.605276     1345834752.000000 -792095744.000000 -882039936.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     2099124224.000000 886976000.000000 22712008.000000        0.000000     0.000000     0.000000
   1      -0.605276     147909648.000000 -282513568.000000 6019749.500000        0.000000     0.000000     0.000000
   1      -0.605276     448611584.000000 -264031920.000000 -294013344.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     699708096.000000 295658688.000000 7570670.000000        0.000000     0.000000     0.000000
   1      -0.605276     49303220.000000 -94171184.000000 2006582.750000        0.000000     0.000000     0.000000
   1      -0.605276     149537184.000000 -88010648.000000 -98004440.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     233236048.000000 98552888.000000 2523557.750000        0.000000     0.000000     0.000000
   1      -0.605276     16434405.000000 -31390390.000000 668860.437500        0.000000     0.000000     0.000000
   1      -0.605276     49845728.000000 -29336884.000000 -32668150.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     77745352.000000 32850968.000000 841186.750000        0.000000     0.000000     0.000000
   1      -0.605276     5478133.500000 -10463460.000000 222952.937500        0.000000     0.000000     0.000000
   1      -0.605276     16615242.000000 -9778965.000000 -10889384.000000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     25915126.000000 10950326.000000 280396.531250        0.000000     0.000000     0.000000
   1      -0.605276     1826043.250000 -3487816.750000 74317.132812        0.000000     0.000000     0.000000
   1      -0.605276     5538412.500000 -3259658.750000 -3629795.500000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     8638384.000000 3650112.500000 93466.429688        0.000000     0.000000     0.000000
   1      -0.605276     608679.750000 -1162602.375000 24771.865234        0.000000     0.000000     0.000000
   1      -0.605276     1846136.125000 -1086556.750000 -1209932.750000        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     2879469.000000 1216707.875000 31156.398438        0.000000     0.000000     0.000000
   1      -0.605276     202891.937500 -387530.843750  8256.773438        0.000000     0.000000     0.000000
   1      -0.605276     615377.437500 -362189.343750 -403311.843750        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864332
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709637



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     959831.062500 405573.031250 10386.387695        0.000000     0.000000     0.000000
   1      -0.605276     67629.328125 -129173.679688  2751.742920        0.000000     0.000000     0.000000
   1      -0.605276     205124.531250 -120733.554688 -134438.203125        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864331
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709636



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     319951.718750 135194.718750  3463.051270        0.000000     0.000000     0.000000
   1      -0.605276     22541.794922 -43054.621094   916.732788        0.000000     0.000000     0.000000
   1      -0.605276     68373.554688 -40248.296875 -44813.656250        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864325
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709630



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     106658.585938 45068.628906  1155.272095        0.000000     0.000000     0.000000
   1      -0.605276      7512.617188 -14348.271484   305.062775        0.000000     0.000000     0.000000
   1      -0.605276     22789.896484 -13419.874023 -14938.806641        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000864268
           POLARIZATION ENERGY    -0.0000029045
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709572



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     35560.875000 15026.596680   386.012482        0.000000     0.000000     0.000000
   1      -0.605276      2502.891113 -4779.486816   101.172768        0.000000     0.000000     0.000000
   1      -0.605276      7595.345703 -4477.066406 -4980.523438        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000863752
           POLARIZATION ENERGY    -0.0000029049
             DISPERSION ENERGY    -0.0000125712
     EXCHANGE REPULSION ENERGY     0.0000000062
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000709053



 TORCH CALL 
-------------------------
atom_types in torch_compute    8
atom_types in torch_compute    1
atom_types in torch_compute    1

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   8     -75.197678     11861.639648  5012.585938   129.592606        0.000000     0.000000     0.000000
   1  ERROR: unable to make an optimization step
    -0.605276       832.982361 -1589.892212    33.209438        0.000000     0.000000     0.000000
   1      -0.605276      2530.494385 -1496.130859 -1661.095825        0.000000     0.000000     0.000000
   Total TORCH energy   -76.408230
--------------------------------
