	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	%rdi, %r10
	addq	%rsi, %r10
	movq	%r10, -16(%rbp)
	movq	-8(%rbp), %r10
	movq	-16(%rbp), %r11
	movq	%r11, (%r10)
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	%rbp, %rsp
	movq	-24(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
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
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	