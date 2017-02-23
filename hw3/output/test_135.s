	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$1, -8(%rbp)
	andq	$0, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax