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

run_type gtest
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
max_steps 100
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc false
periodic_box 30.0 30.0 30.0 90.0 90.0 90.0
opt_tol 0.0003
opt_energy_tol 1e-06
gtest_tol 5e-06
ref_energy -76.3884
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

GRADIENT TEST JOB


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


              REFERENCE ENERGY   -76.3884295676
               COMPUTED ENERGY   -76.3884295676  MATCH


    COMPUTING NUMERICAL GRADIENT


TESTING GRADIENTS ON EFP FRAGMENTS

TESTING GRADIENTS ON SPECIAL FRAGMENT ATOMS

A A0001   -5.62770832E-03  -4.68052146E-03  -7.31447247E-03
N A0001   -5.62570790E-03  -4.67995815E-03  -7.31268102E-03  MATCH

A A0002    3.06776776E-04   3.91383924E-03   1.24481663E-03
N A0002    3.09253763E-04   3.91212171E-03   1.24761100E-03  MATCH

A A0003    5.32093154E-03   7.66682217E-04   6.06965585E-03
N A0003    5.32138248E-03   7.69314939E-04   6.06507002E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:44 2025
TOTAL RUN TIME IS 0 SECONDS
