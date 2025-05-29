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
WALL CLOCK TIME IS Thu May 29 00:29:08 2025

SIMULATION SETTINGS

run_type gtest
coord points
terms disp
special_terms disp
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
ref_energy -0.0220108
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
A01N1               -5.515000     1.083000     0.968000
A02H2               -5.171084     0.157148     0.817415
A03H3               -4.838165     1.726200     0.612549
A04H4               -6.354118     1.191679     0.436750
A01N1                1.848000     0.114000     0.130000
A02H2                1.962492     0.657352    -0.700552
A03H3                0.930650     0.284298     0.487246
A04H4                1.908198    -0.851198    -0.120847
A01N1               -1.111000    -0.084000    -4.017000
A02H2               -1.917299     0.471666    -3.818825
A03H3               -0.331561     0.530751    -4.129749
A04H4               -0.933938    -0.666145    -3.224591
A01C1               -2.056000     0.767000    -0.301000
A02O2               -2.979940    -0.252959    -0.545947
A03H3               -1.192965     0.406624     0.250842
A04H4               -2.554557     1.516350     0.296433
A05H5               -1.714730     1.232706    -1.220716
A06H6               -2.587630    -0.929369    -1.064807
A01O1               -0.126000    -2.228000    -0.815000
A02H2                0.288547    -2.463797    -0.004923
A03H3                0.070751    -1.320158    -0.959173
A01O1               -1.850000     1.697000     3.172000
A02H2               -1.090083     1.597261     2.627709
A03H3               -2.594572     1.639020     2.601101
A01C1                1.275000    -2.447000    -4.673000
A02O2                0.721395    -3.174708    -3.615672
A03H3                2.206088    -1.965869    -4.388715
A04H4                0.563481    -1.680500    -4.943610
A05H5                1.454294    -3.071336    -5.543221
A06H6                1.308836    -3.855273    -3.346606
A01O1               -5.773000    -1.738000    -0.926000
A02H2               -5.053659    -1.949235    -1.493100
A03H3               -5.438927    -1.776829    -0.048183


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY    -0.0220107872
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0220107872


              REFERENCE ENERGY    -0.0220107872
               COMPUTED ENERGY    -0.0220107872  MATCH


    COMPUTING NUMERICAL GRADIENT

A F0001   -2.41001529E-03  -2.20169871E-03  -7.66472351E-04
N F0001   -2.41002056E-03  -2.20170578E-03  -7.66471460E-04  MATCH
A D0001   -7.59825732E-05  -1.32774486E-04  -3.98349748E-05
N D0001   -7.59868487E-05  -1.32759430E-04  -3.98291831E-05  MATCH
A F0002   -2.13609536E-03   1.57168407E-03   1.52551248E-03
N F0002   -2.13610441E-03   1.57168590E-03   1.52551660E-03  MATCH
A D0002    1.07238765E-04  -3.41653952E-04  -1.29989746E-04
N D0002    1.07222676E-04  -3.41620823E-04  -1.29970006E-04  MATCH
A F0003    2.44861457E-03   1.46418270E-03   8.65958658E-04
N F0003    2.44862925E-03   1.46419290E-03   8.65964559E-04  MATCH
A D0003    3.63045648E-04  -2.32467637E-04  -1.66141656E-04
N D0003    3.63024899E-04  -2.32443810E-04  -1.66117381E-04  MATCH
A F0004    8.60944574E-04   3.70687603E-03  -1.25140986E-03
N F0004    8.60950646E-04   3.70688088E-03  -1.25141370E-03  MATCH
A D0004   -6.29042330E-05  -8.20536447E-06  -8.95452636E-05
N D0004   -6.29062350E-05  -8.20868083E-06  -8.95360088E-05  MATCH
A F0005    9.10588708E-04   1.40347748E-03  -1.70130759E-04
N F0005    9.10588752E-04   1.40348217E-03  -1.70134145E-04  MATCH
A D0005    1.85042523E-03  -1.00519875E-03   1.24123215E-03
N D0005    1.85022926E-03  -1.00516650E-03   1.24111604E-03  MATCH
A F0006   -6.57302662E-04  -2.39976709E-03   8.27460535E-04
N F0006   -6.57306166E-04  -2.39978243E-03   8.27454998E-04  MATCH
A D0006    4.19293083E-05   6.20298069E-05   1.49472369E-04
N D0006    4.19112893E-05   6.20182687E-05   1.49450551E-04  MATCH
A F0007    2.10380067E-04   3.68012549E-04   1.31611917E-03
N F0007    2.10380003E-04   3.68012544E-04   1.31612028E-03  MATCH
A D0007   -4.44498331E-06  -2.68862176E-05   2.74351174E-05
N D0007   -4.44499628E-06  -2.68838583E-05   2.74302181E-05  MATCH
A F0008    2.28146752E-03  -2.31361377E-03  -1.94622757E-03
N F0008    2.28146656E-03  -2.31361138E-03  -1.94622683E-03  MATCH
A D0008   -1.12571058E-03   6.52289238E-05  -2.26687877E-03
N D0008   -1.12559460E-03   6.53088140E-05  -2.26689524E-03  MATCH
A F0009   -1.50858213E-03  -1.59915327E-03  -4.00810307E-04
N F0009   -1.50858407E-03  -1.59915481E-03  -4.00810311E-04  MATCH
A D0009   -1.24592119E-04   9.67878546E-05  -2.09973121E-05
N D0009   -1.24583612E-04   9.67826560E-05  -2.09940298E-05  MATCH

GRADIENT TEST JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:09 2025
TOTAL RUN TIME IS 1 SECONDS
