
if(NOT DEFINED torch_switch)
    if(DEFINED ENV{TORCH_SWITCH})
        set(torch_switch $ENV{TORCH_SWITCH})
    else()
        set(torch_switch OFF)
    endif()
endif()

option(torch_switch "Enable Torch library integration" ${TORCH_SWITCH})

if(torch_switch)
    add_definitions(-DTORCH_SWITCH)
endif()

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

if(torch_switch)
 find_package(Torch REQUIRED)
 add_library(ctorch OBJECT torch/c_libtorch.cc)
endif()

if(torch_switch)
  message(STATUS "Torch integration enabled.")
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
else()
  message(STATUS "Torch integration disabled.") 
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
  )
endif()
 
#set(TORCH_INCLUDE_DIRS "/depot/lslipche/data/skp/libtorch/include/;/depot/lslipche/data/skp/libtorch/include/torch/csrc/api/include")

set(TORCH_INCLUDE_DIRS "$ENV{LIBTORCH_INCLUDE_DIRS}" CACHE PATH "Torch include directories")

if(torch_switch)
  message("TORCH_INSTALL_PREFIX =  ${TORCH_INSTALL_PREFIX}")
  message("TORCH_LIBRARIES =  ${TORCH_LIBRARIES}")
  message("TORCH_INCLUDE_DIRS =  ${TORCH_INCLUDE_DIRS}")
endif()

set_target_properties(efpmd PROPERTIES
  CXX_STANDARD 14
  CXX_STANDARD_REQUIRED YES
)

if(torch_switch)
  target_include_directories(
  ctorch
  PRIVATE
    ${TORCH_INCLUDE_DIRS}
  )
endif()

if(torch_switch)
  target_include_directories(
  efpmd
  PRIVATE
    libff/
    libopt/
    ../src/
    ctorch/
    ${TORCH_INCLUDE_DIRS}
  )
else()
  target_include_directories(
  efpmd
  PRIVATE
    libff/
    libopt/
    ../src/
  )
endif()

if(torch_switch)
  target_link_libraries(
  ctorch
  PUBLIC
    "${TORCH_LIBRARIES}"
  )
endif()

if(torch_switch)
  target_link_libraries(
  efpmd
  PUBLIC
    ${efp}::efp
    ctorch
    "${TORCH_LIBRARIES}"
  PRIVATE
    libff
    libopt
  )
else()
  target_link_libraries(
  efpmd
  PUBLIC
    ${efp}::efp
  PRIVATE
    libff
    libopt
  )
endif()


target_compile_definitions(
  efpmd
  PRIVATE
    $<BUILD_INTERFACE:FRAGLIB_PATH="/../fraglib">
    $<INSTALL_INTERFACE:FRAGLIB_PATH="${CMAKE_INSTALL_DATADIR}/${efp}/fraglib">
    $<BUILD_INTERFACE:ML_PATH="../nnlib/">
#    $<INSTALL_INTERFACE:ML_PATH="${CMAKE_INSTALL_DATADIR}/${efp}/nnlib">
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

