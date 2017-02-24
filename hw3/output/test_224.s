	.text
	.globl	_bar
_bar:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$56, %rsp
	movq	%rdi, %r10
	addq	%rsi, %r10
	movq	%r10, -8(%rbp)
	movq	-8(%rbp), %r10
	addq	%rdx, %r10
	movq	%r10, -16(%rbp)
	movq	-16(%rbp), %r10
	addq	%rcx, %r10
	movq	%r10, -24(%rbp)
	movq	-24(%rbp), %r10
	addq	%r9, %r10
	movq	%r10, -32(%rbp)
	movq	-32(%rbp), %r10
	addq	%r8, %r10
	movq	%r10, -40(%rbp)
	movq	-40(%rbp), %r10
	addq	16(%rbp), %r10
	movq	%r10, -48(%rbp)
	movq	-48(%rbp), %r10
	addq	24(%rbp), %r10
	movq	%r10, -56(%rbp)
	movq	%rbp, %rsp
	movq	-56(%rbp), %rax
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
	pushq	%rdx
	movq	%rdi, %rdx
	pushq	%rcx
	movq	%rdi, %rcx
	pushq	%r9
	movq	%rdi, %r9
	pushq	%r8
	movq	%rdi, %r8
	pushq	%rdi
	pushq	%rdi
	callq	*_bar
	addq	$16, %rsp
	popq	%r8
	popq	%r9
	popq	%rcx
	popq	%rdx
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
	movq	$3, %rdi
	callq	*_foo
	popq	%rdi
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	