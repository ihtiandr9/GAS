project(helloworld
       LANGUAGES ASM C)
add_executable(hellomain hellomain.s)
add_executable(hellomain_no_bp_frame hellomain_no_bp_frame.s)
