	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
	movq	%rbp, %rsp
	movq	$42, %rax
	popq	%rbp
	retq	
	.text
	.globl	_bar
_bar:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0, %rsp
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	movq	-8(%rbp), %r10
	movq	$0, %r11
	movq	%r11, (%r10)
	movq	-16(%rbp), %r10
	movq	$100, %r11
	movq	%r11, (%r10)
	movq	-16(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	-24(%rbp), %r10
	cmpq	$0, %r10
	setne	-32(%rbp)
	andq	$1, -32(%rbp)
	cmpq	$1, -32(%rbp)
	je	_then
	jmp	_else
	.text
_then:
	callq	_foo
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %r10
	movq	-8(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_end
	.text
_else:
	callq	_bar
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %r10
	movq	-16(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_end
	.text
_end:
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	%rbp, %rsp
	movq	-24(%rbp), %rax
	popq	%rbp
	retq	