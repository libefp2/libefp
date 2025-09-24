

### make sure torch_switch = OFF, in setup.sh #########################

conda create -n libefp-dev python=3.12 -y

conda activate libefp-dev

conda install -c conda-forge cmake ninja pybind11 pytest blas-devel numpy c-compiler cxx-compiler fortran-compiler qcelemental -y
