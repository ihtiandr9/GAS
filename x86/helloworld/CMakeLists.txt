project(gas ASM C)

add_definitions(-ggdb -m32)

add_executable(hellomain
		src/hellomain.s
	      )
add_custom_target(sample_asm
		COMMAND gcc -m32 -S -o sample.c.s ../src/sample.c
		)
add_executable(sample
		src/sample.c
	      )
add_dependencies(sample
		sample_asm
		)
