	.text
	.globl	_baz
_baz:
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
	pushq	%rdi
	movq	-8(%rbp), %rdi
	pushq	%rsi
	movq	-16(%rbp), %rsi
	pushq	%rdx
	movq	-24(%rbp), %rdx
	pushq	%rcx
	movq	-32(%rbp), %rcx
	pushq	%r9
	movq	%r9, %r9
	pushq	%r8
	movq	%r8, %r8
	movq	24(%rbp), 24(%rbp)
	movq	16(%rbp), 16(%rbp)
	callq	_baz
	addq	$64, %rsp
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %r10
	addq	%r8, %r10
	movq	%r10, -48(%rbp)
	movq	-48(%rbp), %r10
	addq	16(%rbp), %r10
	movq	%r10, -56(%rbp)
	movq	-56(%rbp), %r10
	addq	24(%rbp), %r10
	movq	%r10, -64(%rbp)
	movq	-64(%rbp), %r10
	addq	-40(%rbp), %r10
	movq	%r10, -72(%rbp)
	movq	%rbp, %rsp
	movq	-72(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
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
	movq	%rdi, 24(%rbp)
	movq	%rdi, 16(%rbp)
	callq	_bar
	addq	$64, %rsp
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
	pushq	%rdi
	movq	$1, %rdi
	callq	_foo
	addq	$8, %rsp
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	