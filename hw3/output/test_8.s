	.text
	.globl	main
main:
	retq	
	movq	%rax, -8(%rbp)
	popq	%rbp
	movq	%rsp, %rbp
	movq	-8(%rbp), $42
	sarq	$42, $3
	movq	%rbp, %rsp
	pushq	%rbp