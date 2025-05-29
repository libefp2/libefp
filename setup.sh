#!/bin/bash

export TORCH_SWITCH=ON

export LIBEFP_DIR="/Users/lyuda/LIBEFP/libefp_2025"
export INSTALLATION_DIR="$LIBEFP_DIR"

if [[ "$TORCH_SWITCH" == "ON" ]] then
    # Set the installation directory for LibTorch
    export TORCH_INSTALLED_DIR="/Users/lyuda/LIBEFP/LIBTORCH/libtorch"
    export LIBTORCH_INCLUDE_DIRS="$TORCH_INSTALLED_DIR/include/;$TORCH_INSTALLED_DIR/include/torch/csrc/api/include"
    export TORCHANI_DIR="$LIBEFP_DIR/efpmd/torch"

    echo "Environment variables set for Torch integration:"
    echo "LIBEFP_DIR=$LIBEFP_DIR"
    echo "INSTALLATION_DIR=$INSTALLATION_DIR"
    echo "TORCH_INSTALLED_DIR=$TORCH_INSTALLED_DIR"
    echo "LIBTORCH_INCLUDE_DIRS=$LIBTORCH_INCLUDE_DIRS"
    echo "TORCHANI_DIR=$TORCHANI_DIR"
else
    unset LIBTORCH_INCLUDE_DIRS
    unset TORCH_INSTALLED_DIR
    unset TORCHANI_DIR

    echo "Torch integration is disabled. Only basic environment variables are set:"
    echo "LIBEFP_DIR=$LIBEFP_DIR"
    echo "INSTALLATION_DIR=$INSTALLATION_DIR"
fi

echo "TORCH_SWITCH=$TORCH_SWITCH"
