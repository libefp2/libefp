#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libefp::efpmd" for configuration "Release"
set_property(TARGET libefp::efpmd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libefp::efpmd PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/efpmd"
  )

list(APPEND _IMPORT_CHECK_TARGETS libefp::efpmd )
list(APPEND _IMPORT_CHECK_FILES_FOR_libefp::efpmd "${_IMPORT_PREFIX}/bin/efpmd" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
