.text
.code32
.list
.globl call_loader
.globl _astart

_astart:
	jmp start
start:
	xor	%eax, %eax
	lea	aLoaderStarted, %eax
	mov	%eax, %edi
	mov	$1, %esi
	call	fputs
	##println $aLoaderStarted
exit:
	jmp exit
startdata:
.align 4
aLoaderStarted:
	.string "Stage 2"
