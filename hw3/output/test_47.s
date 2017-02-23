	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, -8(%rbp)
	xorq	$0, -8(%rbp)
	movq	%rbp, %rsp
	popq	%rbp
	movq	-8(%rbp), %rax
	retq	