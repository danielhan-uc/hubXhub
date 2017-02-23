	.text
	.globl	_foo
_foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rbp, %rsp
	movq	$42, %rax
	popq	%rbp
	retq	
	.text
	.globl	_bar
_bar:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, -48(%rbp)
	je	*then
	jmp	*else
	.text
_then:
	jmp	*end
	.text
_else:
	jmp	*end
	.text
_end:
	movq	%rbp, %rsp
	movq	-40(%rbp), %rax
	popq	%rbp
	retq	