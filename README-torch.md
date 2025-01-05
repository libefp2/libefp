
# Installation with LibTorch for ML/EFP models

## Required libraries

- cmake
- lapack math library
- C/C++ compiler
- Fortran 77 compiler 

An example of working setup at Purdue supercomputers 
can be foound in *module.sh* script. gcc-10 works well. 
AppleClang 14 works on M2 MacOS Ventura.   

## LibTorch library

For ML/EFP models, one needs to use LibTorch library. 
Install LibTorch (C++ frontend) of PyTorch. Consult Libtorch/Pytorch 
webpages for detail: https://pytorch.org/cppdocs/

You can opt out and continure with EFP-only installation - see the next section.

## Setup environmental variables

*setup.sh* or *setup.csh* are used to set up environmental 
variables. The first two are mandatory:

`TORCH_SWITCH` is the variable governing compilation 
with or without LibTorch.

`LIBEFP_DIR` is a path to LibEFP directory with source codes. 

`TORCH_INSTALLED_DIR` and `LIBTORCH_INCLUDE_DIRS` are paths to the LibTorch 
installation and included directories. 

## Compilation 

Further tuning can be done in `CMakeLists.txt`. Otherwise,
run `./compile.sh` to compile.

Executable `efpmd` will be in `build/efpmd/efpmd` and in 

## Running test jobs

Test jobs are contained in `tests` directory.To check the complilation, 
do 

`cd tests`

`make check`

This will run all the test jobs and report `SUCCESS/FAILURE`. Examine any failed jobs carefully.

### TODO:
Installation path: need to add this variable into setup.sh/csh

added the -DCMAKE_INSTALL_PREFIX=$LIBEFP_DIR/installed option in compile.sh
 
nnlib: need to add to shared dirs

added the install option in CMakeLists.txt 
