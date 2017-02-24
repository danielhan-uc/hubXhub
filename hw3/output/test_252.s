	.data
	.globl	_hd
_hd:
	.quad	1
	.quad	_md
	.data
	.globl	_md
_md:
	.quad	2
	.quad	_tl
	.data
	.globl	_tl
_tl:
	.quad	3
	.quad	0
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	-16(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -24(%rbp)
	movq	-40(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -48(%rbp)
	movq	-56(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -64(%rbp)
	movq	%rbp, %rsp
	movq	-64(%rbp), %rax
	popq	%rbp
	retq	