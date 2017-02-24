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
	movq	$3, %r10
	cmpq	%rdi, %r10
	setl	-8(%rbp)
	andq	$1, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	_few
	jmp	_else
	.text
_few:
	pushq	%rdi
	movq	-8(%rbp), %rdi
	callq	_ll_puts
	popq	%rdi
	movq	%rax, -16(%rbp)
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	
	.text
_else:
	movq	$3, %r10
	cmpq	%rdi, %r10
	setg	-24(%rbp)
	andq	$1, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	_many
	jmp	_right
	.text
_many:
	pushq	%rdi
	movq	-32(%rbp), %rdi
	callq	_ll_puts
	popq	%rdi
	movq	%rax, -40(%rbp)
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	
	.text
_right:
	movq	-48(%rbp), -56(%rbp)
	movq	-64(%rbp), -72(%rbp)
	pushq	%rdi
	movq	-56(%rbp), %rdi
	pushq	%rsi
	movq	-72(%rbp), %rsi
	callq	_ll_strcat
	popq	%rsi
	popq	%rdi
	movq	%rax, -80(%rbp)
	pushq	%rdi
	movq	-80(%rbp), %rdi
	callq	_ll_puts
	popq	%rdi
	movq	%rax, -88(%rbp)
	movq	%rbp, %rsp
	movq	$0, %rax
	popq	%rbp
	retq	