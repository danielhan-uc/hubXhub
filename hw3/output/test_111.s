	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$8, -8(%rbp)
	movq	%rdi, %r10
	addq	%rsi, %r10
	movq	%r10, -16(%rbp)
	movq	-8(%rbp), -32(%rbp)
	movq	%rbp, %rsp
	movq	-32(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rdi
	movq	$_foo, %rdi
	callq	_ll_callback
	popq	%rdi
	movq	%rax, -8(%rbp)
	pushq	%rdi
	movq	-8(%rbp), %rdi
	callq	_ll_ltoa
	popq	%rdi
	movq	%rax, -16(%rbp)
	pushq	%rdi
	movq	-16(%rbp), %rdi
	callq	_ll_puts
	popq	%rdi
	movq	%rax, -24(%rbp)
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	