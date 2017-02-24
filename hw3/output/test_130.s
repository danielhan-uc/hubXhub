	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$8, -8(%rbp)
	movq	-32(%rbp), -40(%rbp)
	movq	%rbp, %rsp
	movq	-40(%rbp), %rax
	popq	%rbp
	retq	