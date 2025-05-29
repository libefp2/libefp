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
WALL CLOCK TIME IS Thu May 29 00:29:18 2025

SIMULATION SETTINGS

run_type gtest
coord xyzabc
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp overlap
disp_damp tt
pol_damp tt
pol_driver direct
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
ref_energy -0.0787829
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

A01O1               -1.565519     4.752548     1.404744
A02H2               -2.499487     4.698144     1.312989
A03H3               -1.247751     3.867874     1.411721
A01C                -0.475118     0.061730    -1.170498
A02C                 0.205348    -0.748720    -2.060650
A03C                 1.087318    -1.704362    -1.590451
A04C                -0.283209    -0.091973     0.190301
A05C                 0.587641    -1.057555     0.660905
A06C                 1.278165    -1.858962    -0.229627
A07H                -1.152865     0.809827    -1.535995
A08H                 0.048541    -0.636275    -3.116752
A09H                 1.623586    -2.326516    -2.281776
A10H                -0.810112     0.538384     0.881403
A11H                 0.726537    -1.186277     1.717651
A12H                 1.962576    -2.601019     0.135714
A01N1               -3.500000    -1.948921    -0.662820
A02H2               -2.732448    -2.549328    -0.442521
A03H3               -3.423526    -1.689001    -1.624459
A04H4               -4.344026    -2.471377    -0.549612
Q0001                3.200000     1.800000    -2.300000
Q0002               -2.900000    -6.200000    -2.500000
Q0003                5.000000     4.300000     0.200000
Q0004                4.900000     0.000000     4.700000


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0003915990
           POLARIZATION ENERGY    -0.0877125739
             DISPERSION ENERGY    -0.0027158425
     EXCHANGE REPULSION ENERGY     0.0012788542
          POINT CHARGES ENERGY     0.0108908032
     CHARGE PENETRATION ENERGY    -0.0001318970
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0787822550


              REFERENCE ENERGY    -0.0787829370
               COMPUTED ENERGY    -0.0787822550  MATCH


    COMPUTING NUMERICAL GRADIENT

A Q0001    7.52090709E-04   2.17658292E-03  -4.26362517E-04
N Q0001    7.52090779E-04   2.17658306E-03  -4.26362415E-04  MATCH
A Q0002   -9.12625429E-03  -3.06257668E-02  -1.13167737E-02
N Q0002   -9.12625457E-03  -3.06257715E-02  -1.13167729E-02  MATCH
A Q0003    1.32839858E-04  -2.88458920E-04   5.74449114E-04
N Q0003    1.32839887E-04  -2.88458851E-04   5.74449097E-04  MATCH
A Q0004   -9.69155630E-04  -1.42554797E-04  -2.19912158E-04
N Q0004   -9.69155637E-04  -1.42554787E-04  -2.19912119E-04  MATCH
A F0001   -2.65157710E-04   2.74078126E-04  -3.94292711E-04
N F0001   -2.65157757E-04   2.74078027E-04  -3.94292704E-04  MATCH
A D0001    2.33043809E-02   5.61409865E-03   2.25436354E-02
N D0001    2.33040691E-02   5.61404971E-03   2.25433381E-02  MATCH
A F0002    1.02507606E-02   1.08080863E-02   3.97584631E-03
N F0002    1.02500735E-02   1.08074730E-02   3.97578253E-03  MATCH
A D0002   -1.39104674E-03   7.01763319E-03   3.65599288E-04
N D0002   -1.38774302E-03   7.01512362E-03   3.65489422E-04  MATCH
A F0003   -7.75123553E-04   1.77980332E-02   7.80704564E-03
N F0003   -7.74436972E-04   1.77986512E-02   7.80710876E-03  MATCH
A D0003    5.21463501E-03  -2.59025467E-03   5.10208673E-04
N D0003    5.21460217E-03  -2.58966221E-03   5.09845732E-04  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:18 2025
TOTAL RUN TIME IS 0 SECONDS
