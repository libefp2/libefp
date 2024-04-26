if (CMAKE_HOST_WIN32)
    cmake_minimum_required(VERSION 3.21)
else()
    cmake_minimum_required(VERSION 3.16)
endif()
if (POLICY CMP0135)
	cmake_policy(SET CMP0135 NEW)
endif ()

if(NOT DEFINED libefp_VERSION)
    # for indep bld of project(pylibefp), version not available from project(libefp)
    # extract project version from source
    file(STRINGS "../src/efp.h" _src_efp_h REGEX "LIBEFP_VERSION_STRING")
    if (${_src_efp_h} MATCHES "^#define LIBEFP_VERSION_STRING \"(.*)\"$")
        set(libefp_VERSION ${CMAKE_MATCH_1})
    endif()
endif()

project(
  pylibefp
  VERSION ${libefp_VERSION}
  LANGUAGES CXX
  )

##  <<  Pybind11 & Python  >>


list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake)

include(psi4OptionsTools)
option_with_default(CMAKE_BUILD_TYPE "Build type (Release or Debug)" Release)
option_with_default(PYMOD_INSTALL_LIBDIR "Location within CMAKE_INSTALL_LIBDIR to which python modules are installed" /)
option_with_default(LIBEFP_CMAKECONFIG_INSTALL_DIR "Directory to which libefp CMake config files installed." share/cmake/libefp)

include(GNUInstallDirs)
include(autocmake_safeguards)


if (NOT TARGET Python::Module)
    find_package(Python 3.6 COMPONENTS Interpreter Development REQUIRED)
    message(STATUS "Using Python ${Python_VERSION_MAJOR}.${Python_VERSION_MINOR}: ${Python_EXECUTABLE}")
endif()

find_package(pybind11 2.11 CONFIG)
if (NOT TARGET pybind11::pybind11)
    message(STATUS "Suitable pybind11 could not be located, building pybind11 instead.")

    include(FetchContent)
    FetchContent_Declare(
      pybind11
      URL https://github.com/pybind/pybind11/archive/v2.11.1.tar.gz
      URL_HASH SHA256=d475978da0cdc2d43b73f30910786759d593a9d8ee05b1b6846d1eb16c6d2e0c
      # FIND_PACKAGE_ARGS 2.11 CONFIG  # CMake 3.24 integrates find_package() call above into FC_Declare
      )

    FetchContent_MakeAvailable(pybind11)
    set(pybind11_VERSION "2.11.1")  # getting the fetched version isn't reliable, so sync explicitly from tag above
endif()
message(STATUS "Using pybind11: ${pybind11_INCLUDE_DIR} (version ${pybind11_VERSION} for Py${Python_VERSION} and ${CMAKE_CXX_STANDARD})")

if (TARGET libefp::efp)
    # pylibefp from libefp project

    get_property(_dir TARGET ${efp}::efp PROPERTY libefp_FRAGLIB_DIRS)
    get_property(_loc TARGET ${efp}::efp PROPERTY INTERFACE_LOCATION)
else()
    # C lib already installed
    #find_package(libefp COMPONENTS C REQUIRED)  # TODO fix this needs to work rather than line below
    find_package(libefp REQUIRED)
    get_property(_loc TARGET libefp::efp PROPERTY INTERFACE_LOCATION)
    get_filename_component(_dloc ${_loc} DIRECTORY)
endif()
message(STATUS "Using libefp: ${_loc} (version ${libefp_VERSION})")


if (APPLE)
    set(base "@loader_path")
else()
    set(base "$ORIGIN")
endif()
file(RELATIVE_PATH relDir ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}${PYMOD_INSTALL_LIBDIR}/pylibefp
                          ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_INSTALL_RPATH ${base} ${base}/${relDir} ${_dloc})

message(STATUS "pylibefp rpath: ${CMAKE_INSTALL_RPATH}")

pybind11_add_module(
  pylibefp
  MODULE
    core.cc
  )

target_include_directories(
  pylibefp
  PRIVATE
    ../src
  )

#if (LIBEFP_ENABLE_OPENMP)
if (NOT (CMAKE_CXX_COMPILER_ID STREQUAL "IntelLLVM"))
    find_package(OpenMP REQUIRED COMPONENTS CXX)
endif()

if (CMAKE_CXX_COMPILER_ID STREQUAL "IntelLLVM")
target_link_libraries(
  pylibefp
  PRIVATE
    libefp::efp
  )
else()
target_link_libraries(
  pylibefp
  PRIVATE
    libefp::efp
    OpenMP::OpenMP_CXX
  )
endif()

install(
  TARGETS pylibefp
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}${PYMOD_INSTALL_LIBDIR}/pylibefp
  )

set_target_properties(
  pylibefp
  PROPERTIES
    OUTPUT_NAME core
#                           EXPORT_NAME core
#                           INSTALL_RPATH "${psi4_RPATH}"
    INSTALL_RPATH "${CMAKE_INSTALL_RPATH}"
#                           BUILD_WITH_INSTALL_RPATH ON)
  )

# <<<  Install  >>>

configure_file(
  __init__.py
  __init__.py
  @ONLY)
configure_file(
  wrapper.py
  wrapper.py
  @ONLY)
install(
  FILES
    ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    ${CMAKE_CURRENT_BINARY_DIR}/wrapper.py
  DESTINATION ${CMAKE_INSTALL_LIBDIR}${PYMOD_INSTALL_LIBDIR}/pylibefp
  )

install(
  FILES
    extras.py
    exceptions.py
  DESTINATION ${CMAKE_INSTALL_LIBDIR}${PYMOD_INSTALL_LIBDIR}/pylibefp
  )

install(
  DIRECTORY
    ../tests/pytests/
  DESTINATION ${CMAKE_INSTALL_LIBDIR}${PYMOD_INSTALL_LIBDIR}/pylibefp/tests/
  FILES_MATCHING
    PATTERN "test_*.py"
    PATTERN "addons.py"
    PATTERN "conftest.py"
    PATTERN "systems.py"
    PATTERN "__pycache__" EXCLUDE
    PATTERN "*pyc" EXCLUDE
    PATTERN "test_libefp.py" EXCLUDE  # until xr_cutoff resolved
    PATTERN "test_opts.py" EXCLUDE  # until xr_cutoff resolved
  )

