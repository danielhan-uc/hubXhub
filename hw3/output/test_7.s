	.data
	.globl	_toofew
_toofew:
	.asciz	"argc < 3"
	.data
	.globl	_toomany
_toomany:
	.asciz	"argc > 3"
	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, -8(%rbp)
	je	*few
	jmp	*else
	.text
_few:
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	
	.text
_else:
	cmpq	$0, -24(%rbp)
	je	*many
	jmp	*right
	.text
_many:
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	
	.text
_right:
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	