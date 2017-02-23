	.text
	.globl	_factorial
_factorial:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, -8(%rbp)
	je	*ret1
	jmp	*recurse
	.text
_ret1:
	movq	%rbp, %rsp
	movq	$1, %rax
	popq	%rbp
	retq	
	.text
_recurse:
	movq	%rdi, %r10
	subq	$1, %r10
	movq	%r10, -8(%rbp)
	movq	%rdi, %r10
	imulq	-16(%rbp), %r10
	movq	%r10, -24(%rbp)
	movq	%rbp, %rsp
	movq	-24(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	