.text

.global main

main:
	push	%rbp
	mov	%rsp,	%rbp
	sub	$16,	%rsp
	mov	%rdi,	-8(%rbp)
##        lea     message, %rsi      # address of string to output
        mov	$message, %rdi      # address of string to output
        call    myfunc
	leave
	xor	%rax,	%rax
	ret
        # exit(0)
        xor     %rdi, %rdi              # we want return code 0
        call    exit                         # invoke operating system to exit
                                        # invoke operating system to exit

myfunc:
        # write(1, message, 13)
        push	%rbp
        mov     %rsp, %rbp
        sub	 $32, %rsp
        mov	%rdi, -8(%rbp)
        mov	%rsi, -16(%rbp)
        mov	-8(%rbp),%rax
        mov     $13, %rdx
        mov     %rax, %rsi
        mov     $1, %rdi                # file handle 1 is stdout
        xor	%rax,	%rax
        call    write                     # invoke operating system to do the write
        leave
        ret


.data
message:
        .ascii  "Hello, world\n"

