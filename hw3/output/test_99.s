	.text
	.globl	main
main:
	movq	$1, -8(%rbp)
	andq	$0, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax