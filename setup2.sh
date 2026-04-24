#!/bin/bash

export TORCH_SWITCH=ON

if [[ "$TORCH_SWITCH" == "ON" ]]; then
    export CMAKE_PREFIX_PATH="/Users/lyuda/LIBEFP/LIBTORCH/libtorch:$CMAKE_PREFIX_PATH"
fi

echo "TORCH_SWITCH=$TORCH_SWITCH"

