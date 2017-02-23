	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$10, -8(%rbp)
	subq	$9, -8(%rbp)
	movq	%rbp, %rsp
	popq	%rbp
	movq	-8(%rbp), %rax