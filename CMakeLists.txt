cmake_minimum_required(VERSION 3.16)
if (POLICY CMP0135)
	cmake_policy(SET CMP0135 NEW)
endif ()

# extract project version from source

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

file(STRINGS "src/efp.h" _src_efp_h REGEX "LIBEFP_VERSION_STRING")

if (${_src_efp_h} MATCHES "^#define LIBEFP_VERSION_STRING \"(.*)\"$")
    set(_libefp_VERSION ${CMAKE_MATCH_1})
endif()

project(
  libefp
  # someday when Makefile dropped, configure efp.h.in from cmake
  VERSION ${_libefp_VERSION}
  LANGUAGES C CXX
  )

#set(CMAKE_INSTALL_PREFIX "$ENV{LIBEFP_DIR}" CACHE PATH "Installation directory" FORCE)
#set(CMAKE_INSTALL_PREFIX "${LIBEFP_DIR}" CACHE PATH "Installation directory")

### LVS needs this on MacOS silicon
set(CMAKE_CXX_STANDARD 17)

set(libefp_AUTHORS "Ilya A. Kaliman, Lori A. Burns, Suranjan Paul, Dmitry Morozov, Carlos H. Borca, Yen (Terri) Bui, Yongbin Kim, Lyudmila V. Slipchenko")
set(libefp_DESCRIPTION "Parallel implementation of the Effective Fragment Potential method")
set(libefp_URL "https://github.com/libefp2/libefp")
set(libefp_LICENSE "BSD 2-clause")

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

set(efp libefp)  # Namespace


# TODO: Remove when requiring cmake >= 3.21  # from LecrisUT/CMake-Template
if (NOT DEFINED ${efp}_IS_TOP_LEVEL)
    if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
        set(PROJECT_IS_TOP_LEVEL ON)
    else ()
        set(PROJECT_IS_TOP_LEVEL OFF)
    endif ()
    set(${efp}_IS_TOP_LEVEL ${PROJECT_IS_TOP_LEVEL})
endif ()

################################### Options ####################################
include(psi4OptionsTools)
if (${efp}_IS_TOP_LEVEL)
    if (DEFINED ENABLE_OPENMP)
        message(FATAL_ERROR "Use LIBEFP_ENABLE_OPENMP instead of ENABLE_OPENMP.")
    endif()
    if (DEFINED FRAGLIB_UNDERSCORE_L)
        message(WARNING "Using FRAGLIB_UNDERSCORE_L=OFF is deprecated and may be removed as soon as v1.10. Please adapt your fragment search to handle name and name_L.")
    endif()
    if (DEFINED FRAGLIB_DEEP)
        message(WARNING "Using FRAGLIB_DEEP=OFF is deprecated and may be removed as soon as v1.10. Please adapt your fraglib library usage to handle a list of paths.")
    endif()
endif()

option_with_default(CMAKE_BUILD_TYPE "Build type" Release)
option_with_print(BUILD_SHARED_LIBS "Build final library as shared, not static" OFF)
option_with_default(BUILD_FPIC "Libraries will be compiled with position independent code" ON)
if((${BUILD_SHARED_LIBS}) AND NOT ${BUILD_FPIC})
    message(FATAL_ERROR "BUILD_SHARED_LIBS ON and BUILD_FPIC OFF are incompatible, as shared library requires position independent code")
endif()

### This option turns OPENMP ON and OFF!
option_with_print(LIBEFP_ENABLE_OPENMP "Enable OpenMP parallelization. Psi4 wants OFF" ON)

option_with_print(ENABLE_GENERIC "Enable mostly static linking in shared library" OFF)
include(xhost)  # defines: option(ENABLE_XHOST "Enable processor-specific optimization" ON)
option_with_print(FRAGLIB_UNDERSCORE_L "DEPRECATED: Installed fragment library has names ending in _L. Psi4 wants OFF" ON)
option_with_print(FRAGLIB_DEEP "DEPRECATED: Installed fragment libary has hierarchical, not flat, filestructure. Psi4 wants OFF" ON)
option_with_print(INSTALL_DEVEL_HEADERS "Install additional namespaced devel headers beyond convenience efp.h" OFF)
option_with_default(LIBEFP_CMAKECONFIG_INSTALL_DIR "Directory within CMAKE_INSTALL_PREFIX to which CMake configuration files installed" "share/cmake/libefp")
option_with_print(LIBEFP_ENABLE_EFPMD "Build standalone efpmd executable (requires Fortran). This also enables testing" ON)

option_with_default(PYMOD_INSTALL_LIBDIR "If LIBEFP_ENABLE_PYTHON, location within CMAKE_INSTALL_LIBDIR to which python modules are installed" /)
option_with_print(LIBEFP_ENABLE_PYTHON "Build Python bindings (requires CXX, Python, and Pybind11)" OFF)

######################### Process & Validate Options ###########################
include(autocmake_safeguards)
include(custom_static_library)

if (LIBEFP_ENABLE_OPENMP)
    if (CMAKE_C_COMPILER_ID STREQUAL "IntelLLVM")
        message(WARNING "CMake v3.28 doesn't find OpenMP C language for IntelLLVM (icx), so configure will likely fail. Rerun with `-D LIBEFP_ENABLE_OPENMP=OFF` or pass flags in CMAKE_C_FLAGS.")
    endif()

    find_package(OpenMP REQUIRED COMPONENTS C)
endif()

# for MKL serial, this is recommended:
# set(BLA_VENDOR Intel10_64lp_seq)
find_package(TargetLAPACK REQUIRED)

################################# Main Project #################################
include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

# <<< Build >>>

# fragment library
set(FRAGLIB_DATADIRS "")
file(GLOB_RECURSE _dotefps RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "fraglib/*.efp")
foreach(_dotefp ${_dotefps})
    get_filename_component(_efpdir ${_dotefp} DIRECTORY)
    get_filename_component(_efpfile ${_dotefp} NAME)
    file(READ ${_dotefp} _strefpL)
    string(REPLACE "_L" "" _strefp ${_strefpL})

    if(FRAGLIB_DEEP)
        set(_destdir ${_efpdir})
    else()
        set(_destdir fraglib)
    endif()
    if(FRAGLIB_UNDERSCORE_L)
        set(_destcontents ${_strefpL})
    else()
        set(_destcontents ${_strefp})
    endif()

    list(APPEND FRAGLIB_DATADIRS "${_destdir}")
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${_destdir}/${_efpfile} ${_destcontents})
endforeach()
list(REMOVE_DUPLICATES FRAGLIB_DATADIRS)

# libefp C library
set(raw_sources_list
  aidisp.c
  balance.c
  clapack.c
  disp.c
  efp.c
  elec.c
  electerms.c
  int.c
  log.c
  parse.c
  pol.c
  poldirect.c
  stream.c
  swf.c
  util.c
  xr.c
  )

set(src_prefix "src/")
string(REGEX REPLACE "([^;]+)" "${src_prefix}\\1" sources_list "${raw_sources_list}")

if (CMAKE_C_COMPILER_ID STREQUAL "IntelLLVM")
    # Linux+icx: without this, many efpmd tests produce wrong answers
    set_source_files_properties(
      src/elec.c
      src/util.c
      PROPERTIES
        COMPILE_OPTIONS "-O0"
      )
endif()

set(export_properties
  "${efp}_VERSION"
  "${efp}_FRAGLIB_DIRS"
  )

# STATIC/SHARED on below governed by BUILD_SHARED_LIBS
add_library(efp ${sources_list})
add_library(${efp}::efp ALIAS efp)
set_target_properties(efp
  PROPERTIES
    POSITION_INDEPENDENT_CODE ${BUILD_FPIC}
    C_STANDARD 99
    C_STANDARD_REQUIRED ON
    C_EXTENSIONS OFF
    SOVERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    OUTPUT_NAME "efp"
    EXPORT_NAME "efp"
    ${efp}_VERSION ${${efp}_VERSION}
    ${efp}_FRAGLIB_DIRS "${FRAGLIB_DATADIRS}"
  )
set_property(TARGET efp APPEND PROPERTY EXPORT_PROPERTIES "${export_properties}")

if(${BUILD_SHARED_LIBS})
    target_link_libraries(efp PRIVATE ${LIBC_INTERJECT})
    if(APPLE)
        set_target_properties(efp PROPERTIES LINK_FLAGS "-undefined dynamic_lookup")
    endif()
endif()
target_link_libraries(
  efp
  PUBLIC
    tgt::lapack
    $<$<TARGET_EXISTS:OpenMP::OpenMP_C>:OpenMP::OpenMP_C>
  )

# pylibefp bindings
if (LIBEFP_ENABLE_PYTHON)
    enable_language(CXX)
    add_subdirectory(python)
endif()

# efpmd executable
if (LIBEFP_ENABLE_EFPMD)
    # needed to link the Fortran routines in libff into the efpmd executable
    enable_language(Fortran)
    add_subdirectory(efpmd)

    enable_testing()
    add_subdirectory(tests)
endif()

# <<< Install >>>

install(FILES fraglib/makefp.inp
        DESTINATION ${CMAKE_INSTALL_DATADIR}/${efp})
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fraglib
        DESTINATION ${CMAKE_INSTALL_DATADIR}/${efp})

install(DIRECTORY ${PROJECT_SOURCE_DIR}/nnlib
        DESTINATION ${CMAKE_INSTALL_DATADIR}/${efp})

# headers NOT namespace protected
install(FILES ${src_prefix}/efp.h
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
if (INSTALL_DEVEL_HEADERS)
    install(DIRECTORY ${src_prefix}
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${efp}
            FILES_MATCHING PATTERN "*.h")
endif()
install(TARGETS efp
        EXPORT "${efp}Targets-C"
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

# <<< Export Interface >>>

target_compile_definitions(efp INTERFACE USING_${efp})
target_include_directories(efp INTERFACE
                           $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

# <<< Export Config >>>

configure_package_config_file(
  cmake/${efp}Config.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/${efp}Config.cmake"
  INSTALL_DESTINATION ${LIBEFP_CMAKECONFIG_INSTALL_DIR}
  )
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/${efp}ConfigVersion.cmake
  VERSION ${${efp}_VERSION}
  COMPATIBILITY SameMinorVersion
  )
install(
  FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${efp}Config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/${efp}ConfigVersion.cmake
    cmake/FindTargetLAPACK.cmake
  DESTINATION
    ${LIBEFP_CMAKECONFIG_INSTALL_DIR}
  )
install(
  EXPORT
    "${efp}Targets-C"
  NAMESPACE
    "${efp}::"
  DESTINATION
    ${LIBEFP_CMAKECONFIG_INSTALL_DIR}
  )
