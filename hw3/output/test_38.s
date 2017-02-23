	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	movq	-8(%rbp), $5
	imulq	-8(%rbp), $9
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	