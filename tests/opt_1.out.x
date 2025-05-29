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
WALL CLOCK TIME IS Wed May 28 22:54:45 2025

SIMULATION SETTINGS

run_type opt
coord points
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


ENERGY MINIMIZATION JOB


    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01O1               -6.693900    -0.705300     0.203100
A02H2               -7.486763    -0.206378     0.281332
A03H3               -6.954530    -1.593217     0.037723
A01O1               -3.044600     1.421700     0.199400
A02H2               -3.803616     0.868273     0.235295
A03H3               -3.356434     2.304969     0.278587
A01O1               -1.944300    -2.076400     0.128700
A02H2               -1.008603    -1.991043     0.158038
A03H3               -2.291348    -1.368671     0.640903
A01O1               -5.523500    -4.155400     0.271100
A02H2               -5.481723    -4.842535    -0.369036
A03H3               -4.691889    -3.717879     0.245170


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0111379933
           POLARIZATION ENERGY    -0.0008465601
             DISPERSION ENERGY    -0.0014846887
     EXCHANGE REPULSION ENERGY     0.0008105103
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0126587318


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0021639922
              MAXIMUM GRADIENT     0.0051780586



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 1 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.614562    -0.694911     0.228654
A02H2               -7.478590    -1.065221     0.228673
A03H3               -6.015554    -1.419344     0.236559
A01O1               -3.134928     1.299282     0.209796
A02H2               -4.067468     1.180771     0.210132
A03H3               -2.985545     2.227376     0.210167
A01O1               -2.020724    -2.053066     0.138813
A02H2               -1.116896    -2.307073     0.091391
A03H3               -2.029831    -1.157110     0.423164
A01O1               -5.516886    -4.046176     0.238379
A02H2               -5.391649    -4.762530    -0.357295
A03H3               -4.707016    -3.569148     0.253487


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0148491770
           POLARIZATION ENERGY    -0.0012890366
             DISPERSION ENERGY    -0.0018998803
     EXCHANGE REPULSION ENERGY     0.0016409577
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0163971362


                 ENERGY CHANGE    -0.0037384044
                  RMS GRADIENT     0.0023551933
              MAXIMUM GRADIENT     0.0058092427



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 2 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.567060    -0.712667     0.233650
A02H2               -7.425267    -1.096274     0.234105
A03H3               -5.957365    -1.426754     0.278659
A01O1               -3.162085     1.215655     0.222924
A02H2               -4.099398     1.147746     0.200393
A03H3               -2.962082     2.133876     0.199593
A01O1               -2.093559    -2.032914     0.136716
A02H2               -1.172865    -2.222253     0.124542
A03H3               -2.171386    -1.100600     0.228415
A01O1               -5.455987    -3.956431     0.234029
A02H2               -5.595668    -4.697564    -0.327117
A03H3               -4.541971    -3.745617     0.172340


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0182033217
           POLARIZATION ENERGY    -0.0018270906
             DISPERSION ENERGY    -0.0022825665
     EXCHANGE REPULSION ENERGY     0.0025684046
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0197445741


                 ENERGY CHANGE    -0.0033474380
                  RMS GRADIENT     0.0019822632
              MAXIMUM GRADIENT     0.0037368627



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 3 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.388627    -0.802025     0.245420
A02H2               -7.328294    -0.815629     0.222693
A03H3               -6.113255    -1.693168     0.362499
A01O1               -3.217214     0.938004     0.248138
A02H2               -4.143527     0.788844     0.190076
A03H3               -3.093425     1.867321     0.179430
A01O1               -2.318493    -1.958446     0.133366
A02H2               -1.418004    -1.690754     0.099677
A03H3               -2.825379    -1.220777    -0.154010
A01O1               -5.278865    -3.667607     0.226080
A02H2               -5.814648    -4.261065    -0.268305
A03H3               -4.387590    -3.923199     0.071238


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0237636470
           POLARIZATION ENERGY    -0.0036252971
             DISPERSION ENERGY    -0.0044955451
     EXCHANGE REPULSION ENERGY     0.0091564158
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0227280733


                 ENERGY CHANGE    -0.0029834992
                  RMS GRADIENT     0.0038330961
              MAXIMUM GRADIENT     0.0107240949



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 4 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.361222    -0.778803     0.242433
A02H2               -7.273819    -1.004129     0.234039
A03H3               -5.889839    -1.585452     0.346304
A01O1               -3.255771     0.933342     0.243226
A02H2               -4.187771     0.819892     0.196544
A03H3               -3.098254     1.858570     0.190155
A01O1               -2.322520    -1.986709     0.132612
A02H2               -1.398412    -1.814814     0.120325
A03H3               -2.745769    -1.177545    -0.090524
A01O1               -5.299510    -3.659013     0.225587
A02H2               -5.600165    -4.369507    -0.311516
A03H3               -4.361547    -3.657843     0.163141


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0273018923
           POLARIZATION ENERGY    -0.0041090667
             DISPERSION ENERGY    -0.0045752169
     EXCHANGE REPULSION ENERGY     0.0096742384
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0263119376


                 ENERGY CHANGE    -0.0035838643
                  RMS GRADIENT     0.0027293457
              MAXIMUM GRADIENT     0.0050110992



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 5 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.265482    -0.774142     0.235115
A02H2               -7.199885    -0.876707     0.228350
A03H3               -5.903917    -1.640603     0.281934
A01O1               -3.336433     0.861973     0.233175
A02H2               -4.266884     0.729424     0.214015
A03H3               -3.200502     1.791853     0.210361
A01O1               -2.387185    -2.017227     0.129444
A02H2               -1.448769    -1.962008     0.130526
A03H3               -2.704551    -1.136721     0.041905
A01O1               -5.263150    -3.577822     0.233076
A02H2               -5.242843    -4.314042    -0.351084
A03H3               -4.378288    -3.267539     0.299543


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0335615812
           POLARIZATION ENERGY    -0.0057115783
             DISPERSION ENERGY    -0.0056312922
     EXCHANGE REPULSION ENERGY     0.0143466537
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0305577980


                 ENERGY CHANGE    -0.0042458604
                  RMS GRADIENT     0.0034466892
              MAXIMUM GRADIENT     0.0061863349



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 6 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.126449    -0.769393     0.229639
A02H2               -7.066441    -0.778623     0.227457
A03H3               -5.852436    -1.668537     0.241056
A01O1               -3.450976     0.713447     0.229688
A02H2               -4.382366     0.586404     0.222842
A03H3               -3.310023     1.642822     0.221400
A01O1               -2.515936    -2.027433     0.128109
A02H2               -1.578573    -2.098157     0.132917
A03H3               -2.712371    -1.109822     0.072629
A01O1               -5.165633    -3.431244     0.238015
A02H2               -4.994010    -4.129251    -0.367795
A03H3               -4.342396    -3.003656     0.390080


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0442389580
           POLARIZATION ENERGY    -0.0093660990
             DISPERSION ENERGY    -0.0084034666
     EXCHANGE REPULSION ENERGY     0.0280730361
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0339354875


                 ENERGY CHANGE    -0.0033776895
                  RMS GRADIENT     0.0047402066
              MAXIMUM GRADIENT     0.0113906484



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 7 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.080746    -0.735578     0.218736
A02H2               -7.007829    -0.580865     0.234767
A03H3               -5.968297    -1.667037     0.160304
A01O1               -3.506643     0.671972     0.222689
A02H2               -4.422233     0.459197     0.232559
A03H3               -3.452286     1.610339     0.236372
A01O1               -2.554611    -2.048069     0.127967
A02H2               -1.627861    -2.205414     0.120810
A03H3               -2.664960    -1.116092     0.181970
A01O1               -5.110378    -3.407286     0.250730
A02H2               -4.878269    -4.054998    -0.389792
A03H3               -4.321880    -2.935100     0.448181


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0478025984
           POLARIZATION ENERGY    -0.0107342375
             DISPERSION ENERGY    -0.0092529631
     EXCHANGE REPULSION ENERGY     0.0318995345
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0358902645


                 ENERGY CHANGE    -0.0019547770
                  RMS GRADIENT     0.0028116247
              MAXIMUM GRADIENT     0.0086994057



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 8 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.086908    -0.719863     0.217130
A02H2               -7.020731    -0.613135     0.233253
A03H3               -5.926669    -1.643899     0.152681
A01O1               -3.517272     0.655181     0.222974
A02H2               -4.426773     0.417597     0.228993
A03H3               -3.488550     1.594742     0.231668
A01O1               -2.549118    -2.036848     0.129184
A02H2               -1.631268    -2.239878     0.126999
A03H3               -2.613262    -1.099101     0.143003
A01O1               -5.098113    -3.403102     0.257878
A02H2               -5.021475    -4.059216    -0.410939
A03H3               -4.230216    -3.074498     0.407706


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0491277697
           POLARIZATION ENERGY    -0.0114821375
             DISPERSION ENERGY    -0.0093022992
     EXCHANGE REPULSION ENERGY     0.0328161106
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0370960958


                 ENERGY CHANGE    -0.0012058313
                  RMS GRADIENT     0.0010243739
              MAXIMUM GRADIENT     0.0022749593



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 9 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.094665    -0.710294     0.217622
A02H2               -7.029359    -0.610990     0.230288
A03H3               -5.926762    -1.633790     0.166264
A01O1               -3.516753     0.652160     0.223413
A02H2               -4.415158     0.375528     0.227562
A03H3               -3.528659     1.592103     0.229780
A01O1               -2.538276    -2.042242     0.130689
A02H2               -1.606964    -2.170043     0.130678
A03H3               -2.678400    -1.112705     0.130786
A01O1               -5.094691    -3.402380     0.257639
A02H2               -5.081880    -4.057157    -0.416733
A03H3               -4.203288    -3.130108     0.379882


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0492295244
           POLARIZATION ENERGY    -0.0114824833
             DISPERSION ENERGY    -0.0092241700
     EXCHANGE REPULSION ENERGY     0.0326976839
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0372384938


                 ENERGY CHANGE    -0.0001423980
                  RMS GRADIENT     0.0010155477
              MAXIMUM GRADIENT     0.0022161876



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 10 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.101893    -0.694072     0.217848
A02H2               -7.039684    -0.629645     0.226368
A03H3               -5.899412    -1.611290     0.180623
A01O1               -3.530521     0.658076     0.222630
A02H2               -4.436019     0.405630     0.226850
A03H3               -3.517224     1.598001     0.228863
A01O1               -2.520608    -2.055174     0.132644
A02H2               -1.591216    -2.196250     0.131135
A03H3               -2.647447    -1.123809     0.144716
A01O1               -5.093755    -3.409873     0.256151
A02H2               -5.106599    -4.060486    -0.422239
A03H3               -4.194906    -3.156505     0.363620


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0482698670
           POLARIZATION ENERGY    -0.0111023397
             DISPERSION ENERGY    -0.0089243066
     EXCHANGE REPULSION ENERGY     0.0308814068
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0374151064


                 ENERGY CHANGE    -0.0001766126
                  RMS GRADIENT     0.0006311687
              MAXIMUM GRADIENT     0.0011922712



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 11 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.091243    -0.680419     0.218521
A02H2               -7.029709    -0.626122     0.221231
A03H3               -5.878611    -1.596015     0.206415
A01O1               -3.561674     0.635510     0.222521
A02H2               -4.478945     0.429910     0.226612
A03H3               -3.500117     1.573515     0.228161
A01O1               -2.517718    -2.072443     0.135601
A02H2               -1.584820    -2.188092     0.134464
A03H3               -2.669942    -1.144865     0.145721
A01O1               -5.076698    -3.386588     0.252636
A02H2               -5.108653    -4.029733    -0.432212
A03H3               -4.172884    -3.146957     0.349441


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0498712777
           POLARIZATION ENERGY    -0.0117773633
             DISPERSION ENERGY    -0.0093227877
     EXCHANGE REPULSION ENERGY     0.0334441497
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0375272789


                 ENERGY CHANGE    -0.0001121725
                  RMS GRADIENT     0.0004733014
              MAXIMUM GRADIENT     0.0012627877



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 12 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.117527    -0.678879     0.219564
A02H2               -7.055584    -0.617888     0.217616
A03H3               -5.911418    -1.596005     0.228120
A01O1               -3.556869     0.641323     0.221888
A02H2               -4.481597     0.472382     0.225419
A03H3               -3.458048     1.576143     0.226485
A01O1               -2.489641    -2.082346     0.138556
A02H2               -1.552557    -2.156819     0.136785
A03H3               -2.682536    -1.162523     0.158316
A01O1               -5.081569    -3.387752     0.249203
A02H2               -5.135865    -4.027778    -0.437160
A03H3               -4.173497    -3.156913     0.325324


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0482367682
           POLARIZATION ENERGY    -0.0111321722
             DISPERSION ENERGY    -0.0088752670
     EXCHANGE REPULSION ENERGY     0.0306788938
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0375653137


                 ENERGY CHANGE    -0.0000380347
                  RMS GRADIENT     0.0006187596
              MAXIMUM GRADIENT     0.0014592614



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 13 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.123220    -0.674295     0.219276
A02H2               -7.062226    -0.630229     0.218138
A03H3               -5.900597    -1.587579     0.224477
A01O1               -3.557758     0.631099     0.221133
A02H2               -4.477607     0.437358     0.225284
A03H3               -3.484096     1.568231     0.226745
A01O1               -2.487133    -2.083222     0.139368
A02H2               -1.551102    -2.169902     0.136793
A03H3               -2.668002    -1.161136     0.166179
A01O1               -5.078040    -3.379402     0.249331
A02H2               -5.126453    -4.015764    -0.440867
A03H3               -4.172351    -3.139497     0.325804


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0487573167
           POLARIZATION ENERGY    -0.0112958080
             DISPERSION ENERGY    -0.0089691571
     EXCHANGE REPULSION ENERGY     0.0313873846
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0376348972


                 ENERGY CHANGE    -0.0000695835
                  RMS GRADIENT     0.0002786210
              MAXIMUM GRADIENT     0.0006783737



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 14 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.131945    -0.672484     0.219480
A02H2               -7.071099    -0.631723     0.218160
A03H3               -5.906110    -1.584973     0.225554
A01O1               -3.559608     0.616021     0.220449
A02H2               -4.477774     0.414459     0.224880
A03H3               -3.493920     1.553743     0.226515
A01O1               -2.481575    -2.083585     0.140642
A02H2               -1.546235    -2.177421     0.137773
A03H3               -2.655379    -1.160200     0.169402
A01O1               -5.072924    -3.365171     0.248918
A02H2               -5.126829    -3.996226    -0.445732
A03H3               -4.166667    -3.125740     0.319958


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0492867130
           POLARIZATION ENERGY    -0.0115199402
             DISPERSION ENERGY    -0.0090916214
     EXCHANGE REPULSION ENERGY     0.0322249932
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0376732813


                 ENERGY CHANGE    -0.0000383841
                  RMS GRADIENT     0.0002855581
              MAXIMUM GRADIENT     0.0005443397



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 15 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.157801    -0.667346     0.221578
A02H2               -7.096805    -0.623291     0.219078
A03H3               -5.935188    -1.580575     0.232998
A01O1               -3.563208     0.586528     0.218883
A02H2               -4.480785     0.382330     0.224448
A03H3               -3.500193     1.524422     0.226539
A01O1               -2.459458    -2.086258     0.142669
A02H2               -1.525390    -2.191993     0.139417
A03H3               -2.621483    -1.160803     0.173562
A01O1               -5.065570    -3.338451     0.246816
A02H2               -5.123987    -3.960930    -0.455168
A03H3               -4.160410    -3.092340     0.308384


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0496697656
           POLARIZATION ENERGY    -0.0116993206
             DISPERSION ENERGY    -0.0091711791
     EXCHANGE REPULSION ENERGY     0.0328166352
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0377236301


                 ENERGY CHANGE    -0.0000503487
                  RMS GRADIENT     0.0002322886
              MAXIMUM GRADIENT     0.0004747493



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 16 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.182590    -0.661701     0.230148
A02H2               -7.121796    -0.622189     0.227773
A03H3               -5.955560    -1.573847     0.241132
A01O1               -3.568835     0.564244     0.217630
A02H2               -4.488082     0.367777     0.225373
A03H3               -3.497877     1.501543     0.228167
A01O1               -2.433855    -2.090803     0.138719
A02H2               -1.499539    -2.194381     0.138062
A03H3               -2.598065    -1.165240     0.145155
A01O1               -5.061499    -3.317192     0.243811
A02H2               -5.115312    -3.944908    -0.453864
A03H3               -4.156240    -3.073122     0.311713


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0495267891
           POLARIZATION ENERGY    -0.0116395949
             DISPERSION ENERGY    -0.0091292171
     EXCHANGE REPULSION ENERGY     0.0325457525
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0377498486


                 ENERGY CHANGE    -0.0000262185
                  RMS GRADIENT     0.0001721555
              MAXIMUM GRADIENT     0.0003670784



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 17 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.194589    -0.657982     0.236405
A02H2               -7.133060    -0.603712     0.237921
A03H3               -5.981910    -1.573622     0.229619
A01O1               -3.572974     0.556627     0.213588
A02H2               -4.492214     0.360229     0.223615
A03H3               -3.501875     1.493875     0.227235
A01O1               -2.423572    -2.095724     0.135076
A02H2               -1.489834    -2.204372     0.133337
A03H3               -2.582743    -1.169410     0.151855
A01O1               -5.055510    -3.308461     0.244501
A02H2               -5.102561    -3.938949    -0.451162
A03H3               -4.150389    -3.067011     0.322810


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0492833573
           POLARIZATION ENERGY    -0.0115633518
             DISPERSION ENERGY    -0.0090797076
     EXCHANGE REPULSION ENERGY     0.0321747867
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0377516300


                 ENERGY CHANGE    -0.0000017815
                  RMS GRADIENT     0.0002848249
              MAXIMUM GRADIENT     0.0006305853



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    STATE AFTER 18 STEPS

    GEOMETRY (ANGSTROMS)

A01O1               -6.191806    -0.658562     0.235911
A02H2               -7.130756    -0.613306     0.235817
A03H3               -5.970335    -1.572140     0.236340
A01O1               -3.572545     0.559448     0.214208
A02H2               -4.492764     0.367676     0.223987
A03H3               -3.496741     1.496333     0.227423
A01O1               -2.424577    -2.095861     0.135654
A02H2               -1.489782    -2.195012     0.134245
A03H3               -2.593161    -1.171172     0.149921
A01O1               -5.057890    -3.310889     0.243712
A02H2               -5.105412    -3.941760    -0.451571
A03H3               -4.152902    -3.068424     0.320406


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0493004184
           POLARIZATION ENERGY    -0.0115511080
             DISPERSION ENERGY    -0.0090731744
     EXCHANGE REPULSION ENERGY     0.0321647284
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0377599725


                 ENERGY CHANGE    -0.0000083425
                  RMS GRADIENT     0.0000630938
              MAXIMUM GRADIENT     0.0001257909



 L-BFGS-B optimizer direction search 

 L-BFGS-B optimizer new step 
    FINAL STATE

    GEOMETRY (ANGSTROMS)

A01O1               -6.191452    -0.658777     0.236947
A02H2               -7.130494    -0.615486     0.236959
A03H3               -5.968070    -1.571890     0.236893
A01O1               -3.572640     0.559781     0.213598
A02H2               -4.493090     0.369146     0.223890
A03H3               -3.495661     1.496561     0.227482
A01O1               -2.424612    -2.095794     0.135100
A02H2               -1.489660    -2.193455     0.133625
A03H3               -2.594668    -1.171387     0.150179
A01O1               -5.058251    -3.311041     0.243628
A02H2               -5.104814    -3.942580    -0.451113
A03H3               -4.153227    -3.069251     0.322009


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY    -0.0493014731
           POLARIZATION ENERGY    -0.0115485887
             DISPERSION ENERGY    -0.0090729957
     EXCHANGE REPULSION ENERGY     0.0321621146
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000
                     QQ ENERGY     0.0000000000
                     LJ ENERGY     0.0000000000

                  TOTAL ENERGY    -0.0377609429


                 ENERGY CHANGE    -0.0000009704
                  RMS GRADIENT     0.0000435368
              MAXIMUM GRADIENT     0.0000928939



OPTIMIZATION CONVERGED IN 19 STEPS
ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed May 28 22:54:45 2025
TOTAL RUN TIME IS 0 SECONDS
