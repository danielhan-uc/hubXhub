	.text
	.globl	main
main:
	retq	
	movq	%rax, -8(%rbp)
	popq	%rbp
	movq	%rsp, %rbp
	movq	-8(%rbp), $5
	imulq	$5, $9
	movq	%rbp, %rsp
	pushq	%rbp