.text

.global main

main:
	push	%rbp		# callee savereg
	push	%rdi		# caller savereg before call
        mov	$message, %rdi      # address of string to output
        call    myfunc
	pop	%rdi
	xor	%rax,	%rax    # we want return code 0
	pop	%rbp
	ret

myfunc:
        # write(1, message, 13)
        sub	 $24, %rsp
        push	%rbp
        push	%rdi
        mov	%rdi, 16(%rsp)
        mov	16(%rsp),%rax
        mov     $13, %rdx
        mov     %rax, %rsi
        mov     $2, %rdi                # file handle 2 is stderr
        xor	%rax,	%rax
        call    write                     # invoke operating system to do the write
        pop	%rdi
        xor	%rax,%rax
        pop	%rbp
        add	$24, %rsp
        ret


.data
message:
        .ascii  "Hello, world\n"

