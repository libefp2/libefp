#!/bin/bash
export TORCH_SWITCH=ON

export LIBEFP_DIR="/scratch/negishi/gupta872/ladybugs/libefp/"
export INSTALLATION_DIR="$LIBEFP_DIR"
export PYTHONPATH="$LIBEFP_DIR/lib"

if [[ "$TORCH_SWITCH" == "ON" ]]; then
    #export CMAKE_PREFIX_PATH="/home/gupta872/scr/libefp:$CMAKE_PREFIX_PATH"
    export CMAKE_PREFIX_PATH="/home/gupta872/.conda/envs/dev/share/cmake/Torch"
fi

echo "TORCH_SWITCH=$TORCH_SWITCH"

