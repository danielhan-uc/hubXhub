	.text
	.globl	_bar
_bar:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rdi, %r10
	addq	%rsi, %r10
	movq	%r10, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	pushq	%rdi
	movq	%rdi, %rdi
	pushq	%rsi
	movq	%rdi, %rsi
	callq	*_bar
	popq	%rsi
	popq	%rdi
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
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