	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	jmp	*_end
	.text
_end:
	movq	%rbp, %rsp
	movq	$9, %rax
	popq	%rbp
	retq	