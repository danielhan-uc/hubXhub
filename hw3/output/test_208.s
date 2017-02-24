	.data
	.globl	gbl
gbl:
	.quad	12
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	$gbl, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	