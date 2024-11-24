.text

.global main

main:
	push	%rbp
	mov	%rsp, %rbp
	xor	%rsi, %rsi       # address of string to output
	mov	$0xffff, %rax
	mov	$10, %rbx
divide:	xor	%dx, %dx
	div	%bx
	or	$0x30,%dx
	movw	%dx, bytesa(%esi)
	inc	%rsi
	or	%ax, %ax
	jnz	divide
	leave
        xor	%rax, %rax
        ret

.data
bytesa:
        .ascii  "Hello words"

