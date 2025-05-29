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
WALL CLOCK TIME IS Thu May 29 00:29:13 2025

SIMULATION SETTINGS

run_type grad
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp screen
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


ENERGY GRADIENT JOB


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
A01N1                0.000000     0.000000     4.936823
A02H2               -0.827726    -0.431794     5.292603
A03H3                0.039919     0.932729     5.292603
A04H4                0.787807    -0.500935     5.292603
A01O1                4.958590     5.047518     0.000000
A02H2                4.761176     4.128442     0.000000
A03H3                5.896028     5.117406     0.000000
A01N1                0.000000     5.000000     4.936823
A02H2               -0.932543     4.955954     5.292603
A03H3                0.428126     5.829629     5.292603
A04H4                0.504417     4.214417     5.292603


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0024000515
           POLARIZATION ENERGY    -0.0001073022
             DISPERSION ENERGY    -0.0008355477
     EXCHANGE REPULSION ENERGY     0.0001069498
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY     0.0015641513


    GRADIENT ON FRAGMENT 1 (H2O_L)

FORCE    2.24682390E-04   1.02932698E-05   7.85836080E-05
TORQUE   1.25546044E-03   5.49502949E-06   2.45436104E-03

    GRADIENT ON FRAGMENT 2 (H2O_L)

FORCE   -1.44203282E-05   2.51652526E-04  -2.43125949E-05
TORQUE   2.12008430E-04   3.59750638E-05   9.86634066E-05

    GRADIENT ON FRAGMENT 3 (NH3_L)

FORCE   -1.96520615E-04   8.98646330E-05   1.70364878E-04
TORQUE  -5.17911896E-04  -4.90177405E-04  -9.95813866E-04

    GRADIENT ON FRAGMENT 4 (NH3_L)

FORCE   -2.23803253E-05   4.28137056E-04  -1.18499641E-04
TORQUE   1.07823187E-03   2.89151920E-04  -1.17734507E-04

    GRADIENT ON FRAGMENT 5 (H2O_L)

FORCE    3.17321469E-05  -5.73041395E-04  -7.49680353E-05
TORQUE  -5.68780900E-04  -1.42659180E-04   1.22621408E-04

    GRADIENT ON FRAGMENT 6 (NH3_L)

FORCE   -2.30932686E-05  -2.06906090E-04  -3.11682151E-05
TORQUE   2.44491538E-05  -2.06188239E-04  -3.00637904E-04


ENERGY GRADIENT JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:13 2025
TOTAL RUN TIME IS 0 SECONDS
