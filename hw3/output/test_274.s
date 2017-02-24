	.data
	.globl	_gbl
_gbl:
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.quad	6
	.quad	7
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	movq	$0, %r10
	addq	$0, %r10
	movq	%r10, -8(%rbp)
	leaq	_gbl(%rip), %r10
	addq	$0, %r10
	addq	$8, %r10
	movq	-8(%rbp), %r10
	imulq	$8, %r10
	movq	%r10, -16(%rbp)
	movq	-16(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	%rbp, %rsp
	movq	-24(%rbp), %rax
	popq	%rbp
	retq	