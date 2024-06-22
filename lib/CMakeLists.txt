cmake_minimum_required(VERSION 3.10)
project(lib)

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
set(CMAKE_C_STANDARD 11)

include_directories(${CMAKE_SOURCE_DIR}/include)

add_library(lib SHARED lib.c)

target_compile_definitions(lib PRIVATE LIB_EXPORTS)

# Add executable for development
add_executable(lib_dev lib.c)
target_compile_definitions(lib_dev PRIVATE _DEV)
