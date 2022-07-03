.text

.global main

main:
	push	%rbp
	mov	%rsp,	%rbp
	sub	$32,	%rsp
	mov	%rdi,	-8(%rbp)
##        lea     message, %rsi      # address of string to output
        mov	$message, %rdi      # address of string to output
        call    print_str
        mov	$4, %rdi
        call	fact
        mov	%rax, -16(%rbp)
        mov	$fmt_fact, %rdi
        mov	-16(%rbp), %rsi
        xor	%rax, %rax
        call	printf
	leave
	xor	%rax,	%rax
	ret

#        # exit(0)
#        xor     %rdi, %rdi              # we want return code 0
#        call    exit                         # invoke operating system to exit
#                                        # invoke operating system to exit

print_str:
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

fact:
        # write(1, message, 13)
        push	%rbp
        mov     %rsp, %rbp
        sub	 $32, %rsp
        mov	%rdi, -8(%rbp)
        mov	-8(%rbp), %rax
        cmp	$0, %rax
        jz	ret1
        jb	err_arg
        dec	%rax
        mov	%rax, %rdi
        call	fact
        mull	-8(%rbp)
        jmp endif
ret1:
	mov $1, %rax
	jmp endif
err_arg:
	mov $0, %rax
endif:
        leave
        ret

.data
message:
        .ascii  "Hello, world\n"
fmt_fact:
	.ascii "factorial is %d\n"
