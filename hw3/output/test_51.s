	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$3, $0
	setl	-8(%rbp)
	cmpq	$0, -8(%rbp)
	je	_then
	jmp	_else
	.text
_then:
	movq	%rbp, %rsp
	movq	$7, %rax
	popq	%rbp
	retq	
	.text
_else:
	movq	%rbp, %rsp
	movq	$9, %rax
	popq	%rbp
	retq	