#!/bin/csh

rm -rf build
rm -rf installed
mkdir build

if ( "$TORCH_SWITCH" == "ON" ) then
    echo "Building with Torch integration..."
    echo "TORCH_DIR = ${TORCH_INSTALLED_DIR}"
    cd build
    setenv TORCH_CXX_FLAGS "-D_GLIBCXX_USE_CXX11_ABI=0"
    cmake -DCMAKE_INSTALL_PREFIX=${INSTALLATION_DIR} -DCMAKE_PREFIX_PATH=${TORCH_INSTALLED_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..
    #cmake -DCMAKE_PREFIX_PATH=${TORCH_INSTALLED_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..
    make VERBOSE=1 
    make install
else
    echo "Building without Torch integration..."
    cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=${INSTALLATION_DIR}
    cd build
    make VERBOSE=1
    make install
endif

echo "Compilation complete. You can now run test jobs as '${INSTALLATION_DIR}/bin/efpmd input.in' from the tests directory."
