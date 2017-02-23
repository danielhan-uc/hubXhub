	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$10, -8(%rbp)
	subq	$9, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	