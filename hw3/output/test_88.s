	.text
	.globl	_bar
_bar:
	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	%rdi, 24(%rbp)
	movq	%rdi, 16(%rbp)
	movq	%rdi, 8(%rbp)
	pushq	%r8
	movq	%rdi, %r8
	pushq	%r9
	movq	%rdi, %r9
	pushq	%rcx
	movq	%rdi, %rcx
	pushq	%rdx
	movq	%rdi, %rdx
	pushq	%rsi
	movq	%rdi, %rsi
	callq	_bar
	addq	$64, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rdx
	popq	%rcx
	popq	%r9
	popq	%r8
	popq	8(%rbp)
	popq	16(%rbp)
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
	pushq	%rsi
	movq	$3, %rsi
	callq	_foo
	addq	$8, %rsp
	popq	%rdi
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	