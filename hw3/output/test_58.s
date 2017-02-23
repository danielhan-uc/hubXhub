	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rbp, %rsp
	movq	$42, %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	callq	*_foo
	addq	$0, %rsp
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	