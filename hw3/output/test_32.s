	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	xorq	$0, $0
	movq	-8(%rbp), $0
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	