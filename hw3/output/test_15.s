	.text
	.globl	_factorial
_factorial:
	pushq	%rbp
	movq	%rsp, %rbp
	jmp	*start
	.text
_start:
	cmpq	$0, -16(%rbp)
	je	*then
	jmp	*end
	.text
_then:
	movq	-24(%rbp), %r10
	imulq	-32(%rbp), %r10
	movq	%r10, -40(%rbp)
	movq	-56(%rbp), %r10
	subq	$1, %r10
	movq	%r10, -64(%rbp)
	jmp	*start
	.text
_end:
	movq	%rbp, %rsp
	movq	-80(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rbp, %rsp
	movq	-24(%rbp), %rax
	popq	%rbp
	retq	