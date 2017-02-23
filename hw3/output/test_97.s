	.text
	.globl	main
main:
	movq	$10, -8(%rbp)
	subq	$9, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax