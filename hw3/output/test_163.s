	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$8, -8(%rbp)
	movq	-8(%rbp), -24(%rbp)
	movq	%rbp, %rsp
	movq	-24(%rbp), %rax
	popq	%rbp
	retq	