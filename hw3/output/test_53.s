	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$5, -8(%rbp)
	imulq	$9, -8(%rbp)
	movq	%rbp, %rsp
	popq	%rbp
	movq	-8(%rbp), %rax