#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libefp::efp" for configuration "Release"
set_property(TARGET libefp::efp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libefp::efp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libefp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libefp::efp )
list(APPEND _IMPORT_CHECK_FILES_FOR_libefp::efp "${_IMPORT_PREFIX}/lib/libefp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
