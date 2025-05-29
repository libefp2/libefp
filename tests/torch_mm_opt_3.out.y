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
atom_gradient mm
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
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0016890975

                     ML ENERGY   -76.3293533325

                  TOTAL ENERGY   -76.3276642350


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0621541957
              MAXIMUM GRADIENT     0.1592299767



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.795288     2.748644    -0.269330
A02H                -1.575713     1.770278     0.022617
A03H                -2.538181     2.807900    -0.766669
A01O                -1.815344     5.661751    -0.000648
A02H                -1.618353     4.720215     0.001165
A03H                -2.465031     5.769294    -0.696523


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0006712381

                     ML ENERGY   -76.3678207397

                  TOTAL ENERGY   -76.3671495016


                 ENERGY CHANGE    -0.0394852666
                  RMS GRADIENT     0.0280660480
              MAXIMUM GRADIENT     0.0741839125



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.783124     2.690188    -0.252147
A02H                -1.578053     1.820133     0.013564
A03H                -2.548718     2.817814    -0.775296
A01O                -1.814729     5.660506    -0.000169
A02H                -1.616575     4.719217     0.002732
A03H                -2.463840     5.766589    -0.696805


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0003602243

                     ML ENERGY   -76.3799743652

                  TOTAL ENERGY   -76.3796141409


                 ENERGY CHANGE    -0.0124646393
                  RMS GRADIENT     0.0120924435
              MAXIMUM GRADIENT     0.0257253133



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.787737     2.686790    -0.254462
A02H                -1.581000     1.828008     0.010440
A03H                -2.541580     2.814084    -0.770141
A01O                -1.814389     5.659821     0.000094
A02H                -1.615071     4.718780     0.003825
A03H                -2.463205     5.764575    -0.697017


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0003467216

                     ML ENERGY   -76.3806381226

                  TOTAL ENERGY   -76.3802914010


                 ENERGY CHANGE    -0.0006772601
                  RMS GRADIENT     0.0074552480
              MAXIMUM GRADIENT     0.0225053257



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.788457     2.690706    -0.255456
A02H                -1.582242     1.826824     0.009801
A03H                -2.539751     2.811595    -0.768595
A01O                -1.814283     5.659599     0.000175
A02H                -1.614551     4.718647     0.004187
A03H                -2.463010     5.763887    -0.697089


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0003657608

                     ML ENERGY   -76.3807754517

                  TOTAL ENERGY   -76.3804096909


                 ENERGY CHANGE    -0.0001182899
                  RMS GRADIENT     0.0053833164
              MAXIMUM GRADIENT     0.0108396362



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.785331     2.697223    -0.254079
A02H                -1.587401     1.828949     0.006088
A03H                -2.538290     2.804012    -0.766638
A01O                -1.813825     5.658623     0.000526
A02H                -1.612477     4.718021     0.005681
A03H                -2.462151     5.761071    -0.697383


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0004025561

                     ML ENERGY   -76.3809814453

                  TOTAL ENERGY   -76.3805788892


                 ENERGY CHANGE    -0.0001691983
                  RMS GRADIENT     0.0034089343
              MAXIMUM GRADIENT     0.0060765211



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.781649     2.704347    -0.251874
A02H                -1.592924     1.835379     0.001494
A03H                -2.538106     2.793534    -0.765356
A01O                -1.812477     5.655770     0.001559
A02H                -1.606839     4.716120     0.009880
A03H                -2.459565     5.753266    -0.698206


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0004540343

                     ML ENERGY   -76.3811492920

                  TOTAL ENERGY   -76.3806952576


                 ENERGY CHANGE    -0.0001163684
                  RMS GRADIENT     0.0022914307
              MAXIMUM GRADIENT     0.0060391135



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.780850     2.706819    -0.251424
A02H                -1.594271     1.837110     0.000350
A03H                -2.538131     2.790414    -0.765046
A01O                -1.812004     5.654760     0.001921
A02H                -1.605008     4.715417     0.011290
A03H                -2.458639     5.750664    -0.698483


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0004725711

                     ML ENERGY   -76.3811721802

                  TOTAL ENERGY   -76.3806996091


                 ENERGY CHANGE    -0.0000043514
                  RMS GRADIENT     0.0022543658
              MAXIMUM GRADIENT     0.0063092303



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
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.780850     2.706819    -0.251424
A02H                -1.594271     1.837110     0.000350
A03H                -2.538131     2.790414    -0.765046
A01O                -1.812004     5.654760     0.001921
A02H                -1.605008     4.715417     0.011290
A03H                -2.458639     5.750664    -0.698483


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0004725711

                     ML ENERGY   -76.3811721802

                  TOTAL ENERGY   -76.3806996091


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0022543658
              MAXIMUM GRADIENT     0.0063092303



L-BFGS-B is unable to make an optimization step

OPTIMIZATION HAS NOT CONVERGED
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:48 2025
TOTAL RUN TIME IS 1 SECONDS
