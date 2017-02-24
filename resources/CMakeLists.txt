# - Package resource files as needed
# Because there are many resources, use a script based GLOB to locate
# them together with a custom target to rebuild the resources
#

add_custom_target(edw_gentiane_mc_resources
  COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/_BuildResourceList.sh
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  COMMENT "Bundling EDW-Gentiane-MC Resources"
  )

include(_resources.cmake)
foreach(_rfin ${EDWGentianeMC_RESOURCES})
  message(STATUS "Resource in file  = '${_rfin}'")
  string(REGEX REPLACE "\\.in$" "" _rfout "${_rfin}")
  string(REGEX REPLACE "^${PROJECT_SOURCE_DIR}/resources"
    "${CMAKE_CURRENT_BINARY_DIR}/resources"
    _rfout "${_rfout}")
  message(STATUS "Resource out file = '${_rfout}'")
  get_filename_component (_rfin_ext ${_rfin} EXT)
  if (_rfin_ext STREQUAL ".in")
    configure_file(${_rfin} ${_rfout} @ONLY)
  else()
    configure_file(${_rfin} ${_rfout} COPYONLY)
  endif()
endforeach()

install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/resources"
  DESTINATION "${EDWGentianeMC_INSTALL_DATAROOTDIR}"
  FILE_PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
  DIRECTORY_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
  GROUP_READ GROUP_EXECUTE
  WORLD_READ WORLD_EXECUTE)

# - end
