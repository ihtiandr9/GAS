.text

.global main

main:
	push	%ebp
	mov	%esp,	%ebp
	mov $bytesa, %esi       # address of string to output
	mov	$0xffff, %ax
	mov	$10, %bx
divide:	xor	%dx, %dx
	div	%bx
	or	$0x30,%dx
	movw	%dx, (%esi)
	inc	%esi
	or	%ax, %ax
	jnz	divide
	leave
        xor	%eax,	%eax
        ret

.data
bytesa:
        .ascii  "Hello words"

