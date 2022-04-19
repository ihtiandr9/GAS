.text

.global main

main:
	sub     $8, %rsp
        push	%rbp
        push    %rdi
        mov	$message, %rdi      # address of string to output
        call    print_str
        mov	$4, %rdi
        call	fact
        mov	%rax, 16(%rsp)
        mov	$fmt_fact, %rdi
        mov	16(%rsp), %rsi
        xor	%rax, %rax
        call	printf
	#return 0;
	xor	%rax,	%rax        # we want return code 0
        pop     %rdi
        pop     %rbp
        add     $8, %rsp
	ret

print_str:
        # write(1, message, 13)
        sub	 $8, %rsp
        push	%rbp
        push    %rdi            
        mov	%rdi, 16(%rsp)        
        mov	16(%rsp),%rax
        mov     $13, %rdx
        mov     %rax, %rsi
        mov     $1, %rdi                # file handle 1 is stdout
        xor	%rax,	%rax
        call    write                     # invoke operating system to do the write
        pop     %rdi
        pop     %rbp
        add     $8, %rsp
        ret

fact:
        # write(1, message, 13)
        sub	 $8, %rsp
        push	%rbp
        mov	%rdi, 8(%rsp)
        mov	8(%rsp), %rax
        cmp	$0, %rax
        jz	ret1
        jb	err_arg
        push    %rdi
        dec	%rax
        mov	%rax, %rdi
        call	fact
        pop     %rdi
        mull	8(%rsp)
        jmp endif
ret1:
	mov $1, %rax
	jmp endif
err_arg:
	mov $0, %rax
endif:
        pop     %rbp
        add     $8, %rsp
        ret

.data
message:
        .ascii  "Hello, world\n"
fmt_fact:
	.ascii "factorial is %d\n"
