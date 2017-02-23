	.text
	.globl	main
main:
	movq	$42, -8(%rbp)
	sarq	$3, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax