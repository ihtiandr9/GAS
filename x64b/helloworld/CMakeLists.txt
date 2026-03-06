project(helloworld
       LANGUAGES ASM C)

##enable_language(ASM)  # или ASM если gas

add_executable(hellomain hellomain.s)
set_target_properties(hellomain PROPERTIES 
    POSITION_INDEPENDENT_CODE OFF 
    LINK_FLAGS "-no-pie"
)
add_executable(hellomain_no_bp_frame hellomain_no_bp_frame.s)
set_target_properties(hellomain_no_bp_frame PROPERTIES 
    POSITION_INDEPENDENT_CODE OFF 
    LINK_FLAGS "-no-pie"
)
add_executable(hellomain_no_bp_frame_stderr hellomain_no_bp_frame_stderr.s)
set_target_properties(hellomain_no_bp_frame_stderr PROPERTIES 
    POSITION_INDEPENDENT_CODE OFF 
    LINK_FLAGS "-no-pie"
)
add_executable(sample sample.c)
