	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	movq	-8(%rbp), $1
	orq	-8(%rbp), $0
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	