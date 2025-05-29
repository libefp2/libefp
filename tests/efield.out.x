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

RUNNING 1 MPI PROCESSES WITH 12 OPENMP THREADS EACH
WALL CLOCK TIME IS Wed May 28 22:54:44 2025

SIMULATION SETTINGS

run_type efield
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
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
special_fragment -100
enable_torch false
enable_elpot false
opt_special_frag -1
torch_nn none
ml_path none
userml_path none
custom_nn none
aev_nn none
atom_gradient frag
symm_frag frag
update_params 0
update_params_cutoff 0
print 0


ELECTRIC FIELD JOB


    GEOMETRY (ANGSTROMS)

A01O1               -0.026657     0.006545    -0.056739
A02H2                0.576926     0.598938     0.353668
A03H3               -0.153867    -0.702819     0.546829
A01N1                5.055087     0.016296     0.026291
A02H2                5.128382    -0.867017    -0.434733
A03H3                4.768465     0.694848    -0.648669
A04H4                4.337749    -0.054247     0.718104


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0002900482
           POLARIZATION ENERGY    -0.0000123244
             DISPERSION ENERGY    -0.0001007275
     EXCHANGE REPULSION ENERGY     0.0000134697
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001904661


COORDINATES ARE IN ANGSTROMS
ELECTRIC FIELD IS IN ATOMIC UNITS

FIELD FOR ATOM A01O1 ON FRAGMENT 1
    COORD  -0.02665657   0.00654545  -0.05673948
    FIELD  -0.00065466   0.00001103  -0.00006038

FIELD FOR ATOM A02H2 ON FRAGMENT 1
    COORD   0.57692576   0.59893787   0.35366788
    FIELD  -0.00092839   0.00017312  -0.00004544

FIELD FOR ATOM A03H3 ON FRAGMENT 1
    COORD  -0.15386681  -0.70281891   0.54682855
    FIELD  -0.00064432  -0.00008050   0.00002504

FIELD FOR ATOM A01N1 ON FRAGMENT 2
    COORD   5.05508742   0.01629557   0.02629110
    FIELD   0.00061847  -0.00027305  -0.00096635

FIELD FOR ATOM A02H2 ON FRAGMENT 2
    COORD   5.12838186  -0.86701660  -0.43473345
    FIELD   0.00015273  -0.00024977  -0.00091658

FIELD FOR ATOM A03H3 ON FRAGMENT 2
    COORD   4.76846525   0.69484778  -0.64866870
    FIELD   0.00039143  -0.00025251  -0.00121331

FIELD FOR ATOM A04H4 ON FRAGMENT 2
    COORD   4.33774920  -0.05424749   0.71810440
    FIELD   0.00152883  -0.00052606  -0.00114057

ELECTRIC FIELD JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:44 2025
TOTAL RUN TIME IS 0 SECONDS
