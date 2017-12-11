	.text
	.file	"toupper.c"
	.align	16, 0x90
	.type	toupper_naive_fn_no_size,@function
toupper_naive_fn_no_size:               # @toupper_naive_fn_no_size
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movb	(%rbx), %al
	testb	%al, %al
	je	.LBB0_3
# BB#1:                                 # %.thread.preheader
	addq	$1, %rbx
	.align	16, 0x90
.LBB0_2:                                # %.thread
                                        # =>This Inner Loop Header: Depth=1
	movsbl	%al, %edi
	callq	upper_fn
	movb	%al, -1(%rbx)
	movb	(%rbx), %al
	addq	$1, %rbx
	testb	%al, %al
	jne	.LBB0_2
.LBB0_3:                                # %._crit_edge
	popq	%rbx
	retq
.Lfunc_end0:
	.size	toupper_naive_fn_no_size, .Lfunc_end0-toupper_naive_fn_no_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_naive_define_no_size,@function
toupper_naive_define_no_size:           # @toupper_naive_define_no_size
	.cfi_startproc
# BB#0:
	movb	(%rdi), %al
	testb	%al, %al
	je	.LBB1_5
# BB#1:                                 # %.thread.preheader
	addq	$1, %rdi
	.align	16, 0x90
.LBB1_2:                                # %.thread
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, %cl
	addb	$-97, %cl
	movzbl	%cl, %ecx
	cmpl	$26, %ecx
	jae	.LBB1_4
# BB#3:                                 #   in Loop: Header=BB1_2 Depth=1
	addb	$-32, %al
.LBB1_4:                                # %.thread
                                        #   in Loop: Header=BB1_2 Depth=1
	movb	%al, -1(%rdi)
	movb	(%rdi), %al
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB1_2
.LBB1_5:                                # %._crit_edge
	retq
.Lfunc_end1:
	.size	toupper_naive_define_no_size, .Lfunc_end1-toupper_naive_define_no_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_library_no_size,@function
toupper_library_no_size:                # @toupper_library_no_size
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp3:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp4:
	.cfi_def_cfa_offset 32
.Ltmp5:
	.cfi_offset %rbx, -24
.Ltmp6:
	.cfi_offset %rbp, -16
	movq	%rdi, %rbx
	movb	(%rbx), %bpl
	testb	%bpl, %bpl
	je	.LBB2_3
# BB#1:                                 # %.lr.ph
	callq	__ctype_toupper_loc
	addq	$1, %rbx
	.align	16, 0x90
.LBB2_2:                                # =>This Inner Loop Header: Depth=1
	movsbq	%bpl, %rcx
	movq	(%rax), %rdx
	movb	(%rdx,%rcx,4), %cl
	movb	%cl, -1(%rbx)
	movb	(%rbx), %bpl
	addq	$1, %rbx
	testb	%bpl, %bpl
	jne	.LBB2_2
.LBB2_3:                                # %._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	toupper_library_no_size, .Lfunc_end2-toupper_library_no_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_library_size,@function
toupper_library_size:                   # @toupper_library_size
	.cfi_startproc
# BB#0:
	pushq	%r14
.Ltmp7:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp8:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp9:
	.cfi_def_cfa_offset 32
.Ltmp10:
	.cfi_offset %rbx, -24
.Ltmp11:
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	testq	%r14, %r14
	je	.LBB3_3
# BB#1:                                 # %.lr.ph
	callq	__ctype_toupper_loc
	.align	16, 0x90
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	movsbq	(%rbx), %rcx
	movq	(%rax), %rdx
	movb	(%rdx,%rcx,4), %cl
	movb	%cl, (%rbx)
	addq	$1, %rbx
	addq	$-1, %r14
	jne	.LBB3_2
.LBB3_3:                                # %._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end3:
	.size	toupper_library_size, .Lfunc_end3-toupper_library_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_loop_fn,@function
toupper_loop_fn:                        # @toupper_loop_fn
	.cfi_startproc
# BB#0:
	pushq	%r14
.Ltmp12:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp13:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp14:
	.cfi_def_cfa_offset 32
.Ltmp15:
	.cfi_offset %rbx, -24
.Ltmp16:
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	testq	%r14, %r14
	je	.LBB4_2
	.align	16, 0x90
.LBB4_1:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movsbl	(%rbx), %edi
	callq	upper_fn
	movb	%al, (%rbx)
	addq	$1, %rbx
	addq	$-1, %r14
	jne	.LBB4_1
.LBB4_2:                                # %._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end4:
	.size	toupper_loop_fn, .Lfunc_end4-toupper_loop_fn
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_loop_define,@function
toupper_loop_define:                    # @toupper_loop_define
	.cfi_startproc
# BB#0:
	testq	%rsi, %rsi
	je	.LBB5_4
	.align	16, 0x90
.LBB5_1:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movb	(%rdi), %al
	movb	%al, %cl
	addb	$-97, %cl
	movzbl	%cl, %ecx
	cmpl	$26, %ecx
	jae	.LBB5_3
# BB#2:                                 #   in Loop: Header=BB5_1 Depth=1
	addb	$-32, %al
.LBB5_3:                                # %.lr.ph
                                        #   in Loop: Header=BB5_1 Depth=1
	movb	%al, (%rdi)
	addq	$1, %rdi
	addq	$-1, %rsi
	jne	.LBB5_1
.LBB5_4:                                # %._crit_edge
	retq
.Lfunc_end5:
	.size	toupper_loop_define, .Lfunc_end5-toupper_loop_define
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_unroll,@function
toupper_unroll:                         # @toupper_unroll
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp17:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp18:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp19:
	.cfi_def_cfa_offset 32
.Ltmp20:
	.cfi_offset %rbx, -32
.Ltmp21:
	.cfi_offset %r14, -24
.Ltmp22:
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	xorl	%ebx, %ebx
	testq	%r14, %r14
	je	.LBB6_5
	.align	16, 0x90
.LBB6_1:                                # %.lr.ph7
                                        # =>This Inner Loop Header: Depth=1
	movsbl	(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, (%r15,%rbx)
	movsbl	1(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 1(%r15,%rbx)
	movsbl	2(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 2(%r15,%rbx)
	movsbl	3(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 3(%r15,%rbx)
	movsbl	4(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 4(%r15,%rbx)
	movsbl	5(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 5(%r15,%rbx)
	movsbl	6(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 6(%r15,%rbx)
	movsbl	7(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, 7(%r15,%rbx)
	addq	$8, %rbx
	cmpq	%r14, %rbx
	jb	.LBB6_1
# BB#2:                                 # %.preheader
	testb	$7, %r14b
	je	.LBB6_5
# BB#3:                                 # %.lr.ph.preheader
	andl	$7, %r14d
	addq	%rbx, %r15
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB6_4:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movsbl	(%r15,%rbx), %edi
	callq	upper_fn
	movb	%al, (%r15,%rbx)
	addq	$1, %rbx
	cmpq	%rbx, %r14
	jne	.LBB6_4
.LBB6_5:                                # %._crit_edge
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end6:
	.size	toupper_unroll, .Lfunc_end6-toupper_unroll
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_mmx,@function
toupper_mmx:                            # @toupper_mmx
	.cfi_startproc
# BB#0:
	cmpq	$8, %rsi
	jb	.LBB7_3
# BB#1:                                 # %.lr.ph.preheader
	shrq	$3, %rsi
	movabsq	$-2170205185142300191, %rax # imm = 0xE1E1E1E1E1E1E1E1
	movd	%rax, %mm0
	movabsq	$-7378697629483820647, %rax # imm = 0x9999999999999999
	movd	%rax, %mm1
	movabsq	$2314885530818453536, %rax # imm = 0x2020202020202020
	movd	%rax, %mm2
	.align	16, 0x90
.LBB7_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi), %mm3
	movq	%mm3, %mm4
	psubb	%mm0, %mm4
	pcmpgtb	%mm1, %mm4
	pandn	%mm2, %mm4
	pxor	%mm3, %mm4
	movq	%mm4, (%rdi)
	addq	$8, %rdi
	addq	$-1, %rsi
	jne	.LBB7_2
.LBB7_3:                                # %._crit_edge
	retq
.Lfunc_end7:
	.size	toupper_mmx, .Lfunc_end7-toupper_mmx
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_sse_1,@function
toupper_sse_1:                          # @toupper_sse_1
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp23:
	.cfi_def_cfa_offset 16
.Ltmp24:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	vmovdqu	(%rbx), %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	jmp	.LBB8_2
	.align	16, 0x90
.LBB8_1:                                # %.thread
                                        #   in Loop: Header=BB8_2 Depth=1
	callq	toupper_si128
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqu	%xmm0, (%rbx)
	vmovdqu	16(%rbx), %xmm0
	addq	$16, %rbx
.LBB8_2:                                # %.thread
                                        # =>This Inner Loop Header: Depth=1
	vpcmpeqb	%xmm1, %xmm0, %xmm1
	vpmovmskb	%xmm1, %eax
	testl	%eax, %eax
	je	.LBB8_1
# BB#3:                                 # %._crit_edge
	tzcntl	%eax, %eax
	je	.LBB8_8
# BB#4:                                 # %.preheader.preheader
	addl	$1, %eax
	.align	16, 0x90
.LBB8_5:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movb	(%rbx), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$25, %edx
	ja	.LBB8_7
# BB#6:                                 #   in Loop: Header=BB8_5 Depth=1
	addb	$-32, %cl
	movb	%cl, (%rbx)
.LBB8_7:                                #   in Loop: Header=BB8_5 Depth=1
	addq	$1, %rbx
	addl	$-1, %eax
	jne	.LBB8_5
.LBB8_8:                                # %.loopexit
	popq	%rbx
	retq
.Lfunc_end8:
	.size	toupper_sse_1, .Lfunc_end8-toupper_sse_1
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI9_0:
	.zero	16,31
.LCPI9_1:
	.zero	16,153
.LCPI9_2:
	.zero	16,32
	.text
	.align	16, 0x90
	.type	toupper_sse,@function
toupper_sse:                            # @toupper_sse
	.cfi_startproc
# BB#0:
	cmpq	$16, %rsi
	jb	.LBB9_3
# BB#1:                                 # %.lr.ph.preheader
	shrq	$4, %rsi
	vmovdqa	.LCPI9_0(%rip), %xmm0   # xmm0 = [31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31]
	vmovdqa	.LCPI9_1(%rip), %xmm1   # xmm1 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovdqa	.LCPI9_2(%rip), %xmm2   # xmm2 = [2314885530818453536,2314885530818453536]
	.align	16, 0x90
.LBB9_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rdi), %xmm3
	vpaddb	%xmm0, %xmm3, %xmm4
	vpcmpgtb	%xmm1, %xmm4, %xmm4
	vpandn	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, (%rdi)
	addq	$16, %rdi
	addq	$-1, %rsi
	jne	.LBB9_2
.LBB9_3:                                # %._crit_edge
	retq
.Lfunc_end9:
	.size	toupper_sse, .Lfunc_end9-toupper_sse
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_avx_1,@function
toupper_avx_1:                          # @toupper_avx_1
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp25:
	.cfi_def_cfa_offset 16
.Ltmp26:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	vmovdqu	(%rbx), %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	jmp	.LBB10_2
	.align	16, 0x90
.LBB10_1:                               # %.thread
                                        #   in Loop: Header=BB10_2 Depth=1
	callq	toupper_si256
	vpxor	%ymm1, %ymm1, %ymm1
	vmovdqu	%ymm0, (%rbx)
	vmovdqu	32(%rbx), %ymm0
	addq	$32, %rbx
.LBB10_2:                               # %.thread
                                        # =>This Inner Loop Header: Depth=1
	vpcmpeqb	%ymm1, %ymm0, %ymm1
	vpmovmskb	%ymm1, %eax
	testl	%eax, %eax
	je	.LBB10_1
# BB#3:                                 # %._crit_edge
	tzcntl	%eax, %eax
	je	.LBB10_8
# BB#4:                                 # %.preheader.preheader
	addl	$1, %eax
	.align	16, 0x90
.LBB10_5:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movb	(%rbx), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$25, %edx
	ja	.LBB10_7
# BB#6:                                 #   in Loop: Header=BB10_5 Depth=1
	addb	$-32, %cl
	movb	%cl, (%rbx)
.LBB10_7:                               #   in Loop: Header=BB10_5 Depth=1
	addq	$1, %rbx
	addl	$-1, %eax
	jne	.LBB10_5
.LBB10_8:                               # %.loopexit
	popq	%rbx
	vzeroupper
	retq
.Lfunc_end10:
	.size	toupper_avx_1, .Lfunc_end10-toupper_avx_1
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_prefetch_branch,@function
toupper_prefetch_branch:                # @toupper_prefetch_branch
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp27:
	.cfi_def_cfa_offset 16
.Ltmp28:
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	rte_prefetch0
	leaq	64(%rbx), %rdi
	callq	rte_prefetch0
	movq	%rbx, %rdi
	subq	$-128, %rdi
	callq	rte_prefetch0
	movb	(%rbx), %al
	testb	%al, %al
	je	.LBB11_3
# BB#1:                                 # %.thread.preheader
	addq	$1, %rbx
	.align	16, 0x90
.LBB11_2:                               # %.thread
                                        # =>This Inner Loop Header: Depth=1
	movsbl	%al, %edi
	callq	upper_fn
	movb	%al, -1(%rbx)
	movb	(%rbx), %al
	addq	$1, %rbx
	testb	%al, %al
	jne	.LBB11_2
.LBB11_3:                               # %._crit_edge
	popq	%rbx
	retq
.Lfunc_end11:
	.size	toupper_prefetch_branch, .Lfunc_end11-toupper_prefetch_branch
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp29:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp30:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp31:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp32:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp33:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp34:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp35:
	.cfi_def_cfa_offset 80
.Ltmp36:
	.cfi_offset %rbx, -56
.Ltmp37:
	.cfi_offset %r12, -48
.Ltmp38:
	.cfi_offset %r13, -40
.Ltmp39:
	.cfi_offset %r14, -32
.Ltmp40:
	.cfi_offset %r15, -24
.Ltmp41:
	.cfi_offset %rbp, -16
	movq	%rsi, %r13
	xorl	%ebp, %ebp
	movl	$800000, %r15d          # imm = 0xC3500
	movl	$10000, %r12d           # imm = 0x2710
	cmpl	$2, %edi
	jl	.LBB12_1
# BB#2:                                 # %.lr.ph104.preheader
	movslq	%edi, %rax
	movq	%rax, 16(%rsp)          # 8-byte Spill
	movl	$1, 4(%rsp)             # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movl	$50, %ebx
	movl	$10000, %r12d           # imm = 0x2710
	movl	$800000, %r15d          # imm = 0xC3500
	movl	$3, %r14d
	movl	$0, (%rsp)              # 4-byte Folded Spill
	.align	16, 0x90
.LBB12_3:                               # %.lr.ph104
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_7
# BB#4:                                 #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$100, %ecx
	jne	.LBB12_7
# BB#5:                                 #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	jne	.LBB12_7
# BB#6:                                 #   in Loop: Header=BB12_3 Depth=1
	movl	$1, debug(%rip)
	.align	16, 0x90
.LBB12_7:                               # %.thread
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	-16(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_19
# BB#8:                                 #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$108, %ecx
	jne	.LBB12_19
# BB#9:                                 #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	jne	.LBB12_19
# BB#10:                                #   in Loop: Header=BB12_3 Depth=1
	movq	-8(%r13,%r14,8), %rdi
	callq	atoi
	cltq
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$64, %edx
	subq	%rcx, %rdx
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$0, %r15d
	cmovneq	%rdx, %r15
	addq	%rax, %r15
	cmpq	16(%rsp), %r14          # 8-byte Folded Reload
	jge	.LBB12_31
# BB#11:                                #   in Loop: Header=BB12_3 Depth=1
	movq	(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_14
# BB#12:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$114, %ecx
	jne	.LBB12_14
# BB#13:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	je	.LBB12_31
.LBB12_14:                              # %.thread70
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_17
# BB#15:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$100, %ecx
	jne	.LBB12_17
# BB#16:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	je	.LBB12_31
.LBB12_17:                              # %.thread72
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	(%r13,%r14,8), %rdi
	callq	atoi
	cltq
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$64, %edx
	subq	%rcx, %rdx
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$0, %ecx
	cmovneq	%rdx, %rcx
	addq	%rax, %rcx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	movq	8(%r13,%r14,8), %rdi
	callq	atoi
	movslq	%eax, %r12
	movq	%r12, %rax
	andq	$63, %rax
	je	.LBB12_19
# BB#18:                                #   in Loop: Header=BB12_3 Depth=1
	addq	$64, %r12
	subq	%rax, %r12
	.align	16, 0x90
.LBB12_19:                              # %.thread68
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	-16(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_30
# BB#20:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$114, %ecx
	jne	.LBB12_30
# BB#21:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	jne	.LBB12_30
# BB#22:                                #   in Loop: Header=BB12_3 Depth=1
	movq	-8(%r13,%r14,8), %rdi
	callq	atoi
	movl	%eax, %ebx
	cmpq	16(%rsp), %r14          # 8-byte Folded Reload
	jge	.LBB12_31
# BB#23:                                #   in Loop: Header=BB12_3 Depth=1
	movq	(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_26
# BB#24:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$108, %ecx
	jne	.LBB12_26
# BB#25:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	je	.LBB12_31
.LBB12_26:                              # %.thread76
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	(%r13,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_29
# BB#27:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$100, %ecx
	jne	.LBB12_29
# BB#28:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	je	.LBB12_31
.LBB12_29:                              # %.thread78
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	(%r13,%r14,8), %rdi
	callq	atoi
	movl	%eax, (%rsp)            # 4-byte Spill
	movq	8(%r13,%r14,8), %rdi
	callq	atoi
	movl	%eax, 4(%rsp)           # 4-byte Spill
	.align	16, 0x90
.LBB12_30:                              # %.thread74
                                        #   in Loop: Header=BB12_3 Depth=1
	leaq	1(%r14), %rax
	addq	$-1, %r14
	cmpq	16(%rsp), %r14          # 8-byte Folded Reload
	movq	%rax, %r14
	jl	.LBB12_3
	jmp	.LBB12_31
.LBB12_1:
	movl	$50, %ebx
	movl	$1, 4(%rsp)             # 4-byte Folded Spill
	movl	$0, (%rsp)              # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 8(%rsp)           # 8-byte Spill
.LBB12_31:                              # %._crit_edge105
	movl	$toupperversion+24, %eax
	cmpq	$0, toupperversion+8(%rip)
	je	.LBB12_34
	.align	16, 0x90
.LBB12_32:                              # %.lr.ph91
                                        # =>This Inner Loop Header: Depth=1
	addl	$1, %ebp
	cmpq	$0, (%rax)
	leaq	16(%rax), %rax
	jne	.LBB12_32
# BB#33:                                # %._crit_edge92
	movl	%ebp, no_version(%rip)
.LBB12_34:
	movl	4(%rsp), %r14d          # 4-byte Reload
	movl	(%rsp), %esi            # 4-byte Reload
	movq	8(%rsp), %rdi           # 8-byte Reload
	movl	$1, %ecx
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.LBB12_36
# BB#35:
	subq	%r15, %rdi
	xorl	%edx, %edx
	movq	%rdi, %rax
	divq	%r12
	addl	$1, %eax
.LBB12_36:
	movl	%eax, no_sz(%rip)
	testl	%esi, %esi
	je	.LBB12_38
# BB#37:
	subl	%ebx, %esi
	movl	%esi, %eax
	cltd
	idivl	%r14d
	movl	%eax, %ecx
	addl	$1, %ecx
.LBB12_38:
	movl	%ecx, no_ratio(%rip)
	imull	%ecx, %ebp
	imull	no_sz(%rip), %ebp
	shlq	$3, %rbp
	movq	%rbp, %rdi
	callq	malloc
	movq	%rax, results(%rip)
	movl	no_ratio(%rip), %edi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, ratios(%rip)
	movl	no_sz(%rip), %edi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, sizes(%rip)
	cmpl	$0, no_sz(%rip)
	jle	.LBB12_41
# BB#39:                                # %.lr.ph88
	movq	sizes(%rip), %rax
	movslq	no_sz(%rip), %rcx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB12_40:                              # =>This Inner Loop Header: Depth=1
	movq	%r15, (%rax,%rdx,8)
	addq	$1, %rdx
	addq	%r12, %r15
	cmpq	%rcx, %rdx
	jl	.LBB12_40
.LBB12_41:                              # %.preheader80
	cmpl	$0, no_ratio(%rip)
	jle	.LBB12_44
# BB#42:                                # %.lr.ph85
	movq	ratios(%rip), %rax
	movslq	no_ratio(%rip), %rcx
	xorl	%edx, %edx
	.align	16, 0x90
.LBB12_43:                              # =>This Inner Loop Header: Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%ebx, %xmm0, %xmm0
	vmovsd	%xmm0, (%rax,%rdx,8)
	addq	$1, %rdx
	addl	%r14d, %ebx
	cmpq	%rcx, %rdx
	jl	.LBB12_43
.LBB12_44:                              # %.preheader79
	cmpl	$0, no_sz(%rip)
	jle	.LBB12_49
# BB#45:
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB12_46:                              # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_47 Depth 2
	xorl	%ebp, %ebp
	cmpl	$0, no_ratio(%rip)
	jle	.LBB12_48
	.align	16, 0x90
.LBB12_47:                              # %.lr.ph
                                        #   Parent Loop BB12_46 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, %edi
	movl	%ebp, %esi
	callq	run
	addl	$1, %ebp
	cmpl	no_ratio(%rip), %ebp
	jl	.LBB12_47
.LBB12_48:                              # %._crit_edge
                                        #   in Loop: Header=BB12_46 Depth=1
	addl	$1, %ebx
	cmpl	no_sz(%rip), %ebx
	jl	.LBB12_46
.LBB12_49:                              # %._crit_edge83
	callq	printresults
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end12:
	.size	main, .Lfunc_end12-main
	.cfi_endproc

	.align	16, 0x90
	.type	run,@function
run:                                    # @run
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp42:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp43:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp44:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp45:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp46:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp47:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp48:
	.cfi_def_cfa_offset 64
.Ltmp49:
	.cfi_offset %rbx, -56
.Ltmp50:
	.cfi_offset %r12, -48
.Ltmp51:
	.cfi_offset %r13, -40
.Ltmp52:
	.cfi_offset %r14, -32
.Ltmp53:
	.cfi_offset %r15, -24
.Ltmp54:
	.cfi_offset %rbp, -16
	movl	%esi, %r14d
	movslq	%edi, %r12
	movq	sizes(%rip), %rax
	movq	(%rax,%r12,8), %rdi
	movslq	%r14d, %rax
	movq	ratios(%rip), %rcx
	vcvttsd2si	(%rcx,%rax,8), %esi
	callq	init
	movq	%rax, %r15
	movl	$toupperversion+8, %ebx
	cmpq	$0, toupperversion+8(%rip)
	je	.LBB14_3
# BB#1:
	xorl	%ebp, %ebp
	.align	16, 0x90
.LBB14_2:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	sizes(%rip), %rax
	movq	(%rax,%r12,8), %rdi
	addq	$1, %rdi
	callq	mymalloc
	movq	%rax, %r13
	movq	sizes(%rip), %rax
	movq	(%rax,%r12,8), %rdx
	addq	$1, %rdx
	movq	%r13, %rdi
	movq	%r15, %rsi
	callq	memcpy
	movl	no_sz(%rip), %eax
	imull	%ebp, %eax
	leal	(%r12,%rax), %edx
	imull	no_ratio(%rip), %edx
	addl	%r14d, %edx
	movq	sizes(%rip), %rax
	movq	(%rax,%r12,8), %rsi
	movq	(%rbx), %rcx
	movq	%r13, %rdi
	callq	run_toupper
	movq	-8(%rbx), %rdi
	movq	sizes(%rip), %rax
	movq	(%rax,%r12,8), %rdx
	movq	%r13, %rsi
	callq	check_valid_toupper
	movq	%r13, %rdi
	callq	myfree
	addl	$1, %ebp
	cmpq	$0, 16(%rbx)
	leaq	16(%rbx), %rbx
	jne	.LBB14_2
.LBB14_3:                               # %._crit_edge
	movq	%r15, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	myfree                  # TAILCALL
.Lfunc_end13:
	.size	run, .Lfunc_end13-run
	.cfi_endproc

	.align	16, 0x90
	.type	upper_fn,@function
upper_fn:                               # @upper_fn
	.cfi_startproc
# BB#0:
	movb	%dil, %al
	addb	$-97, %al
	movzbl	%al, %eax
	cmpl	$26, %eax
	jae	.LBB15_2
# BB#1:
	addb	$-32, %dil
.LBB15_2:
	movsbl	%dil, %eax
	retq
.Lfunc_end14:
	.size	upper_fn, .Lfunc_end14-upper_fn
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI16_0:
	.zero	16,31
.LCPI16_1:
	.zero	16,153
.LCPI16_2:
	.zero	16,32
	.text
	.align	16, 0x90
	.type	toupper_si128,@function
toupper_si128:                          # @toupper_si128
	.cfi_startproc
# BB#0:
	vpaddb	.LCPI16_0(%rip), %xmm0, %xmm1
	vpcmpgtb	.LCPI16_1(%rip), %xmm1, %xmm1
	vpandn	.LCPI16_2(%rip), %xmm1, %xmm1
	vpxor	%xmm0, %xmm1, %xmm0
	retq
.Lfunc_end15:
	.size	toupper_si128, .Lfunc_end15-toupper_si128
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI17_0:
	.zero	32,31
.LCPI17_1:
	.zero	32,153
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI17_2:
	.quad	2314885530818453536     # 0x2020202020202020
	.text
	.align	16, 0x90
	.type	toupper_si256,@function
toupper_si256:                          # @toupper_si256
	.cfi_startproc
# BB#0:
	vpaddb	.LCPI17_0(%rip), %ymm0, %ymm1
	vpcmpgtb	.LCPI17_1(%rip), %ymm1, %ymm1
	vpbroadcastq	.LCPI17_2(%rip), %ymm2
	vpandn	%ymm2, %ymm1, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	retq
.Lfunc_end16:
	.size	toupper_si256, .Lfunc_end16-toupper_si256
	.cfi_endproc

	.align	16, 0x90
	.type	rte_prefetch0,@function
rte_prefetch0:                          # @rte_prefetch0
	.cfi_startproc
# BB#0:
	#APP
	prefetcht0	(%rdi)
	#NO_APP
	retq
.Lfunc_end17:
	.size	rte_prefetch0, .Lfunc_end17-rte_prefetch0
	.cfi_endproc

	.align	16, 0x90
	.type	init,@function
init:                                   # @init
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp55:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp56:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp57:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp58:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp59:
	.cfi_def_cfa_offset 48
.Ltmp60:
	.cfi_offset %rbx, -40
.Ltmp61:
	.cfi_offset %r14, -32
.Ltmp62:
	.cfi_offset %r15, -24
.Ltmp63:
	.cfi_offset %rbp, -16
	movl	%esi, %r15d
	movq	%rdi, %rbp
	leaq	1(%rbp), %rdi
	callq	mymalloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	srand
	xorl	%ebx, %ebx
	testq	%rbp, %rbp
	je	.LBB19_3
	.align	16, 0x90
.LBB19_1:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movl	%r15d, %edi
	callq	createChar
	movb	%al, (%r14,%rbx)
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	jne	.LBB19_1
# BB#2:
	movq	%rbp, %rbx
.LBB19_3:                               # %._crit_edge
	movb	$0, (%r14,%rbx)
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end18:
	.size	init, .Lfunc_end18-init
	.cfi_endproc

	.align	16, 0x90
	.type	mymalloc,@function
mymalloc:                               # @mymalloc
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp64:
	.cfi_def_cfa_offset 16
	addq	$32, %rdi
	callq	malloc
	addq	$16, %rax
	andq	$-16, %rax
	popq	%rcx
	retq
.Lfunc_end19:
	.size	mymalloc, .Lfunc_end19-mymalloc
	.cfi_endproc

	.align	16, 0x90
	.type	run_toupper,@function
run_toupper:                            # @run_toupper
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp65:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp66:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp67:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp68:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp69:
	.cfi_def_cfa_offset 48
.Ltmp70:
	.cfi_offset %rbx, -40
.Ltmp71:
	.cfi_offset %r14, -32
.Ltmp72:
	.cfi_offset %r15, -24
.Ltmp73:
	.cfi_offset %rbp, -16
	movq	%rcx, %r15
	movl	%edx, %r14d
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	cmpl	$0, debug(%rip)
	je	.LBB21_2
# BB#1:
	movl	$.L.str.15, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	callq	printf
.LBB21_2:
	callq	gettime
	vmovsd	%xmm0, (%rsp)           # 8-byte Spill
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	callq	*%r15
	callq	gettime
	vsubsd	(%rsp), %xmm0, %xmm0    # 8-byte Folded Reload
	movslq	%r14d, %rax
	movq	results(%rip), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	cmpl	$0, debug(%rip)
	je	.LBB21_3
# BB#4:
	movl	$.L.str.16, %edi
	xorl	%eax, %eax
	movq	%rbx, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	printf                  # TAILCALL
.LBB21_3:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end20:
	.size	run_toupper, .Lfunc_end20-run_toupper
	.cfi_endproc

	.align	16, 0x90
	.type	check_valid_toupper,@function
check_valid_toupper:                    # @check_valid_toupper
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp74:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp75:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Ltmp76:
	.cfi_def_cfa_offset 32
.Ltmp77:
	.cfi_offset %rbx, -32
.Ltmp78:
	.cfi_offset %r14, -24
.Ltmp79:
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	testq	%rbx, %rbx
	je	.LBB22_4
# BB#1:                                 # %.lr.ph
	callq	__ctype_toupper_loc
	movq	(%rax), %rax
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB22_2:                               # =>This Inner Loop Header: Depth=1
	movsbq	(%r15,%rcx), %r8
	movl	(%rax,%r8,4), %r9d
	cmpl	%r9d, %r8d
	jne	.LBB22_5
# BB#3:                                 #   in Loop: Header=BB22_2 Depth=1
	addq	$1, %rcx
	cmpq	%rbx, %rcx
	jb	.LBB22_2
.LBB22_4:                               # %._crit_edge
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.LBB22_5:
	movq	stderr(%rip), %rdi
	movl	$.L.str.18, %esi
	xorl	%eax, %eax
	movq	%r14, %rdx
	callq	fprintf
	callq	abort
.Lfunc_end21:
	.size	check_valid_toupper, .Lfunc_end21-check_valid_toupper
	.cfi_endproc

	.align	16, 0x90
	.type	myfree,@function
myfree:                                 # @myfree
	.cfi_startproc
# BB#0:
	addq	$-1, %rdi
	andq	$-16, %rdi
	jmp	free                    # TAILCALL
.Lfunc_end22:
	.size	myfree, .Lfunc_end22-myfree
	.cfi_endproc

	.align	16, 0x90
	.type	createChar,@function
createChar:                             # @createChar
	.cfi_startproc
# BB#0:
	pushq	%rbx
.Ltmp80:
	.cfi_def_cfa_offset 16
.Ltmp81:
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	callq	rand
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	%ebx, %eax
	movl	$64, %eax
	movl	$96, %ebx
	cmovll	%eax, %ebx
	callq	rand
	cltq
	imulq	$1321528399, %rax, %rcx # imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	imull	$26, %ecx, %ecx
	subl	%ecx, %eax
	leal	1(%rbx,%rax), %eax
	movsbl	%al, %eax
	popq	%rbx
	retq
.Lfunc_end23:
	.size	createChar, .Lfunc_end23-createChar
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI25_0:
	.quad	4741671816366391296     # double 1.0E+9
	.text
	.align	16, 0x90
	.type	gettime,@function
gettime:                                # @gettime
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp82:
	.cfi_def_cfa_offset 32
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, (%rsp)
	leaq	(%rsp), %rsi
	movl	$1, %edi
	callq	clock_gettime
	testl	%eax, %eax
	jne	.LBB25_2
# BB#1:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	(%rsp), %xmm0, %xmm0
	vcvtsi2sdq	8(%rsp), %xmm0, %xmm1
	vdivsd	.LCPI25_0(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$24, %rsp
	retq
.LBB25_2:
	movl	$.L.str.17, %edi
	callq	perror
	callq	abort
.Lfunc_end24:
	.size	gettime, .Lfunc_end24-gettime
	.cfi_endproc

	.align	16, 0x90
	.type	printresults,@function
printresults:                           # @printresults
	.cfi_startproc
# BB#0:
	pushq	%r15
.Ltmp83:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp84:
	.cfi_def_cfa_offset 24
	pushq	%r12
.Ltmp85:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Ltmp86:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Ltmp87:
	.cfi_def_cfa_offset 48
.Ltmp88:
	.cfi_offset %rbx, -40
.Ltmp89:
	.cfi_offset %r12, -32
.Ltmp90:
	.cfi_offset %r14, -24
.Ltmp91:
	.cfi_offset %r15, -16
	movl	$.L.str.20, %edi
	callq	puts
	xorl	%r14d, %r14d
	cmpl	$0, no_sz(%rip)
	jle	.LBB26_8
	.align	16, 0x90
.LBB26_1:                               # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB26_3 Depth 2
                                        #       Child Loop BB26_5 Depth 3
	cmpl	$0, no_ratio(%rip)
	jle	.LBB26_7
# BB#2:                                 # %.lr.ph5.preheader
                                        #   in Loop: Header=BB26_1 Depth=1
	xorl	%r15d, %r15d
	.align	16, 0x90
.LBB26_3:                               # %.lr.ph5
                                        #   Parent Loop BB26_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB26_5 Depth 3
	movq	sizes(%rip), %rax
	movq	(%rax,%r14,8), %rsi
	movq	ratios(%rip), %rax
	vmovsd	(%rax,%r15,8), %xmm0    # xmm0 = mem[0],zero
	movl	$.L.str.21, %edi
	movb	$1, %al
	callq	printf
	cmpl	$0, no_version(%rip)
	jle	.LBB26_6
# BB#4:                                 # %.lr.ph.preheader
                                        #   in Loop: Header=BB26_3 Depth=2
	movl	$toupperversion, %r12d
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB26_5:                               # %.lr.ph
                                        #   Parent Loop BB26_1 Depth=1
                                        #     Parent Loop BB26_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	no_sz(%rip), %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	imull	no_ratio(%rip), %eax
	addl	%r15d, %eax
	movq	(%r12), %rsi
	cltq
	movq	results(%rip), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0    # xmm0 = mem[0],zero
	movl	$.L.str.22, %edi
	movb	$1, %al
	callq	printf
	addq	$1, %rbx
	movslq	no_version(%rip), %rax
	addq	$16, %r12
	cmpq	%rax, %rbx
	jl	.LBB26_5
.LBB26_6:                               # %._crit_edge
                                        #   in Loop: Header=BB26_3 Depth=2
	movl	$10, %edi
	callq	putchar
	addq	$1, %r15
	movslq	no_ratio(%rip), %rax
	cmpq	%rax, %r15
	jl	.LBB26_3
.LBB26_7:                               # %._crit_edge6
                                        #   in Loop: Header=BB26_1 Depth=1
	addq	$1, %r14
	movslq	no_sz(%rip), %rax
	cmpq	%rax, %r14
	jl	.LBB26_1
.LBB26_8:                               # %._crit_edge9
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.Lfunc_end25:
	.size	printresults, .Lfunc_end25-printresults
	.cfi_endproc

	.type	debug,@object           # @debug
	.bss
	.globl	debug
	.align	4
debug:
	.long	0                       # 0x0
	.size	debug, 4

	.type	no_sz,@object           # @no_sz
	.data
	.globl	no_sz
	.align	4
no_sz:
	.long	1                       # 0x1
	.size	no_sz, 4

	.type	no_ratio,@object        # @no_ratio
	.globl	no_ratio
	.align	4
no_ratio:
	.long	1                       # 0x1
	.size	no_ratio, 4

	.type	no_version,@object      # @no_version
	.globl	no_version
	.align	4
no_version:
	.long	1                       # 0x1
	.size	no_version, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"naive,fn,no size"
	.size	.L.str, 17

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"naive,define,no size"
	.size	.L.str.1, 21

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"library,no size"
	.size	.L.str.2, 16

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"library,size"
	.size	.L.str.3, 13

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"loop,fn"
	.size	.L.str.4, 8

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"loop,define"
	.size	.L.str.5, 12

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"unroll"
	.size	.L.str.6, 7

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"mmx"
	.size	.L.str.7, 4

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"sse2,rest"
	.size	.L.str.8, 10

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"sse2"
	.size	.L.str.9, 5

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"avx2"
	.size	.L.str.10, 5

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"prefetch"
	.size	.L.str.11, 9

	.type	toupperversion,@object  # @toupperversion
	.data
	.globl	toupperversion
	.align	16
toupperversion:
	.quad	.L.str
	.quad	toupper_naive_fn_no_size
	.quad	.L.str.1
	.quad	toupper_naive_define_no_size
	.quad	.L.str.2
	.quad	toupper_library_no_size
	.quad	.L.str.3
	.quad	toupper_library_size
	.quad	.L.str.4
	.quad	toupper_loop_fn
	.quad	.L.str.5
	.quad	toupper_loop_define
	.quad	.L.str.6
	.quad	toupper_unroll
	.quad	.L.str.7
	.quad	toupper_mmx
	.quad	.L.str.8
	.quad	toupper_sse_1
	.quad	.L.str.9
	.quad	toupper_sse
	.quad	.L.str.10
	.quad	toupper_avx_1
	.quad	.L.str.11
	.quad	toupper_prefetch_branch
	.zero	16
	.size	toupperversion, 208

	.type	.L.str.12,@object       # @.str.12
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.12:
	.asciz	"-d"
	.size	.L.str.12, 3

	.type	.L.str.13,@object       # @.str.13
.L.str.13:
	.asciz	"-l"
	.size	.L.str.13, 3

	.type	.L.str.14,@object       # @.str.14
.L.str.14:
	.asciz	"-r"
	.size	.L.str.14, 3

	.type	results,@object         # @results
	.comm	results,8,8
	.type	ratios,@object          # @ratios
	.comm	ratios,8,8
	.type	sizes,@object           # @sizes
	.comm	sizes,8,8
	.type	.L.str.15,@object       # @.str.15
.L.str.15:
	.asciz	"Before: %.40s...\n"
	.size	.L.str.15, 18

	.type	.L.str.16,@object       # @.str.16
.L.str.16:
	.asciz	"After:  %.40s...\n"
	.size	.L.str.16, 18

	.type	.L.str.17,@object       # @.str.17
.L.str.17:
	.asciz	"getting time"
	.size	.L.str.17, 13

	.type	.L.str.18,@object       # @.str.18
.L.str.18:
	.asciz	"%s failed check at %zu: %c should be %c\n"
	.size	.L.str.18, 41

	.type	.L.str.19,@object       # @.str.19
.L.str.19:
	.asciz	"%s\n"
	.size	.L.str.19, 4

	.type	.L.str.20,@object       # @.str.20
.L.str.20:
	.asciz	"VARIANT2: clang -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O1 toupper.c"
	.size	.L.str.20, 86

	.type	.L.str.21,@object       # @.str.21
.L.str.21:
	.asciz	"Size: %ld \tRatio: %f \tRunning time:\n"
	.size	.L.str.21, 37

	.type	.L.str.22,@object       # @.str.22
.L.str.22:
	.asciz	"\t%-16s:\t%9.5f \n"
	.size	.L.str.22, 16

	.type	.L.str.23,@object       # @.str.23
.L.str.23:
	.asciz	"\n"
	.size	.L.str.23, 2


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
