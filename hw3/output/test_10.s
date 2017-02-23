	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	subq	$10, $9
	movq	-8(%rbp), $10
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	