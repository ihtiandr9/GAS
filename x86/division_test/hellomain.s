.text

.global main

main:
	push	%ebp
	mov	%esp,	%ebp
	xor	%esi, %esi       # address of string to output
	mov	$0xff, %ax
	mov	$10, %bl
divide:	xor	%ah, %ah
	div	%bl
	or	$0x30,%ah
	movb	%ah, bytesa(%esi)
	inc	%esi
	or	%al, %al
	jnz	divide
	leave
        xor	%eax,	%eax
        ret

.data
bytesa:
        .ascii  "Hello"

