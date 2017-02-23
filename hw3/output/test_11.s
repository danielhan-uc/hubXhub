	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	imulq	$5, $9
	movq	-8(%rbp), $5
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	