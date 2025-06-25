project(helloworld
       LANGUAGES ASM C)
set(CMAKE_C_FLAGS "-O0 -ggdb -m32")
set(CMAKE_ASM_FLAGS "-O0 -ggdb -m32")
add_executable(hellomain src/hellomain.s)
add_executable(sample src/sample.c)
add_executable(asmvol src/asmvol.c)
