.text

.global main

main:
	push	%ebp
	mov		%esp,	%ebp
	mov		$bytesa, %esi       # address of string to output
	mov		$0xff, %ax
	mov		$10, %bl
divide:
	xor     %ah, %ah
	div		%bl
	or		$0x30,%ah
	movzb	%ah, %dx
	movw    %dx, (%esi)
	inc		%esi
	orb		%al, %al
	jnz	divide
	leave
        xor	%eax,	%eax
        ret

.data
bytesa:
        .ascii  "Hello bytes"

