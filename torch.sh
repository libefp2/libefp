rm -rf build4
mkdir build4

cd build4

TORCH_INSTALLED_DIR=/depot/lslipche/data/skp/libtorch ## Address for the location of your LibTorch installation

echo "TORCH_DIR = " ${TORCH_INSTALLED_DIR}

# Specify _GLIBCXX_USE_CXX11_ABI=0 when you compile c-libtorch using clang with precompiled libtorch which is built with pre-C++11 ABI
 TORCH_CXX_FLAGS="-D_GLIBCXX_USE_CXX11_ABI=0"

# (optional) Enable Address Sanitizer
#  -DSANITIZE_ADDRESS=1

#Torch_DIR=${TORCH_INSTALLED_DIR} \
#cmake ..

cmake -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_PREFIX_PATH=${TORCH_INSTALLED_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..

make VERBOSE=1
