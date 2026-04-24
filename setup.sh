#!/bin/bash

export TORCH_SWITCH=ON

export LIBEFP_DIR="/Users/lyuda/LIBEFP/libefp_2026"
export INSTALLATION_DIR="$LIBEFP_DIR"
export PYTHONPATH="$LIBEFP_DIR/lib"

if [[ "$TORCH_SWITCH" == "ON" ]]; then
    export CMAKE_PREFIX_PATH="/Users/lyuda/LIBEFP/LIBTORCH/libtorch:$CMAKE_PREFIX_PATH"
fi

echo "TORCH_SWITCH=$TORCH_SWITCH"

