cmake_minimum_required(VERSION 3.0)
# project_VERSION* variables populated from project(... VERSION x.x.x) string
cmake_policy(SET CMP0048 NEW)

project(libefp VERSION 1.7.2 LANGUAGES C)
set(libefp_AUTHORS "Ilya A. Kaliman, Lori A. Burns, Dmitry Morozov, Carlos H. Borca, Yen (Terri) Bui, Yongbin Kim, Lyudmila V. Slipchenko")
set(libefp_DESCRIPTION "Parallel implementation of the Effective Fragment Potential method")
set(libefp_URL "https://github.com/libefp2/libefp")
set(libefp_LICENSE "BSD 2-clause")

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

################################### Options ####################################
include(psi4OptionsTools)
option_with_default(CMAKE_BUILD_TYPE "Build type" Release)
option_with_print(BUILD_SHARED_LIBS "Build final library as shared, not static" OFF)
option_with_default(BUILD_FPIC "Libraries will be compiled with position independent code" ON)
if((${BUILD_SHARED_LIBS}) AND NOT ${BUILD_FPIC})
    message(FATAL_ERROR "BUILD_SHARED_LIBS ON and BUILD_FPIC OFF are incompatible, as shared library requires position independent code")
endif()
option_with_print(ENABLE_OPENMP "Enable OpenMP parallelization. Psi4 wants OFF" OFF)
option_with_print(ENABLE_GENERIC "Enable mostly static linking in shared library" OFF)
option_with_flags(ENABLE_XHOST "Enable processor-specific optimization" ON "-xHost" "-march=native")
option_with_print(FRAGLIB_UNDERSCORE_L "Installed fragment library has names ending in _L. Psi4 wants OFF" ON)
option_with_print(FRAGLIB_DEEP "Installed fragment libary has hierarchical, not flat, filestructure. Psi4 wants OFF" ON)
option_with_print(INSTALL_DEVEL_HEADERS "Install additional namespaced devel headers beyond convenience efp.h" OFF)

######################### Process & Validate Options ###########################
include(autocmake_safeguards)
include(autocmake_omp)
include(custom_static_library)

find_package(TargetLAPACK REQUIRED)

################################# Main Project #################################
include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(PN ${PROJECT_NAME})

# <<< Build >>>

set(raw_sources_list aidisp.c balance.c clapack.c disp.c efp.c elec.c
                     electerms.c int.c log.c parse.c pol.c poldirect.c
                     stream.c swf.c util.c xr.c)
set(src_prefix "src/")
string(REGEX REPLACE "([^;]+)" "${src_prefix}\\1" sources_list "${raw_sources_list}")

# STATIC/SHARED on below governed by BUILD_SHARED_LIBS
add_library(efp ${sources_list})
set_target_properties(efp PROPERTIES POSITION_INDEPENDENT_CODE ${BUILD_FPIC}
				     COMPILE_FLAGS "-std=c99"
				     SOVERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR})
if(${BUILD_SHARED_LIBS})
    target_link_libraries(efp PRIVATE ${LIBC_INTERJECT})
    if(APPLE)
        set_target_properties(efp PROPERTIES LINK_FLAGS "-undefined dynamic_lookup")
    endif()
endif()
target_link_libraries(efp PRIVATE tgt::lapack)

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

    list(APPEND FRAGLIB_DATADIRS ${_destdir})
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${_destdir}/${_efpfile} ${_destcontents})
endforeach()
list(REMOVE_DUPLICATES FRAGLIB_DATADIRS)

# <<< Install >>>

install(FILES fraglib/makefp.inp
        DESTINATION ${CMAKE_INSTALL_DATADIR}/${PN})
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fraglib
        DESTINATION ${CMAKE_INSTALL_DATADIR}/${PN})

# headers NOT namespace protected
install(FILES ${src_prefix}/efp.h
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
if (INSTALL_DEVEL_HEADERS)
    install(DIRECTORY ${src_prefix}
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PN}
            FILES_MATCHING PATTERN "*.h")
endif()
install(TARGETS efp
        EXPORT "${PN}Targets"
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

# <<< Export Interface >>>

target_compile_definitions(efp INTERFACE USING_${PN})
target_include_directories(efp INTERFACE
                           $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

# <<< Export Config >>>

# GNUInstallDirs "DATADIR" wrong here; CMake search path wants "share".
set(CMAKECONFIG_INSTALL_DIR "share/cmake/${PN}")
configure_package_config_file(cmake/${PN}Config.cmake.in
                              "${CMAKE_CURRENT_BINARY_DIR}/${PN}Config.cmake"
                              INSTALL_DESTINATION ${CMAKECONFIG_INSTALL_DIR})
write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/${PN}ConfigVersion.cmake
                                 VERSION ${${PN}_VERSION}
                                 COMPATIBILITY AnyNewerVersion)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PN}Config.cmake
              ${CMAKE_CURRENT_BINARY_DIR}/${PN}ConfigVersion.cmake
              cmake/FindTargetLAPACK.cmake
        DESTINATION ${CMAKECONFIG_INSTALL_DIR})
install(EXPORT "${PN}Targets"
        NAMESPACE "${PN}::"
        DESTINATION ${CMAKECONFIG_INSTALL_DIR})

# Notes on CMake: CMake builds libefp, the shared or static library,
#   but not efpmd because Psi4 doesn't use it. Also not implemented
#   is testing with CTest. Also, when libefp is
#   compiled statically with OpenMP, will need to compile consuming
#   application with OpenMP, too, or supply link library.
