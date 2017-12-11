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
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L9:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
.L12:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L9
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
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L22:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
.L25:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L22
	ret
	.cfi_endproc
.LFE4911:
	.size	toupper_naive_define_no_size, .-toupper_naive_define_no_size
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.type	toupper_loop_fn, @function
toupper_loop_fn:
.LFB4914:
	.cfi_startproc
	leaq	(%rdi,%rsi), %r8
	testq	%rsi, %rsi
	je	.L33
	.p2align 4,,10
	.p2align 3
.L31:
	movzbl	(%rdi), %eax
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
	cmpq	%r8, %rdi
	jne	.L31
.L33:
	ret
	.cfi_endproc
.LFE4914:
	.size	toupper_loop_fn, .-toupper_loop_fn
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.type	toupper_loop_define, @function
toupper_loop_define:
.LFB4915:
	.cfi_startproc
	leaq	(%rdi,%rsi), %r8
	testq	%rsi, %rsi
	je	.L41
	.p2align 4,,10
	.p2align 3
.L39:
	movzbl	(%rdi), %eax
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
	cmpq	%r8, %rdi
	jne	.L39
.L41:
	ret
	.cfi_endproc
.LFE4915:
	.size	toupper_loop_define, .-toupper_loop_define
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.type	toupper_unroll, @function
toupper_unroll:
.LFB4916:
	.cfi_startproc
	movq	%rdi, %rax
	testq	%rsi, %rsi
	je	.L62
	.p2align 4,,10
	.p2align 3
.L58:
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
	addq	$8, %rax
	movb	%dl, -1(%rax)
	movq	%rax, %rdx
	subq	%rdi, %rdx
	cmpq	%rdx, %rsi
	ja	.L58
	andl	$7, %esi
	je	.L62
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L55:
	movzbl	(%rax), %edx
	leal	-97(%rdx), %edi
	leal	-32(%rdx), %ecx
	cmpb	$25, %dil
	cmovbe	%ecx, %edx
	addq	$1, %rax
	movb	%dl, -1(%rax)
	cmpq	%rsi, %rax
	jne	.L55
.L62:
	ret
	.cfi_endproc
.LFE4916:
	.size	toupper_unroll, .-toupper_unroll
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
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
	je	.L73
	.p2align 4,,10
	.p2align 3
.L71:
	leal	-97(%rax), %ecx
	leal	-32(%rax), %edx
	cmpb	$25, %cl
	cmovbe	%edx, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L71
.L73:
	ret
	.cfi_endproc
.LFE4917:
	.size	toupper_prefetch_branch, .-toupper_prefetch_branch
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.type	toupper_avx_1, @function
toupper_avx_1:
.LFB4923:
	.cfi_startproc
	vmovdqa	.LC6(%rip), %ymm6
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC7(%rip), %ymm5
	vmovdqa	.LC8(%rip), %ymm4
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L84:
	vpsubb	%ymm6, %ymm2, %ymm0
	addq	$32, %rdi
	vpcmpgtb	%ymm5, %ymm0, %ymm0
	vpandn	%ymm4, %ymm0, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqu	%ymm0, -32(%rdi)
.L76:
	vmovdqu	(%rdi), %ymm2
	vpcmpeqb	%ymm3, %ymm2, %ymm1
	vpmovmskb	%ymm1, %eax
	testl	%eax, %eax
	je	.L84
	tzcntl	%eax, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L83
	.p2align 4,,10
	.p2align 3
.L81:
	movl	%ecx, %edx
	addq	%rdi, %rdx
	movzbl	(%rdx), %esi
	leal	-97(%rsi), %r8d
	cmpb	$25, %r8b
	ja	.L78
	subl	$32, %esi
	movb	%sil, (%rdx)
.L78:
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jnb	.L81
.L83:
	vzeroupper
	ret
	.cfi_endproc
.LFE4923:
	.size	toupper_avx_1, .-toupper_avx_1
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.type	toupper_sse, @function
toupper_sse:
.LFB4921:
	.cfi_startproc
	shrq	$4, %rsi
	je	.L90
	vmovdqa	.LC10(%rip), %xmm4
	salq	$4, %rsi
	vmovdqa	.LC11(%rip), %xmm3
	leaq	(%rdi,%rsi), %rax
	vmovdqa	.LC12(%rip), %xmm2
	.p2align 4,,10
	.p2align 3
.L87:
	vmovdqu	(%rdi), %xmm1
	addq	$16, %rdi
	vpsubb	%xmm4, %xmm1, %xmm0
	vpcmpgtb	%xmm3, %xmm0, %xmm0
	vpandn	%xmm2, %xmm0, %xmm0
	vpxor	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
	cmpq	%rdi, %rax
	jne	.L87
.L90:
	ret
	.cfi_endproc
.LFE4921:
	.size	toupper_sse, .-toupper_sse
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.type	toupper_sse_1, @function
toupper_sse_1:
.LFB4919:
	.cfi_startproc
	vmovdqa	.LC10(%rip), %xmm6
	vpxor	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC11(%rip), %xmm5
	vmovdqa	.LC12(%rip), %xmm4
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L101:
	vpsubb	%xmm6, %xmm2, %xmm0
	addq	$16, %rdi
	vpcmpgtb	%xmm5, %xmm0, %xmm0
	vpandn	%xmm4, %xmm0, %xmm0
	vpxor	%xmm2, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
.L93:
	vmovdqu	(%rdi), %xmm2
	vpcmpeqb	%xmm3, %xmm2, %xmm1
	vpmovmskb	%xmm1, %eax
	testl	%eax, %eax
	je	.L101
	tzcntl	%eax, %eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	je	.L100
	.p2align 4,,10
	.p2align 3
.L98:
	movl	%ecx, %edx
	addq	%rdi, %rdx
	movzbl	(%rdx), %esi
	leal	-97(%rsi), %r8d
	cmpb	$25, %r8b
	ja	.L95
	subl	$32, %esi
	movb	%sil, (%rdx)
.L95:
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jnb	.L98
.L100:
	ret
	.cfi_endproc
.LFE4919:
	.size	toupper_sse_1, .-toupper_sse_1
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.type	toupper_mmx, @function
toupper_mmx:
.LFB4920:
	.cfi_startproc
	shrq	$3, %rsi
	je	.L107
	leaq	(%rdi,%rsi,8), %rax
	movq	.LC16(%rip), %mm3
	movq	.LC17(%rip), %mm2
	movq	.LC15(%rip), %mm1
	.p2align 4,,10
	.p2align 3
.L104:
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
	jne	.L104
.L107:
	ret
	.cfi_endproc
.LFE4920:
	.size	toupper_mmx, .-toupper_mmx
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.type	toupper_library_size, @function
toupper_library_size:
.LFB4913:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L116
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
.L110:
	movsbq	(%rdi), %rcx
	addq	$1, %rdi
	movq	(%rax), %rdx
	movl	(%rdx,%rcx,4), %edx
	movb	%dl, -1(%rdi)
	cmpq	%rdi, %rsi
	jne	.L110
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L116:
	ret
	.cfi_endproc
.LFE4913:
	.size	toupper_library_size, .-toupper_library_size
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
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
	je	.L122
	movq	%rdi, %rbp
	call	__ctype_toupper_loc
	.p2align 4,,10
	.p2align 3
.L119:
	movq	(%rax), %rdx
	addq	$1, %rbp
	movl	(%rdx,%rbx,4), %edx
	movb	%dl, -1(%rbp)
	movsbq	0(%rbp), %rbx
	testb	%bl, %bl
	jne	.L119
.L122:
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
.LCOLDE21:
	.text
.LHOTE21:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC22:
	.string	"Before: %.40s...\n"
.LC23:
	.string	"getting time"
.LC25:
	.string	"After:  %.40s...\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC26:
	.string	"%s failed check at %zu: %c should be %c\n"
	.align 8
.LC27:
	.string	"VARIANT3: gcc -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O2 toupper.c"
	.align 8
.LC28:
	.string	"Size: %ld \tRatio: %f \tRunning time:\n"
	.section	.rodata.str1.1
.LC29:
	.string	"\t%-16s:\t%9.5f \n"
	.section	.text.unlikely
.LCOLDB30:
	.section	.text.startup,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rcx
	movq	%rcx, 88(%rsp)
	xorl	%ecx, %ecx
	movl	%edi, 32(%rsp)
	cmpl	$1, %edi
	jle	.L125
	movl	%edi, %eax
	movl	$3, %ebx
	movl	$1, %r13d
	movl	$0, 24(%rsp)
	addl	$2, %eax
	movl	$10000, %r14d
	xorl	%r12d, %r12d
	movl	$50, 16(%rsp)
	leaq	8(%rsi), %r15
	movl	%eax, 8(%rsp)
	movl	$800000, %ebp
	jmp	.L141
.L139:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	24(%r15), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, 24(%rsp)
	call	strtol
	movl	%eax, %r13d
.L126:
	addq	$8, %r15
	addl	$1, %ebx
	cmpl	%ebx, 8(%rsp)
	je	.L134
.L141:
	movq	(%r15), %rax
	cmpb	$45, (%rax)
	jne	.L126
	cmpb	$100, 1(%rax)
	jne	.L127
	cmpb	$0, 2(%rax)
	jne	.L218
	movl	$1, debug(%rip)
	cmpb	$45, (%rax)
	jne	.L126
.L127:
	cmpb	$108, 1(%rax)
	jne	.L218
	cmpb	$0, 2(%rax)
	jne	.L126
	movq	8(%r15), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %rbp
	andl	$63, %eax
	je	.L133
	addq	$64, %rbp
	cltq
	subq	%rax, %rbp
.L133:
	cmpl	32(%rsp), %ebx
	jge	.L134
	movq	16(%r15), %rdi
	cmpb	$45, (%rdi)
	jne	.L135
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	je	.L217
	cmpb	$100, %al
	jne	.L135
.L217:
	cmpb	$0, 2(%rdi)
	je	.L134
.L135:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %r12
	andl	$63, %eax
	je	.L137
	addq	$64, %r12
	cltq
	subq	%rax, %r12
.L137:
	movq	24(%r15), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %r14
	andl	$63, %eax
	je	.L219
	addq	$64, %r14
	cltq
	subq	%rax, %r14
.L219:
	movq	(%r15), %rax
.L218:
	movzbl	(%rax), %edx
	cmpb	$45, %dl
	jne	.L126
	cmpb	$114, 1(%rax)
	jne	.L126
	cmpb	$0, 2(%rax)
	jne	.L126
	movq	8(%r15), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, 16(%rsp)
	cmpl	32(%rsp), %ebx
	jge	.L134
	movq	16(%r15), %rdi
	cmpb	$45, (%rdi)
	jne	.L139
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	je	.L220
	cmpb	$100, %al
	jne	.L139
.L220:
	cmpb	$0, 2(%rdi)
	jne	.L139
.L134:
	cmpq	$0, toupperversion+8(%rip)
	je	.L225
.L178:
	movl	$toupperversion+24, %eax
	xorl	%ecx, %ecx
.L143:
	addq	$16, %rax
	addl	$1, %ecx
	cmpq	$0, -16(%rax)
	jne	.L143
	movl	%ecx, no_version(%rip)
.L142:
	testq	%r12, %r12
	jne	.L144
.L179:
	movq	$8, 8(%rsp)
	movl	$1, %r15d
	movl	$1, no_sz(%rip)
.L145:
	movl	24(%rsp), %edi
	testl	%edi, %edi
	jne	.L146
	movl	%ecx, %edi
	movl	$1, %ebx
	movl	$1, no_ratio(%rip)
	imull	%r15d, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movl	$8, %edi
	movq	%rax, results(%rip)
	call	malloc
	movq	8(%rsp), %rdi
	movq	%rax, %r12
	movq	%rax, ratios(%rip)
	call	malloc
	movq	%rax, sizes(%rip)
	testl	%r15d, %r15d
	jle	.L148
.L147:
	leal	-1(%r15), %edx
	leaq	8(%rax,%rdx,8), %rdx
.L150:
	movq	%rbp, (%rax)
	addq	$8, %rax
	addq	%r14, %rbp
	cmpq	%rdx, %rax
	jne	.L150
	testl	%ebx, %ebx
	jle	.L153
.L148:
	movl	16(%rsp), %edx
	xorl	%eax, %eax
.L152:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%edx, %xmm0, %xmm0
	addl	%r13d, %edx
	vmovsd	%xmm0, (%r12,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L152
	testl	%r15d, %r15d
	jle	.L154
.L153:
	xorl	%r13d, %r13d
	movl	$0, 36(%rsp)
.L169:
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	testl	%ebx, %ebx
	jle	.L159
.L197:
	movq	ratios(%rip), %rax
	movq	40(%rsp), %rdi
	vcvttsd2si	(%rax,%rdi), %ebp
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rax
	leaq	33(%rax), %rdi
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	call	malloc
	movl	$1, %edi
	andq	$-16, %rax
	addq	$16, %rax
	movq	%rax, %r14
	movq	%rax, 24(%rsp)
	call	srand
	movq	%rbx, %rax
	testq	%rbx, %rbx
	je	.L155
	addq	%r14, %rax
	movq	%r14, %r15
	movl	$1374389535, %r14d
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L156:
	call	rand
	movl	%eax, %esi
	imull	%r14d
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %eax
	subl	%eax, %esi
	cmpl	%esi, %ebp
	setle	%bl
	addq	$1, %r15
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
	movb	%al, -1(%r15)
	cmpq	%r15, %r12
	jne	.L156
.L155:
	movq	24(%rsp), %rax
	xorl	%r12d, %r12d
	movl	$toupperversion+8, %ebp
	movq	8(%rsp), %rcx
	movb	$0, (%rax,%rcx)
	cmpq	$0, toupperversion+8(%rip)
	je	.L168
	.p2align 4,,10
	.p2align 3
.L167:
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rbx
	leaq	33(%rbx), %rdi
	call	malloc
	movq	24(%rsp), %rsi
	leaq	1(%rbx), %rdx
	andq	$-16, %rax
	leaq	16(%rax), %r15
	movq	%r15, %rdi
	call	memcpy
	movl	no_sz(%rip), %ebx
	movl	no_ratio(%rip), %eax
	movl	debug(%rip), %esi
	movq	0(%rbp), %r14
	imull	%r12d, %ebx
	imull	%eax, %ebx
	imull	36(%rsp), %eax
	addl	32(%rsp), %eax
	addl	%ebx, %eax
	movl	%eax, 8(%rsp)
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rbx
	testl	%esi, %esi
	jne	.L226
.L160:
	leaq	64(%rsp), %rsi
	movl	$1, %edi
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	call	clock_gettime
	testl	%eax, %eax
	jne	.L162
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%rbx, %rsi
	movq	%r15, %rdi
	vcvtsi2sdq	64(%rsp), %xmm1, %xmm1
	vcvtsi2sdq	72(%rsp), %xmm0, %xmm0
	vdivsd	.LC24(%rip), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm2
	vmovsd	%xmm2, 16(%rsp)
	call	*%r14
	leaq	48(%rsp), %rsi
	movl	$1, %edi
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	call	clock_gettime
	testl	%eax, %eax
	jne	.L162
	vxorpd	%xmm1, %xmm1, %xmm1
	movslq	8(%rsp), %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	48(%rsp), %xmm1, %xmm1
	movq	results(%rip), %rax
	vcvtsi2sdq	56(%rsp), %xmm0, %xmm0
	movl	debug(%rip), %ecx
	vdivsd	.LC24(%rip), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vsubsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax,%rbx,8)
	testl	%ecx, %ecx
	je	.L163
	movq	%r15, %rdx
	movl	$.LC25, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L163:
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rbx
	testq	%rbx, %rbx
	je	.L164
	call	__ctype_toupper_loc
	xorl	%r8d, %r8d
	movq	(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L166:
	movsbq	(%r8,%r15), %r9
	movl	(%rdx,%r9,4), %eax
	cmpl	%eax, %r9d
	jne	.L227
	addq	$1, %r8
	cmpq	%r8, %rbx
	jne	.L166
.L164:
	leaq	-16(%r15), %rdi
	addq	$16, %rbp
	addl	$1, %r12d
	call	free
	cmpq	$0, 0(%rbp)
	jne	.L167
.L168:
	movq	24(%rsp), %rdi
	subq	$16, %rdi
	call	free
	addl	$1, 32(%rsp)
	addq	$8, 40(%rsp)
	movl	32(%rsp), %eax
	cmpl	%eax, no_ratio(%rip)
	jg	.L197
.L159:
	addl	$1, 36(%rsp)
	addq	$8, %r13
	movl	36(%rsp), %eax
	cmpl	%eax, no_sz(%rip)
	jle	.L154
	movl	no_ratio(%rip), %ebx
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L226:
	movq	%r15, %rdx
	movl	$.LC22, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L160
.L227:
	movslq	%r12d, %rdx
	subq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 168
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	salq	$4, %rdx
	pushq	%rax
	.cfi_def_cfa_offset 176
	xorl	%eax, %eax
	movq	toupperversion(%rdx), %rcx
	movl	$.LC26, %edx
	call	__fprintf_chk
	call	abort
.L146:
	.cfi_restore_state
	movl	24(%rsp), %eax
	imull	%r15d, %ecx
	subl	16(%rsp), %eax
	movl	%ecx, %edi
	cltd
	idivl	%r13d
	leal	1(%rax), %ebx
	imull	%ebx, %edi
	movl	%ebx, no_ratio(%rip)
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movslq	%ebx, %rdi
	salq	$3, %rdi
	movq	%rax, results(%rip)
	call	malloc
	movq	8(%rsp), %rdi
	movq	%rax, %r12
	movq	%rax, ratios(%rip)
	call	malloc
	movq	%rax, sizes(%rip)
	testl	%r15d, %r15d
	jg	.L147
	testl	%ebx, %ebx
	jg	.L148
.L154:
	movl	$.LC27, %edi
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	call	puts
	cmpl	$0, no_sz(%rip)
	jle	.L171
.L194:
	movl	no_ratio(%rip), %eax
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L174
.L195:
	movq	ratios(%rip), %rax
	movl	$.LC28, %esi
	movl	$1, %edi
	xorl	%r14d, %r14d
	movl	$toupperversion, %r15d
	vmovsd	(%rax,%r12), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rdx
	movl	$1, %eax
	call	__printf_chk
	movl	no_version(%rip), %edx
	testl	%edx, %edx
	jle	.L176
	.p2align 4,,10
	.p2align 3
.L196:
	movl	no_sz(%rip), %ecx
	movl	$.LC29, %esi
	movl	$1, %edi
	addq	$16, %r15
	movl	no_ratio(%rip), %eax
	imull	%r14d, %ecx
	addl	$1, %r14d
	movl	%eax, %edx
	imull	%ebp, %edx
	imull	%ecx, %eax
	addl	%ebx, %edx
	addl	%edx, %eax
	movq	results(%rip), %rdx
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	movl	$1, %eax
	movq	-16(%r15), %rdx
	call	__printf_chk
	cmpl	no_version(%rip), %r14d
	jl	.L196
.L176:
	movl	$10, %edi
	addl	$1, %ebx
	addq	$8, %r12
	call	putchar
	cmpl	no_ratio(%rip), %ebx
	jl	.L195
.L174:
	addl	$1, %ebp
	addq	$8, %r13
	cmpl	no_sz(%rip), %ebp
	jl	.L194
.L171:
	xorl	%eax, %eax
	movq	88(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L228
	addq	$104, %rsp
	.cfi_remember_state
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
.L144:
	.cfi_restore_state
	movq	%r12, %rax
	xorl	%edx, %edx
	subq	%rbp, %rax
	divq	%r14
	leal	1(%rax), %r15d
	movslq	%r15d, %r12
	movl	%r15d, no_sz(%rip)
	leaq	0(,%r12,8), %rax
	movq	%rax, 8(%rsp)
	jmp	.L145
.L125:
	cmpq	$0, toupperversion+8(%rip)
	movl	$1, %r13d
	je	.L229
	movl	$0, 24(%rsp)
	movl	$10000, %r14d
	xorl	%r12d, %r12d
	movl	$800000, %ebp
	movl	$50, 16(%rsp)
	jmp	.L178
.L225:
	xorl	%ecx, %ecx
	jmp	.L142
.L229:
	xorl	%ecx, %ecx
	movl	$0, 24(%rsp)
	movl	$800000, %ebp
	movl	$10000, %r14d
	movl	$50, 16(%rsp)
	jmp	.L179
.L162:
	movl	$.LC23, %edi
	call	perror
	call	abort
.L228:
	call	__stack_chk_fail
	.cfi_endproc
.LFE4931:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE30:
	.section	.text.startup
.LHOTE30:
	.globl	toupperversion
	.section	.rodata.str1.1
.LC31:
	.string	"naive,fn,no size"
.LC32:
	.string	"naive,define,no size"
.LC33:
	.string	"library,no size"
.LC34:
	.string	"library,size"
.LC35:
	.string	"loop,fn"
.LC36:
	.string	"loop,define"
.LC37:
	.string	"unroll"
.LC38:
	.string	"mmx"
.LC39:
	.string	"sse2,rest"
.LC40:
	.string	"sse2"
.LC41:
	.string	"avx2"
.LC42:
	.string	"prefetch"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 208
toupperversion:
	.quad	.LC31
	.quad	toupper_naive_fn_no_size
	.quad	.LC32
	.quad	toupper_naive_define_no_size
	.quad	.LC33
	.quad	toupper_library_no_size
	.quad	.LC34
	.quad	toupper_library_size
	.quad	.LC35
	.quad	toupper_loop_fn
	.quad	.LC36
	.quad	toupper_loop_define
	.quad	.LC37
	.quad	toupper_unroll
	.quad	.LC38
	.quad	toupper_mmx
	.quad	.LC39
	.quad	toupper_sse_1
	.quad	.LC40
	.quad	toupper_sse
	.quad	.LC41
	.quad	toupper_avx_1
	.quad	.LC42
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
.LC6:
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
.LC7:
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
.LC8:
	.quad	2314885530818453536
	.quad	2314885530818453536
	.quad	2314885530818453536
	.quad	2314885530818453536
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC10:
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
.LC11:
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
.LC12:
	.quad	2314885530818453536
	.quad	2314885530818453536
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC15:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.align 8
.LC16:
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.byte	-103
	.align 8
.LC17:
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.byte	-31
	.align 8
.LC24:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
