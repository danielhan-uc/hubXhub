	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	addq	$-8, %rsp
	movq	%rsp, -8(%rbp)
	movq	-8(%rbp), %r10
	movq	$17, (%r10)
	addq	$-8, %rsp
	movq	%rsp, -16(%rbp)
	movq	-16(%rbp), %r10
	movq	-8(%rbp), (%r10)
	movq	-16(%rbp), %r10
	movq	%r10, -24(%rbp)
	movq	-24(%rbp), %r10
	movq	%r10, -32(%rbp)
	movq	%rbp, %rsp
	movq	-32(%rbp), %rax
	popq	%rbp
	retq	