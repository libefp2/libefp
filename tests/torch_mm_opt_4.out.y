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
WALL CLOCK TIME IS Thu May 29 00:29:48 2025

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
max_steps 200
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
print 1


Chosen nn_type: Custom model using AEV + electrostatic potential
The location of NN potential is: ../nnlib/
AEV loaded from: ../nnlib/aev_scripted.pt
Custom model loaded from: ../nnlib/custom_model_script.pt

SPECIAL FRAGMENT ENERGY MINIMIZATION JOB


    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.863988    -0.300000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    7.00482944E-04  -6.70593371E-04   6.21580831E-04
TORQUE   2.93641035E-03  -3.28557608E-04  -4.47284794E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -7.00482944E-04   6.70593371E-04  -6.21580831E-04
TORQUE   7.16434690E-04   6.81230656E-04   7.36800544E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.815220          2.863988        -0.300000
   1         -1.617480          1.725461         0.001936
   1         -2.476026          2.736906        -0.714908
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.026775          0.165652        -0.042620
   1         -0.057586         -0.063621        -0.028217
   1          0.084361         -0.102031         0.070837
------------------------------------------------------------

 Torch energy -76.329376 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0016644440

                     ML ENERGY   -76.3293762207

                  TOTAL ENERGY   -76.3277117767


    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01O                -1.815220     2.863988    -0.300000
A02H                -1.617480     1.725461     0.001936
A03H                -2.476026     2.736906    -0.714908
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0016644440

                     ML ENERGY   -76.3293762207

                  TOTAL ENERGY   -76.3277117767


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0802410071
              MAXIMUM GRADIENT     0.1592895958



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.755572     2.513824    -0.207494
A02H                -1.490309     1.861236     0.065021
A03H                -2.664385     2.952768    -0.871866
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    1.68753866E-03  -1.74091676E-03   1.14688292E-03
TORQUE   5.34234245E-03  -6.44742913E-04  -7.74212708E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -1.68753866E-03   1.74091676E-03  -1.14688292E-03
TORQUE   2.02943187E-03   1.35652213E-03  -2.02435005E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.755572          2.513824        -0.207494
   1         -1.490309          1.861236         0.065021
   1         -2.664385          2.952768        -0.871866
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.296640          0.051518         0.187662
   1         -0.211741          0.046073        -0.146368
   1         -0.084900         -0.097591        -0.041294
------------------------------------------------------------

 Torch energy -76.328049 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001547543

                     ML ENERGY   -76.3280487061

                  TOTAL ENERGY   -76.3282034604



 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.755572     2.513824    -0.207494
A02H                -1.490309     1.861236     0.065021
A03H                -2.664385     2.952768    -0.871866
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001547543

                     ML ENERGY   -76.3280487061

                  TOTAL ENERGY   -76.3282034604


                 ENERGY CHANGE    -0.0004916837
                  RMS GRADIENT     0.1534201602
              MAXIMUM GRADIENT     0.2969112887



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.845077     2.171584    -0.214230
A02H                -1.270743     1.962313     0.194192
A03H                -2.796677     3.196129    -0.996110
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    1.75236468E-03   1.25426163E-04   1.27540664E-03
TORQUE   6.84249250E-03  -8.04612262E-04  -9.38058218E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -1.75236468E-03  -1.25426163E-04  -1.27540664E-03
TORQUE   1.30182328E-03   1.39073075E-03  -1.86706658E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.845077          2.171584        -0.214230
   1         -1.270743          1.962313         0.194192
   1         -2.796677          3.196129        -0.996110
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.101234         -0.148323         0.089281
   1          0.002337          0.022637        -0.001983
   1         -0.103571          0.125686        -0.087298
------------------------------------------------------------

 Torch energy -76.259384 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0003356647

                     ML ENERGY   -76.2593841553

                  TOTAL ENERGY   -76.2597198199



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.781129     2.416101    -0.209417
A02H                -1.427614     1.890098     0.101904
A03H                -2.702160     3.022257    -0.907342
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    1.70224844E-03  -1.22258019E-03   1.18845549E-03
TORQUE   5.73426637E-03  -6.81554927E-04  -8.15936810E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -1.70224844E-03   1.22258019E-03  -1.18845549E-03
TORQUE   1.88279316E-03   1.35989432E-03  -2.05288088E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.781129          2.416101        -0.209417
   1         -1.427614          1.890098         0.101904
   1         -2.702160          3.022257        -0.907342
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.163150         -0.353692         0.160106
   1         -0.128409          0.292062        -0.128039
   1         -0.034741          0.061630        -0.032066
------------------------------------------------------------

 Torch energy -76.348770 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002668953

                     ML ENERGY   -76.3487701416

                  TOTAL ENERGY   -76.3490370369



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.767992     2.466334    -0.208428
A02H                -1.459841     1.875262     0.082945
A03H                -2.682743     2.986538    -0.889106
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    1.69410383E-03  -1.49786776E-03   1.16710532E-03
TORQUE   5.52894191E-03  -6.61647003E-04  -7.93983428E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -1.69410383E-03   1.49786776E-03  -1.16710532E-03
TORQUE   1.96413449E-03   1.35737384E-03  -2.04379140E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.767992          2.466334        -0.208428
   1         -1.459841          1.875262         0.082945
   1         -2.682743          2.986538        -0.889106
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.215150         -0.130114         0.161254
   1         -0.200849          0.188322        -0.160516
   1         -0.014301         -0.058208        -0.000738
------------------------------------------------------------

 Torch energy -76.349739 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002189366

                     ML ENERGY   -76.3497390747

                  TOTAL ENERGY   -76.3499580113



 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.767992     2.466334    -0.208428
A02H                -1.459841     1.875262     0.082945
A03H                -2.682743     2.986538    -0.889106
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002189366

                     ML ENERGY   -76.3497390747

                  TOTAL ENERGY   -76.3499580113


                 ENERGY CHANGE    -0.0217545509
                  RMS GRADIENT     0.1480946702
              MAXIMUM GRADIENT     0.2153877015



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.866554     2.473777    -0.274245
A02H                -1.371535     1.830258     0.147842
A03H                -2.673233     3.024808    -0.888710
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    1.33777976E-03  -1.49359383E-03   9.67771276E-04
TORQUE   4.99755208E-03  -5.25700873E-04  -7.02053575E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -1.33777976E-03   1.49359383E-03  -9.67771276E-04
TORQUE   1.44948980E-03   1.06697234E-03  -1.05604454E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.866554          2.473777        -0.274245
   1         -1.371535          1.830258         0.147842
   1         -2.673233          3.024808        -0.888710
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.165617          0.050651         0.102009
   1         -0.038350         -0.066304        -0.015576
   1         -0.127267          0.015653        -0.086433
------------------------------------------------------------

 Torch energy -76.420296 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002163742

                     ML ENERGY   -76.4202957153

                  TOTAL ENERGY   -76.4205120895



 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.866554     2.473777    -0.274245
A02H                -1.371535     1.830258     0.147842
A03H                -2.673233     3.024808    -0.888710
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002163742

                     ML ENERGY   -76.4202957153

                  TOTAL ENERGY   -76.4205120895


                 ENERGY CHANGE    -0.0705540782
                  RMS GRADIENT     0.0876008361
              MAXIMUM GRADIENT     0.1654652317



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.004475     2.538045    -0.374777
A02H                -1.330432     1.798663     0.179824
A03H                -2.577075     2.992848    -0.820575
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    6.68476190E-04  -1.36459524E-03   5.61585319E-04
TORQUE   3.44178283E-03  -2.42079913E-04  -4.65358568E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -6.68476190E-04   1.36459524E-03  -5.61585319E-04
TORQUE   6.88956858E-04   4.90100237E-04   3.39274577E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.004475          2.538045        -0.374777
   1         -1.330432          1.798663         0.179824
   1         -2.577075          2.992848        -0.820575
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.093949          0.150352        -0.084215
   1          0.096992         -0.127694         0.082918
   1         -0.003043         -0.022657         0.001297
------------------------------------------------------------

 Torch energy -76.433670 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001485956

                     ML ENERGY   -76.4336700439

                  TOTAL ENERGY   -76.4338186395



 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.004475     2.538045    -0.374777
A02H                -1.330432     1.798663     0.179824
A03H                -2.577075     2.992848    -0.820575
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001485956

                     ML ENERGY   -76.4336700439

                  TOTAL ENERGY   -76.4338186395


                 ENERGY CHANGE    -0.0133065500
                  RMS GRADIENT     0.0873838147
              MAXIMUM GRADIENT     0.1429124279



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.943161     2.503985    -0.329192
A02H                -1.359380     1.820996     0.157416
A03H                -2.609654     3.004936    -0.843954
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.77195424E-04  -1.37251060E-03   7.51008641E-04
TORQUE   4.13307810E-03  -3.62251488E-04  -5.69083403E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.77195424E-04   1.37251060E-03  -7.51008641E-04
TORQUE   1.05173794E-03   7.48014900E-04  -3.50526732E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.943161          2.503985        -0.329192
   1         -1.359380          1.820996         0.157416
   1         -2.609654          3.004936        -0.843954
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.023561          0.079709         0.003945
   1          0.037621         -0.087556         0.037729
   1         -0.061182          0.007847        -0.041674
------------------------------------------------------------

 Torch energy -76.453514 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001875143

                     ML ENERGY   -76.4535140991

                  TOTAL ENERGY   -76.4537016135



 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.943161     2.503985    -0.329192
A02H                -1.359380     1.820996     0.157416
A03H                -2.609654     3.004936    -0.843954
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001875143

                     ML ENERGY   -76.4535140991

                  TOTAL ENERGY   -76.4537016135


                 ENERGY CHANGE    -0.0198829739
                  RMS GRADIENT     0.0485109770
              MAXIMUM GRADIENT     0.0856810996



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.936718     2.506348    -0.325245
A02H                -1.382220     1.831369     0.140913
A03H                -2.593744     2.992886    -0.831768
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.82703158E-04  -1.32913765E-03   7.52529875E-04
TORQUE   4.07390905E-03  -3.56912955E-04  -5.61504917E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.82703158E-04   1.32913765E-03  -7.52529875E-04
TORQUE   1.08499343E-03   7.46922416E-04  -4.32941285E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.936718          2.506348        -0.325245
   1         -1.382220          1.831369         0.140913
   1         -2.593744          2.992886        -0.831768
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.044070          0.105832         0.013717
   1         -0.006095         -0.069249         0.006093
   1         -0.037975         -0.036583        -0.019810
------------------------------------------------------------

 Torch energy -76.457779 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001834435

                     ML ENERGY   -76.4577789307

                  TOTAL ENERGY   -76.4579623742



 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.936718     2.506348    -0.325245
A02H                -1.382220     1.831369     0.140913
A03H                -2.593744     2.992886    -0.831768
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001834435

                     ML ENERGY   -76.4577789307

                  TOTAL ENERGY   -76.4579623742


                 ENERGY CHANGE    -0.0042607607
                  RMS GRADIENT     0.0460590680
              MAXIMUM GRADIENT     0.0983946404



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.941273     2.478124    -0.323911
A02H                -1.393773     1.851910     0.130491
A03H                -2.579113     3.002454    -0.823818
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    1.02181357E-03  -1.08064242E-03   7.89107405E-04
TORQUE   4.13633340E-03  -3.55288151E-04  -5.64144192E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -1.02181357E-03   1.08064242E-03  -7.89107405E-04
TORQUE   1.13588187E-03   7.51754801E-04  -6.42597962E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.941273          2.478124        -0.323911
   1         -1.393773          1.851910         0.130491
   1         -2.579113          3.002454        -0.823818
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.034265          0.025049         0.019212
   1         -0.025413         -0.003969        -0.016347
   1         -0.008852         -0.021080        -0.002865
------------------------------------------------------------

 Torch energy -76.462799 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002195157

                     ML ENERGY   -76.4627990723

                  TOTAL ENERGY   -76.4630185879



 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.941273     2.478124    -0.323911
A02H                -1.393773     1.851910     0.130491
A03H                -2.579113     3.002454    -0.823818
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002195157

                     ML ENERGY   -76.4627990723

                  TOTAL ENERGY   -76.4630185879


                 ENERGY CHANGE    -0.0050562138
                  RMS GRADIENT     0.0186751186
              MAXIMUM GRADIENT     0.0338310228



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.955598     2.472580    -0.332460
A02H                -1.384141     1.852225     0.136893
A03H                -2.575041     3.008369    -0.822149
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.83550728E-04  -1.01130013E-03   7.71068529E-04
TORQUE   4.06491360E-03  -3.37174112E-04  -5.50242019E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.83550728E-04   1.01130013E-03  -7.71068529E-04
TORQUE   1.08291745E-03   7.12358928E-04  -5.71914784E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.955598          2.472580        -0.332460
   1         -1.384141          1.852225         0.136893
   1         -2.575041          3.008369        -0.822149
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.017798          0.039119         0.006460
   1         -0.015308         -0.013494        -0.008370
   1         -0.002490         -0.025625         0.001909
------------------------------------------------------------

 Torch energy -76.464951 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002273629

                     ML ENERGY   -76.4649505615

                  TOTAL ENERGY   -76.4651779244



 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.955598     2.472580    -0.332460
A02H                -1.384141     1.852225     0.136893
A03H                -2.575041     3.008369    -0.822149
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002273629

                     ML ENERGY   -76.4649505615

                  TOTAL ENERGY   -76.4651779244


                 ENERGY CHANGE    -0.0021593365
                  RMS GRADIENT     0.0159427985
              MAXIMUM GRADIENT     0.0318456507



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.003619     2.428935    -0.357498
A02H                -1.348091     1.864346     0.159534
A03H                -2.566518     3.043661    -0.822432
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.29280673E-04  -6.18461483E-04   7.65771136E-04
TORQUE   4.00327097E-03  -2.96400878E-04  -5.23928309E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.29280673E-04   6.18461483E-04  -7.65771136E-04
TORQUE   9.71794583E-04   6.21382719E-04  -5.35606178E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.003619          2.428935        -0.357498
   1         -1.348091          1.864346         0.159534
   1         -2.566518          3.043661        -0.822432
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.057804         -0.005469        -0.036676
   1          0.053305         -0.019904         0.037847
   1          0.004499          0.025373        -0.001171
------------------------------------------------------------

 Torch energy -76.461815 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002722519

                     ML ENERGY   -76.4618148804

                  TOTAL ENERGY   -76.4620871323



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.973105     2.456668    -0.341588
A02H                -1.370998     1.856644     0.145147
A03H                -2.571934     3.021236    -0.822252
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.61110590E-04  -8.70338154E-04   7.67313944E-04
TORQUE   4.03948147E-03  -3.21715822E-04  -5.40442285E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.61110590E-04   8.70338154E-04  -7.67313944E-04
TORQUE   1.03945142E-03   6.77945504E-04  -5.53211499E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.973105          2.456668        -0.341588
   1         -1.370998          1.856644         0.145147
   1         -2.571934          3.021236        -0.822252
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.011457          0.028520        -0.011079
   1          0.011114         -0.019613         0.009892
   1          0.000343         -0.008907         0.001187
------------------------------------------------------------

 Torch energy -76.466713 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002455255

                     ML ENERGY   -76.4667129517

                  TOTAL ENERGY   -76.4669584772



 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.973105     2.456668    -0.341588
A02H                -1.370998     1.856644     0.145147
A03H                -2.571934     3.021236    -0.822252
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002455255

                     ML ENERGY   -76.4667129517

                  TOTAL ENERGY   -76.4669584772


                 ENERGY CHANGE    -0.0017805527
                  RMS GRADIENT     0.0118129271
              MAXIMUM GRADIENT     0.0213401266



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.972274     2.450665    -0.340243
A02H                -1.372750     1.861409     0.143515
A03H                -2.571877     3.023333    -0.822644
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.75617579E-04  -8.29081862E-04   7.77482833E-04
TORQUE   4.06992881E-03  -3.25441263E-04  -5.44082913E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.75617579E-04   8.29081862E-04  -7.77482833E-04
TORQUE   1.05182531E-03   6.86352665E-04  -6.01295604E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.972274          2.450665        -0.340243
   1         -1.372750          1.861409         0.143515
   1         -2.571877          3.023333        -0.822644
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.003395          0.012382        -0.003511
   1          0.003681         -0.008137         0.003355
   1         -0.000286         -0.004246         0.000156
------------------------------------------------------------

 Torch energy -76.467163 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002510129

                     ML ENERGY   -76.4671630859

                  TOTAL ENERGY   -76.4674140988



 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.972274     2.450665    -0.340243
A02H                -1.372750     1.861409     0.143515
A03H                -2.571877     3.023333    -0.822644
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002510129

                     ML ENERGY   -76.4671630859

                  TOTAL ENERGY   -76.4674140988


                 ENERGY CHANGE    -0.0004556217
                  RMS GRADIENT     0.0035393712
              MAXIMUM GRADIENT     0.0061785005



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.971234     2.449050    -0.339398
A02H                -1.373646     1.863607     0.142765
A03H                -2.572624     3.023291    -0.823218
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.80593394E-04  -8.22012936E-04   7.80039283E-04
TORQUE   4.07913092E-03  -3.27545053E-04  -5.45580733E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.80593394E-04   8.22012936E-04  -7.80039283E-04
TORQUE   1.05479059E-03   6.90617009E-04  -6.15476227E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.971234          2.449050        -0.339398
   1         -1.373646          1.863607         0.142765
   1         -2.572624          3.023291        -0.823218
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.002389          0.005807         0.001158
   1         -0.000818         -0.003266        -0.000276
   1         -0.001571         -0.002541        -0.000882
------------------------------------------------------------

 Torch energy -76.467216 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002523388

                     ML ENERGY   -76.4672164917

                  TOTAL ENERGY   -76.4674688305



 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.971234     2.449050    -0.339398
A02H                -1.373646     1.863607     0.142765
A03H                -2.572624     3.023291    -0.823218
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002523388

                     ML ENERGY   -76.4672164917

                  TOTAL ENERGY   -76.4674688305


                 ENERGY CHANGE    -0.0000547317
                  RMS GRADIENT     0.0013084444
              MAXIMUM GRADIENT     0.0018839908



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.971687     2.449023    -0.339709
A02H                -1.373326     1.864093     0.142965
A03H                -2.572737     3.023040    -0.823301
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.77901169E-04  -8.21870358E-04   7.78157849E-04
TORQUE   4.07238288E-03  -3.26790631E-04  -5.44628789E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.77901169E-04   8.21870358E-04  -7.78157849E-04
TORQUE   1.05063278E-03   6.88726678E-04  -6.09473805E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.971687          2.449023        -0.339709
   1         -1.373326          1.864093         0.142965
   1         -2.572737          3.023040        -0.823301
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001347          0.006073         0.000404
   1         -0.000323         -0.003376         0.000081
   1         -0.001024         -0.002697        -0.000485
------------------------------------------------------------

 Torch energy -76.467224 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002523922

                     ML ENERGY   -76.4672241211

                  TOTAL ENERGY   -76.4674765132



 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.971687     2.449023    -0.339709
A02H                -1.373326     1.864093     0.142965
A03H                -2.572737     3.023040    -0.823301
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002523922

                     ML ENERGY   -76.4672241211

                  TOTAL ENERGY   -76.4674765132


                 ENERGY CHANGE    -0.0000076827
                  RMS GRADIENT     0.0010251348
              MAXIMUM GRADIENT     0.0016664816



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.973210     2.449502    -0.340884
A02H                -1.371600     1.867459     0.144036
A03H                -2.574732     3.020697    -0.824625
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.62732924E-04  -8.32392841E-04   7.66640472E-04
TORQUE   4.03492290E-03  -3.24017467E-04  -5.39785512E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.62732924E-04   8.32392841E-04  -7.66640472E-04
TORQUE   1.02608724E-03   6.80145273E-04  -5.70996026E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.973210          2.449502        -0.340884
   1         -1.371600          1.867459         0.144036
   1         -2.574732          3.020697        -0.824625
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.001543          0.007359        -0.001848
   1          0.001248         -0.004143         0.001308
   1          0.000296         -0.003217         0.000540
------------------------------------------------------------

 Torch energy -76.467232 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002519758

                     ML ENERGY   -76.4672317505

                  TOTAL ENERGY   -76.4674837263



 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.973210     2.449502    -0.340884
A02H                -1.371600     1.867459     0.144036
A03H                -2.574732     3.020697    -0.824625
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002519758

                     ML ENERGY   -76.4672317505

                  TOTAL ENERGY   -76.4674837263


                 ENERGY CHANGE    -0.0000072130
                  RMS GRADIENT     0.0015395669
              MAXIMUM GRADIENT     0.0022752191



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.976447     2.450969    -0.343471
A02H                -1.367027     1.878160     0.146779
A03H                -2.581672     3.013235    -0.829242
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.20751636E-04  -8.68937340E-04   7.34252725E-04
TORQUE   3.93243072E-03  -3.17953630E-04  -5.26769508E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.20751636E-04   8.68937340E-04  -7.34252725E-04
TORQUE   9.57434426E-04   6.58298748E-04  -4.61412366E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.976447          2.450969        -0.343471
   1         -1.367027          1.878160         0.146779
   1         -2.581672          3.013235        -0.829242
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.005982          0.009207        -0.005411
   1          0.003757         -0.005329         0.003323
   1          0.002225         -0.003878         0.002089
------------------------------------------------------------

 Torch energy -76.467255 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002505413

                     ML ENERGY   -76.4672546387

                  TOTAL ENERGY   -76.4675051799



 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.976447     2.450969    -0.343471
A02H                -1.367027     1.878160     0.146779
A03H                -2.581672     3.013235    -0.829242
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002505413

                     ML ENERGY   -76.4672546387

                  TOTAL ENERGY   -76.4675051799


                 ENERGY CHANGE    -0.0000214536
                  RMS GRADIENT     0.0037836833
              MAXIMUM GRADIENT     0.0065063113



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.983405     2.455170    -0.349139
A02H                -1.355672     1.907656     0.153398
A03H                -2.601402     2.992448    -0.842398
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    8.12630543E-04  -9.69678065E-04   6.51158236E-04
TORQUE   3.67218821E-03  -3.04320012E-04  -4.93691996E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -8.12630543E-04   9.69678065E-04  -6.51158236E-04
TORQUE   7.83112648E-04   6.04013688E-04  -1.76901824E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.983405          2.455170        -0.349139
   1         -1.355672          1.907656         0.153398
   1         -2.601402          2.992448        -0.842398
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.012510          0.011854        -0.010817
   1          0.008263         -0.007681         0.007018
   1          0.004247         -0.004173         0.003799
------------------------------------------------------------

 Torch energy -76.467278 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002462634

                     ML ENERGY   -76.4672775269

                  TOTAL ENERGY   -76.4675237902



 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.983405     2.455170    -0.349139
A02H                -1.355672     1.907656     0.153398
A03H                -2.601402     2.992448    -0.842398
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002462634

                     ML ENERGY   -76.4672775269

                  TOTAL ENERGY   -76.4675237902


                 ENERGY CHANGE    -0.0000186103
                  RMS GRADIENT     0.0074244308
              MAXIMUM GRADIENT     0.0130633752



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.996144     2.464859    -0.359591
A02H                -1.333065     1.972575     0.166122
A03H                -2.644669     2.946077    -0.871262
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    5.86904556E-04  -1.16848644E-03   4.80821993E-04
TORQUE   3.13545245E-03  -2.76800108E-04  -4.24489558E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -5.86904556E-04   1.16848644E-03  -4.80821993E-04
TORQUE   4.32086681E-04   4.90391145E-04   4.09324902E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.996144          2.464859        -0.359591
   1         -1.333065          1.972575         0.166122
   1         -2.644669          2.946077        -0.871262
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.018185          0.013642        -0.015764
   1          0.016626         -0.012413         0.013850
   1          0.001559         -0.001228         0.001914
------------------------------------------------------------

 Torch energy -76.467278 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002362377

                     ML ENERGY   -76.4672775269

                  TOTAL ENERGY   -76.4675137645



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.987205     2.458060    -0.352257
A02H                -1.348927     1.927025     0.157194
A03H                -2.614311     2.978612    -0.851010
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    7.44750675E-04  -1.03293746E-03   5.99609255E-04
TORQUE   3.51046345E-03  -2.96337851E-04  -4.72945878E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -7.44750675E-04   1.03293746E-03  -5.99609255E-04
TORQUE   6.76495521E-04   5.70297547E-04   9.50560895E-07



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.987205          2.458060        -0.352257
   1         -1.348927          1.927025         0.157194
   1         -2.614311          2.978612        -0.851010
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.014639          0.012820        -0.012645
   1          0.010286         -0.008880         0.008693
   1          0.004352         -0.003940         0.003953
------------------------------------------------------------

 Torch energy -76.467308 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002432618

                     ML ENERGY   -76.4673080444

                  TOTAL ENERGY   -76.4675513062



 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.987205     2.458060    -0.352257
A02H                -1.348927     1.927025     0.157194
A03H                -2.614311     2.978612    -0.851010
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002432618

                     ML ENERGY   -76.4673080444

                  TOTAL ENERGY   -76.4675513062


                 ENERGY CHANGE    -0.0000275160
                  RMS GRADIENT     0.0087198201
              MAXIMUM GRADIENT     0.0152083439



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.012745     2.480136    -0.373048
A02H                -1.303194     2.072078     0.181878
A03H                -2.708130     2.874082    -0.913527
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    2.59587045E-04  -1.39994585E-03   2.41525043E-04
TORQUE   2.35889804E-03  -2.34777871E-04  -3.21888695E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -2.59587045E-04   1.39994585E-03  -2.41525043E-04
TORQUE  -4.82646176E-05   3.19843289E-04   1.22851975E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.012745          2.480136        -0.373048
   1         -1.303194          2.072078         0.181878
   1         -2.708130          2.874082        -0.913527
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.017232          0.013106        -0.015281
   1          0.033739         -0.020915         0.027240
   1         -0.016507          0.007809        -0.011959
------------------------------------------------------------

 Torch energy -76.466705 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002201139

                     ML ENERGY   -76.4667053223

                  TOTAL ENERGY   -76.4669254361



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -1.995127     2.464908    -0.358706
A02H                -1.334742     1.972017     0.164851
A03H                -2.643411     2.946190    -0.870401
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    5.92268706E-04  -1.16528401E-03   4.85684593E-04
TORQUE   3.14849443E-03  -2.78283797E-04  -4.25871844E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -5.92268706E-04   1.16528401E-03  -4.85684593E-04
TORQUE   4.44375304E-04   4.93644249E-04   3.94094690E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -1.995127          2.464908        -0.358706
   1         -1.334742          1.972017         0.164851
   1         -2.643411          2.946190        -0.870401
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.016340          0.013585        -0.014177
   1          0.013497         -0.010768         0.011311
   1          0.002843         -0.002818         0.002866
------------------------------------------------------------

 Torch energy -76.467384 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002360831

                     ML ENERGY   -76.4673843384

                  TOTAL ENERGY   -76.4676204214



 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -1.995127     2.464908    -0.358706
A02H                -1.334742     1.972017     0.164851
A03H                -2.643411     2.946190    -0.870401
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002360831

                     ML ENERGY   -76.4673843384

                  TOTAL ENERGY   -76.4676204214


                 ENERGY CHANGE    -0.0000691152
                  RMS GRADIENT     0.0100658393
              MAXIMUM GRADIENT     0.0169453886



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.020297     2.491120    -0.379279
A02H                -1.295161     2.125603     0.184303
A03H                -2.734063     2.832053    -0.930014
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    8.86246882E-05  -1.48079483E-03   1.20582949E-04
TORQUE   1.93678044E-03  -2.08974403E-04  -2.64819316E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -8.86246882E-05   1.48079483E-03  -1.20582949E-04
TORQUE  -2.76823672E-04   2.25011472E-04   1.62511699E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.020297          2.491120        -0.379279
   1         -1.295161          2.125603         0.184303
   1         -2.734063          2.832053        -0.930014
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.016529          0.018395        -0.014987
   1          0.032427         -0.021129         0.026221
   1         -0.015899          0.002734        -0.011233
------------------------------------------------------------

 Torch energy -76.466820 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002080833

                     ML ENERGY   -76.4668197632

                  TOTAL ENERGY   -76.4670278464



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.002883     2.472985    -0.365046
A02H                -1.322545     2.019344     0.170845
A03H                -2.671345     2.911019    -0.888771
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    4.35293422E-04  -1.28184440E-03   3.70604563E-04
TORQUE   2.77137107E-03  -2.57758788E-04  -3.76085115E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -4.35293422E-04   1.28184440E-03  -3.70604563E-04
TORQUE   2.16080557E-04   4.11846397E-04   7.84898305E-04



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.002883          2.472985        -0.365046
   1         -1.322545          2.019344         0.170845
   1         -2.671345          2.911019        -0.888771
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.017134          0.015558        -0.015008
   1          0.014672         -0.011846         0.012311
   1          0.002462         -0.003712         0.002696
------------------------------------------------------------

 Torch energy -76.467445 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002275880

                     ML ENERGY   -76.4674453735

                  TOTAL ENERGY   -76.4676729616



 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.002883     2.472985    -0.365046
A02H                -1.322545     2.019344     0.170845
A03H                -2.671345     2.911019    -0.888771
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002275880

                     ML ENERGY   -76.4674453735

                  TOTAL ENERGY   -76.4676729616


                 ENERGY CHANGE    -0.0000525401
                  RMS GRADIENT     0.0108388691
              MAXIMUM GRADIENT     0.0177762364



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.022002     2.485082    -0.379343
A02H                -1.296823     2.135264     0.182091
A03H                -2.734421     2.835136    -0.930845
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    9.09630916E-05  -1.42276372E-03   1.23299933E-04
TORQUE   1.92382902E-03  -2.09101330E-04  -2.62252850E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -9.09630916E-05   1.42276372E-03  -1.23299933E-04
TORQUE  -2.83269939E-04   2.25378184E-04   1.60004450E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.022002          2.485082        -0.379343
   1         -1.296823          2.135264         0.182091
   1         -2.734421          2.835136        -0.930845
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.013064          0.002828        -0.010143
   1          0.027490         -0.011604         0.021297
   1         -0.014427          0.008776        -0.011154
------------------------------------------------------------

 Torch energy -76.467270 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002151584

                     ML ENERGY   -76.4672698975

                  TOTAL ENERGY   -76.4674850559



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.010210     2.477621    -0.370525
A02H                -1.312687     2.063771     0.175155
A03H                -2.695519     2.881937    -0.904895
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE    3.03019292E-04  -1.34623934E-03   2.75002162E-04
TORQUE   2.44800375E-03  -2.39657138E-04  -3.32787906E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE   -3.03019292E-04   1.34623934E-03  -2.75002162E-04
TORQUE   2.25066147E-05   3.41109295E-04   1.10232050E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.010210          2.477621        -0.370525
   1         -1.312687          2.063771         0.175155
   1         -2.695519          2.881937        -0.904895
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.016098          0.010788        -0.013542
   1          0.017057         -0.010732         0.013813
   1         -0.000959         -0.000057        -0.000271
------------------------------------------------------------

 Torch energy -76.467560 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002227587

                     ML ENERGY   -76.4675598145

                  TOTAL ENERGY   -76.4677825732



 L-BFGS-B optimizer new step 
    STATE AFTER 19 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.010210     2.477621    -0.370525
A02H                -1.312687     2.063771     0.175155
A03H                -2.695519     2.881937    -0.904895
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002227587

                     ML ENERGY   -76.4675598145

                  TOTAL ENERGY   -76.4677825732


                 ENERGY CHANGE    -0.0001096116
                  RMS GRADIENT     0.0105078743
              MAXIMUM GRADIENT     0.0167716068



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.025251     2.499414    -0.383211
A02H                -1.296630     2.180942     0.179523
A03H                -2.754222     2.797990    -0.942749
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -4.54653933E-05  -1.48654494E-03   2.58971742E-05
TORQUE   1.57654286E-03  -1.90530655E-04  -2.16164375E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    4.54653933E-05   1.48654494E-03  -2.58971742E-05
TORQUE  -4.60063322E-04   1.52037888E-04   1.91219389E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.025251          2.499414        -0.383211
   1         -1.296630          2.180942         0.179523
   1         -2.754222          2.797990        -0.942749
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -0.004443          0.012893        -0.005325
   1          0.016644         -0.012584         0.013773
   1         -0.012201         -0.000309        -0.008447
------------------------------------------------------------

 Torch energy -76.467690 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001986693

                     ML ENERGY   -76.4676895142

                  TOTAL ENERGY   -76.4678881835



 L-BFGS-B optimizer new step 
    STATE AFTER 20 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.025251     2.499414    -0.383211
A02H                -1.296630     2.180942     0.179523
A03H                -2.754222     2.797990    -0.942749
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001986693

                     ML ENERGY   -76.4676895142

                  TOTAL ENERGY   -76.4678881835


                 ENERGY CHANGE    -0.0001056103
                  RMS GRADIENT     0.0093492127
              MAXIMUM GRADIENT     0.0158725696



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028839     2.498752    -0.384941
A02H                -1.305831     2.215130     0.170065
A03H                -2.755216     2.781118    -0.942743
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.04654752E-04  -1.40897540E-03  -1.40966939E-05
TORQUE   1.37291139E-03  -1.78409555E-04  -1.87507254E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.04654752E-04   1.40897540E-03   1.40966939E-05
TORQUE  -5.36815535E-04   1.15144785E-04   1.99120613E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028839          2.498752        -0.384941
   1         -1.305831          2.215130         0.170065
   1         -2.755216          2.781118        -0.942743
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.003565         -0.000025         0.002848
   1         -0.016574          0.005790        -0.012780
   1          0.013008         -0.005765         0.009932
------------------------------------------------------------

 Torch energy -76.467674 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0002000148

                     ML ENERGY   -76.4676742554

                  TOTAL ENERGY   -76.4678742702



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.026993     2.499093    -0.384051
A02H                -1.301097     2.197541     0.174931
A03H                -2.754705     2.789798    -0.942746
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -7.42411242E-05  -1.44961668E-03   6.42508204E-06
TORQUE   1.47801075E-03  -1.84612240E-04  -2.02302531E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    7.42411242E-05   1.44961668E-03  -6.42508204E-06
TORQUE  -4.97437382E-04   1.34073228E-04   1.95091329E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.026993          2.499093        -0.384051
   1         -1.301097          2.197541         0.174931
   1         -2.754705          2.789798        -0.942746
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.000850          0.005959        -0.000263
   1         -0.001102         -0.002704        -0.000389
   1          0.000252         -0.003255         0.000652
------------------------------------------------------------

 Torch energy -76.467972 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001993169

                     ML ENERGY   -76.4679718018

                  TOTAL ENERGY   -76.4681711186



 L-BFGS-B optimizer new step 
    STATE AFTER 21 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.026993     2.499093    -0.384051
A02H                -1.301097     2.197541     0.174931
A03H                -2.754705     2.789798    -0.942746
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001993169

                     ML ENERGY   -76.4679718018

                  TOTAL ENERGY   -76.4681711186


                 ENERGY CHANGE    -0.0002829351
                  RMS GRADIENT     0.0011399434
              MAXIMUM GRADIENT     0.0018821703



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.034130     2.506712    -0.389555
A02H                -1.295988     2.248190     0.175297
A03H                -2.776757     2.755564    -0.956928
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -2.19005802E-04  -1.45352905E-03  -9.44119381E-05
TORQUE   1.10012114E-03  -1.62472306E-04  -1.50891685E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    2.19005802E-04   1.45352905E-03   9.44119381E-05
TORQUE  -6.94052226E-04   5.21816184E-05   2.26495757E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.034130          2.506712        -0.389555
   1         -1.295988          2.248190         0.175297
   1         -2.776757          2.755564        -0.956928
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.004909          0.004462         0.003255
   1          0.002357         -0.003871         0.002051
   1         -0.007266         -0.000592        -0.005306
------------------------------------------------------------

 Torch energy -76.467964 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001908378

                     ML ENERGY   -76.4679641724

                  TOTAL ENERGY   -76.4681550101



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277914E-04  -1.45227265E-03  -2.01459875E-05
TORQUE   1.37918664E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277914E-04   1.45227265E-03   2.01459875E-05
TORQUE  -5.49230915E-04   1.12608965E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer new step 
    STATE AFTER 22 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292


                 ENERGY CHANGE    -0.0000054106
                  RMS GRADIENT     0.0009594780
              MAXIMUM GRADIENT     0.0017229911



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.050897     2.523886    -0.402594
A02H                -1.286184     2.356659     0.175275
A03H                -2.820656     2.681325    -0.984708
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -5.40461678E-04  -1.39654112E-03  -3.16258616E-04
TORQUE   2.36722864E-04  -1.11448230E-04  -3.31752757E-04

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    5.40461678E-04   1.39654112E-03   3.16258616E-04
TORQUE  -1.12694318E-03  -1.33693654E-04   2.93557331E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.050897          2.523886        -0.402594
   1         -1.286184          2.356659         0.175275
   1         -2.820656          2.681325        -0.984708
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.004852          0.004934         0.003905
   1          0.024041         -0.008060         0.018056
   1         -0.028893          0.003126        -0.021961
------------------------------------------------------------

 Torch energy -76.467201 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001713392

                     ML ENERGY   -76.4672012329

                  TOTAL ENERGY   -76.4673725721



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.032919     2.505286    -0.388642
A02H                -1.297259     2.237666     0.175073
A03H                -2.771563     2.762508    -0.953505
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.89957480E-04  -1.45266189E-03  -7.43548550E-05
TORQUE   1.17519604E-03  -1.66338884E-04  -1.61139020E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.89957480E-04   1.45266189E-03   7.43548550E-05
TORQUE  -6.54772728E-04   6.80990257E-05   2.20114320E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.032919          2.505286        -0.388642
   1         -1.297259          2.237666         0.175073
   1         -2.771563          2.762508        -0.953505
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.002691          0.005303         0.001440
   1          0.000759         -0.003397         0.000891
   1         -0.003450         -0.001906        -0.002331
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001924749

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681719061



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.029741     2.501998    -0.386175
A02H                -1.299217     2.216629     0.175037
A03H                -2.762884     2.776860    -0.947988
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.28924127E-04  -1.45274994E-03  -3.17809030E-05
TORQUE   1.33558107E-03  -1.76118524E-04  -1.82944108E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.28924127E-04   1.45274994E-03   3.17809030E-05
TORQUE  -5.71876306E-04   1.03082110E-04   2.06995268E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.029741          2.501998        -0.386175
   1         -1.299217          2.216629         0.175037
   1         -2.762884          2.776860        -0.947988
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.002055          0.005488         0.000809
   1         -0.000459         -0.002959         0.000031
   1         -0.001595         -0.002529        -0.000840
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001961101

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681755412



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.029043     2.501276    -0.385633
A02H                -1.299646     2.212011     0.175029
A03H                -2.760979     2.780011    -0.946778
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.15549149E-04  -1.45238339E-03  -2.24332169E-05
TORQUE   1.37062201E-03  -1.78265024E-04  -1.87705460E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.15549149E-04   1.45238339E-03   2.24332169E-05
TORQUE  -5.53682322E-04   1.10737317E-04   2.04107182E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.029043          2.501276        -0.385633
   1         -1.299646          2.212011         0.175029
   1         -2.760979          2.780011        -0.946778
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001917          0.005532         0.000672
   1         -0.000618         -0.002896        -0.000075
   1         -0.001299         -0.002636        -0.000597
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001969040

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681763352



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028906     2.501134    -0.385527
A02H                -1.299731     2.211101     0.175028
A03H                -2.760603     2.780632    -0.946539
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12913255E-04  -1.45229480E-03  -2.05902445E-05
TORQUE   1.37752339E-03  -1.78688151E-04  -1.88643104E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12913255E-04   1.45229480E-03   2.05902445E-05
TORQUE  -5.50095517E-04   1.12245473E-04   2.03537450E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028906          2.501134        -0.385527
   1         -1.299731          2.211101         0.175028
   1         -2.760603          2.780632        -0.946539
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001891          0.005540         0.000646
   1         -0.000646         -0.002885        -0.000093
   1         -0.001245         -0.002655        -0.000553
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970604

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681764916



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028879     2.501106    -0.385506
A02H                -1.299748     2.210924     0.175027
A03H                -2.760531     2.780753    -0.946493
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12401051E-04  -1.45227697E-03  -2.02320913E-05
TORQUE   1.37886428E-03  -1.78770376E-04  -1.88825278E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12401051E-04   1.45227697E-03   2.02320913E-05
TORQUE  -5.49398488E-04   1.12538516E-04   2.03426720E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028879          2.501106        -0.385506
   1         -1.299748          2.210924         0.175027
   1         -2.760531          2.780753        -0.946493
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001886          0.005542         0.000640
   1         -0.000650         -0.002883        -0.000096
   1         -0.001235         -0.002659        -0.000544
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970908

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765219



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028874     2.501101    -0.385502
A02H                -1.299751     2.210890     0.175027
A03H                -2.760516     2.780776    -0.946484
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12301770E-04  -1.45227348E-03  -2.01626689E-05
TORQUE   1.37912419E-03  -1.78786314E-04  -1.88860588E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12301770E-04   1.45227348E-03   2.01626689E-05
TORQUE  -5.49263380E-04   1.12595317E-04   2.03405256E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028874          2.501101        -0.385502
   1         -1.299751          2.210890         0.175027
   1         -2.760516          2.780776        -0.946484
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002883        -0.000097
   1         -0.001233         -0.002660        -0.000543
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970967

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765278



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501100    -0.385501
A02H                -1.299751     2.210883     0.175027
A03H                -2.760514     2.780780    -0.946482
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12282535E-04  -1.45227281E-03  -2.01492191E-05
TORQUE   1.37917454E-03  -1.78789402E-04  -1.88867429E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12282535E-04   1.45227281E-03   2.01492191E-05
TORQUE  -5.49237204E-04   1.12606321E-04   2.03401097E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501100        -0.385501
   1         -1.299751          2.210883         0.175027
   1         -2.760514          2.780780        -0.946482
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001884          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970978

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765290



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780781    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12278809E-04  -1.45227268E-03  -2.01466135E-05
TORQUE   1.37918429E-03  -1.78790000E-04  -1.88868755E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12278809E-04   1.45227268E-03   2.01466135E-05
TORQUE  -5.49232134E-04   1.12608453E-04   2.03400292E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780781        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001884          0.005542         0.000639
   1         -0.000652         -0.002883        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970980

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12278087E-04  -1.45227265E-03  -2.01461088E-05
TORQUE   1.37918618E-03  -1.78790116E-04  -1.88869011E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12278087E-04   1.45227265E-03   2.01461088E-05
TORQUE  -5.49231151E-04   1.12608866E-04   2.03400136E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277948E-04  -1.45227265E-03  -2.01460110E-05
TORQUE   1.37918655E-03  -1.78790139E-04  -1.88869061E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277948E-04   1.45227265E-03   2.01460110E-05
TORQUE  -5.49230961E-04   1.12608946E-04   2.03400105E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277921E-04  -1.45227265E-03  -2.01459921E-05
TORQUE   1.37918662E-03  -1.78790143E-04  -1.88869071E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277921E-04   1.45227265E-03   2.01459921E-05
TORQUE  -5.49230924E-04   1.12608961E-04   2.03400100E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277915E-04  -1.45227265E-03  -2.01459884E-05
TORQUE   1.37918663E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277915E-04   1.45227265E-03   2.01459884E-05
TORQUE  -5.49230917E-04   1.12608964E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277914E-04  -1.45227265E-03  -2.01459877E-05
TORQUE   1.37918664E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277914E-04   1.45227265E-03   2.01459877E-05
TORQUE  -5.49230916E-04   1.12608965E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277914E-04  -1.45227265E-03  -2.01459875E-05
TORQUE   1.37918664E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277914E-04   1.45227265E-03   2.01459875E-05
TORQUE  -5.49230915E-04   1.12608965E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277914E-04  -1.45227265E-03  -2.01459876E-05
TORQUE   1.37918664E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277914E-04   1.45227265E-03   2.01459876E-05
TORQUE  -5.49230915E-04   1.12608965E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277914E-04  -1.45227265E-03  -2.01459877E-05
TORQUE   1.37918664E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277914E-04   1.45227265E-03   2.01459877E-05
TORQUE  -5.49230916E-04   1.12608965E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer direction search 
    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    GRADIENT ON FRAGMENT 1 (tip3p_mm_l)

FORCE   -1.12277914E-04  -1.45227265E-03  -2.01459877E-05
TORQUE   1.37918664E-03  -1.78790144E-04  -1.88869073E-03

    GRADIENT ON FRAGMENT 2 (tip3p_mm_l)

FORCE    1.12277914E-04   1.45227265E-03   2.01459877E-05
TORQUE  -5.49230916E-04   1.12608965E-04   2.03400098E-03



 TORCH INFO 
-----------

 Special fragment coordinates (Angstroms) 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8         -2.028873          2.501099        -0.385501
   1         -1.299752          2.210882         0.175027
   1         -2.760513          2.780782        -0.946481
-----------------------------------------------------------

 Special fragment atom gradients 
-----------------------------------------------------------
  Atom            X                 Y                Z
   8          0.001885          0.005542         0.000639
   1         -0.000652         -0.002882        -0.000097
   1         -0.001233         -0.002660        -0.000542
------------------------------------------------------------

 Torch energy -76.467979 

    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292



 L-BFGS-B optimizer new step 
    STATE AFTER 23 STEPS

    GEOMETRY (ANGSTROMS)

A01O                -2.028873     2.501099    -0.385501
A02H                -1.299752     2.210882     0.175027
A03H                -2.760513     2.780782    -0.946481
A01O                -1.815220     5.663988    -0.000000
A02H                -1.617480     4.725461     0.001936
A03H                -2.476026     5.736906    -0.714908


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000000000
           POLARIZATION ENERGY     0.0000000000
             DISPERSION ENERGY     0.0000000000
     EXCHANGE REPULSION ENERGY     0.0000000000
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY    -0.0001970981

                     ML ENERGY   -76.4679794312

                  TOTAL ENERGY   -76.4681765292


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0009594780
              MAXIMUM GRADIENT     0.0017229911



L-BFGS-B is unable to make an optimization step

OPTIMIZATION HAS NOT CONVERGED
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Thu May 29 00:29:48 2025
TOTAL RUN TIME IS 0 SECONDS
