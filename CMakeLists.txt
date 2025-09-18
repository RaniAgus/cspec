cmake_minimum_required(VERSION 3.11)
project(cspecs VERSION 1.1 DESCRIPTION "Small BDD framework for C")

set(SOURCE_FILES
        cspecs/cspec.h
        cspecs/cspec.c)

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER cspecs/cspec.h)

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.pc.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc"
    @ONLY
)

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Install path prefix" FORCE)
endif()

install(TARGETS cspecs
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/cspecs)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc"
        DESTINATION lib/pkgconfig)
