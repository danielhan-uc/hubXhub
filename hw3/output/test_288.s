	.text
	.globl	_main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	pushq	%rdi
	movq	$347, %rdi
	callq	_is_prime
	popq	%rdi
	movq	%rax, -8(%rbp)
	movq	%rbp, %rsp
	movq	-8(%rbp), %rax
	popq	%rbp
	retq	
	.text
	.globl	_is_prime
_is_prime:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$304, %rsp
	pushq	%rdi
	movq	$8, %rdi
	pushq	%rsi
	movq	$10000, %rsi
	callq	_ll_malloc
	popq	%rsi
	popq	%rdi
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %r10
	addq	$0, %r10
	movq	%r10, -16(%rbp)
	movq	-16(%rbp), %r10
	movq	$0, %r11
	movq	%r11, (%r10)
	movq	-8(%rbp), %r10
	addq	$8, %r10
	movq	%r10, -24(%rbp)
	movq	-24(%rbp), %r10
	movq	$0, %r11
	movq	%r11, (%r10)
	jmp	_start1
	.text
_start1:
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	movq	-32(%rbp), %r10
	movq	$2, %r11
	movq	%r11, (%r10)
	jmp	_cmp1
	.text
_cmp1:
	movq	-32(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -40(%rbp)
	movq	-40(%rbp), %r10
	cmpq	$10000, %r10
	setl	-48(%rbp)
	andq	$1, -48(%rbp)
	cmpq	$1, -48(%rbp)
	je	_loop1
	jmp	_end1
	.text
_loop1:
	movq	-32(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -56(%rbp)
	movq	-8(%rbp), %r10
	movq	%r10, -64(%rbp)
	movq	-64(%rbp), %r10
	movq	$1, %r11
	movq	%r11, (%r10)
	movq	-56(%rbp), %r10
	addq	$1, %r10
	movq	%r10, -72(%rbp)
	movq	-32(%rbp), %r10
	movq	-72(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_cmp1
	.text
_end1:
	jmp	_start2
	.text
_start2:
	movq	-32(%rbp), %r10
	movq	$2, %r11
	movq	%r11, (%r10)
	jmp	_cmp2
	.text
_cmp2:
	movq	-32(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -80(%rbp)
	movq	-80(%rbp), %r10
	cmpq	$10000, %r10
	setl	-88(%rbp)
	andq	$1, -88(%rbp)
	cmpq	$1, -88(%rbp)
	je	_loop2
	jmp	_end2
	.text
_loop2:
	movq	-32(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -96(%rbp)
	movq	-8(%rbp), %r10
	movq	%r10, -104(%rbp)
	movq	-104(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -112(%rbp)
	movq	-112(%rbp), %r10
	cmpq	$1, %r10
	sete	-120(%rbp)
	andq	$1, -120(%rbp)
	cmpq	$1, -120(%rbp)
	je	_then1
	jmp	_else1
	.text
_then1:
	subq	$8, %rsp
	movq	%rsp, -128(%rbp)
	movq	-96(%rbp), %r10
	addq	-96(%rbp), %r10
	movq	%r10, -136(%rbp)
	movq	-128(%rbp), %r10
	movq	-136(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_cmp3
	.text
_cmp3:
	movq	-128(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -144(%rbp)
	movq	-144(%rbp), %r10
	cmpq	$10000, %r10
	setl	-152(%rbp)
	andq	$1, -152(%rbp)
	cmpq	$1, -152(%rbp)
	je	_loop3
	jmp	_end3
	.text
_loop3:
	movq	-8(%rbp), %r10
	movq	%r10, -160(%rbp)
	movq	-160(%rbp), %r10
	movq	$0, %r11
	movq	%r11, (%r10)
	movq	-144(%rbp), %r10
	addq	-96(%rbp), %r10
	movq	%r10, -168(%rbp)
	movq	-128(%rbp), %r10
	movq	-168(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_cmp3
	.text
_end3:
	jmp	_else1
	.text
_else1:
	movq	-32(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -176(%rbp)
	movq	-176(%rbp), %r10
	addq	$1, %r10
	movq	%r10, -184(%rbp)
	movq	-32(%rbp), %r10
	movq	-184(%rbp), %r11
	movq	%r11, (%r10)
	jmp	_cmp2
	.text
_end2:
	movq	-8(%rbp), %r10
	movq	%r10, -192(%rbp)
	movq	-192(%rbp), %r10
	movq	(%r10), %r11
	movq	%r11, -200(%rbp)
	movq	%rbp, %rsp
	movq	-200(%rbp), %rax
	popq	%rbp
	retq	