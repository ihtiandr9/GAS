cmake_minimum_required(VERSION 3.5)
project(factorial_iterative
       LANGUAGES ASM C)
set(CMAKE_ASM_FLAGS "-ggdb")
add_executable(fact_iter hellomain.s)
add_executable(fact_iter_no_bp hellomain_no_bp_frame.s)
set_target_properties(fact_iter fact_iter_no_bp PROPERTIES
    POSITION_INDEPENDENT_CODE OFF
    LINK_FLAGS "-no-pie"
)
