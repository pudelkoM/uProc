	.text
	.file	"toupper.c"
	.align	16, 0x90
	.type	toupper_naive_fn_no_size,@function
toupper_naive_fn_no_size:               # @toupper_naive_fn_no_size
	.cfi_startproc
# BB#0:
	movb	(%rdi), %al
	testb	%al, %al
	je	.LBB0_5
# BB#1:                                 # %.thread.preheader
	addq	$1, %rdi
	.align	16, 0x90
.LBB0_2:                                # %.thread
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, %cl
	addb	$-97, %cl
	movzbl	%cl, %ecx
	cmpl	$26, %ecx
	jae	.LBB0_4
# BB#3:                                 #   in Loop: Header=BB0_2 Depth=1
	addb	$-32, %al
.LBB0_4:                                # %.thread
                                        #   in Loop: Header=BB0_2 Depth=1
	movb	%al, -1(%rdi)
	movb	(%rdi), %al
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB0_2
.LBB0_5:                                # %._crit_edge
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
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp2:
	.cfi_def_cfa_offset 32
.Ltmp3:
	.cfi_offset %rbx, -24
.Ltmp4:
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
.Ltmp5:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp6:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp7:
	.cfi_def_cfa_offset 32
.Ltmp8:
	.cfi_offset %rbx, -24
.Ltmp9:
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testq	%rbx, %rbx
	je	.LBB3_7
# BB#1:                                 # %.lr.ph
	callq	__ctype_toupper_loc
	leaq	-1(%rbx), %r8
	xorl	%edx, %edx
	testb	$7, %bl
	je	.LBB3_4
# BB#2:                                 # %.preheader
	movl	%ebx, %esi
	andl	$7, %esi
	xorl	%edx, %edx
	.align	16, 0x90
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	movsbq	(%r14,%rdx), %rdi
	movq	(%rax), %rcx
	movb	(%rcx,%rdi,4), %cl
	movb	%cl, (%r14,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rsi
	jne	.LBB3_3
.LBB3_4:                                # %.lr.ph.split
	cmpq	$7, %r8
	jb	.LBB3_7
# BB#5:                                 # %.lr.ph.split.split
	subq	%rdx, %rbx
	leaq	7(%rdx,%r14), %rcx
	.align	16, 0x90
.LBB3_6:                                # =>This Inner Loop Header: Depth=1
	movsbq	-7(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -7(%rcx)
	movsbq	-6(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -6(%rcx)
	movsbq	-5(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -5(%rcx)
	movsbq	-4(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -4(%rcx)
	movsbq	-3(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -3(%rcx)
	movsbq	-2(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -2(%rcx)
	movsbq	-1(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, -1(%rcx)
	movsbq	(%rcx), %rdx
	movq	(%rax), %rsi
	movb	(%rsi,%rdx,4), %dl
	movb	%dl, (%rcx)
	addq	$8, %rcx
	addq	$-8, %rbx
	jne	.LBB3_6
.LBB3_7:                                # %._crit_edge
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end3:
	.size	toupper_library_size, .Lfunc_end3-toupper_library_size
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI4_0:
	.zero	32,159
.LCPI4_1:
	.zero	32,128
.LCPI4_2:
	.zero	32,154
.LCPI4_3:
	.zero	32,224
	.text
	.align	16, 0x90
	.type	toupper_loop_fn,@function
toupper_loop_fn:                        # @toupper_loop_fn
	.cfi_startproc
# BB#0:
	testq	%rsi, %rsi
	je	.LBB4_14
# BB#1:                                 # %.lr.ph.preheader
	xorl	%ecx, %ecx
	cmpq	$31, %rsi
	jbe	.LBB4_2
# BB#6:                                 # %min.iters.checked
	xorl	%ecx, %ecx
	movq	%rsi, %rax
	andq	$-32, %rax
	je	.LBB4_2
# BB#7:                                 # %vector.body.preheader
	leaq	-32(%rsi), %r8
	movl	%r8d, %ecx
	shrl	$5, %ecx
	addl	$1, %ecx
	xorl	%edx, %edx
	testb	$3, %cl
	je	.LBB4_10
# BB#8:                                 # %vector.body.prol.preheader
	leal	-32(%rsi), %ecx
	shrl	$5, %ecx
	addl	$1, %ecx
	andl	$3, %ecx
	negq	%rcx
	xorl	%edx, %edx
	vmovdqa	.LCPI4_0(%rip), %ymm0   # ymm0 = [159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159]
	vmovdqa	.LCPI4_1(%rip), %ymm1   # ymm1 = [128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128]
	vmovdqa	.LCPI4_2(%rip), %ymm2   # ymm2 = [154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154]
	vmovdqa	.LCPI4_3(%rip), %ymm3   # ymm3 = [224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224]
	.align	16, 0x90
.LBB4_9:                                # %vector.body.prol
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rdi,%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rdi,%rdx)
	addq	$32, %rdx
	addq	$1, %rcx
	jne	.LBB4_9
.LBB4_10:                               # %vector.body.preheader.split
	cmpq	$96, %r8
	jb	.LBB4_13
# BB#11:                                # %vector.body.preheader.split.split
	movq	%rsi, %rcx
	andq	$-32, %rcx
	subq	%rdx, %rcx
	leaq	96(%rdx,%rdi), %rdx
	vmovdqa	.LCPI4_0(%rip), %ymm0   # ymm0 = [159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159]
	vmovdqa	.LCPI4_1(%rip), %ymm1   # ymm1 = [128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128]
	vmovdqa	.LCPI4_2(%rip), %ymm2   # ymm2 = [154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154]
	vmovdqa	.LCPI4_3(%rip), %ymm3   # ymm3 = [224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224]
	.align	16, 0x90
.LBB4_12:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	-96(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, -96(%rdx)
	vmovdqu	-64(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, -64(%rdx)
	vmovdqu	-32(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, -32(%rdx)
	vmovdqu	(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rdx)
	subq	$-128, %rdx
	addq	$-128, %rcx
	jne	.LBB4_12
.LBB4_13:                               # %middle.block
	movq	%rax, %rcx
	cmpq	%rsi, %rax
	je	.LBB4_14
.LBB4_2:                                # %.lr.ph.preheader4
	addq	%rcx, %rdi
	subq	%rcx, %rsi
	.align	16, 0x90
.LBB4_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movb	(%rdi), %al
	movb	%al, %cl
	addb	$-97, %cl
	movzbl	%cl, %ecx
	cmpl	$26, %ecx
	jae	.LBB4_5
# BB#4:                                 #   in Loop: Header=BB4_3 Depth=1
	addb	$-32, %al
.LBB4_5:                                # %.lr.ph
                                        #   in Loop: Header=BB4_3 Depth=1
	movb	%al, (%rdi)
	addq	$1, %rdi
	addq	$-1, %rsi
	jne	.LBB4_3
.LBB4_14:                               # %._crit_edge
	vzeroupper
	retq
.Lfunc_end4:
	.size	toupper_loop_fn, .Lfunc_end4-toupper_loop_fn
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI5_0:
	.zero	32,159
.LCPI5_1:
	.zero	32,128
.LCPI5_2:
	.zero	32,154
.LCPI5_3:
	.zero	32,224
	.text
	.align	16, 0x90
	.type	toupper_loop_define,@function
toupper_loop_define:                    # @toupper_loop_define
	.cfi_startproc
# BB#0:
	testq	%rsi, %rsi
	je	.LBB5_14
# BB#1:                                 # %.lr.ph.preheader
	xorl	%ecx, %ecx
	cmpq	$31, %rsi
	jbe	.LBB5_2
# BB#6:                                 # %min.iters.checked
	xorl	%ecx, %ecx
	movq	%rsi, %rax
	andq	$-32, %rax
	je	.LBB5_2
# BB#7:                                 # %vector.body.preheader
	leaq	-32(%rsi), %r8
	movl	%r8d, %ecx
	shrl	$5, %ecx
	addl	$1, %ecx
	xorl	%edx, %edx
	testb	$3, %cl
	je	.LBB5_10
# BB#8:                                 # %vector.body.prol.preheader
	leal	-32(%rsi), %ecx
	shrl	$5, %ecx
	addl	$1, %ecx
	andl	$3, %ecx
	negq	%rcx
	xorl	%edx, %edx
	vmovdqa	.LCPI5_0(%rip), %ymm0   # ymm0 = [159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159]
	vmovdqa	.LCPI5_1(%rip), %ymm1   # ymm1 = [128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128]
	vmovdqa	.LCPI5_2(%rip), %ymm2   # ymm2 = [154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154]
	vmovdqa	.LCPI5_3(%rip), %ymm3   # ymm3 = [224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224]
	.align	16, 0x90
.LBB5_9:                                # %vector.body.prol
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rdi,%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rdi,%rdx)
	addq	$32, %rdx
	addq	$1, %rcx
	jne	.LBB5_9
.LBB5_10:                               # %vector.body.preheader.split
	cmpq	$96, %r8
	jb	.LBB5_13
# BB#11:                                # %vector.body.preheader.split.split
	movq	%rsi, %rcx
	andq	$-32, %rcx
	subq	%rdx, %rcx
	leaq	96(%rdx,%rdi), %rdx
	vmovdqa	.LCPI5_0(%rip), %ymm0   # ymm0 = [159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159]
	vmovdqa	.LCPI5_1(%rip), %ymm1   # ymm1 = [128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128]
	vmovdqa	.LCPI5_2(%rip), %ymm2   # ymm2 = [154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154,154]
	vmovdqa	.LCPI5_3(%rip), %ymm3   # ymm3 = [224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224,224]
	.align	16, 0x90
.LBB5_12:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	-96(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, -96(%rdx)
	vmovdqu	-64(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, -64(%rdx)
	vmovdqu	-32(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, -32(%rdx)
	vmovdqu	(%rdx), %ymm4
	vpaddb	%ymm0, %ymm4, %ymm5
	vpxor	%ymm1, %ymm5, %ymm5
	vpcmpgtb	%ymm5, %ymm2, %ymm5
	vpaddb	%ymm3, %ymm4, %ymm6
	vpblendvb	%ymm5, %ymm6, %ymm4, %ymm4
	vmovdqu	%ymm4, (%rdx)
	subq	$-128, %rdx
	addq	$-128, %rcx
	jne	.LBB5_12
.LBB5_13:                               # %middle.block
	movq	%rax, %rcx
	cmpq	%rsi, %rax
	je	.LBB5_14
.LBB5_2:                                # %.lr.ph.preheader4
	addq	%rcx, %rdi
	subq	%rcx, %rsi
	.align	16, 0x90
.LBB5_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movb	(%rdi), %al
	movb	%al, %cl
	addb	$-97, %cl
	movzbl	%cl, %ecx
	cmpl	$26, %ecx
	jae	.LBB5_5
# BB#4:                                 #   in Loop: Header=BB5_3 Depth=1
	addb	$-32, %al
.LBB5_5:                                # %.lr.ph
                                        #   in Loop: Header=BB5_3 Depth=1
	movb	%al, (%rdi)
	addq	$1, %rdi
	addq	$-1, %rsi
	jne	.LBB5_3
.LBB5_14:                               # %._crit_edge
	vzeroupper
	retq
.Lfunc_end5:
	.size	toupper_loop_define, .Lfunc_end5-toupper_loop_define
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_unroll,@function
toupper_unroll:                         # @toupper_unroll
	.cfi_startproc
# BB#0:
	xorl	%ecx, %ecx
	testq	%rsi, %rsi
	je	.LBB6_23
	.align	16, 0x90
.LBB6_1:                                # %.lr.ph23
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rax
	movb	(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_3
# BB#2:                                 #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_3:                                # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, (%rdi,%rax)
	movb	1(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_5
# BB#4:                                 #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_5:                                # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 1(%rdi,%rax)
	movb	2(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_7
# BB#6:                                 #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_7:                                # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 2(%rdi,%rax)
	movb	3(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_9
# BB#8:                                 #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_9:                                # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 3(%rdi,%rax)
	movb	4(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_11
# BB#10:                                #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_11:                               # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 4(%rdi,%rax)
	movb	5(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_13
# BB#12:                                #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_13:                               # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 5(%rdi,%rax)
	movb	6(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_15
# BB#14:                                #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_15:                               # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 6(%rdi,%rax)
	movb	7(%rdi,%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_17
# BB#16:                                #   in Loop: Header=BB6_1 Depth=1
	addb	$-32, %cl
.LBB6_17:                               # %.lr.ph23
                                        #   in Loop: Header=BB6_1 Depth=1
	movb	%cl, 7(%rdi,%rax)
	leaq	8(%rax), %rcx
	cmpq	%rsi, %rcx
	jb	.LBB6_1
# BB#18:                                # %.preheader
	testb	$7, %sil
	je	.LBB6_23
# BB#19:                                # %.lr.ph.preheader
	leaq	8(%rdi,%rax), %rax
	andl	$7, %esi
	.align	16, 0x90
.LBB6_20:                               # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movb	(%rax), %cl
	movb	%cl, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$26, %edx
	jae	.LBB6_22
# BB#21:                                #   in Loop: Header=BB6_20 Depth=1
	addb	$-32, %cl
.LBB6_22:                               # %.lr.ph
                                        #   in Loop: Header=BB6_20 Depth=1
	movb	%cl, (%rax)
	addq	$1, %rax
	addq	$-1, %rsi
	jne	.LBB6_20
.LBB6_23:                               # %._crit_edge
	retq
.Lfunc_end6:
	.size	toupper_unroll, .Lfunc_end6-toupper_unroll
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_mmx,@function
toupper_mmx:                            # @toupper_mmx
	.cfi_startproc
# BB#0:
	testq	$-8, %rsi
	je	.LBB7_7
# BB#1:                                 # %.lr.ph.preheader
	movq	%rsi, %rax
	shrq	$3, %rax
	leaq	-1(%rax), %r8
	movl	$515, %ecx              # imm = 0x203
	xorl	%edx, %edx
	bextrq	%rcx, %rsi, %rcx
	je	.LBB7_4
# BB#2:                                 # %.lr.ph.prol.preheader
	movl	$515, %ecx              # imm = 0x203
	bextrq	%rcx, %rsi, %rsi
	xorl	%edx, %edx
	movabsq	$-2170205185142300191, %rcx # imm = 0xE1E1E1E1E1E1E1E1
	movd	%rcx, %mm0
	movabsq	$-7378697629483820647, %rcx # imm = 0x9999999999999999
	movd	%rcx, %mm1
	movabsq	$2314885530818453536, %rcx # imm = 0x2020202020202020
	movd	%rcx, %mm2
	.align	16, 0x90
.LBB7_3:                                # %.lr.ph.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi), %mm3
	movq	%mm3, %mm4
	psubb	%mm0, %mm4
	pcmpgtb	%mm1, %mm4
	pandn	%mm2, %mm4
	pxor	%mm3, %mm4
	movq	%mm4, (%rdi)
	addq	$1, %rdx
	addq	$8, %rdi
	cmpq	%rdx, %rsi
	jne	.LBB7_3
.LBB7_4:                                # %.lr.ph.preheader.split
	cmpq	$3, %r8
	jb	.LBB7_7
# BB#5:                                 # %.lr.ph.preheader.split.split
	subq	%rdx, %rax
	movabsq	$-2170205185142300191, %rcx # imm = 0xE1E1E1E1E1E1E1E1
	movd	%rcx, %mm0
	movabsq	$-7378697629483820647, %rcx # imm = 0x9999999999999999
	movd	%rcx, %mm1
	movabsq	$2314885530818453536, %rcx # imm = 0x2020202020202020
	movd	%rcx, %mm2
	.align	16, 0x90
.LBB7_6:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdi), %mm3
	movq	%mm3, %mm4
	psubb	%mm0, %mm4
	pcmpgtb	%mm1, %mm4
	pandn	%mm2, %mm4
	pxor	%mm3, %mm4
	movq	%mm4, (%rdi)
	movq	8(%rdi), %mm3
	movq	%mm3, %mm4
	psubb	%mm0, %mm4
	pcmpgtb	%mm1, %mm4
	pandn	%mm2, %mm4
	pxor	%mm3, %mm4
	movq	%mm4, 8(%rdi)
	movq	16(%rdi), %mm3
	movq	%mm3, %mm4
	psubb	%mm0, %mm4
	pcmpgtb	%mm1, %mm4
	pandn	%mm2, %mm4
	pxor	%mm3, %mm4
	movq	%mm4, 16(%rdi)
	movq	24(%rdi), %mm3
	movq	%mm3, %mm4
	psubb	%mm0, %mm4
	pcmpgtb	%mm1, %mm4
	pandn	%mm2, %mm4
	pxor	%mm3, %mm4
	movq	%mm4, 24(%rdi)
	addq	$32, %rdi
	addq	$-4, %rax
	jne	.LBB7_6
.LBB7_7:                                # %._crit_edge
	retq
.Lfunc_end7:
	.size	toupper_mmx, .Lfunc_end7-toupper_mmx
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI8_0:
	.zero	16,31
.LCPI8_1:
	.zero	16,153
.LCPI8_2:
	.zero	16,32
	.text
	.align	16, 0x90
	.type	toupper_sse_1,@function
toupper_sse_1:                          # @toupper_sse_1
	.cfi_startproc
# BB#0:
	vmovdqu	(%rdi), %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	vpcmpeqb	%xmm1, %xmm0, %xmm2
	vpmovmskb	%xmm2, %ecx
	testl	%ecx, %ecx
	jne	.LBB8_3
# BB#1:
	vmovdqa	.LCPI8_0(%rip), %xmm2   # xmm2 = [31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31]
	vmovdqa	.LCPI8_1(%rip), %xmm3   # xmm3 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovdqa	.LCPI8_2(%rip), %xmm4   # xmm4 = [2314885530818453536,2314885530818453536]
	.align	16, 0x90
.LBB8_2:                                # %.thread
                                        # =>This Inner Loop Header: Depth=1
	vpaddb	%xmm2, %xmm0, %xmm5
	vpcmpgtb	%xmm3, %xmm5, %xmm5
	vpandn	%xmm4, %xmm5, %xmm5
	vpxor	%xmm5, %xmm0, %xmm0
	vmovdqu	%xmm0, (%rdi)
	vmovdqu	16(%rdi), %xmm0
	addq	$16, %rdi
	vpcmpeqb	%xmm1, %xmm0, %xmm5
	vpmovmskb	%xmm5, %ecx
	testl	%ecx, %ecx
	je	.LBB8_2
.LBB8_3:                                # %._crit_edge.loopexit
	vpextrb	$0, %xmm0, %eax
	tzcntl	%ecx, %ecx
	je	.LBB8_9
# BB#4:                                 # %.preheader.preheader
	addq	$1, %rdi
	jmp	.LBB8_5
	.align	16, 0x90
.LBB8_8:                                # %..preheader_crit_edge
                                        #   in Loop: Header=BB8_5 Depth=1
	movb	(%rdi), %al
	addq	$1, %rdi
	addl	$-1, %ecx
.LBB8_5:                                # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$25, %edx
	ja	.LBB8_7
# BB#6:                                 #   in Loop: Header=BB8_5 Depth=1
	addb	$-32, %al
	movb	%al, -1(%rdi)
.LBB8_7:                                #   in Loop: Header=BB8_5 Depth=1
	testl	%ecx, %ecx
	jne	.LBB8_8
.LBB8_9:                                # %.loopexit
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
	testq	$-16, %rsi
	je	.LBB9_7
# BB#1:                                 # %.lr.ph.preheader
	movq	%rsi, %rax
	shrq	$4, %rax
	leaq	-1(%rax), %r8
	movl	$516, %ecx              # imm = 0x204
	xorl	%edx, %edx
	bextrq	%rcx, %rsi, %rcx
	je	.LBB9_4
# BB#2:                                 # %.lr.ph.prol.preheader
	movl	$516, %ecx              # imm = 0x204
	bextrq	%rcx, %rsi, %rsi
	xorl	%edx, %edx
	vmovdqa	.LCPI9_0(%rip), %xmm0   # xmm0 = [31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31]
	vmovdqa	.LCPI9_1(%rip), %xmm1   # xmm1 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovdqa	.LCPI9_2(%rip), %xmm2   # xmm2 = [2314885530818453536,2314885530818453536]
	.align	16, 0x90
.LBB9_3:                                # %.lr.ph.prol
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rdi), %xmm3
	vpaddb	%xmm0, %xmm3, %xmm4
	vpcmpgtb	%xmm1, %xmm4, %xmm4
	vpandn	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, (%rdi)
	addq	$1, %rdx
	addq	$16, %rdi
	cmpq	%rdx, %rsi
	jne	.LBB9_3
.LBB9_4:                                # %.lr.ph.preheader.split
	cmpq	$3, %r8
	jb	.LBB9_7
# BB#5:                                 # %.lr.ph.preheader.split.split
	subq	%rdx, %rax
	vmovdqa	.LCPI9_0(%rip), %xmm0   # xmm0 = [31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31]
	vmovdqa	.LCPI9_1(%rip), %xmm1   # xmm1 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovdqa	.LCPI9_2(%rip), %xmm2   # xmm2 = [2314885530818453536,2314885530818453536]
	.align	16, 0x90
.LBB9_6:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	(%rdi), %xmm3
	vpaddb	%xmm0, %xmm3, %xmm4
	vpcmpgtb	%xmm1, %xmm4, %xmm4
	vpandn	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, (%rdi)
	vmovdqu	16(%rdi), %xmm3
	vpaddb	%xmm0, %xmm3, %xmm4
	vpcmpgtb	%xmm1, %xmm4, %xmm4
	vpandn	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, 16(%rdi)
	vmovdqu	32(%rdi), %xmm3
	vpaddb	%xmm0, %xmm3, %xmm4
	vpcmpgtb	%xmm1, %xmm4, %xmm4
	vpandn	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, 32(%rdi)
	vmovdqu	48(%rdi), %xmm3
	vpaddb	%xmm0, %xmm3, %xmm4
	vpcmpgtb	%xmm1, %xmm4, %xmm4
	vpandn	%xmm2, %xmm4, %xmm4
	vpxor	%xmm4, %xmm3, %xmm3
	vmovdqu	%xmm3, 48(%rdi)
	addq	$64, %rdi
	addq	$-4, %rax
	jne	.LBB9_6
.LBB9_7:                                # %._crit_edge
	retq
.Lfunc_end9:
	.size	toupper_sse, .Lfunc_end9-toupper_sse
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI10_0:
	.zero	32,31
.LCPI10_1:
	.zero	32,153
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI10_2:
	.quad	2314885530818453536     # 0x2020202020202020
	.text
	.align	16, 0x90
	.type	toupper_avx_1,@function
toupper_avx_1:                          # @toupper_avx_1
	.cfi_startproc
# BB#0:
	vmovdqu	(%rdi), %ymm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpcmpeqb	%ymm1, %ymm0, %ymm2
	vpmovmskb	%ymm2, %ecx
	testl	%ecx, %ecx
	jne	.LBB10_3
# BB#1:
	vmovdqa	.LCPI10_0(%rip), %ymm2  # ymm2 = [31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31]
	vmovdqa	.LCPI10_1(%rip), %ymm3  # ymm3 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vpbroadcastq	.LCPI10_2(%rip), %ymm4
	.align	16, 0x90
.LBB10_2:                               # %.thread
                                        # =>This Inner Loop Header: Depth=1
	vpaddb	%ymm2, %ymm0, %ymm5
	vpcmpgtb	%ymm3, %ymm5, %ymm5
	vpandn	%ymm4, %ymm5, %ymm5
	vpxor	%ymm5, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rdi)
	vmovdqu	32(%rdi), %ymm0
	addq	$32, %rdi
	vpcmpeqb	%ymm1, %ymm0, %ymm5
	vpmovmskb	%ymm5, %ecx
	testl	%ecx, %ecx
	je	.LBB10_2
.LBB10_3:                               # %._crit_edge.loopexit
	vpextrb	$0, %xmm0, %eax
	tzcntl	%ecx, %ecx
	je	.LBB10_9
# BB#4:                                 # %.preheader.preheader
	addq	$1, %rdi
	jmp	.LBB10_5
	.align	16, 0x90
.LBB10_8:                               # %..preheader_crit_edge
                                        #   in Loop: Header=BB10_5 Depth=1
	movb	(%rdi), %al
	addq	$1, %rdi
	addl	$-1, %ecx
.LBB10_5:                               # %.preheader
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, %dl
	addb	$-97, %dl
	movzbl	%dl, %edx
	cmpl	$25, %edx
	ja	.LBB10_7
# BB#6:                                 #   in Loop: Header=BB10_5 Depth=1
	addb	$-32, %al
	movb	%al, -1(%rdi)
.LBB10_7:                               #   in Loop: Header=BB10_5 Depth=1
	testl	%ecx, %ecx
	jne	.LBB10_8
.LBB10_9:                               # %.loopexit
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
	#APP
	prefetcht0	(%rdi)
	#NO_APP
	#APP
	prefetcht0	64(%rdi)
	#NO_APP
	#APP
	prefetcht0	128(%rdi)
	#NO_APP
	movb	(%rdi), %al
	testb	%al, %al
	je	.LBB11_5
# BB#1:                                 # %.thread.preheader
	addq	$1, %rdi
	.align	16, 0x90
.LBB11_2:                               # %.thread
                                        # =>This Inner Loop Header: Depth=1
	movb	%al, %cl
	addb	$-97, %cl
	movzbl	%cl, %ecx
	cmpl	$26, %ecx
	jae	.LBB11_4
# BB#3:                                 #   in Loop: Header=BB11_2 Depth=1
	addb	$-32, %al
.LBB11_4:                               # %.thread
                                        #   in Loop: Header=BB11_2 Depth=1
	movb	%al, -1(%rdi)
	movb	(%rdi), %al
	addq	$1, %rdi
	testb	%al, %al
	jne	.LBB11_2
.LBB11_5:                               # %._crit_edge
	retq
.Lfunc_end11:
	.size	toupper_prefetch_branch, .Lfunc_end11-toupper_prefetch_branch
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI12_0:
	.quad	0                       # 0x0
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	3                       # 0x3
.LCPI12_1:
	.quad	4                       # 0x4
	.quad	5                       # 0x5
	.quad	6                       # 0x6
	.quad	7                       # 0x7
.LCPI12_2:
	.quad	8                       # 0x8
	.quad	9                       # 0x9
	.quad	10                      # 0xa
	.quad	11                      # 0xb
.LCPI12_3:
	.quad	12                      # 0xc
	.quad	13                      # 0xd
	.quad	14                      # 0xe
	.quad	15                      # 0xf
.LCPI12_4:
	.long	0                       # 0x0
	.long	2                       # 0x2
	.long	4                       # 0x4
	.long	6                       # 0x6
	.zero	4
	.zero	4
	.zero	4
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI12_5:
	.quad	4741671816366391296     # double 1.0E+9
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI12_6:
	.zero	16
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp10:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp11:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp12:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp13:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp14:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp15:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp16:
	.cfi_def_cfa_offset 144
.Ltmp17:
	.cfi_offset %rbx, -56
.Ltmp18:
	.cfi_offset %r12, -48
.Ltmp19:
	.cfi_offset %r13, -40
.Ltmp20:
	.cfi_offset %r14, -32
.Ltmp21:
	.cfi_offset %r15, -24
.Ltmp22:
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	xorl	%r13d, %r13d
	movl	$800000, %ebp           # imm = 0xC3500
	movl	$10000, %r12d           # imm = 0x2710
	cmpl	$2, %edi
	jl	.LBB12_1
# BB#2:                                 # %.lr.ph119.preheader
	movslq	%edi, %r15
	movl	$1, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movl	$50, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movl	$10000, %r12d           # imm = 0x2710
	movl	$800000, %ebp           # imm = 0xC3500
	movl	$3, %r14d
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	.align	16, 0x90
.LBB12_3:                               # %.lr.ph119
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbx,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_17
# BB#4:                                 #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$100, %ecx
	jne	.LBB12_7
# BB#5:                                 #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	jne	.LBB12_7
# BB#6:                                 # %.thread
                                        #   in Loop: Header=BB12_3 Depth=1
	movl	$1, debug(%rip)
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_17
	.align	16, 0x90
.LBB12_7:                               # %.thread.thread
                                        #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$108, %ecx
	jne	.LBB12_17
# BB#8:                                 #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	jne	.LBB12_17
# BB#9:                                 #   in Loop: Header=BB12_3 Depth=1
	movq	-8(%rbx,%r14,8), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	cltq
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$64, %ebp
	subq	%rcx, %rbp
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$0, %ecx
	cmoveq	%rcx, %rbp
	addq	%rax, %rbp
	cmpq	%r15, %r14
	jge	.LBB12_28
# BB#10:                                #   in Loop: Header=BB12_3 Depth=1
	movq	(%rbx,%r14,8), %rdi
	movzbl	(%rdi), %eax
	cmpl	$45, %eax
	jne	.LBB12_15
# BB#11:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rdi), %eax
	cmpl	$114, %eax
	jne	.LBB12_13
# BB#12:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rdi)
	je	.LBB12_28
.LBB12_13:                              #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rdi), %eax
	cmpl	$100, %eax
	jne	.LBB12_15
# BB#14:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rdi)
	je	.LBB12_28
.LBB12_15:                              # %.thread76
                                        #   in Loop: Header=BB12_3 Depth=1
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	cltq
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$64, %edx
	subq	%rcx, %rdx
	movq	%rax, %rcx
	andq	$63, %rcx
	movl	$0, %ecx
	cmoveq	%rcx, %rdx
	addq	%rax, %rdx
	movq	%rdx, 32(%rsp)          # 8-byte Spill
	movq	8(%rbx,%r14,8), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	movslq	%eax, %r12
	movq	%r12, %rax
	andq	$63, %rax
	je	.LBB12_17
# BB#16:                                #   in Loop: Header=BB12_3 Depth=1
	addq	$64, %r12
	subq	%rax, %r12
	.align	16, 0x90
.LBB12_17:                              # %.thread72
                                        #   in Loop: Header=BB12_3 Depth=1
	movq	-16(%rbx,%r14,8), %rax
	movzbl	(%rax), %ecx
	cmpl	$45, %ecx
	jne	.LBB12_27
# BB#18:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rax), %ecx
	cmpl	$114, %ecx
	jne	.LBB12_27
# BB#19:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rax)
	jne	.LBB12_27
# BB#20:                                #   in Loop: Header=BB12_3 Depth=1
	movq	-8(%rbx,%r14,8), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	movq	%rax, 56(%rsp)          # 8-byte Spill
	cmpq	%r15, %r14
	jge	.LBB12_28
# BB#21:                                #   in Loop: Header=BB12_3 Depth=1
	movq	(%rbx,%r14,8), %rdi
	movzbl	(%rdi), %eax
	cmpl	$45, %eax
	jne	.LBB12_26
# BB#22:                                #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rdi), %eax
	cmpl	$108, %eax
	jne	.LBB12_24
# BB#23:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rdi)
	je	.LBB12_28
.LBB12_24:                              #   in Loop: Header=BB12_3 Depth=1
	movzbl	1(%rdi), %eax
	cmpl	$100, %eax
	jne	.LBB12_26
# BB#25:                                #   in Loop: Header=BB12_3 Depth=1
	cmpb	$0, 2(%rdi)
	je	.LBB12_28
.LBB12_26:                              # %.thread82
                                        #   in Loop: Header=BB12_3 Depth=1
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	movq	%rax, 40(%rsp)          # 8-byte Spill
	movq	8(%rbx,%r14,8), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
	movq	%rax, 48(%rsp)          # 8-byte Spill
	.align	16, 0x90
.LBB12_27:                              # %.thread78
                                        #   in Loop: Header=BB12_3 Depth=1
	leaq	1(%r14), %rax
	addq	$-1, %r14
	cmpq	%r15, %r14
	movq	%rax, %r14
	jl	.LBB12_3
	jmp	.LBB12_28
.LBB12_1:
	movl	$50, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	movl	$1, %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)          # 8-byte Spill
.LBB12_28:                              # %._crit_edge120
	movl	$toupperversion+24, %eax
	cmpq	$0, toupperversion+8(%rip)
	je	.LBB12_31
	.align	16, 0x90
.LBB12_29:                              # %.lr.ph106
                                        # =>This Inner Loop Header: Depth=1
	addq	$1, %r13
	cmpq	$0, (%rax)
	leaq	16(%rax), %rax
	jne	.LBB12_29
# BB#30:                                # %._crit_edge107
	movl	%r13d, no_version(%rip)
.LBB12_31:
	movl	$1, %ebx
	movl	$1, %r15d
	movq	32(%rsp), %rax          # 8-byte Reload
	testq	%rax, %rax
	movq	48(%rsp), %r14          # 8-byte Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	je	.LBB12_33
# BB#32:
	subq	%rbp, %rax
	xorl	%edx, %edx
	divq	%r12
	movq	%rax, %r15
	addl	$1, %r15d
.LBB12_33:
	movl	%r15d, no_sz(%rip)
	testl	%ecx, %ecx
	je	.LBB12_35
# BB#34:
	movq	56(%rsp), %rax          # 8-byte Reload
	subl	%eax, %ecx
	movl	%ecx, %eax
	cltd
	idivl	%r14d
	movl	%eax, %ebx
	addl	$1, %ebx
.LBB12_35:
	movl	%ebx, no_ratio(%rip)
	imull	%ebx, %r13d
	imull	%r15d, %r13d
	shlq	$3, %r13
	movq	%r13, %rdi
	callq	malloc
	movq	%rax, results(%rip)
	movl	%ebx, %edi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, ratios(%rip)
	movl	%r15d, %edi
	shlq	$3, %rdi
	callq	malloc
	movq	%rax, sizes(%rip)
	testl	%r15d, %r15d
	jle	.LBB12_46
# BB#36:                                # %.lr.ph103
	movslq	%r15d, %rcx
	xorl	%esi, %esi
	cmpl	$15, %r15d
	jbe	.LBB12_37
# BB#39:                                # %min.iters.checked
	xorl	%esi, %esi
	movq	%rcx, %rdx
	andq	$-16, %rdx
	je	.LBB12_37
# BB#40:                                # %vector.ph
	vmovq	%r12, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmovq	%rbp, %xmm1
	vpbroadcastq	%xmm1, %ymm1
	leaq	-16(%rcx), %rdi
	movq	%rdi, %r8
	shrq	$4, %r8
	xorl	%esi, %esi
	btq	$4, %rdi
	jb	.LBB12_42
# BB#41:                                # %vector.body.prol
	vmovdqa	.LCPI12_0(%rip), %ymm2  # ymm2 = [0,1,2,3]
	vpmuludq	%ymm2, %ymm0, %ymm3
	vpsrlq	$32, %ymm0, %ymm4
	vpmuludq	%ymm2, %ymm4, %ymm2
	vpsllq	$32, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm2
	vmovdqa	.LCPI12_1(%rip), %ymm3  # ymm3 = [4,5,6,7]
	vpmuludq	%ymm3, %ymm0, %ymm5
	vpmuludq	%ymm3, %ymm4, %ymm3
	vpsllq	$32, %ymm3, %ymm3
	vpaddq	%ymm3, %ymm5, %ymm3
	vmovdqa	.LCPI12_2(%rip), %ymm5  # ymm5 = [8,9,10,11]
	vpmuludq	%ymm5, %ymm0, %ymm6
	vpmuludq	%ymm5, %ymm4, %ymm5
	vpsllq	$32, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm5
	vmovdqa	.LCPI12_3(%rip), %ymm6  # ymm6 = [12,13,14,15]
	vpmuludq	%ymm6, %ymm0, %ymm7
	vpmuludq	%ymm6, %ymm4, %ymm4
	vpsllq	$32, %ymm4, %ymm4
	vpaddq	%ymm4, %ymm7, %ymm4
	vpaddq	%ymm1, %ymm2, %ymm2
	vpaddq	%ymm1, %ymm3, %ymm3
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	%ymm1, %ymm4, %ymm4
	vmovdqu	%ymm2, (%rax)
	vmovdqu	%ymm3, 32(%rax)
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	movl	$16, %esi
.LBB12_42:                              # %vector.ph.split
	testq	%r8, %r8
	je	.LBB12_45
# BB#43:                                # %vector.ph.split.split
	vmovdqa	.LCPI12_0(%rip), %ymm2  # ymm2 = [0,1,2,3]
	vmovdqa	.LCPI12_1(%rip), %ymm3  # ymm3 = [4,5,6,7]
	vmovdqa	.LCPI12_2(%rip), %ymm4  # ymm4 = [8,9,10,11]
	vmovdqa	.LCPI12_3(%rip), %ymm5  # ymm5 = [12,13,14,15]
	vpsrlq	$32, %ymm0, %ymm6
	.align	16, 0x90
.LBB12_44:                              # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovq	%rsi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpaddq	%ymm2, %ymm7, %ymm8
	vpaddq	%ymm3, %ymm7, %ymm9
	vpaddq	%ymm4, %ymm7, %ymm10
	vpaddq	%ymm5, %ymm7, %ymm7
	vpmuludq	%ymm0, %ymm8, %ymm11
	vpmuludq	%ymm6, %ymm8, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm8, %ymm8
	vpmuludq	%ymm0, %ymm8, %ymm8
	vpsllq	$32, %ymm8, %ymm8
	vpaddq	%ymm8, %ymm11, %ymm8
	vpmuludq	%ymm0, %ymm9, %ymm11
	vpmuludq	%ymm6, %ymm9, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm9, %ymm9
	vpmuludq	%ymm0, %ymm9, %ymm9
	vpsllq	$32, %ymm9, %ymm9
	vpaddq	%ymm9, %ymm11, %ymm9
	vpmuludq	%ymm0, %ymm10, %ymm11
	vpmuludq	%ymm6, %ymm10, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm10, %ymm10
	vpmuludq	%ymm0, %ymm10, %ymm10
	vpsllq	$32, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm11, %ymm10
	vpmuludq	%ymm0, %ymm7, %ymm11
	vpmuludq	%ymm6, %ymm7, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm7, %ymm7
	vpmuludq	%ymm0, %ymm7, %ymm7
	vpsllq	$32, %ymm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm7
	vpaddq	%ymm1, %ymm8, %ymm8
	vpaddq	%ymm1, %ymm9, %ymm9
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm7, %ymm7
	vmovdqu	%ymm8, (%rax,%rsi,8)
	vmovdqu	%ymm9, 32(%rax,%rsi,8)
	vmovdqu	%ymm10, 64(%rax,%rsi,8)
	vmovdqu	%ymm7, 96(%rax,%rsi,8)
	leaq	16(%rsi), %rdi
	vmovq	%rdi, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpaddq	%ymm2, %ymm7, %ymm8
	vpaddq	%ymm3, %ymm7, %ymm9
	vpaddq	%ymm4, %ymm7, %ymm10
	vpaddq	%ymm5, %ymm7, %ymm7
	vpmuludq	%ymm0, %ymm8, %ymm11
	vpmuludq	%ymm6, %ymm8, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm8, %ymm8
	vpmuludq	%ymm0, %ymm8, %ymm8
	vpsllq	$32, %ymm8, %ymm8
	vpaddq	%ymm8, %ymm11, %ymm8
	vpmuludq	%ymm0, %ymm9, %ymm11
	vpmuludq	%ymm6, %ymm9, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm9, %ymm9
	vpmuludq	%ymm0, %ymm9, %ymm9
	vpsllq	$32, %ymm9, %ymm9
	vpaddq	%ymm9, %ymm11, %ymm9
	vpmuludq	%ymm0, %ymm10, %ymm11
	vpmuludq	%ymm6, %ymm10, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm10, %ymm10
	vpmuludq	%ymm0, %ymm10, %ymm10
	vpsllq	$32, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm11, %ymm10
	vpmuludq	%ymm0, %ymm7, %ymm11
	vpmuludq	%ymm6, %ymm7, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpaddq	%ymm12, %ymm11, %ymm11
	vpsrlq	$32, %ymm7, %ymm7
	vpmuludq	%ymm0, %ymm7, %ymm7
	vpsllq	$32, %ymm7, %ymm7
	vpaddq	%ymm7, %ymm11, %ymm7
	vpaddq	%ymm1, %ymm8, %ymm8
	vpaddq	%ymm1, %ymm9, %ymm9
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm7, %ymm7
	vmovdqu	%ymm8, 128(%rax,%rsi,8)
	vmovdqu	%ymm9, 160(%rax,%rsi,8)
	vmovdqu	%ymm10, 192(%rax,%rsi,8)
	vmovdqu	%ymm7, 224(%rax,%rsi,8)
	addq	$32, %rsi
	cmpq	%rdx, %rsi
	jne	.LBB12_44
.LBB12_45:                              # %middle.block
	movq	%rdx, %rsi
	cmpq	%rdx, %rcx
	je	.LBB12_46
.LBB12_37:                              # %scalar.ph.preheader
	movq	%rsi, %rdx
	imulq	%r12, %rdx
	addq	%rdx, %rbp
	.align	16, 0x90
.LBB12_38:                              # %scalar.ph
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbp, (%rax,%rsi,8)
	addq	$1, %rsi
	addq	%r12, %rbp
	cmpq	%rcx, %rsi
	jl	.LBB12_38
.LBB12_46:                              # %.preheader86
	testl	%ebx, %ebx
	jle	.LBB12_54
# BB#47:                                # %.lr.ph100
	movq	ratios(%rip), %rax
	movq	56(%rsp), %rcx          # 8-byte Reload
	movl	%ecx, %edi
	movslq	%ebx, %rcx
	xorl	%esi, %esi
	cmpl	$15, %ebx
	jbe	.LBB12_48
# BB#50:                                # %min.iters.checked219
	xorl	%esi, %esi
	movq	%rcx, %rdx
	andq	$-16, %rdx
	je	.LBB12_48
# BB#51:                                # %vector.ph223
	movslq	%r14d, %rsi
	vmovq	%rsi, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmovq	%rdi, %xmm1
	vpbroadcastq	%xmm1, %ymm1
	movq	%rcx, %rsi
	andq	$-16, %rsi
	xorl	%edi, %edi
	vmovdqa	.LCPI12_0(%rip), %ymm8  # ymm8 = [0,1,2,3]
	vmovdqa	.LCPI12_1(%rip), %ymm3  # ymm3 = [4,5,6,7]
	vmovdqa	.LCPI12_2(%rip), %ymm4  # ymm4 = [8,9,10,11]
	vmovdqa	.LCPI12_3(%rip), %ymm5  # ymm5 = [12,13,14,15]
	vpsrlq	$32, %ymm0, %ymm6
	vmovdqa	.LCPI12_4(%rip), %ymm7  # ymm7 = <0,2,4,6,u,u,u,u>
	.align	16, 0x90
.LBB12_52:                              # %vector.body215
                                        # =>This Inner Loop Header: Depth=1
	vmovq	%rdi, %xmm2
	vpbroadcastq	%xmm2, %ymm2
	vpaddq	%ymm8, %ymm2, %ymm9
	vpaddq	%ymm3, %ymm2, %ymm10
	vpaddq	%ymm4, %ymm2, %ymm11
	vpaddq	%ymm5, %ymm2, %ymm2
	vpmuludq	%ymm0, %ymm9, %ymm12
	vpmuludq	%ymm6, %ymm9, %ymm13
	vpsllq	$32, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsrlq	$32, %ymm9, %ymm9
	vpmuludq	%ymm0, %ymm9, %ymm9
	vpsllq	$32, %ymm9, %ymm9
	vpaddq	%ymm9, %ymm12, %ymm9
	vpmuludq	%ymm0, %ymm10, %ymm12
	vpmuludq	%ymm6, %ymm10, %ymm13
	vpsllq	$32, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsrlq	$32, %ymm10, %ymm10
	vpmuludq	%ymm0, %ymm10, %ymm10
	vpsllq	$32, %ymm10, %ymm10
	vpaddq	%ymm10, %ymm12, %ymm10
	vpmuludq	%ymm0, %ymm11, %ymm12
	vpmuludq	%ymm6, %ymm11, %ymm13
	vpsllq	$32, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsrlq	$32, %ymm11, %ymm11
	vpmuludq	%ymm0, %ymm11, %ymm11
	vpsllq	$32, %ymm11, %ymm11
	vpaddq	%ymm11, %ymm12, %ymm11
	vpmuludq	%ymm0, %ymm2, %ymm12
	vpmuludq	%ymm6, %ymm2, %ymm13
	vpsllq	$32, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsrlq	$32, %ymm2, %ymm2
	vpmuludq	%ymm0, %ymm2, %ymm2
	vpsllq	$32, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm12, %ymm2
	vpaddq	%ymm1, %ymm9, %ymm9
	vpaddq	%ymm1, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm11, %ymm11
	vpaddq	%ymm1, %ymm2, %ymm2
	vpermd	%ymm9, %ymm7, %ymm9
	vpermd	%ymm10, %ymm7, %ymm10
	vpermd	%ymm11, %ymm7, %ymm11
	vpermd	%ymm2, %ymm7, %ymm2
	vcvtdq2pd	%xmm9, %ymm9
	vcvtdq2pd	%xmm10, %ymm10
	vcvtdq2pd	%xmm11, %ymm11
	vcvtdq2pd	%xmm2, %ymm2
	vmovdqu	%ymm9, (%rax,%rdi,8)
	vmovdqu	%ymm10, 32(%rax,%rdi,8)
	vmovdqu	%ymm11, 64(%rax,%rdi,8)
	vmovdqu	%ymm2, 96(%rax,%rdi,8)
	addq	$16, %rdi
	cmpq	%rdi, %rsi
	jne	.LBB12_52
# BB#53:                                # %middle.block216
	movq	%rdx, %rsi
	cmpq	%rdx, %rcx
	je	.LBB12_54
.LBB12_48:                              # %scalar.ph217.preheader
	movl	%esi, %edx
	imull	%r14d, %edx
	movq	56(%rsp), %rdi          # 8-byte Reload
	addl	%edi, %edx
	.align	16, 0x90
.LBB12_49:                              # %scalar.ph217
                                        # =>This Inner Loop Header: Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdl	%edx, %xmm0, %xmm0
	vmovsd	%xmm0, (%rax,%rsi,8)
	addq	$1, %rsi
	addl	%r14d, %edx
	cmpq	%rcx, %rsi
	jl	.LBB12_49
.LBB12_54:                              # %.preheader85
	testl	%r15d, %r15d
	jle	.LBB12_77
# BB#55:                                # %.preheader.lr.ph
	movl	$64, %r12d
	xorl	%eax, %eax
	movq	%rax, 56(%rsp)          # 8-byte Spill
	.align	16, 0x90
.LBB12_56:                              # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_58 Depth 2
                                        #       Child Loop BB12_59 Depth 3
                                        #       Child Loop BB12_63 Depth 3
                                        #         Child Loop BB12_71 Depth 4
	testl	%ebx, %ebx
	jle	.LBB12_76
# BB#57:                                # %.lr.ph.preheader
                                        #   in Loop: Header=BB12_56 Depth=1
	xorl	%edx, %edx
	.align	16, 0x90
.LBB12_58:                              # %.lr.ph
                                        #   Parent Loop BB12_56 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB12_59 Depth 3
                                        #       Child Loop BB12_63 Depth 3
                                        #         Child Loop BB12_71 Depth 4
	movq	%rdx, 16(%rsp)          # 8-byte Spill
	movq	sizes(%rip), %rax
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rax,%rcx,8), %r15
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rdx,8), %r14d
	leaq	33(%r15), %rdi
	vzeroupper
	callq	malloc
	movq	%rax, %r13
	addq	$16, %r13
	andq	$-16, %r13
	movl	$1, %edi
	callq	srand
	movl	$0, %ebp
	movl	$0, %eax
	testq	%r15, %r15
	je	.LBB12_61
	.align	16, 0x90
.LBB12_59:                              # %.lr.ph.i.i
                                        #   Parent Loop BB12_56 Depth=1
                                        #     Parent Loop BB12_58 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	callq	rand
	cltq
	imulq	$1374389535, %rax, %rcx # imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	%r14d, %eax
	movl	$96, %ebx
	cmovll	%r12d, %ebx
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
	movb	%al, (%r13,%rbp)
	addq	$1, %rbp
	cmpq	%rbp, %r15
	jne	.LBB12_59
# BB#60:                                #   in Loop: Header=BB12_58 Depth=2
	movq	%r15, %rax
.LBB12_61:                              # %init.exit.i
                                        #   in Loop: Header=BB12_58 Depth=2
	movq	%r13, 24(%rsp)          # 8-byte Spill
	movb	$0, (%r13,%rax)
	cmpq	$0, toupperversion+8(%rip)
	leaq	64(%rsp), %r12
	je	.LBB12_74
# BB#62:                                # %.lr.ph.i.preheader
                                        #   in Loop: Header=BB12_58 Depth=2
	xorl	%r14d, %r14d
	movl	$toupperversion+8, %r15d
	.align	16, 0x90
.LBB12_63:                              # %.lr.ph.i
                                        #   Parent Loop BB12_56 Depth=1
                                        #     Parent Loop BB12_58 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB12_71 Depth 4
	movq	%r14, %r13
	movq	sizes(%rip), %r14
	movq	56(%rsp), %rbx          # 8-byte Reload
	movq	(%r14,%rbx,8), %rdi
	addq	$33, %rdi
	callq	malloc
	movq	%rax, %rbp
	addq	$16, %rbp
	andq	$-16, %rbp
	movq	(%r14,%rbx,8), %rdx
	movq	%r13, %r14
	addq	$1, %rdx
	movq	%rbp, %rdi
	movq	24(%rsp), %rsi          # 8-byte Reload
	callq	memcpy
	movl	no_sz(%rip), %r13d
	imull	%r14d, %r13d
	addl	%ebx, %r13d
	imull	no_ratio(%rip), %r13d
	movq	sizes(%rip), %rax
	movq	(%rax,%rbx,8), %rax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movq	(%r15), %rax
	movq	%rax, 40(%rsp)          # 8-byte Spill
	cmpl	$0, debug(%rip)
	je	.LBB12_65
# BB#64:                                #   in Loop: Header=BB12_63 Depth=3
	movl	$.L.str.15, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.LBB12_65:                              #   in Loop: Header=BB12_63 Depth=3
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, 64(%rsp)
	movl	$1, %edi
	movq	%r12, %rsi
	callq	clock_gettime
	testl	%eax, %eax
	jne	.LBB12_88
# BB#66:                                # %gettime.exit.i.i
                                        #   in Loop: Header=BB12_63 Depth=3
	movq	%r14, 32(%rsp)          # 8-byte Spill
	movq	%r12, %r14
	movq	64(%rsp), %r12
	movq	72(%rsp), %r15
	movq	%rbp, %rdi
	movq	48(%rsp), %rsi          # 8-byte Reload
	callq	*40(%rsp)               # 8-byte Folded Reload
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%xmm0, 64(%rsp)
	movl	$1, %edi
	movq	%r14, %rsi
	callq	clock_gettime
	testl	%eax, %eax
	jne	.LBB12_88
# BB#67:                                # %gettime.exit2.i.i
                                        #   in Loop: Header=BB12_63 Depth=3
	movq	16(%rsp), %rax          # 8-byte Reload
	addl	%eax, %r13d
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%r12, %xmm0, %xmm0
	vcvtsi2sdq	%r15, %xmm0, %xmm1
	vmovsd	.LCPI12_5(%rip), %xmm2  # xmm2 = mem[0],zero
	vmovapd	%xmm2, %xmm3
	vdivsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdq	64(%rsp), %xmm0, %xmm1
	vcvtsi2sdq	72(%rsp), %xmm0, %xmm2
	vdivsd	%xmm3, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vsubsd	%xmm0, %xmm1, %xmm0
	movslq	%r13d, %rax
	movq	results(%rip), %rcx
	vmovsd	%xmm0, (%rcx,%rax,8)
	cmpl	$0, debug(%rip)
	je	.LBB12_69
# BB#68:                                #   in Loop: Header=BB12_63 Depth=3
	movl	$.L.str.16, %edi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	callq	printf
.LBB12_69:                              # %run_toupper.exit.i
                                        #   in Loop: Header=BB12_63 Depth=3
	movq	sizes(%rip), %rax
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rax,%rcx,8), %rbx
	testq	%rbx, %rbx
	movq	%r14, %r12
	movq	32(%rsp), %r14          # 8-byte Reload
	je	.LBB12_73
# BB#70:                                # %.lr.ph.i1.i
                                        #   in Loop: Header=BB12_63 Depth=3
	movq	%r14, %rax
	shlq	$4, %rax
	leaq	toupperversion(%rax), %rax
	movq	(%rax), %r15
	callq	__ctype_toupper_loc
	movq	(%rax), %rax
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB12_71:                              #   Parent Loop BB12_56 Depth=1
                                        #     Parent Loop BB12_58 Depth=2
                                        #       Parent Loop BB12_63 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movsbq	(%rbp,%rcx), %r8
	movl	(%rax,%r8,4), %r9d
	cmpl	%r9d, %r8d
	jne	.LBB12_89
# BB#72:                                #   in Loop: Header=BB12_71 Depth=4
	addq	$1, %rcx
	cmpq	%rbx, %rcx
	jb	.LBB12_71
.LBB12_73:                              # %check_valid_toupper.exit.i
                                        #   in Loop: Header=BB12_63 Depth=3
	addq	$-1, %rbp
	andq	$-16, %rbp
	movq	%rbp, %rdi
	callq	free
	addq	$1, %r14
	movq	%r14, %rax
	shlq	$4, %rax
	leaq	toupperversion+8(%rax), %r15
	cmpq	$0, toupperversion+8(%rax)
	jne	.LBB12_63
.LBB12_74:                              # %run.exit
                                        #   in Loop: Header=BB12_58 Depth=2
	movq	24(%rsp), %rdi          # 8-byte Reload
	addq	$-1, %rdi
	andq	$-16, %rdi
	callq	free
	movq	16(%rsp), %rdx          # 8-byte Reload
	addq	$1, %rdx
	movslq	no_ratio(%rip), %rbx
	cmpq	%rbx, %rdx
	movl	$64, %r12d
	jl	.LBB12_58
# BB#75:                                # %._crit_edge.loopexit
                                        #   in Loop: Header=BB12_56 Depth=1
	movl	no_sz(%rip), %r15d
	movl	$64, %r12d
.LBB12_76:                              # %._crit_edge
                                        #   in Loop: Header=BB12_56 Depth=1
	movq	56(%rsp), %rax          # 8-byte Reload
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	movslq	%r15d, %rax
	cmpq	%rax, %rcx
	jl	.LBB12_56
.LBB12_77:                              # %._crit_edge98
	movl	$.L.str.20, %edi
	vzeroupper
	callq	puts
	movl	no_sz(%rip), %ecx
	testl	%ecx, %ecx
	jle	.LBB12_87
# BB#78:                                # %.preheader.preheader.i
	movl	no_ratio(%rip), %eax
	xorl	%r14d, %r14d
	.align	16, 0x90
.LBB12_79:                              # %.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_81 Depth 2
                                        #       Child Loop BB12_83 Depth 3
	testl	%eax, %eax
	jle	.LBB12_86
# BB#80:                                # %.lr.ph5.preheader.i
                                        #   in Loop: Header=BB12_79 Depth=1
	xorl	%r15d, %r15d
	.align	16, 0x90
.LBB12_81:                              # %.lr.ph5.i
                                        #   Parent Loop BB12_79 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB12_83 Depth 3
	movq	sizes(%rip), %rax
	movq	(%rax,%r14,8), %rsi
	movq	ratios(%rip), %rax
	vmovsd	(%rax,%r15,8), %xmm0    # xmm0 = mem[0],zero
	movl	$.L.str.21, %edi
	movb	$1, %al
	callq	printf
	cmpl	$0, no_version(%rip)
	jle	.LBB12_84
# BB#82:                                # %.lr.ph.preheader.i
                                        #   in Loop: Header=BB12_81 Depth=2
	movl	$toupperversion, %ebx
	xorl	%ebp, %ebp
	.align	16, 0x90
.LBB12_83:                              # %.lr.ph.i70
                                        #   Parent Loop BB12_79 Depth=1
                                        #     Parent Loop BB12_81 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	no_sz(%rip), %eax
	imull	%ebp, %eax
	addl	%r14d, %eax
	imull	no_ratio(%rip), %eax
	addl	%r15d, %eax
	movq	(%rbx), %rsi
	cltq
	movq	results(%rip), %rcx
	vmovsd	(%rcx,%rax,8), %xmm0    # xmm0 = mem[0],zero
	movl	$.L.str.22, %edi
	movb	$1, %al
	callq	printf
	addq	$1, %rbp
	movslq	no_version(%rip), %rax
	addq	$16, %rbx
	cmpq	%rax, %rbp
	jl	.LBB12_83
.LBB12_84:                              # %._crit_edge.i
                                        #   in Loop: Header=BB12_81 Depth=2
	movl	$10, %edi
	callq	putchar
	addq	$1, %r15
	movslq	no_ratio(%rip), %rax
	cmpq	%rax, %r15
	jl	.LBB12_81
# BB#85:                                # %._crit_edge6.loopexit.i
                                        #   in Loop: Header=BB12_79 Depth=1
	movl	no_sz(%rip), %ecx
.LBB12_86:                              # %._crit_edge6.i
                                        #   in Loop: Header=BB12_79 Depth=1
	addq	$1, %r14
	movslq	%ecx, %rdx
	cmpq	%rdx, %r14
	jl	.LBB12_79
.LBB12_87:                              # %printresults.exit
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB12_89:
	movq	stderr(%rip), %rdi
	movl	$.L.str.18, %esi
	xorl	%eax, %eax
	movq	%r15, %rdx
	callq	fprintf
	callq	abort
.LBB12_88:
	movl	$.L.str.17, %edi
	callq	perror
	callq	abort
.Lfunc_end12:
	.size	main, .Lfunc_end12-main
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

	.type	results,@object         # @results
	.comm	results,8,8
	.type	ratios,@object          # @ratios
	.comm	ratios,8,8
	.type	sizes,@object           # @sizes
	.comm	sizes,8,8
	.type	.L.str.15,@object       # @.str.15
	.section	.rodata.str1.1,"aMS",@progbits,1
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

	.type	.L.str.20,@object       # @.str.20
.L.str.20:
	.asciz	"VARIANT4: clang -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O3 toupper.c"
	.size	.L.str.20, 86

	.type	.L.str.21,@object       # @.str.21
.L.str.21:
	.asciz	"Size: %ld \tRatio: %f \tRunning time:\n"
	.size	.L.str.21, 37

	.type	.L.str.22,@object       # @.str.22
.L.str.22:
	.asciz	"\t%-16s:\t%9.5f \n"
	.size	.L.str.22, 16


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
