	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$5, %r10
	addq	$12, %r10
	movq	%r10, -8(%rbp)
	jmp	*next
	.text
_next:
	jmp	*end
	.text
_end:
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	