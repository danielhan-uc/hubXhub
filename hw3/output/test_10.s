	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	jmp	*end
	.text
_end:
	movq	%rbp, %rsp
	movq	$9, %rax
	popq	%rbp
	retq	