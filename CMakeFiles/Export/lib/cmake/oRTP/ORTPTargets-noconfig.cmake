#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ortp" for configuration ""
set_property(TARGET ortp APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(ortp PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libortp.so.11"
  IMPORTED_SONAME_NOCONFIG "libortp.so.11"
  )

list(APPEND _IMPORT_CHECK_TARGETS ortp )
list(APPEND _IMPORT_CHECK_FILES_FOR_ortp "${_IMPORT_PREFIX}/lib/libortp.so.11" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
