
add_library(
  libff
  OBJECT
    libff/ff.c
  )
add_library(
  libopt
  OBJECT
    libopt/opt.c
    libopt/blas.f
    libopt/lbfgsb.f
    libopt/linpack.f
    libopt/timer.f
  )

find_package(Torch REQUIRED)
add_library(ctorch OBJECT torch/c_libtorch.cc)

add_executable(
  efpmd
    src/cfg.c
    src/common.c
    src/efield.c
    src/energy.c
    src/grad.c
    src/gtest.c
    src/hess.c
    src/main.c
    src/md.c
    src/msg.c
    src/opt.c
    src/parse.c
    src/rand.c
    src/sp.c
    src/torch.c
  )
 
set(TORCH_INCLUDE_DIRS "/depot/lslipche/data/skp/libtorch/include/;/depot/lslipche/data/skp/libtorch/include/torch/csrc/api/include")

message("TORCH_INSTALL_PREFIX =  ${TORCH_INSTALL_PREFIX}")
message("TORCH_LIBRARIES =  ${TORCH_LIBRARIES}")
message("TORCH_INCLUDE_DIRS =  ${TORCH_INCLUDE_DIRS}")

set_target_properties(efpmd PROPERTIES
  CXX_STANDARD 14
  CXX_STANDARD_REQUIRED YES
)

target_include_directories(
  ctorch
  PRIVATE
    ${TORCH_INCLUDE_DIRS}
  )

target_include_directories(
  efpmd
  PRIVATE
    libff/
    libopt/
    ../src/
    ctorch/
#    ${TORCH_INCLUDE_DIRS}
  )

target_link_libraries(
  ctorch
  PUBLIC
    "${TORCH_LIBRARIES}"
  )

target_link_libraries(
  efpmd
  PUBLIC
    ${efp}::efp
    ctorch
#    "${TORCH_LIBRARIES}"
  PRIVATE
    libff
    libopt
  )
target_compile_definitions(
  efpmd
  PRIVATE
    $<BUILD_INTERFACE:FRAGLIB_PATH="/../fraglib">
    $<INSTALL_INTERFACE:FRAGLIB_PATH="${CMAKE_INSTALL_DATADIR}/${efp}/fraglib">
  )

add_executable(${efp}::efpmd ALIAS efpmd)

# TODO libefp::efp not appearing in Targets-exe
# TODO FRAGLIB_PATH not right upon install

set_target_properties(
  libff
  libopt
  efpmd
  PROPERTIES
    POSITION_INDEPENDENT_CODE ${BUILD_FPIC}
  )
set_target_properties(
  efpmd
  PROPERTIES
    MACOSX_RPATH ON
    SKIP_BUILD_RPATH OFF
    BUILD_WITH_INSTALL_RPATH OFF
    INSTALL_RPATH "$ORIGIN/../${CMAKE_INSTALL_LIBDIR}"
    INSTALL_RPATH_USE_LINK_PATH ON
  )
install(
  TARGETS
    efpmd
  EXPORT
    "${efp}Targets-exe"
  RUNTIME DESTINATION
    ${CMAKE_INSTALL_BINDIR}
  )
install(
  EXPORT
    "${efp}Targets-exe"
  NAMESPACE
    "${efp}::"
  DESTINATION
    ${LIBEFP_CMAKECONFIG_INSTALL_DIR}
  )
