.text

.global main

main:
	pushl	%ebp
	movl	%esp,	%ebp
	subl	$4,	%esp
	leal	message, %eax       # address of string to output
        movl	%eax,	(%esp)
        call	myfunc
        addl    $4, %esp            # not need if leave is next instruction
        leave
        xorl	%eax,	%eax
        ret

myfunc:
        push	%ebp
        movl	%esp, %ebp
        movl	8(%ebp), %eax
	subl	$12, %esp
	movl	$1,  (%esp)
	movl	%eax, 4(%esp)	
	movl	$13, 8(%esp)
	# write(1, message, 13)
        call    write               # invoke operating system to do the write
        leave
	xor	%eax,	%eax
        ret


.data
message:
        .ascii  "Hello, world\n"

