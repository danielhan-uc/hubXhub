	.text
	.globl	main
main:
	retq	
	movq	%rax, -8(%rbp)
	popq	%rbp
	movq	%rsp, %rbp
	movq	-8(%rbp), $10
	subq	$10, $9
	movq	%rbp, %rsp
	pushq	%rbp