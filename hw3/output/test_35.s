	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rbp, %rsp
	sarq	$42, $3
	movq	-8(%rbp), $42
	movq	%rsp, %rbp
	popq	%rbp
	movq	%rax, -8(%rbp)
	retq	