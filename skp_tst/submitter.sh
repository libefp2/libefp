#!/bin/sh

#for ((i=750;i<=1000;i+=10))
#do
#qsub $i"_lanl_4.5.pbs"
../bin/efpmd "atom_coord.in" > hmm1
../bin/efpmd "efield.in" > hmm2
../bin/efpmd "pairwise_0.in" > hmm3
../bin/efpmd "pbc_1.in" > hmm4
../bin/efpmd "pol_1a.in" > hmm5
#done
