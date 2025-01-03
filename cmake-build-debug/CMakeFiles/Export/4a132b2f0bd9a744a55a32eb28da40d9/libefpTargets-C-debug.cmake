#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libefp::efp" for configuration "Debug"
set_property(TARGET libefp::efp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libefp::efp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libefp.a"
  )

list(APPEND _cmake_import_check_targets libefp::efp )
list(APPEND _cmake_import_check_files_for_libefp::efp "${_IMPORT_PREFIX}/lib/libefp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
