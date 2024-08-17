chosen nn_type: ani1.pt
EFPMD ver. 1.8.0
Copyright (c) 2012-2017 Ilya Kaliman

LIBEFP ver. 1.8.0
Copyright (c) 2012-2017 Ilya Kaliman
              2018-2022 Lyudmila Slipchenko

Journal References:
  - Kaliman and Slipchenko, JCC 2013.
    DOI: http://dx.doi.org/10.1002/jcc.23375
  - Kaliman and Slipchenko, JCC 2015.
    DOI: http://dx.doi.org/10.1002/jcc.23772

Project web site: https://github.com/libefp2/libefp/

RUNNING 1 MPI PROCESSES WITH 1 OPENMP THREADS EACH
WALL CLOCK TIME IS Wed Aug 14 00:03:03 2024

SIMULATION SETTINGS

run_type opt
coord atoms
terms elec pol disp xr
special_terms elec pol disp xr
elec_damp screen
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
xr_cutoff 0
max_steps 50
multistep_steps 1
fraglib_path ../fraglib
userlib_path .
enable_pbc false
periodic_box 30.0 30.0 30.0 90.0 90.0 90.0
opt_tol 0.0001
gtest_tol 1e-06
ref_energy 0
hess_central false
num_step_dist 0.001
num_step_angle 0.01
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
opt_special_frag 0
torch_nn ani1.pt
symm_frag frag
update_params 0
update_params_cutoff 0
print 0
verbose 0


xr_cutoff is set to 10.000000 

SPECIAL FRAGMENT ENERGY MINIMIZATION JOB


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602544
           POLARIZATION ENERGY    -0.0000082111
             DISPERSION ENERGY    -0.0000377910
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001144311



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717119     0.013446    -0.000001       -0.003067    -0.009763    -0.000007
   8     -75.189697         0.678635    -0.063043    -0.000001       -0.005571     0.055823     0.000004
   1      -0.600703        -1.094134     0.520396     0.883227        0.010806    -0.007040    -0.014544
   1      -0.600342        -1.094993    -0.998593    -0.000048        0.003625     0.014899     0.000001
   1      -0.600703        -1.094156     0.520490    -0.883163        0.010803    -0.007042     0.014546
   1      -0.597402         1.051482     0.798141     0.000002       -0.016596    -0.046875    -0.000000
   Total TORCH energy  -115.679530
--------------------------------

    INITIAL STATE

    GEOMETRY (ANGSTROMS)

A01C1               -0.717119     0.013446    -0.000001
A02O2                0.678635    -0.063043    -0.000001
A03H3               -1.094134     0.520396     0.883227
A04H4               -1.094993    -0.998593    -0.000048
A05H5               -1.094156     0.520490    -0.883163
A06H6                1.051482     0.798141     0.000002
A01O1               -5.394000    -1.900000    -3.700000
A02H2               -5.517419    -1.130057    -3.174996
A03H3               -4.580284    -2.281411    -3.424198


    RESTART DATA

fragment CH3OH_L
   4.850885e-09   4.340585e-10  -4.460128e-10  -5.616720e-09   1.490116e-08   0.000000e+00

fragment H2O_L
  -5.355373e+00  -1.878259e+00  -3.655189e+00   2.411810e+00   2.323317e+00  -2.912813e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602544
           POLARIZATION ENERGY    -0.0000082111
             DISPERSION ENERGY    -0.0000377910
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -115.6794154742


                 ENERGY CHANGE     0.0000000000
                  RMS GRADIENT     0.0000239093
              MAXIMUM GRADIENT     0.0000584661



 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0000958903
           POLARIZATION ENERGY    -0.0000082354
             DISPERSION ENERGY    -0.0000324191
     EXCHANGE REPULSION ENERGY     0.0000002819
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000555177



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.060310        -0.723764     0.318448     0.243980       -0.297758     0.539266     1.072049
   8     -75.170181         0.633326    -0.321669    -0.218345       -0.059091    -0.289999    -0.130011
   1      -0.494673        -1.058317     0.547847     0.918191        0.349291    -0.302730    -0.847973
   1      -0.551723        -1.125942    -0.961630     0.018624        0.003899    -0.115475    -0.037900
   1      -0.590113        -1.100639     0.566911    -0.848197       -0.006226    -0.026631    -0.112495
   1      -0.568792         1.074487     0.770650    -0.013437        0.009885     0.195569     0.056331
   Total TORCH energy  -115.435793
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602478
           POLARIZATION ENERGY    -0.0000082110
             DISPERSION ENERGY    -0.0000377906
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001144249



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717120     0.013467     0.000016       -0.003062    -0.009711     0.000032
   8     -75.189697         0.678631    -0.063061    -0.000016       -0.005585     0.055773    -0.000000
   1      -0.600703        -1.094132     0.520398     0.883230        0.010810    -0.007056    -0.014568
   1      -0.600342        -1.094995    -0.998590    -0.000046        0.003622     0.014875    -0.000002
   1      -0.600703        -1.094156     0.520493    -0.883161        0.010802    -0.007044     0.014540
   1      -0.597402         1.051484     0.798140     0.000001       -0.016586    -0.046837    -0.000001
   Total TORCH energy  -115.679530
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602412
           POLARIZATION ENERGY    -0.0000082110
             DISPERSION ENERGY    -0.0000377902
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001144188



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717120     0.013488     0.000033       -0.003057    -0.009659     0.000070
   8     -75.189697         0.678628    -0.063078    -0.000031       -0.005599     0.055723    -0.000005
   1      -0.600703        -1.094129     0.520400     0.883232        0.010814    -0.007071    -0.014592
   1      -0.600342        -1.094998    -0.998588    -0.000045        0.003619     0.014852    -0.000004
   1      -0.600703        -1.094157     0.520496    -0.883158        0.010801    -0.007046     0.014533
   1      -0.597403         1.051485     0.798138    -0.000000       -0.016577    -0.046799    -0.000002
   Total TORCH energy  -115.679531
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001230288
           POLARIZATION ENERGY    -0.0000079389
             DISPERSION ENERGY    -0.0000347908
     EXCHANGE REPULSION ENERGY     0.0000002017
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000805008



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.079971        -0.720442     0.165968     0.122007       -0.057732     0.324761     0.403923
   8     -75.187424         0.655977    -0.192374    -0.109188       -0.051615    -0.194308    -0.065362
   1      -0.578321        -1.076223     0.534124     0.900712        0.088457    -0.144375    -0.280795
   1      -0.586613        -1.110470    -0.980109     0.009290        0.003040    -0.090401    -0.030927
   1      -0.599075        -1.097398     0.543704    -0.865678        0.007082    -0.023923    -0.045343
   1      -0.590735         1.062986     0.784394    -0.006719        0.010768     0.128247     0.018504
   Total TORCH energy  -115.622139
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602342
           POLARIZATION ENERGY    -0.0000082109
             DISPERSION ENERGY    -0.0000377898
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001144122



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717121     0.013511     0.000051       -0.003052    -0.009604     0.000112
   8     -75.189697         0.678625    -0.063098    -0.000047       -0.005614     0.055670    -0.000010
   1      -0.600703        -1.094127     0.520402     0.883235        0.010817    -0.007087    -0.014617
   1      -0.600342        -1.095000    -0.998585    -0.000044        0.003615     0.014827    -0.000007
   1      -0.600703        -1.094157     0.520500    -0.883156        0.010800    -0.007048     0.014526
   1      -0.597403         1.051487     0.798136    -0.000001       -0.016567    -0.046759    -0.000003
   Total TORCH energy  -115.679532
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602273
           POLARIZATION ENERGY    -0.0000082109
             DISPERSION ENERGY    -0.0000377894
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001144057



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717121     0.013533     0.000069       -0.003047    -0.009548     0.000153
   8     -75.189697         0.678622    -0.063117    -0.000063       -0.005629     0.055618    -0.000015
   1      -0.600703        -1.094124     0.520404     0.883237        0.010821    -0.007104    -0.014642
   1      -0.600342        -1.095002    -0.998582    -0.000042        0.003612     0.014802    -0.000010
   1      -0.600703        -1.094158     0.520503    -0.883153        0.010799    -0.007050     0.014519
   1      -0.597404         1.051489     0.798134    -0.000002       -0.016557    -0.046718    -0.000004
   Total TORCH energy  -115.679532
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001392877
           POLARIZATION ENERGY    -0.0000080438
             DISPERSION ENERGY    -0.0000362928
     EXCHANGE REPULSION ENERGY     0.0000001860
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0000951371



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.087646        -0.718782     0.089751     0.061038       -0.010106     0.166248     0.170895
   8     -75.190262         0.667299    -0.127745    -0.054626       -0.038338    -0.087265    -0.026104
   1      -0.595395        -1.085174     0.527264     0.891974        0.036988    -0.069461    -0.122653
   1      -0.597118        -1.102736    -0.989346     0.004624       -0.000299    -0.052417    -0.014025
   1      -0.600411        -1.095778     0.532103    -0.874415        0.008943    -0.013920    -0.012498
   1      -0.596547         1.057237     0.791264    -0.003360        0.002813     0.056816     0.004384
   Total TORCH energy  -115.667378
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602190
           POLARIZATION ENERGY    -0.0000082108
             DISPERSION ENERGY    -0.0000377889
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001143980



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717122     0.013560     0.000090       -0.003041    -0.009483     0.000202
   8     -75.189697         0.678618    -0.063139    -0.000082       -0.005646     0.055556    -0.000021
   1      -0.600703        -1.094121     0.520406     0.883240        0.010826    -0.007123    -0.014672
   1      -0.600343        -1.095005    -0.998579    -0.000041        0.003608     0.014773    -0.000014
   1      -0.600703        -1.094158     0.520507    -0.883150        0.010798    -0.007052     0.014511
   1      -0.597405         1.051491     0.798131    -0.000003       -0.016545    -0.046671    -0.000006
   Total TORCH energy  -115.679533
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001602107
           POLARIZATION ENERGY    -0.0000082108
             DISPERSION ENERGY    -0.0000377884
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001143903



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717122     0.013586     0.000112       -0.003035    -0.009418     0.000251
   8     -75.189697         0.678614    -0.063161    -0.000101       -0.005664     0.055494    -0.000027
   1      -0.600703        -1.094118     0.520408     0.883243        0.010830    -0.007142    -0.014702
   1      -0.600343        -1.095007    -0.998576    -0.000039        0.003605     0.014744    -0.000017
   1      -0.600703        -1.094159     0.520511    -0.883147        0.010797    -0.007054     0.014503
   1      -0.597405         1.051493     0.798129    -0.000005       -0.016533    -0.046623    -0.000007
   Total TORCH energy  -115.679534
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001490682
           POLARIZATION ENERGY    -0.0000081260
             DISPERSION ENERGY    -0.0000370542
     EXCHANGE REPULSION ENERGY     0.0000001820
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001040700



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.089828        -0.717952     0.051668     0.030575       -0.001731     0.080065     0.079506
   8     -75.190392         0.672957    -0.095453    -0.027363       -0.024958    -0.020642    -0.011210
   1      -0.599338        -1.089646     0.523836     0.887609        0.020886    -0.037443    -0.064546
   1      -0.599623        -1.098872    -0.993961     0.002292        0.000520    -0.021452    -0.006026
   1      -0.600634        -1.094968     0.526307    -0.878781        0.009565    -0.010193     0.001841
   1      -0.597628         1.054365     0.794696    -0.001682       -0.004281     0.009665     0.000435
   Total TORCH energy  -115.677443
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001601988
           POLARIZATION ENERGY    -0.0000082107
             DISPERSION ENERGY    -0.0000377877
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001143792



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717123     0.013624     0.000142       -0.003026    -0.009323     0.000322
   8     -75.189697         0.678608    -0.063194    -0.000129       -0.005690     0.055404    -0.000036
   1      -0.600702        -1.094113     0.520412     0.883248        0.010837    -0.007170    -0.014745
   1      -0.600343        -1.095011    -0.998571    -0.000037        0.003599     0.014701    -0.000022
   1      -0.600703        -1.094160     0.520517    -0.883143        0.010796    -0.007057     0.014490
   1      -0.597406         1.051496     0.798125    -0.000006       -0.016516    -0.046554    -0.000009
   Total TORCH energy  -115.679535
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001601868
           POLARIZATION ENERGY    -0.0000082106
             DISPERSION ENERGY    -0.0000377870
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001143680



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090683        -0.717124     0.013663     0.000173       -0.003017    -0.009229     0.000393
   8     -75.189697         0.678602    -0.063227    -0.000156       -0.005715     0.055314    -0.000045
   1      -0.600702        -1.094109     0.520415     0.883252        0.010843    -0.007198    -0.014788
   1      -0.600343        -1.095015    -0.998567    -0.000034        0.003594     0.014659    -0.000028
   1      -0.600703        -1.094160     0.520523    -0.883138        0.010794    -0.007061     0.014479
   1      -0.597407         1.051498     0.798122    -0.000008       -0.016499    -0.046485    -0.000010
   Total TORCH energy  -115.679536
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001544496
           POLARIZATION ENERGY    -0.0000081687
             DISPERSION ENERGY    -0.0000374255
     EXCHANGE REPULSION ENERGY     0.0000001804
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001090358



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090427        -0.717538     0.032666     0.015374       -0.000966     0.036761     0.038483
   8     -75.190147         0.675779    -0.079340    -0.013760       -0.016808     0.014492    -0.005084
   1      -0.600339        -1.091877     0.522126     0.885430        0.015259    -0.022124    -0.038701
   1      -0.600197        -1.096943    -0.996264     0.001129        0.001633    -0.004699    -0.002798
   1      -0.600681        -1.094564     0.523415    -0.880960        0.010124    -0.008650     0.008376
   1      -0.597694         1.052932     0.796409    -0.000845       -0.009242    -0.015779    -0.000277
   Total TORCH energy  -115.679486
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001600603
           POLARIZATION ENERGY    -0.0000082097
             DISPERSION ENERGY    -0.0000377794
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001142500



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090679        -0.717133     0.014069     0.000498       -0.002925    -0.008229     0.001145
   8     -75.189705         0.678542    -0.063571    -0.000447       -0.005985     0.054365    -0.000138
   1      -0.600701        -1.094061     0.520452     0.883299        0.010914    -0.007494    -0.015247
   1      -0.600344        -1.095057    -0.998517    -0.000010        0.003537     0.014210    -0.000082
   1      -0.600703        -1.094169     0.520585    -0.883092        0.010778    -0.007095     0.014351
   1      -0.597418         1.051529     0.798085    -0.000026       -0.016319    -0.045758    -0.000028
   Total TORCH energy  -115.679550
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001599663
           POLARIZATION ENERGY    -0.0000082091
             DISPERSION ENERGY    -0.0000377737
     EXCHANGE REPULSION ENERGY     0.0000001788
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001141624



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090675        -0.717140     0.014371     0.000740       -0.002859    -0.007486     0.001706
   8     -75.189720         0.678497    -0.063827    -0.000663       -0.006184     0.053663    -0.000208
   1      -0.600700        -1.094026     0.520479     0.883333        0.010968    -0.007714    -0.015590
   1      -0.600345        -1.095087    -0.998481     0.000009        0.003495     0.013879    -0.000122
   1      -0.600702        -1.094175     0.520631    -0.883057        0.010767    -0.007120     0.014256
   1      -0.597425         1.051552     0.798058    -0.000039       -0.016186    -0.045220    -0.000041
   Total TORCH energy  -115.679569
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001571661
           POLARIZATION ENERGY    -0.0000081890
             DISPERSION ENERGY    -0.0000376009
     EXCHANGE REPULSION ENERGY     0.0000001796
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001115557



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090591        -0.717339     0.023519     0.008057       -0.001437     0.014945     0.019546
   8     -75.189957         0.677138    -0.071584    -0.007212       -0.011848     0.033280    -0.002527
   1      -0.600594        -1.092951     0.521302     0.884382        0.012861    -0.014703    -0.026635
   1      -0.600322        -1.096015    -0.997372     0.000569        0.002421     0.004158    -0.001425
   1      -0.600694        -1.094370     0.522023    -0.882008        0.010451    -0.007899     0.011330
   1      -0.597604         1.052242     0.797233    -0.000442       -0.012448    -0.029780    -0.000289
   Total TORCH energy  -115.679763
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001571610
           POLARIZATION ENERGY    -0.0000081890
             DISPERSION ENERGY    -0.0000376006
     EXCHANGE REPULSION ENERGY     0.0000001796
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001115510



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090591        -0.717339     0.023535     0.008070       -0.001435     0.014986     0.019580
   8     -75.189957         0.677136    -0.071598    -0.007224       -0.011858     0.033243    -0.002531
   1      -0.600594        -1.092949     0.521304     0.884384        0.012865    -0.014717    -0.026657
   1      -0.600322        -1.096017    -0.997370     0.000570        0.002419     0.004140    -0.001427
   1      -0.600694        -1.094370     0.522025    -0.882006        0.010450    -0.007901     0.011324
   1      -0.597604         1.052243     0.797232    -0.000443       -0.012442    -0.029753    -0.000289
   Total TORCH energy  -115.679763
--------------------------------

 FG step 
    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001571661
           POLARIZATION ENERGY    -0.0000081890
             DISPERSION ENERGY    -0.0000376009
     EXCHANGE REPULSION ENERGY     0.0000001796
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY     0.0001115557



 TORCH CALL 
-------------------------

Special fragment Atomic Energies, Coordinates, Gradients in H, A, H/A 
---------------------------
   6     -38.090591        -0.717339     0.023519     0.008057       -0.001437     0.014945     0.019546
   8     -75.189957         0.677138    -0.071584    -0.007212       -0.011848     0.033280    -0.002527
   1      -0.600594        -1.092951     0.521302     0.884382        0.012861    -0.014703    -0.026635
   1      -0.600322        -1.096015    -0.997372     0.000569        0.002421     0.004158    -0.001425
   1      -0.600694        -1.094370     0.522023    -0.882008        0.010451    -0.007899     0.011330
   1      -0.597604         1.052242     0.797233    -0.000442       -0.012448    -0.029780    -0.000289
   Total TORCH energy  -115.679763
--------------------------------

 NEW_X step
    FINAL STATE

    GEOMETRY (ANGSTROMS)

A01C1               -0.717339     0.023519     0.008057
A02O2                0.677138    -0.071584    -0.007212
A03H3               -1.092951     0.521302     0.884382
A04H4               -1.096015    -0.997372     0.000569
A05H5               -1.094370     0.522023    -0.882008
A06H6                1.052242     0.797234    -0.000442
A01O1               -5.394000    -1.900000    -3.700000
A02H2               -5.517419    -1.130057    -3.174996
A03H3               -4.580284    -2.281411    -3.424198


    RESTART DATA

fragment CH3OH_L
  -8.072888e-04  -4.049307e-04  -5.041314e-04   9.160584e-01   1.311603e-02  -9.294457e-01

fragment H2O_L
  -5.355373e+00  -1.878259e+00  -3.655189e+00   2.411810e+00   2.323317e+00  -2.912813e+00


    ENERGY COMPONENTS (ATOMIC UNITS)

          ELECTROSTATIC ENERGY     0.0001571661
           POLARIZATION ENERGY    -0.0000081890
             DISPERSION ENERGY    -0.0000376009
     EXCHANGE REPULSION ENERGY     0.0000001796
          POINT CHARGES ENERGY     0.0000000000
     CHARGE PENETRATION ENERGY     0.0000000000

                  TOTAL ENERGY  -115.6796514634


                 ENERGY CHANGE    -0.0002359891
                  RMS GRADIENT     0.0000241397
              MAXIMUM GRADIENT     0.0000589057


OPTIMIZATION CONVERGED
SPECIAL FRAGMENT ENERGY MINIMIZATION JOB COMPLETED SUCCESSFULLY
WALL CLOCK TIME IS Wed Aug 14 00:03:17 2024
TOTAL RUN TIME IS 14 SECONDS
