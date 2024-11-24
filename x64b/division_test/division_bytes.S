.text

.global main

main:
	push	%rbp
	mov	%rsp,	%rbp
	xor	%rsi, %rsi       # address of string to output
	mov	$0xff, %rax
	mov	$10, %rbx
divide: xor     %ah, %ah
        div	%bl
	or	$0x30,%ah
        movb	%ah, %dl
        xor     %dh, %dh
        mov     %dx, bytesa(%rsi)
	inc	%rsi
	orb	%al, %al
	jnz	divide
	leave
        xor	%rax, %rax
        ret

.data
bytesa:
        .ascii  "Hello bytes"

