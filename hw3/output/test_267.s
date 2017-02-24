	.data
	.globl	_gstr
_gstr:
	.asciz	"hello, world!"
	.data
	.globl	_gint
_gint:
	.quad	42
	.data
	.globl	_v1
_v1:
	.quad	0
	.quad	_gint
	.data
	.globl	_v2
_v2:
	.quad	1
	.quad	0
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	leaq	_v2(%rip), %r10
	addq	$0, %r10
	addq	$0, %r10
	movq	%r10, -16(%rbp)
	movq	-16(%rbp), %r10
	movq	$5, %r11
	movq	%r11, (%r10)
	movq	$_v2, %r10
	movq	%r10, -24(%rbp)
	pushq	%rdi
	movq	-24(%rbp), %rdi
	callq	_foo
	popq	%rdi
	movq	-16(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -32(%rbp)
	movq	%rbp, %rsp
	movq	-32(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, %r10
	addq	$0, %r10
	addq	$0, %r10
	movq	%r10, -8(%rbp)
	movq	-8(%rbp), %r10
	movq	$6, %r11
	movq	%r11, (%r10)
	movq	-8(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -16(%rbp)
	movq	%rbp, %rsp
	popq	%rbp
	retq	