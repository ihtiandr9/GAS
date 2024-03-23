project(gas ASM C)
add_executable(hellomain
		src/hellomain.s
	      )
add_custom_target(sample_asm
		COMMAND gcc -S -o sample.c.s ../src/sample.c
		)
add_executable(sample
		src/sample.c
	      )
add_dependencies(sample
		sample_asm
		)
