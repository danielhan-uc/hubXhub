	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	8, -8(%rbp)
	movq	%rbp, %rsp
	movq	$42, %rax
	popq	%rbp
	retq	