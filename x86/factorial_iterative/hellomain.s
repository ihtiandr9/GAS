.text

.global main

main:
	push	%ebp
	mov	%esp,	%ebp
	sub	$32,	%esp
	mov	%edi,	-8(%ebp)
##        lea     message, %esi      # address of string to output
        mov	$message, %edi      # address of string to output
        call    print_str
        mov	$4, %edi
        call	fact
        mov	%eax, -16(%ebp)
        mov	$fmt_fact, %edi
        mov	-16(%ebp), %esi
        xor	%eax, %eax
        call	printf
	leave
	xor	%eax,	%eax
	ret

#        # exit(0)
#        xor     %rdi, %rdi              # we want return code 0
#        call    exit                         # invoke operating system to exit
#                                        # invoke operating system to exit

print_str:
        # write(1, message, 13)
        push	%ebp
        mov     %esp, %ebp
        sub	 $32, %esp
        mov	%edi, -8(%ebp)
        mov	%esi, -16(%ebp)
        mov	-8(%ebp),%eax
        mov     $13, %edx
        mov     %eax, %esi
        mov     $1, %edi                # file handle 1 is stdout
        xor	%eax,	%eax
        call    write                     # invoke operating system to do the write
        leave
        ret

fact:
        # write(1, message, 13)
        push	%ebp
        mov     %esp, %ebp
        sub	 $32, %esp
        mov	%edi, -8(%ebp)
        mov	%ecx, -16(%ebp)
        mov	-8(%ebp), %eax
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
	mov	-16(%ebp), %ecx
        jmp endif
ret1:
	mov $1, %eax
	jmp endif
err_arg:
	mov $0, %eax
endif:
        leave
        ret

.data
message:
        .ascii  "Hello, world\n"
fmt_fact:
	.ascii "factorial is %d\n"
