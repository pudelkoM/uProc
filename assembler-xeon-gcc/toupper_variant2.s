	.file	"toupper.c"
	.text
	.type	toupper_naive_fn_no_size, @function
toupper_naive_fn_no_size:
.LFB4910:
	.cfi_startproc
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L1
.L6:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	movb	%al, (%rdi)
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L6
.L1:
	ret
	.cfi_endproc
.LFE4910:
	.size	toupper_naive_fn_no_size, .-toupper_naive_fn_no_size
	.type	toupper_naive_define_no_size, @function
toupper_naive_define_no_size:
.LFB4911:
	.cfi_startproc
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L8
.L13:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	movb	%al, (%rdi)
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L13
.L8:
	ret
	.cfi_endproc
.LFE4911:
	.size	toupper_naive_define_no_size, .-toupper_naive_define_no_size
	.type	toupper_loop_fn, @function
toupper_loop_fn:
.LFB4914:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L15
	movq	%rdi, %rdx
	addq	%rdi, %rsi
.L18:
	movzbl	(%rdx), %eax
	leal	-97(%rax), %ecx
	leal	-32(%rax), %r8d
	cmpb	$25, %cl
	cmovbe	%r8d, %eax
	movb	%al, (%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L18
.L15:
	ret
	.cfi_endproc
.LFE4914:
	.size	toupper_loop_fn, .-toupper_loop_fn
	.type	toupper_loop_define, @function
toupper_loop_define:
.LFB4915:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L20
	movq	%rdi, %rdx
	addq	%rdi, %rsi
.L23:
	movzbl	(%rdx), %eax
	leal	-97(%rax), %ecx
	leal	-32(%rax), %r8d
	cmpb	$25, %cl
	cmovbe	%r8d, %eax
	movb	%al, (%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L23
.L20:
	ret
	.cfi_endproc
.LFE4915:
	.size	toupper_loop_define, .-toupper_loop_define
	.type	toupper_unroll, @function
toupper_unroll:
.LFB4916:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L25
	movq	%rdi, %rax
.L35:
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
	movb	%dl, 6(%rax)
	movzbl	7(%rax), %edx
	leal	-97(%rdx), %r8d
	leal	-32(%rdx), %ecx
	cmpb	$25, %r8b
	cmovbe	%ecx, %edx
	movb	%dl, 7(%rax)
	addq	$8, %rax
	movq	%rax, %rdx
	subq	%rdi, %rdx
	cmpq	%rdx, %rsi
	ja	.L35
	andl	$7, %esi
	je	.L25
	addq	%rax, %rsi
.L37:
	movzbl	(%rax), %edx
	leal	-97(%rdx), %edi
	leal	-32(%rdx), %ecx
	cmpb	$25, %dil
	cmovbe	%ecx, %edx
	movb	%dl, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rsi
	jne	.L37
.L25:
	ret
	.cfi_endproc
.LFE4916:
	.size	toupper_unroll, .-toupper_unroll
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
	je	.L40
.L45:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	movb	%al, (%rdi)
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L45
.L40:
	ret
	.cfi_endproc
.LFE4917:
	.size	toupper_prefetch_branch, .-toupper_prefetch_branch
	.type	toupper_avx_1, @function
toupper_avx_1:
.LFB4923:
	.cfi_startproc
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC0(%rip), %ymm6
	vmovdqa	.LC1(%rip), %ymm5
	vmovdqa	.LC2(%rip), %ymm4
.L49:
	vmovdqu	(%rdi), %ymm2
	vpcmpeqb	%ymm3, %ymm2, %ymm1
	vpmovmskb	%ymm1, %eax
	testl	%eax, %eax
	jne	.L48
	vpsubb	%ymm6, %ymm2, %ymm0
	vpcmpgtb	%ymm5, %ymm0, %ymm0
	vpandn	%ymm4, %ymm0, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdi)
	addq	$32, %rdi
	jmp	.L49
.L48:
	bsfl	%eax, %eax
	movl	$-1, %edx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L47
	movl	$0, %ecx
.L52:
	movl	%ecx, %edx
	addq	%rdi, %rdx
	movzbl	(%rdx), %esi
	leal	-97(%rsi), %r8d
	cmpb	$25, %r8b
	ja	.L51
	subl	$32, %esi
	movb	%sil, (%rdx)
.L51:
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jnb	.L52
.L47:
	ret
	.cfi_endproc
.LFE4923:
	.size	toupper_avx_1, .-toupper_avx_1
	.type	toupper_sse, @function
toupper_sse:
.LFB4921:
	.cfi_startproc
	shrq	$4, %rsi
	je	.L54
	movl	$0, %eax
	vmovdqa	.LC3(%rip), %xmm4
	vmovdqa	.LC4(%rip), %xmm3
	vmovdqa	.LC5(%rip), %xmm2
.L56:
	vmovdqu	(%rdi), %xmm1
	vpsubb	%xmm4, %xmm1, %xmm0
	vpcmpgtb	%xmm3, %xmm0, %xmm0
	vpandn	%xmm2, %xmm0, %xmm0
	vpxor	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, (%rdi)
	addq	$1, %rax
	addq	$16, %rdi
	cmpq	%rsi, %rax
	jne	.L56
.L54:
	ret
	.cfi_endproc
.LFE4921:
	.size	toupper_sse, .-toupper_sse
	.type	toupper_sse_1, @function
toupper_sse_1:
.LFB4919:
	.cfi_startproc
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC3(%rip), %xmm6
	vmovdqa	.LC4(%rip), %xmm5
	vmovdqa	.LC5(%rip), %xmm4
.L60:
	vmovdqu	(%rdi), %xmm2
	vpcmpeqb	%xmm3, %xmm2, %xmm1
	vpmovmskb	%xmm1, %eax
	testl	%eax, %eax
	jne	.L59
	vpsubb	%xmm6, %xmm2, %xmm0
	vpcmpgtb	%xmm5, %xmm0, %xmm0
	vpandn	%xmm4, %xmm0, %xmm0
	vpxor	%xmm2, %xmm0, %xmm0
	vmovups	%xmm0, (%rdi)
	addq	$16, %rdi
	jmp	.L60
.L59:
	bsfl	%eax, %eax
	movl	$-1, %edx
	cmove	%edx, %eax
	testl	%eax, %eax
	je	.L58
	movl	$0, %ecx
.L63:
	movl	%ecx, %edx
	addq	%rdi, %rdx
	movzbl	(%rdx), %esi
	leal	-97(%rsi), %r8d
	cmpb	$25, %r8b
	ja	.L62
	subl	$32, %esi
	movb	%sil, (%rdx)
.L62:
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jnb	.L63
.L58:
	ret
	.cfi_endproc
.LFE4919:
	.size	toupper_sse_1, .-toupper_sse_1
	.type	toupper_mmx, @function
toupper_mmx:
.LFB4920:
	.cfi_startproc
	shrq	$3, %rsi
	je	.L65
	movq	.LC6(%rip), %mm3
	movq	.LC7(%rip), %mm2
	movq	.LC8(%rip), %mm1
	movl	$0, %eax
.L67:
	movq	(%rdi,%rax,8), %mm0
	psubb	%mm3, %mm0
	pcmpgtb	%mm2, %mm0
	pandn	%mm1, %mm0
	pxor	(%rdi,%rax,8), %mm0
	movq	%mm0, -8(%rsp)
	movq	-8(%rsp), %rdx
	movq	%rdx, (%rdi,%rax,8)
	addq	$1, %rax
	cmpq	%rsi, %rax
	jne	.L67
.L65:
	ret
	.cfi_endproc
.LFE4920:
	.size	toupper_mmx, .-toupper_mmx
	.type	toupper_library_size, @function
toupper_library_size:
.LFB4913:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L75
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, %rbx
	movq	%rdi, %rbp
	call	__ctype_toupper_loc
	movq	%rbp, %rdx
	leaq	0(%rbp,%rbx), %rsi
.L71:
	movsbq	(%rdx), %r8
	movq	(%rax), %rcx
	movl	(%rcx,%r8,4), %ecx
	movb	%cl, (%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L71
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L75:
	ret
	.cfi_endproc
.LFE4913:
	.size	toupper_library_size, .-toupper_library_size
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
	movzbl	(%rdi), %ebx
	testb	%bl, %bl
	je	.L76
	movq	%rdi, %rbp
	call	__ctype_toupper_loc
.L78:
	movsbq	%bl, %rbx
	movq	(%rax), %rdx
	movl	(%rdx,%rbx,4), %edx
	movb	%dl, 0(%rbp)
	addq	$1, %rbp
	movzbl	0(%rbp), %ebx
	testb	%bl, %bl
	jne	.L78
.L76:
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC10:
	.string	"Before: %.40s...\n"
.LC11:
	.string	"getting time"
.LC13:
	.string	"After:  %.40s...\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC14:
	.string	"%s failed check at %zu: %c should be %c\n"
	.align 8
.LC15:
	.string	"VARIANT2: gcc -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O1 toupper.c"
	.align 8
.LC16:
	.string	"Size: %ld \tRatio: %f \tRunning time:\n"
	.section	.rodata.str1.1
.LC17:
	.string	"\t%-16s:\t%9.5f \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4931:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	%edi, %eax
	movl	%edi, 36(%rsp)
	movq	%fs:40, %rdi
	movq	%rdi, 72(%rsp)
	xorl	%edi, %edi
	cmpl	$1, %eax
	jle	.L82
	leaq	8(%rsi), %rbx
	leal	2(%rax), %r15d
	movl	$3, %r12d
	movl	$1, 16(%rsp)
	movl	$0, 32(%rsp)
	movl	$50, 8(%rsp)
	movl	$10000, %r13d
	movq	$0, 24(%rsp)
	movl	$800000, %r14d
.L94:
	movq	%rbx, %rbp
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L86
	cmpb	$100, 1(%rax)
	jne	.L84
	cmpb	$0, 2(%rax)
	jne	.L86
	movl	$1, debug(%rip)
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L85
.L129:
	cmpb	$108, 1(%rax)
	jne	.L86
	cmpb	$0, 2(%rax)
	jne	.L86
	movq	8(%rbp), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r14
	andl	$63, %eax
	je	.L87
	addq	$64, %r14
	subq	%rax, %r14
.L87:
	cmpl	%r12d, 36(%rsp)
	jle	.L88
	movq	16(%rbp), %rdi
	cmpb	$45, (%rdi)
	jne	.L89
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	jne	.L90
	cmpb	$0, 2(%rdi)
	jne	.L89
	jmp	.L88
.L90:
	cmpb	$100, %al
	jne	.L89
	cmpb	$0, 2(%rdi)
	je	.L88
.L89:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %rsi
	movq	%rsi, 24(%rsp)
	andl	$63, %eax
	je	.L91
	addq	$64, %rsi
	movq	%rsi, %rdx
	subq	%rax, %rdx
	movq	%rdx, 24(%rsp)
.L91:
	movq	24(%rbp), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r13
	andl	$63, %eax
	je	.L86
	addq	$64, %r13
	subq	%rax, %r13
.L86:
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L85
	cmpb	$114, 1(%rax)
	jne	.L85
	cmpb	$0, 2(%rax)
	jne	.L85
	movq	8(%rbp), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 8(%rsp)
	cmpl	%r12d, 36(%rsp)
	jle	.L88
	movq	16(%rbp), %rdi
	cmpb	$45, (%rdi)
	jne	.L92
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	jne	.L93
	cmpb	$0, 2(%rdi)
	jne	.L92
	jmp	.L88
.L93:
	cmpb	$100, %al
	jne	.L92
	cmpb	$0, 2(%rdi)
	je	.L88
.L92:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 32(%rsp)
	movq	24(%rbp), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 16(%rsp)
.L85:
	addq	$8, %rbx
	addl	$1, %r12d
	cmpl	%r15d, %r12d
	jne	.L94
.L88:
	cmpq	$0, toupperversion+8(%rip)
	jne	.L126
	jmp	.L131
.L135:
	movl	$1, 16(%rsp)
	movl	$0, 32(%rsp)
	movl	$50, 8(%rsp)
	movl	$10000, %r13d
	movq	$0, 24(%rsp)
	movl	$800000, %r14d
.L126:
	movl	$toupperversion+24, %eax
	movl	$0, %ecx
.L96:
	addl	$1, %ecx
	addq	$16, %rax
	cmpq	$0, -16(%rax)
	jne	.L96
	movl	%ecx, no_version(%rip)
	jmp	.L95
.L131:
	movl	$0, %ecx
.L95:
	cmpq	$0, 24(%rsp)
	jne	.L97
.L127:
	movl	$1, no_sz(%rip)
	jmp	.L98
.L97:
	movq	24(%rsp), %rax
	subq	%r14, %rax
	movl	$0, %edx
	divq	%r13
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L98:
	cmpl	$0, 32(%rsp)
	jne	.L99
	movl	$1, no_ratio(%rip)
	jmp	.L100
.L99:
	movl	32(%rsp), %eax
	subl	8(%rsp), %eax
	cltd
	idivl	16(%rsp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L100:
	movl	no_sz(%rip), %ebp
	movl	no_ratio(%rip), %ebx
	movl	%ecx, %edi
	imull	%ebp, %edi
	imull	%ebx, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, results(%rip)
	movslq	%ebx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, ratios(%rip)
	movslq	%ebp, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, sizes(%rip)
	testl	%ebp, %ebp
	jle	.L101
	movl	$0, %eax
.L102:
	movslq	%eax, %rcx
	movq	%rcx, %rdx
	imulq	%r13, %rdx
	addq	%r14, %rdx
	movq	sizes(%rip), %rsi
	movq	%rdx, (%rsi,%rcx,8)
	addl	$1, %eax
	cmpl	%eax, no_sz(%rip)
	jg	.L102
	cmpl	$0, no_ratio(%rip)
	jle	.L103
.L128:
	movl	16(%rsp), %edi
	movl	8(%rsp), %edx
	movl	$0, %eax
.L104:
	movslq	%eax, %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%edx, %xmm0, %xmm0
	movq	ratios(%rip), %rcx
	vmovsd	%xmm0, (%rcx,%rsi,8)
	addl	$1, %eax
	addl	%edi, %edx
	cmpl	%eax, no_ratio(%rip)
	jg	.L104
.L103:
	movl	$0, 36(%rsp)
	cmpl	$0, no_sz(%rip)
	jg	.L147
	jmp	.L106
.L118:
	movslq	24(%rsp), %rax
	movq	ratios(%rip), %rdx
	vcvttsd2si	(%rdx,%rax,8), %r15d
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %r14
	leaq	33(%r14), %rdi
	call	malloc
	andq	$-16, %rax
	leaq	16(%rax), %rax
	movq	%rax, 40(%rsp)
	movq	%rax, 8(%rsp)
	movl	$1, %edi
	call	srand
	testq	%r14, %r14
	je	.L133
	movl	$0, %r12d
	movl	$0, %ebp
.L108:
	addq	8(%rsp), %rbp
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %eax
	imull	%ecx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	imull	$100, %edx, %eax
	subl	%eax, %ecx
	movsbl	%cl, %ecx
	cmpl	%ecx, %r15d
	setle	%bl
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %ecx
	movzbl	%bl, %ebx
	addl	$2, %ebx
	sall	$5, %ebx
	leal	1(%rbx,%rcx), %eax
	movb	%al, 0(%rbp)
	addl	$1, %r12d
	movslq	%r12d, %rbp
	cmpq	%rbp, %r14
	ja	.L108
	jmp	.L107
.L133:
	movq	%r14, %rbp
.L107:
	movq	40(%rsp), %rax
	movb	$0, (%rax,%rbp)
	cmpq	$0, toupperversion+8(%rip)
	je	.L109
	movl	$toupperversion+8, %ebp
	movl	$0, %r12d
.L117:
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %r14
	leaq	33(%r14), %rdi
	call	malloc
	andq	$-16, %rax
	leaq	16(%rax), %rbx
	leaq	1(%r14), %rdx
	movq	8(%rsp), %rsi
	movq	%rbx, %rdi
	call	memcpy
	movl	no_ratio(%rip), %eax
	movl	%r12d, %edx
	imull	no_sz(%rip), %edx
	imull	%eax, %edx
	imull	36(%rsp), %eax
	addl	24(%rsp), %eax
	addl	%edx, %eax
	movl	%eax, 32(%rsp)
	movq	0(%rbp), %r14
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %r15
	cmpl	$0, debug(%rip)
	je	.L110
	movq	%rbx, %rdx
	movl	$.LC10, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L110:
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	leaq	48(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime
	testl	%eax, %eax
	je	.L111
	movl	$.LC11, %edi
	call	perror
	call	abort
.L111:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	56(%rsp), %xmm0, %xmm0
	vdivsd	.LC12(%rip), %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	48(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	%xmm2, 16(%rsp)
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	*%r14
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	leaq	48(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime
	testl	%eax, %eax
	je	.L112
	movl	$.LC11, %edi
	call	perror
	call	abort
.L112:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	56(%rsp), %xmm0, %xmm0
	vdivsd	.LC12(%rip), %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	48(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	movslq	32(%rsp), %rax
	vsubsd	16(%rsp), %xmm0, %xmm0
	movq	results(%rip), %rdx
	vmovsd	%xmm0, (%rdx,%rax,8)
	cmpl	$0, debug(%rip)
	je	.L113
	movq	%rbx, %rdx
	movl	$.LC13, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L113:
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %r14
	testq	%r14, %r14
	je	.L114
	call	__ctype_toupper_loc
	movq	(%rax), %rdx
	movl	$0, %r8d
.L116:
	movzbl	(%r8,%rbx), %eax
	movsbl	%al, %r9d
	movsbq	%al, %rax
	movl	(%rdx,%rax,4), %eax
	cmpl	%eax, %r9d
	je	.L115
	movslq	%r12d, %rdx
	salq	$4, %rdx
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 152
	pushq	%rax
	.cfi_def_cfa_offset 160
	movq	toupperversion(%rdx), %rcx
	movl	$.LC14, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk
	call	abort
.L115:
	.cfi_restore_state
	addq	$1, %r8
	cmpq	%r8, %r14
	jne	.L116
.L114:
	leaq	-16(%rbx), %rdi
	call	free
	addl	$1, %r12d
	addq	$16, %rbp
	cmpq	$0, 0(%rbp)
	jne	.L117
.L109:
	movq	40(%rsp), %rdi
	subq	$16, %rdi
	call	free
	addl	$1, 24(%rsp)
	movl	24(%rsp), %eax
	cmpl	%eax, no_ratio(%rip)
	jg	.L118
.L119:
	addl	$1, 36(%rsp)
	movl	36(%rsp), %eax
	cmpl	%eax, no_sz(%rip)
	jle	.L106
.L147:
	cmpl	$0, no_ratio(%rip)
	jle	.L119
	movslq	36(%rsp), %r13
	salq	$3, %r13
	movl	$0, 24(%rsp)
	jmp	.L118
.L106:
	movl	$.LC15, %edi
	call	puts
	movl	$0, %r13d
	cmpl	$0, no_sz(%rip)
	jg	.L146
	jmp	.L121
.L124:
	movslq	%r12d, %rax
	movq	ratios(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r14), %rdx
	movl	$.LC16, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	cmpl	$0, no_version(%rip)
	jle	.L122
	movl	$toupperversion, %ebp
	movl	$0, %ebx
.L123:
	movl	no_ratio(%rip), %eax
	movl	%eax, %edx
	imull	%r13d, %edx
	addl	%r12d, %edx
	movl	%ebx, %ecx
	imull	no_sz(%rip), %ecx
	imull	%ecx, %eax
	addl	%edx, %eax
	cltq
	movq	results(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	0(%rbp), %rdx
	movl	$.LC17, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	no_version(%rip), %ebx
	jl	.L123
.L122:
	movl	$10, %edi
	call	putchar
	addl	$1, %r12d
	cmpl	no_ratio(%rip), %r12d
	jl	.L124
.L125:
	addl	$1, %r13d
	cmpl	no_sz(%rip), %r13d
	jge	.L121
.L146:
	cmpl	$0, no_ratio(%rip)
	jle	.L125
	movslq	%r13d, %r14
	salq	$3, %r14
	movl	$0, %r12d
	jmp	.L124
.L121:
	movl	$0, %eax
	movq	72(%rsp), %rsi
	xorq	%fs:40, %rsi
	je	.L130
	jmp	.L148
.L82:
	cmpq	$0, toupperversion+8(%rip)
	jne	.L135
	movl	$0, %ecx
	movl	$1, 16(%rsp)
	movl	$0, 32(%rsp)
	movl	$50, 8(%rsp)
	movl	$10000, %r13d
	movl	$800000, %r14d
	jmp	.L127
.L101:
	testl	%ebx, %ebx
	jg	.L128
	jmp	.L106
.L84:
	movq	(%rbx), %rax
	jmp	.L129
.L148:
	call	__stack_chk_fail
.L130:
	addq	$88, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4931:
	.size	main, .-main
	.globl	toupperversion
	.section	.rodata.str1.1
.LC18:
	.string	"naive,fn,no size"
.LC19:
	.string	"naive,define,no size"
.LC20:
	.string	"library,no size"
.LC21:
	.string	"library,size"
.LC22:
	.string	"loop,fn"
.LC23:
	.string	"loop,define"
.LC24:
	.string	"unroll"
.LC25:
	.string	"mmx"
.LC26:
	.string	"sse2,rest"
.LC27:
	.string	"sse2"
.LC28:
	.string	"avx2"
.LC29:
	.string	"prefetch"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 208
toupperversion:
	.quad	.LC18
	.quad	toupper_naive_fn_no_size
	.quad	.LC19
	.quad	toupper_naive_define_no_size
	.quad	.LC20
	.quad	toupper_library_no_size
	.quad	.LC21
	.quad	toupper_library_size
	.quad	.LC22
	.quad	toupper_loop_fn
	.quad	.LC23
	.quad	toupper_loop_define
	.quad	.LC24
	.quad	toupper_unroll
	.quad	.LC25
	.quad	toupper_mmx
	.quad	.LC26
	.quad	toupper_sse_1
	.quad	.LC27
	.quad	toupper_sse
	.quad	.LC28
	.quad	toupper_avx_1
	.quad	.LC29
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
.LC0:
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
.LC1:
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
.LC2:
	.quad	2314885530818453536
	.quad	2314885530818453536
	.quad	2314885530818453536
	.quad	2314885530818453536
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
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
.LC4:
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
.LC5:
	.quad	2314885530818453536
	.quad	2314885530818453536
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.align 8
.LC7:
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.align 8
.LC8:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.align 8
.LC12:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
