.text
.code32
.list
.globl call_loader
.globl _start

_start:
	jmp start
start:
	xor	%eax, %eax
	lea	aLoaderStarted, %eax
	mov	%eax, %esi
	mov	$1, %edi
	call	fputs
	##println $aLoaderStarted
exit:
	jmp exit
startdata:
.align 4
aLoaderStarted:
	.string "Stage 2"
