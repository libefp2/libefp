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
WALL CLOCK TIME IS Thu May 29 00:29:44 2025

SIMULATION SETTINGS

run_type opt
coord atoms
terms qq lj
special_terms qq lj
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

A01O                -1.815220     2.663988     0.000000
A02H                -1.616905     1.722730     0.001942
A03H                -2.465495     2.770431    -0.695494


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY   -76.3884295676

                  TOTAL ENERGY   -76.3884295676


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0045920528
              MAXIMUM GRADIENT     0.0073144725



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.810658     2.667782     0.005930
A02H                -1.617154     1.719557     0.000933
A03H                -2.469809     2.769809    -0.700415


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY   -76.3884999243

                  TOTAL ENERGY   -76.3884999243


                 ENERGY CHANGE    -0.0000703568
                  RMS GRADIENT     0.0025530894
              MAXIMUM GRADIENT     0.0040036860



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.812211     2.667209     0.004077
A02H                -1.617392     1.720480     0.000882
A03H                -2.468017     2.769460    -0.698511


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY   -76.3885283455

                  TOTAL ENERGY   -76.3885283455


                 ENERGY CHANGE    -0.0000284212
                  RMS GRADIENT     0.0004580387
              MAXIMUM GRADIENT     0.0007597421



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.812144     2.667339     0.004181
A02H                -1.617718     1.720774     0.000589
A03H                -2.467758     2.769036    -0.698322


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY   -76.3885300703

                  TOTAL ENERGY   -76.3885300703


                 ENERGY CHANGE    -0.0000017248
                  RMS GRADIENT     0.0003481415
              MAXIMUM GRADIENT     0.0005848676



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.811781     2.668420     0.004834
A02H                -1.618818     1.721253    -0.000518
A03H                -2.467021     2.767476    -0.697867


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY   -76.3885323381

                  TOTAL ENERGY   -76.3885323381


                 ENERGY CHANGE    -0.0000022678
                  RMS GRADIENT     0.0002777571
              MAXIMUM GRADIENT     0.0005255550



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    FINAL STATE

    GEOMETRY (ANGSTROMS)

A01O                -1.811668     2.668215     0.004911
A02H                -1.618897     1.721496    -0.000550
A03H                -2.467055     2.767438    -0.697913


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                     ML ENERGY   -76.3885325979

                  TOTAL ENERGY   -76.3885325979


                 ENERGY CHANGE    -0.0000002598
                  RMS GRADIENT     0.0000506026
              MAXIMUM GRADIENT     0.0000760749



OPTIMIZATION CONVERGED IN 5 STEPS
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:45 2025
TOTAL RUN TIME IS 1 SECONDS
