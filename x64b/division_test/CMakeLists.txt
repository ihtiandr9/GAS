cmake_minimum_required(VERSION 3.5)
project(helloworld
       LANGUAGES ASM C)
set(CMAKE_C_FLAGS "-ggdb")
set(CMAKE_ASM_FLAGS "-ggdb")
add_executable(division_bytes division_bytes.S)
add_executable(division_words division_words.S)
add_executable(division_c division_c.c)
