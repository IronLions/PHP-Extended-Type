# Version 3.10 for real.
# I just don't want you to use this file for compiling.
# Please us `make` to compile, not this file.
cmake_minimum_required(VERSION 9.10)
project(PHP_Extened_Type)
set(CMAKE_CXX_STANDARD 11)
set(SOURCE_FILES lib/framework)
add_executable(PHP_Extened_Type main.cpp)