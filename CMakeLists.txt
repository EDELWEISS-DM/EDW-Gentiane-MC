# - Top level CMakeLists.txt for EDW-Gentiane-MC package

cmake_minimum_required(VERSION 3.3 FATAL_ERROR)
project(EDWGentianeMC LANGUAGES CXX)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(STATUS "${PROJECT_NAME} requires an out-of-source build.")
  message(STATUS "Please remove these files from ${CMAKE_BINARY_DIR} first:")
  message(STATUS "  CMakeCache.txt")
  message(STATUS "  CMakeFiles")
  message(STATUS "Once these files are removed, create a separate directory")
  message(STATUS "and run CMake from there, pointing it to:")
  message(STATUS "  ${CMAKE_SOURCE_DIR}")
  message(FATAL_ERROR "in-source build detected")
endif()

# - Load Custom Modules
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/cmake)

# - Versioning
set(EDWGentianeMC_VERSION_MAJOR 0)
set(EDWGentianeMC_VERSION_MINOR 1)
set(EDWGentianeMC_VERSION_PATCH 0)
set(EDWGentianeMC_VERSION
  "${EDWGentianeMC_VERSION_MAJOR}.${EDWGentianeMC_VERSION_MINOR}.${EDWGentianeMC_VERSION_PATCH}")

#-----------------------------------------------------------------------
# - Standard UNIX Tool install paths, including relative paths for use
# by applications requiring resources
include(GNUInstallDirs)

# - Validate that certain paths are relative, otherwise relocation may fail
foreach(_dir BINDIR LIBDIR INCLUDEDIR DATAROOTDIR)
  if(IS_ABSOLUTE "${CMAKE_INSTALL_${_dir}}")
    message(FATAL_ERROR "Absolute path for CMAKE_INSTALL_${_dir} not allowed")
  endif()
endforeach()

# Resources directories based on name-version subdirs
set(EDWGentianeMC_TAG "EDWGentianeMC-${EDWGentianeMC_VERSION}")

file(RELATIVE_PATH EDWGentianeMC_BINDIR_TO_RESOURCEDIR
  "${CMAKE_INSTALL_FULL_BINDIR}"
  "${CMAKE_INSTALL_FULL_DATAROOTDIR}/${EDWGentianeMC_TAG}"
  )

file(RELATIVE_PATH EDWGentianeMC_CMAKEDIR_TO_INCLUDEDIR
  "${CMAKE_INSTALL_FULL_CMAKEDIR}/${EDWGentianeMC_TAG}"
  "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
  )

file(RELATIVE_PATH EDWGentianeMC_CMAKEDIR_TO_RESOURCEDIR
  "${CMAKE_INSTALL_FULL_CMAKEDIR}/${EDWGentianeMC_TAG}"
  "${CMAKE_INSTALL_FULL_DATAROOTDIR}/${EDWGentianeMC_TAG}"
  )

# message(STATUS "CMAKE_INSTALL_FULL_DATAROOTDIR = '${CMAKE_INSTALL_FULL_DATAROOTDIR}'")
# message(STATUS "EDWGentianeMC_TAG              = '${EDWGentianeMC_TAG}'")
set(EDWGentianeMC_INSTALL_DATAROOTDIR "${CMAKE_INSTALL_FULL_DATAROOTDIR}/${EDWGentianeMC_TAG}")

# Bayeux is the main external dependency
set(EDWGentianeMC_Bayeux_VERSION "3.0")
set(EDWGentianeMC_Bayeux_COMPONENTS "geant4")
message(STATUS "[info] Search for Bayeux with version >= ${EDWGentianeMC_Bayeux_VERSION}...")
find_package(Bayeux ${EDWGentianeMC_Bayeux_VERSION} REQUIRED
  ${EDWGentianeMC_Bayeux_COMPONENTS} )

add_subdirectory(utilities)
add_subdirectory(resources)
# add_subdirectory(source)

# - end of CMakeLists.txt
