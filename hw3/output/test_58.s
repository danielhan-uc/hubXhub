	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$42, -8(%rbp)
	shrq	$2, -8(%rbp)
	movq	%rbp, %rsp
	popq	%rbp
	movq	-8(%rbp), %rax