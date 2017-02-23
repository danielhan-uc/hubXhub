	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	shrq	$42, $2
	movq	-8(%rbp), $42
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	