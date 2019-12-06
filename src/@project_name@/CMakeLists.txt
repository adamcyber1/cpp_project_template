cmake_minimum_required(VERSION 3.10)
project(@project_name@ CXX)

set(SOURCE_FILES
    @project_name@.h
    @project_name@.cpp
)

add_library(@project_name@ ${SOURCE_FILES})

install(TARGETS @project_name@ DESTINATION ${@PROJECT_NAME@_INSTALL_LIB_DIR})
install(FILES @project_name@.h DESTINATION ${@PROJECT_NAME@_INSTALL_INCLUDE_DIR})
