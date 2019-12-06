cmake_minimum_required(VERSION 3.10)
project(@project_name@-cli)

add_subdirectory(@project_name@)
set(SOURCE_FILES main.cpp)

add_executable(@project_name@-cli ${SOURCE_FILES})
target_link_libraries(@project_name@-cli @project_name@)
install(TARGETS @project_name@-cli DESTINATION ${@PROJECT_NAME@_INSTALL_BIN_DIR})
