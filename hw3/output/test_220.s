	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
	movq	%rbp, %rsp
	movq	%rdi, %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	pushq	%rdi
	movq	$17, %rdi
	callq	*_foo
	popq	%rdi
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	