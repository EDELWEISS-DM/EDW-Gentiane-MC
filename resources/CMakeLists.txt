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
  string(REGEX REPLACE "\\.in$" "" _rfout "${_rfin}")
  string(REGEX REPLACE "^${PROJECT_SOURCE_DIR}/resources"
    "${EDWGENTIANEMC_BUILD_DATAROOTDIR}/${EDWGENTIANEMC_RESOURCE_DIR}"
    _rfout "${_rfout}")
  get_filename_component (_rfin_ext ${_rfin} EXT)
  if (_rfin_ext STREQUAL ".in")
    configure_file(${_rfin} ${_rfout} @ONLY)
  else()
    configure_file(${_rfin} ${_rfout} COPYONLY)
  endif()
endforeach()

# - end
