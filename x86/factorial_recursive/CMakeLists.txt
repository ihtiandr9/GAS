project(helloworld
       LANGUAGES ASM C)
set(CMAKE_C_FLAGS "-O0 -ggdb -m32")
set(CMAKE_ASM_FLAGS "-O0 -ggdb -m32")
add_executable(hellomain src/hellomain.s)
