cmake_minimum_required(VERSION 3.10)
cmake_policy(VERSION 3.10)

if (NOT (UNIX))
  message(FATAL_ERROR "unsupported target platform...windows isn't supported yet")
endif()

project(@project_name@)

# languages
enable_language(CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1z -O0 -Wall")

# options
option(BUILD_SHARED_LIBS "Build shared library" ON)
option(BUILD_TESTS "Build Tests" OFF)


if(BUILD_SHARED_LIBS)
    message("BUILD_SHARED_LIBS: ON")
else()
    message("BUILD_SHARED_LIBS: OFF")
endif()

if(BUILD_TESTS)
    enable_testing()
    message("BUILD_TESTS: ON")
else()
    message("BUILD_TESTS: OFF")
endif()

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

set(@PROJECT_NAME@_INSTALL_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/build/include)
set(@PROJECT_NAME@_INSTALL_BIN_DIR ${PROJECT_SOURCE_DIR}/build/bin)
set(@PROJECT_NAME@_INSTALL_LIB_DIR ${PROJECT_SOURCE_DIR}/lib)

set(@PROJECT_NAME@_HEADERS_DIR ${PROJECT_SOURCE_DIR}/src/@project_name@)

include_directories(${@PROJECT_NAME@_INSTALL_INCLUDE_DIR})
include_directories(${@PROJECT_NAME@_HEADERS_DIR})
include_directories(${PROJECT_SOURCE_DIR}/src)

add_subdirectory(src)

if(BUILD_TESTS)
  add_subdirectory(tests)
endif()