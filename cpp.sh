rm -rf build
rm -rf installed

cmake -S . -B build \
    -D CMAKE_INSTALL_PREFIX=$LIBEFP_DIR/installed \
    -D BUILD_SHARED_LIBS=ON \
    -D LIBEFP_ENABLE_OPENMP=ON

cmake --build build --target install
