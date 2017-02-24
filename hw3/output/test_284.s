	.text
	.globl	_factorial
_factorial:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$104, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	movq	-8(%rbp), %r10
	movq	%rdi, %r11
	movq	%r11, (%r10)
	movq	-16(%rbp), %r10
	movq	$1, %r11
	movq	%r11, (%r10)
	jmp	_start
	.text
_start:
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -8(%rbp)
	movq	-8(%rbp), %r10
	cmpq	$0, %r10
	setg	-16(%rbp)
	andq	$1, -16(%rbp)
	cmpq	$1, -16(%rbp)
	je	_then
	jmp	_end
	.text
_then:
	movq	-16(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -32(%rbp)
	movq	-24(%rbp), %r10
	imulq	-32(%rbp), %r10
	movq	%r10, -40(%rbp)
	movq	-16(%rbp), %r10
	movq	-40(%rbp), %r11
	movq	%r11, (%r10)
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -48(%rbp)
	movq	-48(%rbp), %r10
	subq	$1, %r10
	movq	%r10, -56(%rbp)
	movq	-8(%rbp), %r10
	movq	-56(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_start
	.text
_end:
	movq	-16(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -64(%rbp)
	movq	%rbp, %rsp
	movq	-64(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	movq	-8(%rbp), %r10
	movq	$0, %r11
	movq	%r11, (%r10)
	pushq	%rdi
	movq	$5, %rdi
	callq	_factorial
	popq	%rdi
	movq	%rax, -16(%rbp)
	movq	%rbp, %rsp
	movq	-16(%rbp), %rax
	popq	%rbp
	retq	