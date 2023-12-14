#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libefp::efp" for configuration "Debug"
set_property(TARGET libefp::efp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(libefp::efp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib64/libefp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libefp::efp )
list(APPEND _IMPORT_CHECK_FILES_FOR_libefp::efp "${_IMPORT_PREFIX}/lib64/libefp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
