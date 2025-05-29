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
WALL CLOCK TIME IS Thu May 29 00:29:45 2025

SIMULATION SETTINGS

run_type gtest
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
gtest_tol 5e-06
ref_energy -76.3761
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
atom_gradient mm
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


Chosen nn_type: Custom model using AEV + electrostatic potential
The location of NN potential is: ../nnlib/
AEV loaded from: ../nnlib/aev_scripted.pt
Custom model loaded from: ../nnlib/custom_model_script.pt

GRADIENT TEST JOB


    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.663988     0.000000
A02H                -1.616905     1.722730     0.001942
A03H                -2.465495     2.770431    -0.695494
A01O                -1.815220     5.663988     0.000000
A02H                -1.616905     4.722730     0.001942
A03H                -2.465495     5.770431    -0.695494


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0002780347

                     ML ENERGY   -76.3763809204

                  TOTAL ENERGY   -76.3761028857


              REFERENCE ENERGY   -76.3761028857
               COMPUTED ENERGY   -76.3761028857  MATCH


    COMPUTING NUMERICAL GRADIENT


TESTING GRADIENTS ON EFP FRAGMENTS
A F0002   -8.45443985E-04   1.88866531E-03  -2.11929555E-03
N F0002    7.76846310E-06  -4.23532724E-03   1.83598892E-06  DOES NOT MATCH
A D0002    1.76794342E-04  -1.90153531E-04   4.18483442E-03
N D0002   -8.48820831E-04   7.26961017E-04  -1.93745435E-04  DOES NOT MATCH

TESTING GRADIENTS ON SPECIAL FRAGMENT ATOMS

A A0001    3.52228941E-02   4.86947112E-02   5.43569729E-02
N A0001    3.43134096E-02   5.67428210E-02   5.24876709E-02  DOES NOT MATCH

A A0002    1.15026542E-02  -6.02721083E-02  -1.80932036E-03
N A0002    1.21120809E-02  -6.25816712E-02  -2.01864911E-03  DOES NOT MATCH

A A0003   -4.58801043E-02   9.68873376E-03  -5.04283531E-02
N A0003   -4.64332590E-02   8.05552662E-03  -5.04708577E-02  DOES NOT MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:45 2025
TOTAL RUN TIME IS 0 SECONDS
