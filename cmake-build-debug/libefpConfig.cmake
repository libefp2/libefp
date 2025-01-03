#[=======================================================================[.rst:
libefpConfig.cmake
------------------

libefp cmake module.
This module sets the following variables in your project::

  libefp_FOUND - true if libefp and all required components found on the system
  libefp_VERSION - libefp version in format Major.Minor.Release. Prefer target variable.
  libefp_INCLUDE_DIRS - Directory where efp.h header is located and dependent headers. Prefer targets.
  libefp_INCLUDE_DIR - same as DIRS. Prefer targets.
  libefp_DEFINITIONS - Definitions to indicate libefp is present, namely USING_libefp. Prefer targets.
  libefp_LIBRARIES - libefp library to link against plus any dependent libraries. Prefer targets.
  libefp_LIBRARY - libefp library to link against. Prefer targets
  libefp_FRAGLIB_DIRS - Directories (list of full paths) where EFP fragments are located. Prefer targets.


Target variables::

It is preferred to use properties set on the base target rather than using the above variables. ::

  libefp_VERSION - libefp version in format Major.Minor.Release
  libefp_FRAGLIB_DIRS - Directories (list) where EFP fragments are located. Unlike
                        the plain variable, this target variable contains partial paths.

  get_property(_ver TARGET libefp::efp PROPERTY libefp_VERSION)


Available components::

  shared - search for only shared library
  static - search for only static library
  deep - search for only fragment library where directory structure is layered
  shallow - search for only fragment library where directory structure has been collapsed
  exe - search for executable as well as library


Exported targets::

If libefp is found, this module defines at least the first following
:prop_tgt:`IMPORTED` target. Target is shared _or_ static, so, for both, use
separate, not overlapping, installations. Depending on components available,
it may define::

  libefp::efp - the main libefp library with header & defs attached.
  libefp::efpmd - the efpmd executable program (COMPONENT exe)


Suggested usage::

  find_package(libefp)
  find_package(libefp 1.5.0 EXACT CONFIG REQUIRED COMPONENTS shared)


The following variables can be set to guide the search for this package::

  libefp_DIR - CMake variable, set to directory containing this Config file
  CMAKE_PREFIX_PATH - CMake variable, set to root directory of this package
  PATH - environment variable, set to bin directory of this package
  CMAKE_DISABLE_FIND_PACKAGE_libefp - CMake variable, disables
    find_package(libefp) when not REQUIRED, perhaps to force internal build
#]=======================================================================]


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was libefpConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

set(efp libefp)  # NameSpace

# check library style component
if (OFF)  # BUILD_SHARED_LIBS
    set(${efp}_shared_FOUND 1)
else()
    set(${efp}_static_FOUND 1)
endif()

# check library language component
set(${efp}_C_FOUND 1)

# find fraglibs
if (ON)  # FRAGLIB_DEEP
    set(${efp}_deep_FOUND 1)
else()
    set(${efp}_shallow_FOUND 1)
endif()
string(REGEX REPLACE "([^;]+)" "${PACKAGE_PREFIX_DIR}/share/${efp}/\\1" ${efp}_FRAGLIB_DIRS "fraglib;fraglib/databases")  # FRAGLIB_DATADIRS

# check executable component
if (ON AND EXISTS "${CMAKE_CURRENT_LIST_DIR}/${efp}Targets-exe.cmake")  # LIBEFP_ENABLE_EFPMD
    set(${efp}_exe_FOUND 1)
endif()

# make detectable the FindTarget*.cmake modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})

# check library dependency available
include(CMakeFindDependencyMacro)
if(NOT TARGET tgt::lapack)
    find_dependency(TargetLAPACK)
endif()

# Check all required components are available before trying to load any
check_required_components(${efp})

#-----------------------------------------------------------------------------
# Don't include targets if this file is being picked up by another
# project which has already built this as a subproject
#-----------------------------------------------------------------------------
if(NOT TARGET ${efp}::efp)
    include("${CMAKE_CURRENT_LIST_DIR}/${efp}Targets-C.cmake")

    get_property(_loc TARGET ${efp}::efp PROPERTY INTERFACE_LOCATION)
    get_property(_ill TARGET ${efp}::efp PROPERTY INTERFACE_LINK_LIBRARIES)
    get_property(_iid TARGET ${efp}::efp PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
    get_property(_icd TARGET ${efp}::efp PROPERTY INTERFACE_COMPILE_DEFINITIONS)
    set(${efp}_LIBRARY ${_loc})
    set(${efp}_LIBRARIES ${_loc};${_ill})
    set(${efp}_INCLUDE_DIR ${_iid})
    set(${efp}_INCLUDE_DIRS ${_iid})
    set(${efp}_DEFINITIONS ${_icd})

    if(${efp}_exe_FOUND)
        include("${CMAKE_CURRENT_LIST_DIR}/${efp}Targets-exe.cmake")
    endif()

    if (CMAKE_VERSION VERSION_GREATER 3.15)
        message(VERBOSE "libefp::efp")

        get_property(_ver TARGET ${efp}::efp PROPERTY libefp_VERSION)
        message(VERBOSE "${efp}::efp.${efp}_VERSION   ${_ver}")
        get_property(_dir TARGET ${efp}::efp PROPERTY libefp_FRAGLIB_DIRS)
        message(VERBOSE "${efp}::efp.${efp}_FRAGLIB_DIRS ${_dir}")

        message(VERBOSE "${efp}_FOUND                  ${${efp}_FOUND}")
        message(VERBOSE "${efp}_VERSION                ${${efp}_VERSION}")
        message(VERBOSE "${efp}_DEFINITIONS            ${${efp}_DEFINITIONS}")
        message(VERBOSE "${efp}_FRAGLIB_DIRS           ${${efp}_FRAGLIB_DIRS}")

        message(VERBOSE "${efp}_LIBRARY                ${${efp}_LIBRARY}")
        message(VERBOSE "${efp}_LIBRARIES              ${${efp}_LIBRARIES}")
        message(VERBOSE "${efp}_INCLUDE_DIR            ${${efp}_INCLUDE_DIR}")
        message(VERBOSE "${efp}_INCLUDE_DIRS           ${${efp}_INCLUDE_DIRS}")
    endif()

endif()
