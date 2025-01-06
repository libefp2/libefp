#!/bin/csh

setenv TORCH_SWITCH ON

setenv LIBEFP_DIR "/scratch/bell/paulsk/backup/lyuda_jan2/libefp"

if ("$TORCH_SWITCH" == "ON") then
    # Set the installation directory for LibTorch
    setenv TORCH_INSTALLED_DIR "/depot/lslipche/data/skp/libtorch"
    setenv INSTALLATION_DIR "$LIBEFP_DIR/installed"
    setenv LIBTORCH_INCLUDE_DIRS "$TORCH_INSTALLED_DIR/include/;$TORCH_INSTALLED_DIR/include/torch/csrc/api/include"
    setenv TORCHANI_DIR "$LIBEFP_DIR/efpmd/torch"

    echo "Environment variables set for Torch integration:"
    echo "LIBEFP_DIR=$LIBEFP_DIR"
    echo "TORCH_INSTALLED_DIR=$TORCH_INSTALLED_DIR"
    echo "LIBTORCH_INCLUDE_DIRS=$LIBTORCH_INCLUDE_DIRS"
    echo "TORCHANI_DIR=$TORCHANI_DIR"
    echo "INSTALLATION_DIR=$INSTALLATION_DIR"
else 
    unsetenv LIBTORCH_INCLUDE_DIRS
    unsetenv TORCH_INSTALLED_DIR
    unsetenv TORCHANI_DIR

    echo "Torch integration is disabled. Only basic environment variables are set:"
    echo "LIBEFP_DIR=$LIBEFP_DIR"
endif

echo "TORCH_SWITCH=$TORCH_SWITCH"

