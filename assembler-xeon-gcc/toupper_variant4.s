	.file	"toupper.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	toupper_naive_fn_no_size, @function
toupper_naive_fn_no_size:
.LFB4910:
	.cfi_startproc
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L7:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
.L10:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L7
	ret
	.cfi_endproc
.LFE4910:
	.size	toupper_naive_fn_no_size, .-toupper_naive_fn_no_size
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	toupper_naive_define_no_size, @function
toupper_naive_define_no_size:
.LFB4911:
	.cfi_startproc
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L18:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
.L21:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L18
	ret
	.cfi_endproc
.LFE4911:
	.size	toupper_naive_define_no_size, .-toupper_naive_define_no_size
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.type	toupper_loop_fn, @function
toupper_loop_fn:
.LFB4914:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L41
	movq	%rdi, %rax
	movq	%rsi, %rdx
	negq	%rax
	andl	$31, %eax
	cmpq	%rsi, %rax
	cmova	%rsi, %rax
	cmpq	$32, %rsi
	ja	.L43
.L24:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L26:
	movzbl	(%rdi,%rcx), %eax
	leal	-97(%rax), %r9d
	leal	-32(%rax), %r8d
	cmpb	$25, %r9b
	cmovbe	%r8d, %eax
	movb	%al, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	.L26
	movq	%rdx, %rax
	cmpq	%rdx, %rsi
	je	.L41
.L25:
	leaq	-1(%rsi), %r8
	movq	%rsi, %r9
	subq	%rax, %r9
	subq	%rax, %r8
	leaq	-32(%r9), %rcx
	shrq	$5, %rcx
	addq	$1, %rcx
	movq	%rcx, %r10
	salq	$5, %r10
	cmpq	$30, %r8
	jbe	.L31
	addq	%rdi, %rax
	xorl	%r8d, %r8d
	xorl	%r11d, %r11d
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LC2(%rip), %ymm5
	vmovdqa	.LC3(%rip), %ymm4
	vmovdqa	.LC4(%rip), %ymm3
.L29:
	vmovdqa	(%rax,%r8), %ymm0
	addq	$1, %r11
	vpaddb	%ymm5, %ymm0, %ymm1
	vpaddb	%ymm3, %ymm0, %ymm6
	vpsubusb	%ymm4, %ymm1, %ymm1
	vpcmpeqb	%ymm2, %ymm1, %ymm1
	vpblendvb	%ymm1, %ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, (%rax,%r8)
	addq	$32, %r8
	cmpq	%r11, %rcx
	ja	.L29
	addq	%r10, %rdx
	cmpq	%r10, %r9
	je	.L44
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L31:
	movzbl	(%rdi,%rdx), %eax
	leal	-97(%rax), %r8d
	leal	-32(%rax), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %eax
	movb	%al, (%rdi,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rsi
	ja	.L31
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	vzeroupper
.L41:
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	testq	%rax, %rax
	jne	.L45
	xorl	%edx, %edx
	jmp	.L25
.L45:
	movq	%rax, %rdx
	jmp	.L24
	.cfi_endproc
.LFE4914:
	.size	toupper_loop_fn, .-toupper_loop_fn
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.type	toupper_loop_define, @function
toupper_loop_define:
.LFB4915:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L65
	movq	%rdi, %rax
	movq	%rsi, %rdx
	negq	%rax
	andl	$31, %eax
	cmpq	%rsi, %rax
	cmova	%rsi, %rax
	cmpq	$32, %rsi
	ja	.L67
.L48:
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L50:
	movzbl	(%rdi,%rcx), %eax
	leal	-97(%rax), %r9d
	leal	-32(%rax), %r8d
	cmpb	$25, %r9b
	cmovbe	%r8d, %eax
	movb	%al, (%rdi,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	.L50
	movq	%rdx, %rax
	cmpq	%rdx, %rsi
	je	.L65
.L49:
	leaq	-1(%rsi), %r8
	movq	%rsi, %r9
	subq	%rax, %r9
	subq	%rax, %r8
	leaq	-32(%r9), %rcx
	shrq	$5, %rcx
	addq	$1, %rcx
	movq	%rcx, %r10
	salq	$5, %r10
	cmpq	$30, %r8
	jbe	.L55
	addq	%rdi, %rax
	xorl	%r8d, %r8d
	xorl	%r11d, %r11d
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqa	.LC2(%rip), %ymm5
	vmovdqa	.LC3(%rip), %ymm4
	vmovdqa	.LC4(%rip), %ymm3
.L53:
	vmovdqa	(%rax,%r8), %ymm0
	addq	$1, %r11
	vpaddb	%ymm5, %ymm0, %ymm1
	vpaddb	%ymm3, %ymm0, %ymm6
	vpsubusb	%ymm4, %ymm1, %ymm1
	vpcmpeqb	%ymm2, %ymm1, %ymm1
	vpblendvb	%ymm1, %ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, (%rax,%r8)
	addq	$32, %r8
	cmpq	%r11, %rcx
	ja	.L53
	addq	%r10, %rdx
	cmpq	%r10, %r9
	je	.L68
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L55:
	movzbl	(%rdi,%rdx), %eax
	leal	-97(%rax), %r8d
	leal	-32(%rax), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %eax
	movb	%al, (%rdi,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rsi
	ja	.L55
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	vzeroupper
.L65:
	ret
	.p2align 4,,10
	.p2align 3
.L67:
	testq	%rax, %rax
	jne	.L69
	xorl	%edx, %edx
	jmp	.L49
.L69:
	movq	%rax, %rdx
	jmp	.L48
	.cfi_endproc
.LFE4915:
	.size	toupper_loop_define, .-toupper_loop_define
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.type	toupper_unroll, @function
toupper_unroll:
.LFB4916:
	.cfi_startproc
	movq	%rdi, %rax
	testq	%rsi, %rsi
	je	.L94
	.p2align 4,,10
	.p2align 3
.L86:
	movzbl	(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, (%rax)
	movzbl	1(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, 1(%rax)
	movzbl	2(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, 2(%rax)
	movzbl	3(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, 3(%rax)
	movzbl	4(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, 4(%rax)
	movzbl	5(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, 5(%rax)
	movzbl	6(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movzbl	7(%rax), %ecx
	movb	%dl, 6(%rax)
	leal	-97(%rcx), %r8d
	leal	-32(%rcx), %edx
	cmpb	$25, %r8b
	cmova	%ecx, %edx
	addq	$8, %rax
	movb	%dl, -1(%rax)
	movq	%rax, %rdx
	subq	%rdi, %rdx
	cmpq	%rdx, %rsi
	ja	.L86
	andl	$7, %esi
	je	.L94
	movzbl	(%rax), %ecx
	leal	-97(%rcx), %edi
	leal	-32(%rcx), %edx
	cmpb	$25, %dil
	cmova	%ecx, %edx
	movb	%dl, (%rax)
	cmpq	$1, %rsi
	je	.L94
	movzbl	1(%rax), %ecx
	leal	-97(%rcx), %edi
	leal	-32(%rcx), %edx
	cmpb	$25, %dil
	cmova	%ecx, %edx
	movb	%dl, 1(%rax)
	cmpq	$2, %rsi
	je	.L94
	movzbl	2(%rax), %ecx
	leal	-97(%rcx), %edi
	leal	-32(%rcx), %edx
	cmpb	$25, %dil
	cmova	%ecx, %edx
	movb	%dl, 2(%rax)
	cmpq	$3, %rsi
	je	.L94
	movzbl	3(%rax), %edx
	leal	-97(%rdx), %edi
	leal	-32(%rdx), %ecx
	cmpb	$25, %dil
	cmovbe	%ecx, %edx
	movb	%dl, 3(%rax)
	cmpq	$4, %rsi
	je	.L94
	movzbl	4(%rax), %edx
	leal	-97(%rdx), %edi
	leal	-32(%rdx), %ecx
	cmpb	$25, %dil
	cmovbe	%ecx, %edx
	movb	%dl, 4(%rax)
	cmpq	$5, %rsi
	je	.L94
	movzbl	5(%rax), %edx
	leal	-97(%rdx), %edi
	leal	-32(%rdx), %ecx
	cmpb	$25, %dil
	cmovbe	%ecx, %edx
	movb	%dl, 5(%rax)
	cmpq	$7, %rsi
	jne	.L94
	movzbl	6(%rax), %edx
	leal	-97(%rdx), %esi
	leal	-32(%rdx), %ecx
	cmpb	$25, %sil
	cmovbe	%ecx, %edx
	movb	%dl, 6(%rax)
.L94:
	ret
	.cfi_endproc
.LFE4916:
	.size	toupper_unroll, .-toupper_unroll
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.type	toupper_prefetch_branch, @function
toupper_prefetch_branch:
.LFB4917:
	.cfi_startproc
#APP
# 24 "toupper.c" 1
	prefetcht0 (%rdi)
# 0 "" 2
# 24 "toupper.c" 1
	prefetcht0 64(%rdi)
# 0 "" 2
# 24 "toupper.c" 1
	prefetcht0 128(%rdi)
# 0 "" 2
#NO_APP
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L103
	.p2align 4,,10
	.p2align 3
.L101:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L101
.L103:
	ret
	.cfi_endproc
.LFE4917:
	.size	toupper_prefetch_branch, .-toupper_prefetch_branch
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.type	toupper_avx_1, @function
toupper_avx_1:
.LFB4923:
	.cfi_startproc
	vmovdqa	.LC9(%rip), %ymm6
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC10(%rip), %ymm5
	vmovdqa	.LC11(%rip), %ymm4
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L114:
	vpsubb	%ymm6, %ymm2, %ymm0
	addq	$32, %rdi
	vpcmpgtb	%ymm5, %ymm0, %ymm0
	vpandn	%ymm4, %ymm0, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqu	%ymm0, -32(%rdi)
.L106:
	vmovdqu	(%rdi), %ymm2
	vpcmpeqb	%ymm3, %ymm2, %ymm1
	vpmovmskb	%ymm1, %eax
	testl	%eax, %eax
	je	.L114
	tzcntl	%eax, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L113
	.p2align 4,,10
	.p2align 3
.L111:
	movl	%ecx, %edx
	addq	%rdi, %rdx
	movzbl	(%rdx), %esi
	leal	-97(%rsi), %r8d
	cmpb	$25, %r8b
	ja	.L108
	subl	$32, %esi
	movb	%sil, (%rdx)
.L108:
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jnb	.L111
.L113:
	vzeroupper
	ret
	.cfi_endproc
.LFE4923:
	.size	toupper_avx_1, .-toupper_avx_1
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.type	toupper_sse, @function
toupper_sse:
.LFB4921:
	.cfi_startproc
	shrq	$4, %rsi
	je	.L120
	vmovdqa	.LC13(%rip), %xmm4
	salq	$4, %rsi
	vmovdqa	.LC14(%rip), %xmm3
	leaq	(%rdi,%rsi), %rax
	vmovdqa	.LC15(%rip), %xmm2
	.p2align 4,,10
	.p2align 3
.L117:
	vmovdqu	(%rdi), %xmm1
	addq	$16, %rdi
	vpsubb	%xmm4, %xmm1, %xmm0
	vpcmpgtb	%xmm3, %xmm0, %xmm0
	vpandn	%xmm2, %xmm0, %xmm0
	vpxor	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
	cmpq	%rdi, %rax
	jne	.L117
.L120:
	ret
	.cfi_endproc
.LFE4921:
	.size	toupper_sse, .-toupper_sse
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.type	toupper_sse_1, @function
toupper_sse_1:
.LFB4919:
	.cfi_startproc
	vmovdqa	.LC13(%rip), %xmm6
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC14(%rip), %xmm5
	vmovdqa	.LC15(%rip), %xmm4
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L131:
	vpsubb	%xmm6, %xmm2, %xmm0
	addq	$16, %rdi
	vpcmpgtb	%xmm5, %xmm0, %xmm0
	vpandn	%xmm4, %xmm0, %xmm0
	vpxor	%xmm2, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
.L123:
	vmovdqu	(%rdi), %xmm2
	vpcmpeqb	%xmm3, %xmm2, %xmm1
	vpmovmskb	%xmm1, %eax
	testl	%eax, %eax
	je	.L131
	tzcntl	%eax, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L130
	.p2align 4,,10
	.p2align 3
.L128:
	movl	%ecx, %edx
	addq	%rdi, %rdx
	movzbl	(%rdx), %esi
	leal	-97(%rsi), %r8d
	cmpb	$25, %r8b
	ja	.L125
	subl	$32, %esi
	movb	%sil, (%rdx)
.L125:
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jnb	.L128
.L130:
	ret
	.cfi_endproc
.LFE4919:
	.size	toupper_sse_1, .-toupper_sse_1
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.section	.text.unlikely
.LCOLDB22:
	.text
.LHOTB22:
	.p2align 4,,15
	.type	toupper_mmx, @function
toupper_mmx:
.LFB4920:
	.cfi_startproc
	shrq	$3, %rsi
	je	.L137
	leaq	(%rdi,%rsi,8), %rax
	movq	.LC19(%rip), %mm3
	movq	.LC20(%rip), %mm2
	movq	.LC18(%rip), %mm1
	.p2align 4,,10
	.p2align 3
.L134:
	movq	(%rdi), %mm0
	psubb	%mm2, %mm0
	addq	$8, %rdi
	pcmpgtb	%mm3, %mm0
	pandn	%mm1, %mm0
	pxor	-8(%rdi), %mm0
	movq	%mm0, -8(%rsp)
	movq	-8(%rsp), %rdx
	movq	%rdx, -8(%rdi)
	cmpq	%rax, %rdi
	jne	.L134
.L137:
	ret
	.cfi_endproc
.LFE4920:
	.size	toupper_mmx, .-toupper_mmx
	.section	.text.unlikely
.LCOLDE22:
	.text
.LHOTE22:
	.section	.text.unlikely
.LCOLDB23:
	.text
.LHOTB23:
	.p2align 4,,15
	.type	toupper_library_size, @function
toupper_library_size:
.LFB4913:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L146
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	__ctype_toupper_loc
	leaq	(%rbx,%rbp), %rsi
	movq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L140:
	movsbq	(%rdi), %rcx
	addq	$1, %rdi
	movq	(%rax), %rdx
	movl	(%rdx,%rcx,4), %edx
	movb	%dl, -1(%rdi)
	cmpq	%rdi, %rsi
	jne	.L140
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L146:
	ret
	.cfi_endproc
.LFE4913:
	.size	toupper_library_size, .-toupper_library_size
	.section	.text.unlikely
.LCOLDE23:
	.text
.LHOTE23:
	.section	.text.unlikely
.LCOLDB24:
	.text
.LHOTB24:
	.p2align 4,,15
	.type	toupper_library_no_size, @function
toupper_library_no_size:
.LFB4912:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movsbq	(%rdi), %rbx
	testb	%bl, %bl
	je	.L152
	movq	%rdi, %rbp
	call	__ctype_toupper_loc
	.p2align 4,,10
	.p2align 3
.L149:
	movq	(%rax), %rdx
	addq	$1, %rbp
	movl	(%rdx,%rbx,4), %edx
	movb	%dl, -1(%rbp)
	movsbq	0(%rbp), %rbx
	testb	%bl, %bl
	jne	.L149
.L152:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4912:
	.size	toupper_library_no_size, .-toupper_library_no_size
	.section	.text.unlikely
.LCOLDE24:
	.text
.LHOTE24:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC27:
	.string	"Before: %.40s...\n"
.LC28:
	.string	"getting time"
.LC30:
	.string	"After:  %.40s...\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC31:
	.string	"%s failed check at %zu: %c should be %c\n"
	.align 8
.LC32:
	.string	"VARIANT4: gcc -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O3 toupper.c"
	.align 8
.LC33:
	.string	"Size: %ld \tRatio: %f \tRunning time:\n"
	.section	.rodata.str1.1
.LC34:
	.string	"\t%-16s:\t%9.5f \n"
	.section	.text.unlikely
.LCOLDB35:
	.section	.text.startup,"ax",@progbits
.LHOTB35:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB4931:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$96, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edi, -128(%rbp)
	movq	%fs:40, %rcx
	movq	%rcx, -56(%rbp)
	xorl	%ecx, %ecx
	cmpl	$1, %edi
	jle	.L155
	leaq	8(%rsi), %r14
	movl	%edi, %eax
	movl	$1, -104(%rbp)
	xorl	%r13d, %r13d
	addl	$2, %eax
	movl	$3, %ebx
	movl	$0, -120(%rbp)
	movl	$50, %r8d
	movl	%eax, -112(%rbp)
	movl	$10000, %r15d
	movl	$800000, %r12d
	jmp	.L168
.L166:
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%r8d, -132(%rbp)
	call	strtol
	movq	24(%r14), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, -120(%rbp)
	call	strtol
	movl	-132(%rbp), %r8d
	movl	%eax, -104(%rbp)
.L156:
	addq	$8, %r14
	addl	$1, %ebx
	cmpl	-112(%rbp), %ebx
	je	.L160
.L168:
	movq	(%r14), %rax
	cmpb	$45, (%rax)
	jne	.L156
	cmpb	$100, 1(%rax)
	jne	.L157
	cmpb	$0, 2(%rax)
	jne	.L158
	movl	$1, debug(%rip)
	cmpb	$45, (%rax)
	jne	.L156
.L157:
	cmpb	$108, 1(%rax)
	jne	.L158
	cmpb	$0, 2(%rax)
	jne	.L158
	movq	8(%r14), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%r8d, -132(%rbp)
	call	strtol
	movl	-132(%rbp), %r8d
	movslq	%eax, %r12
	andl	$63, %eax
	je	.L159
	addq	$64, %r12
	cltq
	subq	%rax, %r12
.L159:
	cmpl	%ebx, -128(%rbp)
	jle	.L160
	movq	16(%r14), %rdi
	cmpb	$45, (%rdi)
	jne	.L161
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	je	.L294
	cmpb	$100, %al
	jne	.L161
.L294:
	cmpb	$0, 2(%rdi)
	je	.L160
.L161:
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%r8d, -132(%rbp)
	call	strtol
	movl	-132(%rbp), %r8d
	movslq	%eax, %r13
	andl	$63, %eax
	je	.L163
	addq	$64, %r13
	cltq
	subq	%rax, %r13
.L163:
	movq	24(%r14), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	movl	%r8d, -132(%rbp)
	call	strtol
	movl	-132(%rbp), %r8d
	movslq	%eax, %r15
	andl	$63, %eax
	je	.L295
	leaq	64(%r15), %rcx
	cltq
	subq	%rax, %rcx
	movq	%rcx, %r15
.L295:
	movq	(%r14), %rax
	movzbl	(%rax), %edx
	cmpb	$45, %dl
	jne	.L156
.L158:
	cmpb	$114, 1(%rax)
	jne	.L156
	cmpb	$0, 2(%rax)
	jne	.L156
	movq	8(%r14), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r8d
	cmpl	%ebx, -128(%rbp)
	jle	.L160
	movq	16(%r14), %rdi
	cmpb	$45, (%rdi)
	jne	.L166
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	je	.L296
	cmpb	$100, %al
	jne	.L166
.L296:
	cmpb	$0, 2(%rdi)
	jne	.L166
.L160:
	cmpq	$0, toupperversion+8(%rip)
	je	.L302
.L216:
	cmpq	$0, toupperversion+24(%rip)
	je	.L224
	cmpq	$0, toupperversion+40(%rip)
	je	.L225
	cmpq	$0, toupperversion+56(%rip)
	je	.L226
	cmpq	$0, toupperversion+72(%rip)
	je	.L227
	cmpq	$0, toupperversion+88(%rip)
	je	.L228
	cmpq	$0, toupperversion+104(%rip)
	je	.L229
	cmpq	$0, toupperversion+120(%rip)
	je	.L230
	cmpq	$0, toupperversion+136(%rip)
	je	.L231
	cmpq	$0, toupperversion+152(%rip)
	je	.L232
	cmpq	$0, toupperversion+168(%rip)
	je	.L233
	cmpq	$1, toupperversion+184(%rip)
	sbbl	%esi, %esi
	addl	$12, %esi
.L170:
	movl	%esi, no_version(%rip)
.L169:
	movl	$1, %r14d
	testq	%r13, %r13
	je	.L171
	movq	%r13, %rax
	xorl	%edx, %edx
	subq	%r12, %rax
	divq	%r15
	leal	1(%rax), %r14d
.L171:
	movl	-120(%rbp), %eax
	movl	%r14d, no_sz(%rip)
	testl	%eax, %eax
	je	.L236
	subl	%r8d, %eax
	cltd
	idivl	-104(%rbp)
	leal	1(%rax), %ebx
	movslq	%ebx, %r13
	salq	$3, %r13
.L172:
	movl	%esi, %edi
	movl	%r8d, -112(%rbp)
	imull	%r14d, %edi
	movl	%ebx, no_ratio(%rip)
	imull	%ebx, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%r13, %rdi
	movq	%rax, results(%rip)
	call	malloc
	movslq	%r14d, %rdi
	salq	$3, %rdi
	movq	%rax, %r13
	movq	%rax, ratios(%rip)
	call	malloc
	testl	%r14d, %r14d
	movl	-112(%rbp), %r8d
	movq	%rax, sizes(%rip)
	jle	.L173
	movq	%rax, %rsi
	andl	$31, %esi
	shrq	$3, %rsi
	negq	%rsi
	andl	$3, %esi
	cmpl	%r14d, %esi
	cmova	%r14d, %esi
	cmpl	$9, %r14d
	jg	.L303
	movl	%r14d, %esi
.L174:
	movq	%r12, (%rax)
	cmpl	$1, %esi
	je	.L239
	leaq	(%r15,%r12), %rdx
	movq	%rdx, 8(%rax)
	cmpl	$2, %esi
	je	.L240
	leaq	(%r15,%r15), %rdx
	leaq	(%rdx,%r12), %rdi
	movq	%rdi, 16(%rax)
	cmpl	$3, %esi
	je	.L241
	addq	%r15, %rdx
	leaq	(%rdx,%r12), %rdi
	movq	%rdi, 24(%rax)
	cmpl	$4, %esi
	je	.L242
	addq	%r15, %rdx
	leaq	(%rdx,%r12), %rdi
	movq	%rdi, 32(%rax)
	cmpl	$5, %esi
	je	.L243
	addq	%r15, %rdx
	leaq	(%rdx,%r12), %rdi
	movq	%rdi, 40(%rax)
	cmpl	$6, %esi
	je	.L244
	addq	%r15, %rdx
	leaq	(%rdx,%r12), %rdi
	movq	%rdi, 48(%rax)
	cmpl	$7, %esi
	je	.L245
	addq	%r15, %rdx
	leaq	(%rdx,%r12), %rdi
	movq	%rdi, 56(%rax)
	cmpl	$9, %esi
	jne	.L246
	addq	%r15, %rdx
	addq	%r12, %rdx
	movq	%rdx, 64(%rax)
	movl	$9, %edx
.L176:
	cmpl	%esi, %r14d
	je	.L177
.L175:
	leal	-1(%r14), %r9d
	movl	%r14d, %r10d
	movl	%esi, %ecx
	subl	%esi, %r10d
	subl	%esi, %r9d
	leal	-8(%r10), %edi
	shrl	$3, %edi
	addl	$1, %edi
	leal	0(,%rdi,8), %r11d
	cmpl	$6, %r9d
	jbe	.L178
	vmovq	%r15, %xmm3
	vmovd	%edx, %xmm2
	vmovq	%r12, %xmm7
	vpbroadcastq	%xmm3, %ymm4
	vpbroadcastd	%xmm2, %ymm2
	vpbroadcastq	%xmm7, %ymm6
	vmovdqa	.LC26(%rip), %ymm3
	vpaddd	.LC25(%rip), %ymm2, %ymm2
	vpsrlq	$32, %ymm4, %ymm5
	leaq	(%rax,%rcx,8), %rsi
	xorl	%ecx, %ecx
.L179:
	vpmovsxdq	%xmm2, %ymm1
	addl	$1, %ecx
	addq	$64, %rsi
	vpsrlq	$32, %ymm1, %ymm0
	vpmuludq	%ymm4, %ymm1, %ymm7
	vpmuludq	%ymm4, %ymm0, %ymm0
	vpmuludq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm1, %ymm0, %ymm0
	vextracti128	$0x1, %ymm2, %xmm1
	vpmovsxdq	%xmm1, %ymm1
	vpaddd	%ymm3, %ymm2, %ymm2
	vpsllq	$32, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm7, %ymm0
	vpmuludq	%ymm4, %ymm1, %ymm7
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, -64(%rsi)
	vpsrlq	$32, %ymm1, %ymm0
	vpmuludq	%ymm4, %ymm0, %ymm0
	vpmuludq	%ymm1, %ymm5, %ymm1
	vpaddq	%ymm1, %ymm0, %ymm0
	vpsllq	$32, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm7, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, -32(%rsi)
	cmpl	%edi, %ecx
	jb	.L179
	addl	%r11d, %edx
	cmpl	%r10d, %r11d
	je	.L177
.L178:
	movslq	%edx, %rdi
	movq	%r15, %rsi
	imulq	%rdi, %rsi
	leaq	(%rsi,%r12), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	1(%rdx), %edi
	cmpl	%edi, %r14d
	jle	.L177
	addq	%r15, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r12), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	2(%rdx), %edi
	cmpl	%edi, %r14d
	jle	.L177
	addq	%r15, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r12), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	3(%rdx), %edi
	cmpl	%edi, %r14d
	jle	.L177
	addq	%r15, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r12), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	4(%rdx), %edi
	cmpl	%edi, %r14d
	jle	.L177
	addq	%r15, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r12), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	5(%rdx), %edi
	cmpl	%edi, %r14d
	jle	.L177
	addq	%r15, %rsi
	movslq	%edi, %rdi
	addl	$6, %edx
	leaq	(%rsi,%r12), %r10
	movq	%r10, (%rax,%rdi,8)
	cmpl	%edx, %r14d
	jle	.L177
	leaq	(%r15,%rsi), %rcx
	movslq	%edx, %rdx
	addq	%rcx, %r12
	movq	%r12, (%rax,%rdx,8)
.L177:
	testl	%ebx, %ebx
	jle	.L192
.L218:
	testl	%ebx, %ebx
	movl	$1, %ecx
	movq	%r13, %rdx
	cmovg	%ebx, %ecx
	andl	$31, %edx
	shrq	$3, %rdx
	negq	%rdx
	andl	$3, %edx
	cmpl	%ecx, %edx
	cmova	%ecx, %edx
	cmpl	$9, %ecx
	jg	.L304
	movl	%ecx, %edx
.L183:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%r8d, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13)
	cmpl	$1, %edx
	je	.L249
	movl	-104(%rbp), %edi
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	%edi, %eax
	addl	%r8d, %eax
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r13)
	cmpl	$2, %edx
	je	.L250
	movl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%eax, %eax
	leal	(%r8,%rax), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r13)
	cmpl	$3, %edx
	je	.L251
	addl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r8,%rax), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r13)
	cmpl	$4, %edx
	je	.L252
	addl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r8,%rax), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r13)
	cmpl	$5, %edx
	je	.L253
	addl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r8,%rax), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r13)
	cmpl	$6, %edx
	je	.L254
	addl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r8,%rax), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r13)
	cmpl	$7, %edx
	je	.L255
	addl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r8,%rax), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 56(%r13)
	cmpl	$9, %edx
	jne	.L256
	addl	%edi, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%r8d, %eax
	vcvtsi2sd	%eax, %xmm0, %xmm0
	movl	$9, %eax
	vmovsd	%xmm0, 64(%r13)
.L185:
	cmpl	%edx, %ecx
	je	.L186
.L184:
	subl	%edx, %ecx
	movl	$0, %r12d
	movl	%edx, %r11d
	leal	-8(%rcx), %esi
	leal	-1(%rbx), %edi
	shrl	$3, %esi
	addl	$1, %esi
	testl	%ebx, %ebx
	cmovle	%r12d, %edi
	leal	0(,%rsi,8), %r10d
	subl	%edx, %edi
	cmpl	$6, %edi
	jbe	.L187
	vmovd	%eax, %xmm1
	vmovd	%r8d, %xmm2
	vpbroadcastd	-104(%rbp), %ymm4
	xorl	%edi, %edi
	leaq	0(%r13,%r11,8), %rdx
	vpbroadcastd	%xmm1, %ymm1
	vpbroadcastd	%xmm2, %ymm2
	vmovdqa	.LC26(%rip), %ymm3
	vpaddd	.LC25(%rip), %ymm1, %ymm1
.L188:
	vpmulld	%ymm1, %ymm4, %ymm0
	addl	$1, %edi
	addq	$64, %rdx
	vpaddd	%ymm3, %ymm1, %ymm1
	vpaddd	%ymm2, %ymm0, %ymm0
	vcvtdq2pd	%xmm0, %ymm5
	vextracti128	$0x1, %ymm0, %xmm0
	vmovapd	%ymm5, -64(%rdx)
	vcvtdq2pd	%xmm0, %ymm0
	vmovapd	%ymm0, -32(%rdx)
	cmpl	%esi, %edi
	jb	.L188
	addl	%r10d, %eax
	cmpl	%ecx, %r10d
	je	.L186
.L187:
	movl	-104(%rbp), %edi
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%eax, %rsi
	movl	%edi, %edx
	imull	%eax, %edx
	leal	(%rdx,%r8), %ecx
	vcvtsi2sd	%ecx, %xmm0, %xmm0
	leal	1(%rax), %ecx
	vmovsd	%xmm0, 0(%r13,%rsi,8)
	cmpl	%ecx, %ebx
	jle	.L186
	addl	%edi, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%ecx, %rcx
	leal	(%r8,%rdx), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx,8)
	leal	2(%rax), %ecx
	cmpl	%ecx, %ebx
	jle	.L186
	addl	%edi, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%ecx, %rcx
	leal	(%r8,%rdx), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx,8)
	leal	3(%rax), %ecx
	cmpl	%ebx, %ecx
	jge	.L186
	addl	%edi, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%ecx, %rcx
	leal	(%r8,%rdx), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx,8)
	leal	4(%rax), %ecx
	cmpl	%ecx, %ebx
	jle	.L186
	addl	%edi, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%ecx, %rcx
	leal	(%r8,%rdx), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx,8)
	leal	5(%rax), %ecx
	cmpl	%ecx, %ebx
	jle	.L186
	addl	%edi, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%ecx, %rcx
	addl	$6, %eax
	leal	(%r8,%rdx), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx,8)
	cmpl	%eax, %ebx
	jle	.L186
	addl	-104(%rbp), %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	cltq
	addl	%edx, %r8d
	vcvtsi2sd	%r8d, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax,8)
.L186:
	testl	%r14d, %r14d
	jle	.L305
.L192:
	movl	$0, -136(%rbp)
	xorl	%r13d, %r13d
	vzeroupper
.L208:
	movq	$0, -144(%rbp)
	movl	$0, -132(%rbp)
	testl	%ebx, %ebx
	jle	.L198
.L270:
	movq	ratios(%rip), %rax
	movq	-144(%rbp), %rcx
	vcvttsd2si	(%rax,%rcx), %r12d
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rax
	leaq	33(%rax), %rdi
	movq	%rax, %rbx
	movq	%rax, -112(%rbp)
	call	malloc
	movl	$1, %edi
	andq	$-16, %rax
	addq	$16, %rax
	movq	%rax, %r15
	movq	%rax, -128(%rbp)
	call	srand
	movq	%rbx, %rax
	testq	%rbx, %rbx
	je	.L194
	addq	%r15, %rax
	movq	%r15, %r14
	movl	$1374389535, %r15d
	movq	%rax, -104(%rbp)
	.p2align 4,,10
	.p2align 3
.L195:
	call	rand
	movl	%eax, %esi
	imull	%r15d
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %eax
	subl	%eax, %esi
	cmpl	%esi, %r12d
	setle	%bl
	addq	$1, %r14
	call	rand
	movl	$1321528399, %edx
	movzbl	%bl, %ebx
	movl	%eax, %esi
	imull	%edx
	addl	$2, %ebx
	movl	%esi, %eax
	sall	$5, %ebx
	sarl	$31, %eax
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %esi
	leal	1(%rbx,%rsi), %eax
	movb	%al, -1(%r14)
	cmpq	-104(%rbp), %r14
	jne	.L195
.L194:
	movq	-128(%rbp), %rax
	xorl	%r12d, %r12d
	movl	$toupperversion+8, %ebx
	movq	-112(%rbp), %rcx
	movb	$0, (%rax,%rcx)
	cmpq	$0, toupperversion+8(%rip)
	je	.L207
	.p2align 4,,10
	.p2align 3
.L206:
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %r14
	leaq	33(%r14), %rdi
	call	malloc
	movq	-128(%rbp), %rsi
	leaq	1(%r14), %rdx
	andq	$-16, %rax
	leaq	16(%rax), %r15
	movq	%r15, %rdi
	call	memcpy
	movl	no_sz(%rip), %edx
	movl	no_ratio(%rip), %eax
	movl	debug(%rip), %ecx
	movq	(%rbx), %r14
	imull	%r12d, %edx
	imull	%eax, %edx
	imull	-136(%rbp), %eax
	addl	-132(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -104(%rbp)
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rax
	movq	%rax, -112(%rbp)
	testl	%ecx, %ecx
	jne	.L306
.L199:
	leaq	-80(%rbp), %rsi
	movl	$1, %edi
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	call	clock_gettime
	testl	%eax, %eax
	jne	.L201
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	-80(%rbp), %xmm1, %xmm1
	movq	-112(%rbp), %rsi
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	movq	%r15, %rdi
	vdivsd	.LC29(%rip), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm6
	vmovsd	%xmm6, -120(%rbp)
	call	*%r14
	leaq	-96(%rbp), %rsi
	movl	$1, %edi
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	call	clock_gettime
	testl	%eax, %eax
	jne	.L201
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	-96(%rbp), %xmm1, %xmm1
	movslq	-104(%rbp), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	-88(%rbp), %xmm0, %xmm0
	movq	results(%rip), %rdx
	vdivsd	.LC29(%rip), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	-120(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	movl	debug(%rip), %edx
	testl	%edx, %edx
	je	.L202
	movq	%r15, %rdx
	movl	$.LC30, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L202:
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %r14
	testq	%r14, %r14
	je	.L203
	call	__ctype_toupper_loc
	xorl	%r8d, %r8d
	movq	(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L205:
	movsbq	(%r8,%r15), %r9
	movl	(%rdx,%r9,4), %eax
	cmpl	%eax, %r9d
	jne	.L307
	addq	$1, %r8
	cmpq	%r8, %r14
	jne	.L205
.L203:
	leaq	-16(%r15), %rdi
	addq	$16, %rbx
	addl	$1, %r12d
	call	free
	cmpq	$0, (%rbx)
	jne	.L206
.L207:
	movq	-128(%rbp), %rdi
	subq	$16, %rdi
	call	free
	movl	no_ratio(%rip), %ebx
	addl	$1, -132(%rbp)
	movl	-132(%rbp), %eax
	addq	$8, -144(%rbp)
	cmpl	%eax, %ebx
	jg	.L270
.L198:
	addl	$1, -136(%rbp)
	addq	$8, %r13
	movl	-136(%rbp), %eax
	cmpl	%eax, no_sz(%rip)
	jg	.L208
.L193:
	movl	$.LC32, %edi
	call	puts
	cmpl	$0, no_sz(%rip)
	jle	.L209
	movl	no_ratio(%rip), %eax
	movq	$0, -104(%rbp)
	xorl	%r12d, %r12d
.L210:
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L213
.L268:
	movq	ratios(%rip), %rax
	movl	$.LC33, %esi
	movl	$1, %edi
	xorl	%r15d, %r15d
	movq	-104(%rbp), %rcx
	movl	$toupperversion, %r14d
	vmovsd	(%rax,%r13), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%rcx), %rdx
	movl	$1, %eax
	call	__printf_chk
	movl	no_version(%rip), %eax
	testl	%eax, %eax
	jle	.L215
	.p2align 4,,10
	.p2align 3
.L269:
	movl	no_sz(%rip), %esi
	movl	$1, %edi
	addq	$16, %r14
	movl	no_ratio(%rip), %eax
	imull	%r15d, %esi
	addl	$1, %r15d
	movl	%eax, %edx
	imull	%r12d, %edx
	imull	%esi, %eax
	movl	$.LC34, %esi
	addl	%ebx, %edx
	addl	%edx, %eax
	movq	results(%rip), %rdx
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	movl	$1, %eax
	movq	-16(%r14), %rdx
	call	__printf_chk
	cmpl	no_version(%rip), %r15d
	jl	.L269
.L215:
	movl	$10, %edi
	addl	$1, %ebx
	addq	$8, %r13
	call	putchar
	movl	no_ratio(%rip), %eax
	cmpl	%eax, %ebx
	jl	.L268
.L213:
	addq	$8, -104(%rbp)
	addl	$1, %r12d
	cmpl	no_sz(%rip), %r12d
	jl	.L210
.L209:
	xorl	%eax, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L308
	leaq	-48(%rbp), %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L306:
	.cfi_restore_state
	movq	%r15, %rdx
	movl	$.LC27, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L199
.L307:
	movslq	%r12d, %rdx
	subq	$8, %rsp
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	salq	$4, %rdx
	pushq	%rax
	xorl	%eax, %eax
	movq	toupperversion(%rdx), %rcx
	movl	$.LC31, %edx
	call	__fprintf_chk
	call	abort
.L236:
	movl	$8, %r13d
	movl	$1, %ebx
	jmp	.L172
.L303:
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L175
	jmp	.L174
.L304:
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L184
	jmp	.L183
.L308:
	call	__stack_chk_fail
.L305:
	vzeroupper
	jmp	.L193
.L155:
	cmpq	$0, toupperversion+8(%rip)
	je	.L309
	movl	$1, -104(%rbp)
	movl	$50, %r8d
	xorl	%r13d, %r13d
	movl	$10000, %r15d
	movl	$0, -120(%rbp)
	movl	$800000, %r12d
	jmp	.L216
.L302:
	xorl	%esi, %esi
	jmp	.L169
.L309:
	movl	$1, -104(%rbp)
	xorl	%esi, %esi
	movl	$50, %r8d
	movl	$10000, %r15d
	movl	$1, no_sz(%rip)
	movl	$800000, %r12d
	movl	$1, %ebx
	movl	$1, %r14d
	movl	$8, %r13d
	jmp	.L172
.L224:
	movl	$1, %esi
	jmp	.L170
.L225:
	movl	$2, %esi
	jmp	.L170
.L226:
	movl	$3, %esi
	jmp	.L170
.L227:
	movl	$4, %esi
	jmp	.L170
.L228:
	movl	$5, %esi
	jmp	.L170
.L229:
	movl	$6, %esi
	jmp	.L170
.L230:
	movl	$7, %esi
	jmp	.L170
.L231:
	movl	$8, %esi
	jmp	.L170
.L232:
	movl	$9, %esi
	jmp	.L170
.L233:
	movl	$10, %esi
	jmp	.L170
.L173:
	testl	%ebx, %ebx
	jle	.L193
	jmp	.L218
.L239:
	movl	$1, %edx
	jmp	.L176
.L240:
	movl	$2, %edx
	jmp	.L176
.L241:
	movl	$3, %edx
	jmp	.L176
.L242:
	movl	$4, %edx
	jmp	.L176
.L243:
	movl	$5, %edx
	jmp	.L176
.L244:
	movl	$6, %edx
	jmp	.L176
.L245:
	movl	$7, %edx
	jmp	.L176
.L246:
	movl	$8, %edx
	jmp	.L176
.L249:
	movl	$1, %eax
	jmp	.L185
.L250:
	movl	$2, %eax
	jmp	.L185
.L251:
	movl	$3, %eax
	jmp	.L185
.L252:
	movl	$4, %eax
	jmp	.L185
.L253:
	movl	$5, %eax
	jmp	.L185
.L254:
	movl	$6, %eax
	jmp	.L185
.L255:
	movl	$7, %eax
	jmp	.L185
.L256:
	movl	$8, %eax
	jmp	.L185
.L201:
	movl	$.LC28, %edi
	call	perror
	call	abort
	.cfi_endproc
.LFE4931:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE35:
	.section	.text.startup
.LHOTE35:
	.globl	toupperversion
	.section	.rodata.str1.1
.LC36:
	.string	"naive,fn,no size"
.LC37:
	.string	"naive,define,no size"
.LC38:
	.string	"library,no size"
.LC39:
	.string	"library,size"
.LC40:
	.string	"loop,fn"
.LC41:
	.string	"loop,define"
.LC42:
	.string	"unroll"
.LC43:
	.string	"mmx"
.LC44:
	.string	"sse2,rest"
.LC45:
	.string	"sse2"
.LC46:
	.string	"avx2"
.LC47:
	.string	"prefetch"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 208
toupperversion:
	.quad	.LC36
	.quad	toupper_naive_fn_no_size
	.quad	.LC37
	.quad	toupper_naive_define_no_size
	.quad	.LC38
	.quad	toupper_library_no_size
	.quad	.LC39
	.quad	toupper_library_size
	.quad	.LC40
	.quad	toupper_loop_fn
	.quad	.LC41
	.quad	toupper_loop_define
	.quad	.LC42
	.quad	toupper_unroll
	.quad	.LC43
	.quad	toupper_mmx
	.quad	.LC44
	.quad	toupper_sse_1
	.quad	.LC45
	.quad	toupper_sse
	.quad	.LC46
	.quad	toupper_avx_1
	.quad	.LC47
	.quad	toupper_prefetch_branch
	.quad	0
	.quad	0
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_sz
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.comm	sizes,8,8
	.comm	ratios,8,8
	.comm	results,8,8
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC2:
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.byte	-97
	.align 32
.LC3:
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.byte	25
	.align 32
.LC4:
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.byte	-32
	.align 32
.LC9:
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.align 32
.LC10:
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.align 32
.LC11:
	.quad	2314885530818453536
	.quad	2314885530818453536
	.quad	2314885530818453536
	.quad	2314885530818453536
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC13:
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.align 16
.LC14:
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.align 16
.LC15:
	.quad	2314885530818453536
	.quad	2314885530818453536
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC18:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.align 8
.LC19:
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.align 8
.LC20:
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.section	.rodata.cst32
	.align 32
.LC25:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC26:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.section	.rodata.cst8
	.align 8
.LC29:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
