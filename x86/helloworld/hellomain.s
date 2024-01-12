.text

.global main

main:
	push	%ebp
	mov	%esp,	%ebp
	sub	$16,	%esp
        lea     message, %eax       # address of string to output
	push	%eax
        call    myfunc
	add     $4, %esp
	leave
	xor	%eax,	%eax
	ret

myfunc:
        push	%ebp
        mov     %esp, %ebp
        mov	8(%ebp), %eax
	push	$13
	push	%eax
	push	$1
	# write(1, message, 13)
        call    write               # invoke operating system to do the write
        leave
	xor	%eax,	%eax
        ret


.data
message:
        .ascii  "Hello, world\n"

