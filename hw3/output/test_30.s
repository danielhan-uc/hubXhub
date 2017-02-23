	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	andq	$1, $0
	movq	-8(%rbp), $1
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	