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
WALL CLOCK TIME IS Thu May 29 00:29:29 2025

SIMULATION SETTINGS

run_type gtest
coord points
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp overlap
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
ref_energy -0.00135087
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

A01O1               -3.394000    -1.900000    -3.700000
A02H2               -3.517419    -1.130057    -3.174996
A03H3               -2.580284    -2.281411    -3.424198
A01O1               -0.126000    -2.228000    -0.815000
A02H2                0.288547    -2.463797    -0.004923
A03H3                0.070751    -1.320158    -0.959173
A01O1               -1.850000     1.697000     3.172000
A02H2               -1.090083     1.597261     2.627709
A03H3               -2.594572     1.639020     2.601101
A01O1               -5.773000    -1.738000    -0.926000
A02H2               -5.053659    -1.949235    -1.493100
A03H3               -5.438927    -1.776829    -0.048183


WARNING! Dynamic polarizability parameters are missing on fragment H2O_REDUCED_L
WARNING! Exchange-repulsion parameters are missing on fragment H2O_REDUCED_L
WARNING! Dynamic polarizability parameters are missing on fragment H2O_REDUCED_L
WARNING! Exchange-repulsion parameters are missing on fragment H2O_REDUCED_L
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0010079233
           POLARIZATION ENERGY    -0.0002073312
             DISPERSION ENERGY    -0.0001653260
     EXCHANGE REPULSION ENERGY     0.0000320094
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY    -0.0000022977
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0013508688


              REFERENCE ENERGY    -0.0013508688
               COMPUTED ENERGY    -0.0013508688  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -6.65350370E-04  -5.83731712E-04  -1.32920944E-03
N F0001   -6.65350798E-04  -5.83731198E-04  -1.32921113E-03  MATCH
A D0001    1.79479859E-03  -3.72186702E-03   3.35385429E-05
N D0001    1.79484012E-03  -3.72183418E-03   3.33624149E-05  MATCH
A F0002    4.89667909E-04  -4.62116801E-04   6.08901924E-04
N F0002    4.89668304E-04  -4.62116987E-04   6.08903114E-04  MATCH
A D0002    2.98979600E-03   5.16046069E-04   2.59009849E-03
N D0002    2.98975184E-03   5.16076989E-04   2.59007565E-03  MATCH
A F0003    9.50364290E-05  -1.87682591E-04  -8.74909574E-05
N F0003    9.50364251E-05  -1.87682588E-04  -8.74909575E-05  MATCH
A D0003   -5.82395508E-05   7.99643070E-04  -4.41616259E-04
N D0003   -5.82307395E-05   7.99623130E-04  -4.41624257E-04  MATCH
A F0004    8.06460318E-05   1.23353110E-03   8.07798473E-04
N F0004    8.06460716E-05   1.23353077E-03   8.07798956E-04  MATCH
A D0004    4.52694550E-03   1.13319160E-03   2.67317871E-03
N D0004    4.52677300E-03   1.13308555E-03   2.67294179E-03  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:29 2025
TOTAL RUN TIME IS 0 SECONDS
