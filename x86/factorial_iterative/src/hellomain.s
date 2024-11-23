.text

.global main

main:
	push	%ebp
	mov	%esp,	%ebp
	lea     message, %eax		# eax => message
        push	%eax
	call    print_str
        add	$4, %esp
	mov	$4, %eax
	push	%eax
        call	fact
        add	$4, %esp
	push	%eax
        lea	fmt_fact, %eax
        push	%eax
        call	printf
	leave
	xor	%eax,	%eax
	ret

print_str:
        # write(1, message, 13)
        push	%ebp
        mov     %esp, %ebp
        push	$13
        mov     8(%ebp), %eax
        push	%eax
	push	$1			# file handle 1 is stdout
        call    write                     # invoke operating system to do the write
        leave
        ret

fact:
        # write(1, message, 13)
        push	%ebp
        mov     %esp, %ebp
	mov	8(%ebp), %eax
	cmp	$0, %eax
        jz	ret1$
        jb	err_arg$
        mov	%eax,%ecx
cycle1$:
        dec	%ecx
        jz	endif$
        mul	%ecx
        jmp	cycle1$
        jmp endif$
ret1$:
	mov $1, %eax
	jmp endif$
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
