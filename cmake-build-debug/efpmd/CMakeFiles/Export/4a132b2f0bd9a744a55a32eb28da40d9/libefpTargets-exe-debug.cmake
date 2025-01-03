#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libefp::efpmd" for configuration "Debug"
set_property(TARGET libefp::efpmd APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libefp::efpmd PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/efpmd"
  )

list(APPEND _cmake_import_check_targets libefp::efpmd )
list(APPEND _cmake_import_check_files_for_libefp::efpmd "${_IMPORT_PREFIX}/bin/efpmd" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
