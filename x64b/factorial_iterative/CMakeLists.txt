project(helloworld
       LANGUAGES ASM C)
set(C_FLAGS -ggdb --no-pie)
add_executable(hellomain hellomain.s)
add_executable(hellomain_no_bp_frame hellomain_no_bp_frame.s)
