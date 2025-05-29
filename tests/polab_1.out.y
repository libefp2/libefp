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
WALL CLOCK TIME IS Thu May 29 00:29:17 2025

SIMULATION SETTINGS

run_type gtest
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
gtest_tol 5e-06
ref_energy 0.00600162
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


GRADIENT TEST JOB


    GEOMETRY (ANGSTROMS)

A01O1               -0.026657     0.006545    -0.056739
A02H2                0.576926     0.598938     0.353668
A03H3               -0.153867    -0.702819     0.546829
A01N1                3.055087     0.016296     0.026291
A02H2                3.128382    -0.867017    -0.434733
A03H3                2.768465     0.694848    -0.648669
A04H4                2.337749    -0.054247     0.718104


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0009024700
           POLARIZATION ENERGY    -0.0002132441
             DISPERSION ENERGY    -0.0023579391
     EXCHANGE REPULSION ENERGY     0.0076703346
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0060016214


              REFERENCE ENERGY     0.0060016214
               COMPUTED ENERGY     0.0060016214  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001    1.07820493E-02  -1.78230798E-03   6.75845679E-04
N F0001    1.07783889E-02  -1.78221403E-03   6.75419505E-04  MATCH
A D0001   -5.89889277E-03   3.56174217E-03   2.17505045E-03
N D0001   -5.89856987E-03   3.56190100E-03   2.17433074E-03  MATCH
A F0002   -1.07820493E-02   1.78230798E-03  -6.75845679E-04
N F0002   -1.07783889E-02   1.78221403E-03  -6.75419505E-04  MATCH
A D0002   -4.20532911E-03   6.23505695E-03   5.00648639E-03
N D0002   -4.20101644E-03   6.23369983E-03   5.00415887E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:17 2025
TOTAL RUN TIME IS 0 SECONDS
