.text

.global main

main:
	push	%ebp
	mov	%esp,	%ebp
	# print_str(messsage)
        lea     message, %eax		# eax => message
	push	%eax
        call    print_str
        add	$4, %esp
	push	$4
        call	fact
	add	$4, %esp		# eax = factorial
	
	#  printf(fmt_fact, factorial)
	push	%eax
        lea	fmt_fact, %eax		# eax => fmt_fact
	push	%eax
	call	printf
	
	add	$8, %esp
	leave
	xor	%eax,	%eax
	ret

print_str:
        # write(1, message, 13)
        push	%ebp
        mov     %esp, %ebp
        mov	8(%ebp),%eax
	push	$13
	push	%eax
	push	$1
        call    write                     # invoke operating system to do the write
        leave
        ret

fact:
        push	%ebp
        mov     %esp, %ebp
        sub	$16, %esp
        mov	8(%ebp), %eax
        cmp	$0, %eax
        jz	ret1$
        jb	err_arg$
        dec	%eax
	push	%eax
        call	fact
        mull	8(%ebp)
        jmp	endif$
ret1$:
	mov $1, %eax
	jmp	endif$
err_arg$:
	mov $0, %eax
endif$:
        leave
        ret

.data
message:
        .ascii  "Hello, world\n"
fmt_fact:
	.ascii "factorial is %d\n"
