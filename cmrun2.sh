
cd efpmd/libff
make clean
make
cd ..

cd libopt
make clean
make
cd ..

cd c_wrap_torch
./script/bootstrap-linux-libtorch.sh
cd build
make

cd ../../../

rm -rf build
#mkdir build

#cd build

TORCH_INSTALLED_DIR=/depot/lslipche/data/skp/libtorch/share/cmake/Torch

echo "TORCH_DIR = " ${TORCH_INSTALLED_DIR}

# Specify _GLIBCXX_USE_CXX11_ABI=0 when you compile c-libtorch using clang with precompiled libtorch which is built with pre-C++11 ABI
 TORCH_CXX_FLAGS="-D_GLIBCXX_USE_CXX11_ABI=0"

# (optional) Enable Address Sanitizer
#  -DSANITIZE_ADDRESS=1

Torch_DIR=${TORCH_INSTALLED_DIR} \
#   CXX=g++ 
   cmake -DCMAKE_BUILD_TYPE=Debug \
  -DC_LIBTORCH_PYTHON_ENABLED=Off \
  -DCMAKE_VERBOSE_MAKEFILE=1 \
  -H. -Bbuild

cd build
make

make install
