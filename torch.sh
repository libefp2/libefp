rm -rf build4
mkdir build4

cd build4

#TORCH_INSTALLED_DIR=/depot/lslipche/data/skp/libtorch ## Address for the location of your LibTorch installation
TORCH_INSTALLED_DIR=/Users/lyuda/LIBEFP/LIBTORCH/libtorch

echo "TORCH_DIR = " ${TORCH_INSTALLED_DIR}

# Specify _GLIBCXX_USE_CXX11_ABI=0 when you compile c-libtorch using clang with precompiled libtorch which is built with pre-C++11 ABI
 TORCH_CXX_FLAGS="-D_GLIBCXX_USE_CXX11_ABI=0"

export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/llvm/include"
export CC="/opt/homebrew/opt/llvm/bin/clang"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"


# (optional) Enable Address Sanitizer
#  -DSANITIZE_ADDRESS=1

#Torch_DIR=${TORCH_INSTALLED_DIR} \
#cmake ..

#cmake -DCMAKE_PREFIX_PATH=${TORCH_INSTALLED_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..
cmake -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_PREFIX_PATH=${TORCH_INSTALLED_DIR} -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ..

make VERBOSE=1
