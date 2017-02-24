	.text
	.globl	_one_iteration
_one_iteration:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$72, %rsp
	movq	%rdi, %r10
	shlq	$1, %r10
	movq	%r10, -8(%rbp)
	movq	%rdi, %r10
	xorq	-8(%rbp), %r10
	movq	%r10, -16(%rbp)
	movq	-8(%rbp), %r10
	shlq	$2, %r10
	movq	%r10, -24(%rbp)
	movq	-16(%rbp), %r10
	xorq	-24(%rbp), %r10
	movq	%r10, -32(%rbp)
	movq	-24(%rbp), %r10
	shlq	$1, %r10
	movq	%r10, -40(%rbp)
	movq	-32(%rbp), %r10
	xorq	-40(%rbp), %r10
	movq	%r10, -48(%rbp)
	movq	-48(%rbp), %r10
	shrq	$63, %r10
	movq	%r10, -56(%rbp)
	movq	-56(%rbp), %r10
	andq	$1, %r10
	movq	%r10, -64(%rbp)
	movq	-48(%rbp), %r10
	orq	-64(%rbp), %r10
	movq	%r10, -72(%rbp)
	movq	%rbp, %rsp
	movq	-72(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	-8(%rbp), %r10
	movq	$1, %r11
	movq	%r11, (%r10)
	movq	$12, %r10
	addq	$0, %r10
	movq	%r10, -16(%rbp)
	cmpq	$1, $1
	je	_loop
	jmp	_loop
	.text
_loop:
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	-24(%rbp), %r10
	addq	$1, %r10
	movq	%r10, -32(%rbp)
	movq	-8(%rbp), %r10
	movq	-32(%rbp), %r11
	movq	%r11, (%r10)
	pushq	%rdi
	movq	-24(%rbp), %rdi
	callq	_one_iteration
	popq	%rdi
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %r10
	cmpq	$5, %r10
	sete	-48(%rbp)
	andq	$1, -48(%rbp)
	cmpq	$1, -48(%rbp)
	je	_end
	jmp	_loop
	.text
_end:
	movq	%rbp, %rsp
	movq	-40(%rbp), %rax
	popq	%rbp
	retq	