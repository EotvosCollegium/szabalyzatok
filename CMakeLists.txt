cmake_minimum_required(VERSION 3.0)

include(.cmake/UseLATEX.cmake)
include(.cmake/helper.cmake)

project(szabalyzatok)

add_subdirectory(CHOK)
add_subdirectory(CTSzK)
add_subdirectory(FONAL)

# TODO: add missing tex file
# add_subdirectory(Hazirend)

add_subdirectory(Muhelyek)

# TODO: add missing tex file
# add_subdirectory(SzMSz)
