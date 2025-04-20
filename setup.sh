#!/bin/csh

setenv TORCH_SWITCH OFF

#setenv LIBEFP_DIR "/depot/lslipche/data/skp/torch_skp_branch/libefp"
setenv LIBEFP_DIR "/scratch/gilbreth/paulsk/backup/branch_pylib/libefp"
setenv PYTHONPATH "$LIBEFP_DIR/installed/lib64/"

if ("$TORCH_SWITCH" == "ON") then
    # Set the installation directory for LibTorch
    setenv CONDA_PREFIX "/apps/spack/gilbreth/apps/anaconda/2020.11-py38-gcc-4.8.5-djkvkvk/etc/profile.d/conda.csh"
    setenv TORCH_INSTALLED_DIR "/depot/lslipche/data/skp/libtorch"
    setenv LIBTORCH_INCLUDE_DIRS "$TORCH_INSTALLED_DIR/include/;$TORCH_INSTALLED_DIR/include/torch/csrc/api/include"
    #setenv PYTHON_REQS "/apps/spack/gilbreth/apps/anaconda/2020.11-py38-gcc-4.8.5-djkvkvk/etc/profile.d/conda.csh;$LIBEFP_DIR/python/../installed;$TORCH_INSTALLED_DIR"
    setenv TORCHANI_DIR "$LIBEFP_DIR/efpmd/torch"
 
    echo "Environment variables set for Torch integration:"
    echo "LIBEFP_DIR=$LIBEFP_DIR"
    echo "TORCH_INSTALLED_DIR=$TORCH_INSTALLED_DIR"
    echo "LIBTORCH_INCLUDE_DIRS=$LIBTORCH_INCLUDE_DIRS"
    echo "TORCHANI_DIR=$TORCHANI_DIR"
    echo "PYTHON_REQS=$PYTHON_REQS"
else
    unsetenv LIBTORCH_INCLUDE_DIRS
    unsetenv TORCH_INSTALLED_DIR
    unsetenv TORCHANI_DIR

    echo "Torch integration is disabled. Only basic environment variables are set:"
    echo "LIBEFP_DIR=$LIBEFP_DIR"
endif

echo "TORCH_SWITCH=$TORCH_SWITCH"

