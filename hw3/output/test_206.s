	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	addq	$-8, %rsp
	movq	%rsp, -8(%rbp)
	movq	$17, %r10
	movq	%r10, -8(%rbp)
	movq	-8(%rbp), -16(%rbp)
	movq	%rbp, %rsp
	movq	-16(%rbp), %rax
	popq	%rbp
	retq	