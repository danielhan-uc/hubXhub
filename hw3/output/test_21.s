	.text
	.globl	main
main:
	retq	
	movq	%rax, -8(%rbp)
	popq	%rbp
	movq	%rsp, %rbp
	movq	-8(%rbp), $1
	andq	$1, $0
	movq	%rbp, %rsp
	pushq	%rbp