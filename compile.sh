#!/bin/csh

rm -rf build
rm -rf installed
mkdir build

if ( "$TORCH_SWITCH" == "ON" ) then
    setenv TORCH_CXX_FLAGS "-D_GLIBCXX_USE_CXX11_ABI=0"
    cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=${INSTALLATION_DIR}    
    cd build
    make VERBOSE=1
    make install
else
    cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=${INSTALLATION_DIR}
    cd build
    make VERBOSE=1
    make install
endif

echo "Compilation complete. You can now run test jobs as '${INSTALLATION_DIR}/bin/efpmd input.in' from the tests directory."
