cmake_minimum_required(VERSION 3.11)
project(cspecs VERSION 1.1 DESCRIPTION "Small BDD framework for C")

set(SOURCE_FILES
        "${PROJECT_NAME}/cspec.h"
        "${PROJECT_NAME}/cspec.c")

add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${PROJECT_NAME}/cspec.h")

include(GNUInstallDirs)

configure_file(
    "${PROJECT_NAME}.pc.in"
    "${PROJECT_NAME}.pc"
    @ONLY
)

install(TARGETS "${PROJECT_NAME}"
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc"
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
