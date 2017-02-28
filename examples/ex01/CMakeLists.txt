# - Top level CMakeLists.txt for EDW-Gentiane-MC ex01 example program

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project(EDWGentianeMC_ex01)

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

# - Boost
set(Boost_COMPONENTS program_options)
find_package(Boost 1.60 QUIET COMPONENTS ${Boost_COMPONENTS} NO_MODULE)
find_package(Boost 1.60 REQUIRED ${Boost_COMPONENTS})

# - Bayeux :
find_package(Bayeux 3.0.0 REQUIRED)

include_directories(${PROJECT_SOURCE_DIR})
get_target_property(Bayeux_COMPILE_FEATURES Bayeux::Bayeux INTERFACE_COMPILE_FEATURES)
get_target_property(Bayeux_INCLUDE_DIRS Bayeux::Bayeux INTERFACE_INCLUDE_DIRECTORIES)
get_target_property(Bayeux_LINK_LIBRARIES Bayeux::Bayeux INTERFACE_LINK_LIBRARIES)
message(STATUS "Bayeux_COMPILE_FEATURES = '${Bayeux_INTERFACE_COMPILE_FEATURES}'")
message(STATUS "Bayeux_INCLUDE_DIRS     = '${Bayeux_INCLUDE_DIRS}'")
message(STATUS "Bayeux_LINK_LIBRARIES   = '${Bayeux_LINK_LIBRARIES}'")
include_directories(${Bayeux_INCLUDE_DIRS})
add_definitions(-std=c++11)

add_executable(hpge_mcdata_read hpge_mcdata_read.cxx)

target_link_libraries(hpge_mcdata_read
  Bayeux::Bayeux
  Boost::program_options
  )

install ( FILES
    ${PROJECT_BINARY_DIR}/hpge_mcdata_read
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
    PERMISSIONS OWNER_READ OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
  )

# end of CMakeLists.txt
