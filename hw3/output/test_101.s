	.text
	.globl	main
main:
	movq	$0, -8(%rbp)
	xorq	$0, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax