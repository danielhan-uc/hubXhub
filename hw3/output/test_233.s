	.data
	.globl	_gbl
_gbl:
	.quad	12
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	$_gbl, %r10
	movq	%r10, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	