.text

.global main

main:
	sub	$8, %esp
	push	%ebp
	push	%edi
        mov	$message, %edi      # address of string to output
        call    print_str
        mov	$4, %edi
        call	fact
        mov	%eax, 16(%esp)
        mov	$fmt_fact, %edi
        mov	16(%esp), %esi
        xor	%eax, %eax
        call	printf
        # return 0;
        xor	%eax, %eax  # we want return code 0
	pop	%edi
	pop	%ebp
	add	$8, %esp
	ret

print_str:
        # write(1, message, 13)
        sub	 $8, %esp
        push	%ebp
        push	%edi
        mov	%edi, 16(%esp)
        mov	16(%esp),%eax
        mov     $1, %edi                # file handle 1 is stdout
        mov     %eax, %esi
        mov     $13, %edx
        xor	%eax,	%eax
        call    write                     # invoke operating system to do the write
	#return 0;
        xor	%eax,	%eax
	pop	%edi
	pop	%ebp
	add	$8, %esp
        ret

fact:
        # write(1, message, 13)
        sub	$8, %esp
	push	%ebp
        mov	%edi, 8(%esp)
        mov	8(%esp), %eax
        cmp	$0, %eax
        jz	ret1
        jb	err_arg
        mov	%eax,%ecx
cycle1:
        dec	%ecx
        jz	end_counter
        mulw	%cx
        jmp	cycle1
end_counter:
        jmp endif
ret1:
	mov $1, %eax
	jmp endif
err_arg:
	mov $0, %eax
endif:
        pop %ebp
	add $8, %esp
        ret

.data
message:
        .ascii  "Hello, world\n"
fmt_fact:
	.ascii "factorial is %d\n"
