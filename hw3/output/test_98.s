	.text
	.globl	main
main:
	movq	$5, -8(%rbp)
	imulq	$9, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax