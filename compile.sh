#!/bin/csh

rm -rf build
mkdir build

if ( "$TORCH_SWITCH" == "ON" ) then
    echo "Building with Torch integration..."
    cd build
    echo "TORCH_DIR = ${TORCH_INSTALLED_DIR}"
    setenv TORCH_CXX_FLAGS "-D_GLIBCXX_USE_CXX11_ABI=0"
    cmake -DCMAKE_PREFIX_PATH=${TORCH_INSTALLED_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..
    make VERBOSE=1
    make install
else
    echo "Building without Torch integration..."
    cmake -H. -Bbuild
    cd build
    make VERBOSE=1
    make install
endif

echo "Compilation complete. You can now run test files as '../build/efpmd/efpmd input.in' from the tests directory."
