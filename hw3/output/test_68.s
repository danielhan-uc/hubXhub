	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rbp, %rsp
	movq	%rdi, %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	callq	_foo
	addq	$8, %rsp
	popq	%rdi
	movq	%rax, -8(%rbp)
	callq	_foo
	addq	$8, %rsp
	popq	%rdi
	movq	%rax, -16(%rbp)
	movq	%rbp, %rsp
	movq	-16(%rbp), %rax
	popq	%rbp
	retq	