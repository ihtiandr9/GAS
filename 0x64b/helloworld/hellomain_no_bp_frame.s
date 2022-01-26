.text

.global main

main:
	push	%rbp		# callee savereg
	push	%rdi		# caller savereg before call
        mov	$message, %rdi      # address of string to output
        call    myfunc
	pop	%rdi
	xor	%rax,	%rax
	pop	%rbp
	ret
        # exit(0)
        xor     %rdi, %rdi              # we want return code 0
        call    exit                         # invoke operating system to exit
                                        # invoke operating system to exit

myfunc:
        # write(1, message, 13)
        sub	 $8, %rsp
        push	%rbp
        push	%rdi
        mov	%rdi, 16(%rsp)
        mov	16(%rsp),%rax
        mov     $13, %rdx
        mov     %rax, %rsi
        mov     $1, %rdi                # file handle 1 is stdout
        xor	%rax,	%rax
        call    write                     # invoke operating system to do the write
        pop	%rdi
        xor	%rax,%rax
        pop	%rbp
        add	$8, %rsp
        ret


.data
message:
        .ascii  "Hello, world\n"

