	.text
	.file	"toupper.c"
	.align	16, 0x90
	.type	toupper_naive_fn_no_size,@function
toupper_naive_fn_no_size:               # @toupper_naive_fn_no_size
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp0:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	movb	(%rax), %cl
	movb	%cl, 7(%rsp)
	movsbl	7(%rsp), %edx
	cmpl	$0, %edx
	jne	.LBB0_3
# BB#2:
	jmp	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movsbl	7(%rsp), %edi
	callq	upper_fn
	movq	16(%rsp), %rcx
	movb	%al, (%rcx)
	movq	16(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 16(%rsp)
	jmp	.LBB0_1
.LBB0_4:
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	toupper_naive_fn_no_size, .Lfunc_end0-toupper_naive_fn_no_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_naive_define_no_size,@function
toupper_naive_define_no_size:           # @toupper_naive_define_no_size
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rsp), %rax
	movb	(%rax), %cl
	movb	%cl, -17(%rsp)
	movsbl	-17(%rsp), %edx
	cmpl	$0, %edx
	jne	.LBB1_3
# BB#2:
	jmp	.LBB1_8
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	movsbl	-17(%rsp), %eax
	cmpl	$97, %eax
	jl	.LBB1_6
# BB#4:                                 #   in Loop: Header=BB1_1 Depth=1
	movsbl	-17(%rsp), %eax
	cmpl	$122, %eax
	jg	.LBB1_6
# BB#5:                                 #   in Loop: Header=BB1_1 Depth=1
	movsbl	-17(%rsp), %eax
	subl	$32, %eax
	movl	%eax, -24(%rsp)         # 4-byte Spill
	jmp	.LBB1_7
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	movsbl	-17(%rsp), %eax
	movl	%eax, -24(%rsp)         # 4-byte Spill
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-24(%rsp), %eax         # 4-byte Reload
	movb	%al, %cl
	movq	-8(%rsp), %rdx
	movb	%cl, (%rdx)
	movq	-8(%rsp), %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rsp)
	jmp	.LBB1_1
.LBB1_8:
	retq
.Lfunc_end1:
	.size	toupper_naive_define_no_size, .Lfunc_end1-toupper_naive_define_no_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_library_no_size,@function
toupper_library_no_size:                # @toupper_library_no_size
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp1:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	cmpb	$0, (%rax)
	je	.LBB2_3
# BB#2:                                 #   in Loop: Header=BB2_1 Depth=1
	movq	16(%rsp), %rax
	movsbl	(%rax), %edi
	callq	toupper
	movb	%al, %cl
	movq	16(%rsp), %rdx
	movb	%cl, (%rdx)
	movq	16(%rsp), %rdx
	addq	$1, %rdx
	movq	%rdx, 16(%rsp)
	jmp	.LBB2_1
.LBB2_3:
	addq	$24, %rsp
	retq
.Lfunc_end2:
	.size	toupper_library_no_size, .Lfunc_end2-toupper_library_no_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_library_size,@function
toupper_library_size:                   # @toupper_library_size
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp2:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	$0, (%rsp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	cmpq	8(%rsp), %rax
	jae	.LBB3_4
# BB#2:                                 #   in Loop: Header=BB3_1 Depth=1
	movq	(%rsp), %rax
	movq	16(%rsp), %rcx
	movsbl	(%rcx,%rax), %edi
	callq	toupper
	movb	%al, %dl
	movq	(%rsp), %rcx
	movq	16(%rsp), %rsi
	movb	%dl, (%rsi,%rcx)
# BB#3:                                 #   in Loop: Header=BB3_1 Depth=1
	movq	(%rsp), %rax
	addq	$1, %rax
	movq	%rax, (%rsp)
	jmp	.LBB3_1
.LBB3_4:
	addq	$24, %rsp
	retq
.Lfunc_end3:
	.size	toupper_library_size, .Lfunc_end3-toupper_library_size
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_loop_fn,@function
toupper_loop_fn:                        # @toupper_loop_fn
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp3:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	$0, (%rsp)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	cmpq	8(%rsp), %rax
	jae	.LBB4_4
# BB#2:                                 #   in Loop: Header=BB4_1 Depth=1
	movq	(%rsp), %rax
	movq	16(%rsp), %rcx
	movsbl	(%rcx,%rax), %edi
	callq	upper_fn
	movq	(%rsp), %rcx
	movq	16(%rsp), %rdx
	movb	%al, (%rdx,%rcx)
# BB#3:                                 #   in Loop: Header=BB4_1 Depth=1
	movq	(%rsp), %rax
	addq	$1, %rax
	movq	%rax, (%rsp)
	jmp	.LBB4_1
.LBB4_4:
	addq	$24, %rsp
	retq
.Lfunc_end4:
	.size	toupper_loop_fn, .Lfunc_end4-toupper_loop_fn
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_loop_define,@function
toupper_loop_define:                    # @toupper_loop_define
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	%rsi, -16(%rsp)
	movq	$0, -24(%rsp)
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	movq	-24(%rsp), %rax
	cmpq	-16(%rsp), %rax
	jae	.LBB5_8
# BB#2:                                 #   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rsp), %rax
	movq	-8(%rsp), %rcx
	movsbl	(%rcx,%rax), %edx
	cmpl	$97, %edx
	jl	.LBB5_5
# BB#3:                                 #   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rsp), %rax
	movq	-8(%rsp), %rcx
	movsbl	(%rcx,%rax), %edx
	cmpl	$122, %edx
	jg	.LBB5_5
# BB#4:                                 #   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rsp), %rax
	movq	-8(%rsp), %rcx
	movsbl	(%rcx,%rax), %edx
	subl	$32, %edx
	movl	%edx, -28(%rsp)         # 4-byte Spill
	jmp	.LBB5_6
.LBB5_5:                                #   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rsp), %rax
	movq	-8(%rsp), %rcx
	movsbl	(%rcx,%rax), %edx
	movl	%edx, -28(%rsp)         # 4-byte Spill
.LBB5_6:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-28(%rsp), %eax         # 4-byte Reload
	movb	%al, %cl
	movq	-24(%rsp), %rdx
	movq	-8(%rsp), %rsi
	movb	%cl, (%rsi,%rdx)
# BB#7:                                 #   in Loop: Header=BB5_1 Depth=1
	movq	-24(%rsp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rsp)
	jmp	.LBB5_1
.LBB5_8:
	retq
.Lfunc_end5:
	.size	toupper_loop_define, .Lfunc_end5-toupper_loop_define
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_unroll,@function
toupper_unroll:                         # @toupper_unroll
	.cfi_startproc
# BB#0:
	subq	$40, %rsp
.Ltmp4:
	.cfi_def_cfa_offset 48
	movq	%rdi, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	$0, 16(%rsp)
.LBB6_1:                                # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	cmpq	24(%rsp), %rax
	jae	.LBB6_4
# BB#2:                                 #   in Loop: Header=BB6_1 Depth=1
	movq	32(%rsp), %rax
	movsbl	(%rax), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
	movq	32(%rsp), %rcx
	movsbl	(%rcx), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
# BB#3:                                 #   in Loop: Header=BB6_1 Depth=1
	movq	16(%rsp), %rax
	addq	$8, %rax
	movq	%rax, 16(%rsp)
	jmp	.LBB6_1
.LBB6_4:
	movq	$0, 8(%rsp)
.LBB6_5:                                # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movq	24(%rsp), %rcx
	andq	$7, %rcx
	cmpq	%rcx, %rax
	jae	.LBB6_8
# BB#6:                                 #   in Loop: Header=BB6_5 Depth=1
	movq	32(%rsp), %rax
	movsbl	(%rax), %edi
	callq	upper_fn
	movq	32(%rsp), %rcx
	movb	%al, (%rcx)
	movq	32(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 32(%rsp)
# BB#7:                                 #   in Loop: Header=BB6_5 Depth=1
	movq	8(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 8(%rsp)
	jmp	.LBB6_5
.LBB6_8:
	addq	$40, %rsp
	retq
.Lfunc_end6:
	.size	toupper_unroll, .Lfunc_end6-toupper_unroll
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI7_0:
	.byte	0                       # 0x0
	.byte	2                       # 0x2
	.byte	4                       # 0x4
	.byte	6                       # 0x6
	.byte	8                       # 0x8
	.byte	10                      # 0xa
	.byte	12                      # 0xc
	.byte	14                      # 0xe
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.zero	1
	.text
	.align	16, 0x90
	.type	toupper_mmx,@function
toupper_mmx:                            # @toupper_mmx
	.cfi_startproc
# BB#0:
	subq	$376, %rsp              # imm = 0x178
.Ltmp5:
	.cfi_def_cfa_offset 384
	movq	%rdi, 56(%rsp)
	movq	%rsi, 48(%rsp)
	movq	$0, 8(%rsp)
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movq	48(%rsp), %rcx
	shrq	$3, %rcx
	cmpq	%rcx, %rax
	jae	.LBB7_4
# BB#2:                                 #   in Loop: Header=BB7_1 Depth=1
	movq	56(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, 64(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rax, (%rsp)
	movq	%rax, 40(%rsp)
	movb	$-31, 351(%rsp)
	movb	$-31, 367(%rsp)
	movb	$-31, 366(%rsp)
	movb	$-31, 365(%rsp)
	movb	$-31, 364(%rsp)
	movb	$-31, 363(%rsp)
	movb	$-31, 362(%rsp)
	movb	$-31, 361(%rsp)
	movb	$-31, 360(%rsp)
	movl	$225, %ecx
	vmovd	%ecx, %xmm0
	movzbl	361(%rsp), %ecx
	vpinsrw	$1, %ecx, %xmm0, %xmm0
	movzbl	362(%rsp), %ecx
	vpinsrw	$2, %ecx, %xmm0, %xmm0
	movzbl	363(%rsp), %ecx
	vpinsrw	$3, %ecx, %xmm0, %xmm0
	movzbl	364(%rsp), %ecx
	vpinsrw	$4, %ecx, %xmm0, %xmm0
	movzbl	365(%rsp), %ecx
	vpinsrw	$5, %ecx, %xmm0, %xmm0
	movzbl	366(%rsp), %ecx
	vpinsrw	$6, %ecx, %xmm0, %xmm0
	movzbl	367(%rsp), %ecx
	vpinsrw	$7, %ecx, %xmm0, %xmm0
	vmovaps	.LCPI7_0(%rip), %xmm1   # xmm1 = <0,2,4,6,8,10,12,14,u,u,u,u,u,u,u,u>
	vpshufb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 368(%rsp)
	vmovq	%xmm0, 336(%rsp)
	vmovq	%xmm0, 352(%rsp)
	vmovq	%xmm0, -8(%rsp)
	movq	%rax, -16(%rsp)
	vmovq	%xmm0, -24(%rsp)
	movq	%rax, 320(%rsp)
	vmovq	%xmm0, 312(%rsp)
	movq	%rax, 304(%rsp)
	vmovq	%xmm0, 296(%rsp)
	movq	304(%rsp), %mm0
	movdq2q	%xmm0, %mm1
	psubb	%mm1, %mm0
	movq	%mm0, 328(%rsp)
	movq	328(%rsp), %rax
	movq	%rax, -32(%rsp)
	movq	%rax, 32(%rsp)
	movb	$-103, 271(%rsp)
	movb	$-103, 287(%rsp)
	movb	$-103, 286(%rsp)
	movb	$-103, 285(%rsp)
	movb	$-103, 284(%rsp)
	movb	$-103, 283(%rsp)
	movb	$-103, 282(%rsp)
	movb	$-103, 281(%rsp)
	movb	$-103, 280(%rsp)
	movl	$153, %ecx
	vmovd	%ecx, %xmm0
	movzbl	281(%rsp), %ecx
	vpinsrw	$1, %ecx, %xmm0, %xmm0
	movzbl	282(%rsp), %ecx
	vpinsrw	$2, %ecx, %xmm0, %xmm0
	movzbl	283(%rsp), %ecx
	vpinsrw	$3, %ecx, %xmm0, %xmm0
	movzbl	284(%rsp), %ecx
	vpinsrw	$4, %ecx, %xmm0, %xmm0
	movzbl	285(%rsp), %ecx
	vpinsrw	$5, %ecx, %xmm0, %xmm0
	movzbl	286(%rsp), %ecx
	vpinsrw	$6, %ecx, %xmm0, %xmm0
	movzbl	287(%rsp), %ecx
	vpinsrw	$7, %ecx, %xmm0, %xmm0
	vpshufb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 288(%rsp)
	vmovq	%xmm0, 256(%rsp)
	vmovq	%xmm0, 272(%rsp)
	vmovq	%xmm0, -40(%rsp)
	movq	%rax, -48(%rsp)
	vmovq	%xmm0, -56(%rsp)
	movq	%rax, 240(%rsp)
	vmovq	%xmm0, 232(%rsp)
	movq	%rax, 224(%rsp)
	vmovq	%xmm0, 216(%rsp)
	movq	224(%rsp), %mm0
	movdq2q	%xmm0, %mm1
	pcmpgtb	%mm1, %mm0
	movq	%mm0, 248(%rsp)
	movq	248(%rsp), %rax
	movq	%rax, -64(%rsp)
	movq	%rax, 24(%rsp)
	movb	$32, 191(%rsp)
	movb	$32, 207(%rsp)
	movb	$32, 206(%rsp)
	movb	$32, 205(%rsp)
	movb	$32, 204(%rsp)
	movb	$32, 203(%rsp)
	movb	$32, 202(%rsp)
	movb	$32, 201(%rsp)
	movb	$32, 200(%rsp)
	movl	$32, %ecx
	vmovd	%ecx, %xmm0
	movzbl	201(%rsp), %ecx
	vpinsrw	$1, %ecx, %xmm0, %xmm0
	movzbl	202(%rsp), %ecx
	vpinsrw	$2, %ecx, %xmm0, %xmm0
	movzbl	203(%rsp), %ecx
	vpinsrw	$3, %ecx, %xmm0, %xmm0
	movzbl	204(%rsp), %ecx
	vpinsrw	$4, %ecx, %xmm0, %xmm0
	movzbl	205(%rsp), %ecx
	vpinsrw	$5, %ecx, %xmm0, %xmm0
	movzbl	206(%rsp), %ecx
	vpinsrw	$6, %ecx, %xmm0, %xmm0
	movzbl	207(%rsp), %ecx
	vpinsrw	$7, %ecx, %xmm0, %xmm0
	vpshufb	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, 208(%rsp)
	vmovq	%xmm0, 176(%rsp)
	vmovq	%xmm0, 192(%rsp)
	vmovq	%xmm0, -72(%rsp)
	movq	%rax, -80(%rsp)
	vmovq	%xmm0, -88(%rsp)
	movq	%rax, 160(%rsp)
	vmovq	%xmm0, 152(%rsp)
	movq	%rax, 144(%rsp)
	vmovq	%xmm0, 136(%rsp)
	movq	144(%rsp), %mm0
	movq	136(%rsp), %mm1
	pandn	%mm1, %mm0
	movq	%mm0, 168(%rsp)
	movq	168(%rsp), %rax
	movq	%rax, -96(%rsp)
	movq	%rax, 16(%rsp)
	movq	40(%rsp), %rdx
	movq	%rdx, -104(%rsp)
	movq	%rax, -112(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%rax, 112(%rsp)
	movq	%rdx, 104(%rsp)
	movq	%rax, 96(%rsp)
	movq	104(%rsp), %mm0
	movq	96(%rsp), %mm1
	pxor	%mm1, %mm0
	movq	%mm0, 128(%rsp)
	movq	128(%rsp), %rax
	movq	%rax, -120(%rsp)
	movq	%rax, -128(%rsp)
	movq	%rax, 88(%rsp)
	movq	%rax, 80(%rsp)
	movq	56(%rsp), %rdx
	movq	%rax, (%rdx)
# BB#3:                                 #   in Loop: Header=BB7_1 Depth=1
	movq	8(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 8(%rsp)
	movq	56(%rsp), %rax
	addq	$8, %rax
	movq	%rax, 56(%rsp)
	jmp	.LBB7_1
.LBB7_4:
	addq	$376, %rsp              # imm = 0x178
	retq
.Lfunc_end7:
	.size	toupper_mmx, .Lfunc_end7-toupper_mmx
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_sse_1,@function
toupper_sse_1:                          # @toupper_sse_1
	.cfi_startproc
# BB#0:
	subq	$200, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 208
	movq	%rdi, 80(%rsp)
	movq	%rsi, 72(%rsp)
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
	movq	80(%rsp), %rax
	movq	%rax, 88(%rsp)
	vmovups	(%rax), %xmm0
	vmovaps	%xmm0, 48(%rsp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)
	vmovaps	48(%rsp), %xmm1
	vmovaps	%xmm0, 176(%rsp)
	vmovaps	%xmm1, 160(%rsp)
	vmovaps	176(%rsp), %xmm0
	vpcmpeqb	%xmm1, %xmm0, %xmm0
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	32(%rsp), %xmm0
	vmovdqa	%xmm0, 144(%rsp)
	vmovdqa	144(%rsp), %xmm0
	vpmovmskb	%xmm0, %ecx
	movl	%ecx, 68(%rsp)
	cmpl	$0, 68(%rsp)
	je	.LBB8_3
# BB#2:
	jmp	.LBB8_4
.LBB8_3:                                #   in Loop: Header=BB8_1 Depth=1
	vmovdqa	48(%rsp), %xmm0
	callq	toupper_si128
	vmovdqa	%xmm0, 16(%rsp)
	movq	80(%rsp), %rax
	vmovdqa	16(%rsp), %xmm0
	movq	%rax, 120(%rsp)
	vmovdqa	%xmm0, 96(%rsp)
	movq	120(%rsp), %rax
	vmovdqa	96(%rsp), %xmm0
	vmovdqu	%xmm0, (%rax)
	movq	80(%rsp), %rax
	addq	$16, %rax
	movq	%rax, 80(%rsp)
	jmp	.LBB8_1
.LBB8_4:
	movl	68(%rsp), %edi
	callq	ffs
	subl	$1, %eax
	movl	%eax, 12(%rsp)
	cmpl	$0, 12(%rsp)
	jbe	.LBB8_13
# BB#5:
	movl	$0, 8(%rsp)
.LBB8_6:                                # =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %eax
	cmpl	12(%rsp), %eax
	ja	.LBB8_12
# BB#7:                                 #   in Loop: Header=BB8_6 Depth=1
	movl	8(%rsp), %eax
	movl	%eax, %ecx
	movq	80(%rsp), %rdx
	movsbl	(%rdx,%rcx), %eax
	cmpl	$97, %eax
	jl	.LBB8_10
# BB#8:                                 #   in Loop: Header=BB8_6 Depth=1
	movl	8(%rsp), %eax
	movl	%eax, %ecx
	movq	80(%rsp), %rdx
	movsbl	(%rdx,%rcx), %eax
	cmpl	$122, %eax
	jg	.LBB8_10
# BB#9:                                 #   in Loop: Header=BB8_6 Depth=1
	movl	8(%rsp), %eax
	movl	%eax, %ecx
	movq	80(%rsp), %rdx
	movsbl	(%rdx,%rcx), %eax
	subl	$32, %eax
	movb	%al, %sil
	movb	%sil, (%rdx,%rcx)
.LBB8_10:                               #   in Loop: Header=BB8_6 Depth=1
	jmp	.LBB8_11
.LBB8_11:                               #   in Loop: Header=BB8_6 Depth=1
	movl	8(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 8(%rsp)
	jmp	.LBB8_6
.LBB8_12:
	jmp	.LBB8_13
.LBB8_13:
	addq	$200, %rsp
	retq
.Lfunc_end8:
	.size	toupper_sse_1, .Lfunc_end8-toupper_sse_1
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI9_0:
	.zero	16,225
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
	subq	$232, %rsp
.Ltmp7:
	.cfi_def_cfa_offset 240
	movq	%rdi, -32(%rsp)
	movq	%rsi, -40(%rsp)
	movq	$0, -120(%rsp)
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	movq	-120(%rsp), %rax
	movq	-40(%rsp), %rcx
	shrq	$4, %rcx
	cmpq	%rcx, %rax
	jae	.LBB9_4
# BB#2:                                 #   in Loop: Header=BB9_1 Depth=1
	movq	-32(%rsp), %rax
	movq	%rax, -24(%rsp)
	vmovups	(%rax), %xmm0
	vmovaps	%xmm0, -64(%rsp)
	movb	$-31, 231(%rsp)
	vmovaps	.LCPI9_0(%rip), %xmm1   # xmm1 = [225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225]
	vmovaps	%xmm1, 208(%rsp)
	vmovaps	%xmm0, 192(%rsp)
	vmovaps	%xmm1, 176(%rsp)
	vmovaps	192(%rsp), %xmm0
	vpsubb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -80(%rsp)
	movb	$-103, 175(%rsp)
	vmovaps	.LCPI9_1(%rip), %xmm1   # xmm1 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovaps	%xmm1, 144(%rsp)
	vmovaps	%xmm0, 128(%rsp)
	vmovaps	%xmm1, 112(%rsp)
	vmovaps	128(%rsp), %xmm0
	vpcmpgtb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -96(%rsp)
	movb	$32, 111(%rsp)
	vmovaps	.LCPI9_2(%rip), %xmm1   # xmm1 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	vmovaps	%xmm1, 80(%rsp)
	vmovaps	%xmm0, 64(%rsp)
	vmovaps	%xmm1, 48(%rsp)
	vmovaps	64(%rsp), %xmm0
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	vpxor	%xmm1, %xmm0, %xmm0
	vpand	48(%rsp), %xmm0, %xmm0
	vmovdqa	%xmm0, -112(%rsp)
	movq	-32(%rsp), %rax
	vmovdqa	-64(%rsp), %xmm0
	vmovdqa	-112(%rsp), %xmm1
	vmovdqa	%xmm0, 32(%rsp)
	vmovdqa	%xmm1, 16(%rsp)
	vmovdqa	32(%rsp), %xmm0
	vpxor	16(%rsp), %xmm0, %xmm0
	movq	%rax, 8(%rsp)
	vmovdqa	%xmm0, -16(%rsp)
	movq	8(%rsp), %rax
	vmovdqa	-16(%rsp), %xmm0
	vmovdqu	%xmm0, (%rax)
# BB#3:                                 #   in Loop: Header=BB9_1 Depth=1
	movq	-120(%rsp), %rax
	addq	$1, %rax
	movq	%rax, -120(%rsp)
	movq	-32(%rsp), %rax
	addq	$16, %rax
	movq	%rax, -32(%rsp)
	jmp	.LBB9_1
.LBB9_4:
	addq	$232, %rsp
	retq
.Lfunc_end9:
	.size	toupper_sse, .Lfunc_end9-toupper_sse
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_avx_1,@function
toupper_avx_1:                          # @toupper_avx_1
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$384, %rsp              # imm = 0x180
	movq	%rdi, 144(%rsp)
	movq	%rsi, 136(%rsp)
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	movq	144(%rsp), %rax
	movq	%rax, 152(%rsp)
	vmovups	(%rax), %ymm0
	vmovaps	%ymm0, 96(%rsp)
	vxorps	%ymm0, %ymm0, %ymm0
	vmovaps	%ymm0, 224(%rsp)
	vmovaps	96(%rsp), %ymm1
	vmovaps	%ymm0, 320(%rsp)
	vmovaps	%ymm1, 288(%rsp)
	vmovaps	320(%rsp), %ymm0
	vpcmpeqb	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 64(%rsp)
	vmovaps	%ymm0, 256(%rsp)
	vpmovmskb	%ymm0, %ecx
	movl	%ecx, 132(%rsp)
	cmpl	$0, 132(%rsp)
	je	.LBB10_3
# BB#2:
	jmp	.LBB10_4
.LBB10_3:                               #   in Loop: Header=BB10_1 Depth=1
	vmovaps	96(%rsp), %ymm0
	callq	toupper_si256
	vmovaps	%ymm0, 32(%rsp)
	movq	144(%rsp), %rax
	movq	%rax, 216(%rsp)
	vmovaps	%ymm0, 160(%rsp)
	movq	216(%rsp), %rax
	vmovdqu	%ymm0, (%rax)
	movq	144(%rsp), %rax
	addq	$32, %rax
	movq	%rax, 144(%rsp)
	jmp	.LBB10_1
.LBB10_4:
	movl	132(%rsp), %edi
	vzeroupper
	callq	ffs
	subl	$1, %eax
	movl	%eax, 28(%rsp)
	cmpl	$0, 28(%rsp)
	jbe	.LBB10_13
# BB#5:
	movl	$0, 24(%rsp)
.LBB10_6:                               # =>This Inner Loop Header: Depth=1
	movl	24(%rsp), %eax
	cmpl	28(%rsp), %eax
	ja	.LBB10_12
# BB#7:                                 #   in Loop: Header=BB10_6 Depth=1
	movl	24(%rsp), %eax
	movl	%eax, %ecx
	movq	144(%rsp), %rdx
	movsbl	(%rdx,%rcx), %eax
	cmpl	$97, %eax
	jl	.LBB10_10
# BB#8:                                 #   in Loop: Header=BB10_6 Depth=1
	movl	24(%rsp), %eax
	movl	%eax, %ecx
	movq	144(%rsp), %rdx
	movsbl	(%rdx,%rcx), %eax
	cmpl	$122, %eax
	jg	.LBB10_10
# BB#9:                                 #   in Loop: Header=BB10_6 Depth=1
	movl	24(%rsp), %eax
	movl	%eax, %ecx
	movq	144(%rsp), %rdx
	movsbl	(%rdx,%rcx), %eax
	subl	$32, %eax
	movb	%al, %sil
	movb	%sil, (%rdx,%rcx)
.LBB10_10:                              #   in Loop: Header=BB10_6 Depth=1
	jmp	.LBB10_11
.LBB10_11:                              #   in Loop: Header=BB10_6 Depth=1
	movl	24(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 24(%rsp)
	jmp	.LBB10_6
.LBB10_12:
	jmp	.LBB10_13
.LBB10_13:
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end10:
	.size	toupper_avx_1, .Lfunc_end10-toupper_avx_1
	.cfi_endproc

	.align	16, 0x90
	.type	toupper_prefetch_branch,@function
toupper_prefetch_branch:                # @toupper_prefetch_branch
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp11:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	16(%rsp), %rdi
	callq	rte_prefetch0
	movq	16(%rsp), %rsi
	addq	$64, %rsi
	movq	%rsi, %rdi
	callq	rte_prefetch0
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	%rsi, %rdi
	callq	rte_prefetch0
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rax
	movb	(%rax), %cl
	movb	%cl, 7(%rsp)
	movsbl	7(%rsp), %edx
	cmpl	$0, %edx
	sete	%cl
	andb	$1, %cl
	movzbl	%cl, %edx
	movslq	%edx, %rax
	cmpq	$0, %rax
	je	.LBB11_3
# BB#2:
	jmp	.LBB11_4
.LBB11_3:                               #   in Loop: Header=BB11_1 Depth=1
	movsbl	7(%rsp), %edi
	callq	upper_fn
	movq	16(%rsp), %rcx
	movb	%al, (%rcx)
	movq	16(%rsp), %rcx
	addq	$1, %rcx
	movq	%rcx, 16(%rsp)
	jmp	.LBB11_1
.LBB11_4:
	addq	$24, %rsp
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
	subq	$120, %rsp
.Ltmp12:
	.cfi_def_cfa_offset 128
	movl	$0, 116(%rsp)
	movl	%edi, 112(%rsp)
	movq	%rsi, 104(%rsp)
	movq	$800000, 96(%rsp)       # imm = 0xC3500
	movq	$0, 88(%rsp)
	movq	$10000, 80(%rsp)        # imm = 0x2710
	movl	$50, 76(%rsp)
	movl	$0, 72(%rsp)
	movl	$1, 68(%rsp)
	movl	$1, 64(%rsp)
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	movl	64(%rsp), %eax
	cmpl	112(%rsp), %eax
	jge	.LBB12_28
# BB#2:                                 #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movslq	64(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rsi
	movl	$.L.str.12, %edi
                                        # 
	movl	%eax, 36(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	36(%rsp), %r8d          # 4-byte Reload
	cmpl	%eax, %r8d
	jne	.LBB12_4
# BB#3:                                 #   in Loop: Header=BB12_1 Depth=1
	movl	$1, debug
.LBB12_4:                               #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movslq	64(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rsi
	movl	$.L.str.13, %edi
                                        # 
	movl	%eax, 32(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	32(%rsp), %r8d          # 4-byte Reload
	cmpl	%eax, %r8d
	jne	.LBB12_18
# BB#5:                                 #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$1, %eax
	movslq	%eax, %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	atoi
	movslq	%eax, %rcx
	movq	%rcx, 96(%rsp)
	movq	96(%rsp), %rcx
	andq	$63, %rcx
	movq	%rcx, 40(%rsp)
	cmpq	$0, %rcx
	je	.LBB12_7
# BB#6:                                 #   in Loop: Header=BB12_1 Depth=1
	movl	$64, %eax
	movl	%eax, %ecx
	subq	40(%rsp), %rcx
	addq	96(%rsp), %rcx
	movq	%rcx, 96(%rsp)
.LBB12_7:                               #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$2, %eax
	cmpl	112(%rsp), %eax
	jl	.LBB12_9
# BB#8:
	jmp	.LBB12_28
.LBB12_9:                               #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movl	64(%rsp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdx
	movq	104(%rsp), %rsi
	movq	(%rsi,%rdx,8), %rsi
	movl	$.L.str.14, %ecx
	movl	%ecx, %edi
	movl	%eax, 28(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	28(%rsp), %ecx          # 4-byte Reload
	cmpl	%eax, %ecx
	jne	.LBB12_11
# BB#10:
	jmp	.LBB12_28
.LBB12_11:                              #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movl	64(%rsp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdx
	movq	104(%rsp), %rsi
	movq	(%rsi,%rdx,8), %rsi
	movl	$.L.str.12, %ecx
	movl	%ecx, %edi
	movl	%eax, 24(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	24(%rsp), %ecx          # 4-byte Reload
	cmpl	%eax, %ecx
	jne	.LBB12_13
# BB#12:
	jmp	.LBB12_28
.LBB12_13:                              #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$2, %eax
	movslq	%eax, %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	atoi
	movslq	%eax, %rcx
	movq	%rcx, 88(%rsp)
	movq	88(%rsp), %rcx
	andq	$63, %rcx
	movq	%rcx, 40(%rsp)
	cmpq	$0, %rcx
	je	.LBB12_15
# BB#14:                                #   in Loop: Header=BB12_1 Depth=1
	movl	$64, %eax
	movl	%eax, %ecx
	subq	40(%rsp), %rcx
	addq	88(%rsp), %rcx
	movq	%rcx, 88(%rsp)
.LBB12_15:                              #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$3, %eax
	movslq	%eax, %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	atoi
	movslq	%eax, %rcx
	movq	%rcx, 80(%rsp)
	movq	80(%rsp), %rcx
	andq	$63, %rcx
	movq	%rcx, 40(%rsp)
	cmpq	$0, %rcx
	je	.LBB12_17
# BB#16:                                #   in Loop: Header=BB12_1 Depth=1
	movl	$64, %eax
	movl	%eax, %ecx
	subq	40(%rsp), %rcx
	addq	80(%rsp), %rcx
	movq	%rcx, 80(%rsp)
.LBB12_17:                              #   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_18
.LBB12_18:                              #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movslq	64(%rsp), %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rsi
	movl	$.L.str.14, %edi
                                        # 
	movl	%eax, 20(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	20(%rsp), %r8d          # 4-byte Reload
	cmpl	%eax, %r8d
	jne	.LBB12_26
# BB#19:                                #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$1, %eax
	movslq	%eax, %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	atoi
	movl	%eax, 76(%rsp)
	movl	64(%rsp), %eax
	addl	$2, %eax
	cmpl	112(%rsp), %eax
	jl	.LBB12_21
# BB#20:
	jmp	.LBB12_28
.LBB12_21:                              #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movl	64(%rsp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdx
	movq	104(%rsp), %rsi
	movq	(%rsi,%rdx,8), %rsi
	movl	$.L.str.13, %ecx
	movl	%ecx, %edi
	movl	%eax, 16(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	16(%rsp), %ecx          # 4-byte Reload
	cmpl	%eax, %ecx
	jne	.LBB12_23
# BB#22:
	jmp	.LBB12_28
.LBB12_23:                              #   in Loop: Header=BB12_1 Depth=1
	xorl	%eax, %eax
	movl	64(%rsp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdx
	movq	104(%rsp), %rsi
	movq	(%rsi,%rdx,8), %rsi
	movl	$.L.str.12, %ecx
	movl	%ecx, %edi
	movl	%eax, 12(%rsp)          # 4-byte Spill
	callq	strcmp
	movl	12(%rsp), %ecx          # 4-byte Reload
	cmpl	%eax, %ecx
	jne	.LBB12_25
# BB#24:
	jmp	.LBB12_28
.LBB12_25:                              #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$2, %eax
	movslq	%eax, %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	atoi
	movl	%eax, 72(%rsp)
	movl	64(%rsp), %eax
	addl	$3, %eax
	movslq	%eax, %rcx
	movq	104(%rsp), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	atoi
	movl	%eax, 68(%rsp)
.LBB12_26:                              #   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_27
.LBB12_27:                              #   in Loop: Header=BB12_1 Depth=1
	movl	64(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 64(%rsp)
	jmp	.LBB12_1
.LBB12_28:
	movl	$0, 52(%rsp)
.LBB12_29:                              # =>This Inner Loop Header: Depth=1
	movabsq	$toupperversion, %rax
	movslq	52(%rsp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, 8(%rax)
	je	.LBB12_32
# BB#30:                                #   in Loop: Header=BB12_29 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, no_version
# BB#31:                                #   in Loop: Header=BB12_29 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB12_29
.LBB12_32:
	xorl	%eax, %eax
	movl	%eax, %ecx
	cmpq	88(%rsp), %rcx
	jne	.LBB12_34
# BB#33:
	movl	$1, no_sz
	jmp	.LBB12_35
.LBB12_34:
	movq	88(%rsp), %rax
	subq	96(%rsp), %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	divq	80(%rsp)
	addq	$1, %rax
	movl	%eax, %ecx
	movl	%ecx, no_sz
.LBB12_35:
	xorl	%eax, %eax
	cmpl	72(%rsp), %eax
	jne	.LBB12_37
# BB#36:
	movl	$1, no_ratio
	jmp	.LBB12_38
.LBB12_37:
	movl	72(%rsp), %eax
	subl	76(%rsp), %eax
	cltd
	idivl	68(%rsp)
	addl	$1, %eax
	movl	%eax, no_ratio
.LBB12_38:
	movl	52(%rsp), %eax
	imull	no_sz, %eax
	imull	no_ratio, %eax
	movl	%eax, 48(%rsp)
	movl	48(%rsp), %eax
	movl	%eax, %ecx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	malloc
	movq	%rax, results
	movl	no_ratio, %edx
	movl	%edx, %eax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	malloc
	movq	%rax, ratios
	movl	no_sz, %edx
	movl	%edx, %eax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	malloc
	movq	%rax, sizes
	movl	$0, 60(%rsp)
.LBB12_39:                              # =>This Inner Loop Header: Depth=1
	movl	60(%rsp), %eax
	cmpl	no_sz, %eax
	jge	.LBB12_42
# BB#40:                                #   in Loop: Header=BB12_39 Depth=1
	movq	96(%rsp), %rax
	movslq	60(%rsp), %rcx
	imulq	80(%rsp), %rcx
	addq	%rcx, %rax
	movslq	60(%rsp), %rcx
	movq	sizes, %rdx
	movq	%rax, (%rdx,%rcx,8)
# BB#41:                                #   in Loop: Header=BB12_39 Depth=1
	movl	60(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 60(%rsp)
	jmp	.LBB12_39
.LBB12_42:
	movl	$0, 60(%rsp)
.LBB12_43:                              # =>This Inner Loop Header: Depth=1
	movl	60(%rsp), %eax
	cmpl	no_ratio, %eax
	jge	.LBB12_46
# BB#44:                                #   in Loop: Header=BB12_43 Depth=1
	movl	76(%rsp), %eax
	movl	60(%rsp), %ecx
	imull	68(%rsp), %ecx
	addl	%ecx, %eax
                                        # implicit-def: %XMM0
	vcvtsi2sdl	%eax, %xmm0, %xmm0
	movslq	60(%rsp), %rdx
	movq	ratios, %rsi
	vmovsd	%xmm0, (%rsi,%rdx,8)
# BB#45:                                #   in Loop: Header=BB12_43 Depth=1
	movl	60(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 60(%rsp)
	jmp	.LBB12_43
.LBB12_46:
	movl	$0, 60(%rsp)
.LBB12_47:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_49 Depth 2
	movl	60(%rsp), %eax
	cmpl	no_sz, %eax
	jge	.LBB12_54
# BB#48:                                #   in Loop: Header=BB12_47 Depth=1
	movl	$0, 56(%rsp)
.LBB12_49:                              #   Parent Loop BB12_47 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	56(%rsp), %eax
	cmpl	no_ratio, %eax
	jge	.LBB12_52
# BB#50:                                #   in Loop: Header=BB12_49 Depth=2
	movl	60(%rsp), %edi
	movl	56(%rsp), %esi
	callq	run
# BB#51:                                #   in Loop: Header=BB12_49 Depth=2
	movl	56(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 56(%rsp)
	jmp	.LBB12_49
.LBB12_52:                              #   in Loop: Header=BB12_47 Depth=1
	jmp	.LBB12_53
.LBB12_53:                              #   in Loop: Header=BB12_47 Depth=1
	movl	60(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 60(%rsp)
	jmp	.LBB12_47
.LBB12_54:
	callq	printresults
	xorl	%eax, %eax
	addq	$120, %rsp
	retq
.Lfunc_end12:
	.size	main, .Lfunc_end12-main
	.cfi_endproc

	.align	16, 0x90
	.type	run,@function
run:                                    # @run
	.cfi_startproc
# BB#0:
	subq	$56, %rsp
.Ltmp13:
	.cfi_def_cfa_offset 64
	movl	%edi, 52(%rsp)
	movl	%esi, 48(%rsp)
	movslq	52(%rsp), %rax
	movq	sizes, %rcx
	movq	(%rcx,%rax,8), %rdi
	movslq	48(%rsp), %rax
	movq	ratios, %rcx
	vcvttsd2si	(%rcx,%rax,8), %esi
	callq	init
	movq	%rax, 32(%rsp)
	movl	$0, 44(%rsp)
.LBB13_1:                               # =>This Inner Loop Header: Depth=1
	movabsq	$toupperversion, %rax
	movslq	44(%rsp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, 8(%rax)
	je	.LBB13_4
# BB#2:                                 #   in Loop: Header=BB13_1 Depth=1
	movslq	52(%rsp), %rax
	movq	sizes, %rcx
	movq	(%rcx,%rax,8), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	callq	mymalloc
	movabsq	$toupperversion, %rcx
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rdi
	movq	32(%rsp), %rsi
	movslq	52(%rsp), %rax
	movq	sizes, %rdx
	movq	(%rdx,%rax,8), %rax
	addq	$1, %rax
	movq	%rax, %rdx
	movq	%rcx, 8(%rsp)           # 8-byte Spill
	callq	memcpy
	movl	48(%rsp), %r8d
	movl	52(%rsp), %r9d
	imull	no_ratio, %r9d
	addl	%r9d, %r8d
	movl	44(%rsp), %r9d
	imull	no_sz, %r9d
	imull	no_ratio, %r9d
	addl	%r9d, %r8d
	movl	%r8d, 20(%rsp)
	movq	24(%rsp), %rdi
	movslq	52(%rsp), %rax
	movq	sizes, %rcx
	movq	(%rcx,%rax,8), %rsi
	movl	20(%rsp), %edx
	movslq	44(%rsp), %rax
	shlq	$4, %rax
	movq	8(%rsp), %rcx           # 8-byte Reload
	addq	%rax, %rcx
	movq	8(%rcx), %rcx
	movslq	44(%rsp), %rax
	shlq	$4, %rax
	movq	8(%rsp), %r10           # 8-byte Reload
	addq	%rax, %r10
	movq	(%r10), %r8
	callq	run_toupper
	movabsq	$toupperversion, %rax
	movslq	44(%rsp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rdi
	movq	24(%rsp), %rsi
	movslq	52(%rsp), %rax
	movq	sizes, %rcx
	movq	(%rcx,%rax,8), %rdx
	callq	check_valid_toupper
	movq	24(%rsp), %rdi
	callq	myfree
# BB#3:                                 #   in Loop: Header=BB13_1 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB13_1
.LBB13_4:
	movq	32(%rsp), %rdi
	callq	myfree
	addq	$56, %rsp
	retq
.Lfunc_end13:
	.size	run, .Lfunc_end13-run
	.cfi_endproc

	.align	16, 0x90
	.type	upper_fn,@function
upper_fn:                               # @upper_fn
	.cfi_startproc
# BB#0:
	movb	%dil, %al
	movb	%al, -2(%rsp)
	movsbl	-2(%rsp), %edi
	cmpl	$97, %edi
	jl	.LBB14_3
# BB#1:
	movsbl	-2(%rsp), %eax
	cmpl	$122, %eax
	jg	.LBB14_3
# BB#2:
	movsbl	-2(%rsp), %eax
	subl	$32, %eax
	movb	%al, %cl
	movb	%cl, -1(%rsp)
	jmp	.LBB14_4
.LBB14_3:
	movb	-2(%rsp), %al
	movb	%al, -1(%rsp)
.LBB14_4:
	movsbl	-1(%rsp), %eax
	retq
.Lfunc_end14:
	.size	upper_fn, .Lfunc_end14-upper_fn
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI15_0:
	.zero	16,225
.LCPI15_1:
	.zero	16,153
.LCPI15_2:
	.zero	16,32
	.text
	.align	16, 0x90
	.type	toupper_si128,@function
toupper_si128:                          # @toupper_si128
	.cfi_startproc
# BB#0:
	subq	$168, %rsp
.Ltmp14:
	.cfi_def_cfa_offset 176
	vmovaps	%xmm0, -80(%rsp)
	movb	$-31, -33(%rsp)
	vmovaps	.LCPI15_0(%rip), %xmm1  # xmm1 = [225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225]
	vmovaps	%xmm1, -64(%rsp)
	vmovaps	%xmm0, 144(%rsp)
	vmovaps	%xmm1, 128(%rsp)
	vmovaps	144(%rsp), %xmm0
	vpsubb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -96(%rsp)
	movb	$-103, 127(%rsp)
	vmovaps	.LCPI15_1(%rip), %xmm1  # xmm1 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovaps	%xmm1, 96(%rsp)
	vmovaps	%xmm0, 80(%rsp)
	vmovaps	%xmm1, 64(%rsp)
	vmovaps	80(%rsp), %xmm0
	vpcmpgtb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -112(%rsp)
	movb	$32, 63(%rsp)
	vmovaps	.LCPI15_2(%rip), %xmm1  # xmm1 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	vmovaps	%xmm1, 32(%rsp)
	vmovaps	%xmm0, 16(%rsp)
	vmovaps	%xmm1, (%rsp)
	vmovaps	16(%rsp), %xmm0
	vpcmpeqd	%xmm1, %xmm1, %xmm1
	vpxor	%xmm1, %xmm0, %xmm0
	vpand	(%rsp), %xmm0, %xmm0
	vmovdqa	%xmm0, -128(%rsp)
	vmovdqa	-80(%rsp), %xmm0
	vmovdqa	-128(%rsp), %xmm1
	vmovdqa	%xmm0, -16(%rsp)
	vmovdqa	%xmm1, -32(%rsp)
	vmovdqa	-16(%rsp), %xmm0
	vpxor	-32(%rsp), %xmm0, %xmm0
	addq	$168, %rsp
	retq
.Lfunc_end15:
	.size	toupper_si128, .Lfunc_end15-toupper_si128
	.cfi_endproc

	.section	.rodata,"a",@progbits
	.align	32
.LCPI16_0:
	.zero	32,225
.LCPI16_1:
	.zero	32,153
.LCPI16_2:
	.zero	32,32
	.text
	.align	16, 0x90
	.type	toupper_si256,@function
toupper_si256:                          # @toupper_si256
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp15:
	.cfi_def_cfa_offset 16
.Ltmp16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp17:
	.cfi_def_cfa_register %rbp
	andq	$-32, %rsp
	subq	$608, %rsp              # imm = 0x260
	vmovaps	%ymm0, 96(%rsp)
	movb	$-31, 191(%rsp)
	vmovaps	.LCPI16_0(%rip), %ymm1  # ymm1 = [225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225,225]
	vmovaps	%ymm1, 128(%rsp)
	vmovaps	%ymm0, 544(%rsp)
	vmovaps	%ymm1, 512(%rsp)
	vmovaps	544(%rsp), %ymm0
	vpsubb	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 64(%rsp)
	movb	$-103, 511(%rsp)
	vmovaps	.LCPI16_1(%rip), %ymm1  # ymm1 = [153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153,153]
	vmovaps	%ymm1, 448(%rsp)
	vmovaps	%ymm0, 416(%rsp)
	vmovaps	%ymm1, 384(%rsp)
	vmovaps	416(%rsp), %ymm0
	vpcmpgtb	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 32(%rsp)
	movb	$32, 383(%rsp)
	vmovaps	.LCPI16_2(%rip), %ymm1  # ymm1 = [32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32]
	vmovaps	%ymm1, 320(%rsp)
	vmovaps	%ymm0, 288(%rsp)
	vmovaps	%ymm1, 256(%rsp)
	vmovaps	288(%rsp), %ymm0
	vpandn	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, (%rsp)
	vmovaps	96(%rsp), %ymm1
	vmovaps	%ymm1, 224(%rsp)
	vmovaps	%ymm0, 192(%rsp)
	vmovaps	224(%rsp), %ymm0
	vxorps	192(%rsp), %ymm0, %ymm0
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end16:
	.size	toupper_si256, .Lfunc_end16-toupper_si256
	.cfi_endproc

	.align	16, 0x90
	.type	rte_prefetch0,@function
rte_prefetch0:                          # @rte_prefetch0
	.cfi_startproc
# BB#0:
	movq	%rdi, -8(%rsp)
	movq	-8(%rsp), %rdi
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
	subq	$24, %rsp
.Ltmp18:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	$0, 8(%rsp)
	movq	16(%rsp), %rdi
	addq	$1, %rdi
	callq	mymalloc
	movl	$1, %edi
	movq	%rax, (%rsp)
	callq	srand
	movl	$0, 8(%rsp)
.LBB18_1:                               # =>This Inner Loop Header: Depth=1
	movslq	8(%rsp), %rax
	cmpq	16(%rsp), %rax
	jae	.LBB18_4
# BB#2:                                 #   in Loop: Header=BB18_1 Depth=1
	movl	12(%rsp), %edi
	callq	createChar
	movslq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	movb	%al, (%rdx,%rcx)
# BB#3:                                 #   in Loop: Header=BB18_1 Depth=1
	movl	8(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 8(%rsp)
	jmp	.LBB18_1
.LBB18_4:
	movslq	8(%rsp), %rax
	movq	(%rsp), %rcx
	movb	$0, (%rcx,%rax)
	movq	(%rsp), %rax
	addq	$24, %rsp
	retq
.Lfunc_end18:
	.size	init, .Lfunc_end18-init
	.cfi_endproc

	.align	16, 0x90
	.type	mymalloc,@function
mymalloc:                               # @mymalloc
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp19:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	16(%rsp), %rdi
	addq	$32, %rdi
	callq	malloc
	movq	%rax, 8(%rsp)
	movq	8(%rsp), %rax
	shrq	$4, %rax
	shlq	$4, %rax
	addq	$16, %rax
	addq	$24, %rsp
	retq
.Lfunc_end19:
	.size	mymalloc, .Lfunc_end19-mymalloc
	.cfi_endproc

	.align	16, 0x90
	.type	run_toupper,@function
run_toupper:                            # @run_toupper
	.cfi_startproc
# BB#0:
	subq	$72, %rsp
.Ltmp20:
	.cfi_def_cfa_offset 80
	movq	%rdi, 64(%rsp)
	movq	%rsi, 56(%rsp)
	movl	%edx, 52(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%r8, 32(%rsp)
	cmpl	$0, debug
	je	.LBB20_2
# BB#1:
	movabsq	$.L.str.15, %rdi
	movq	64(%rsp), %rsi
	movb	$0, %al
	callq	printf
	movl	%eax, 12(%rsp)          # 4-byte Spill
.LBB20_2:
	callq	gettime
	vmovsd	%xmm0, 24(%rsp)
	movq	40(%rsp), %rax
	movq	64(%rsp), %rdi
	movq	56(%rsp), %rsi
	callq	*%rax
	callq	gettime
	vmovsd	%xmm0, 16(%rsp)
	vmovsd	16(%rsp), %xmm0         # xmm0 = mem[0],zero
	vsubsd	24(%rsp), %xmm0, %xmm0
	movslq	52(%rsp), %rax
	movq	results, %rsi
	vmovsd	%xmm0, (%rsi,%rax,8)
	cmpl	$0, debug
	je	.LBB20_4
# BB#3:
	movabsq	$.L.str.16, %rdi
	movq	64(%rsp), %rsi
	movb	$0, %al
	callq	printf
	movl	%eax, 8(%rsp)           # 4-byte Spill
.LBB20_4:
	addq	$72, %rsp
	retq
.Lfunc_end20:
	.size	run_toupper, .Lfunc_end20-run_toupper
	.cfi_endproc

	.align	16, 0x90
	.type	check_valid_toupper,@function
check_valid_toupper:                    # @check_valid_toupper
	.cfi_startproc
# BB#0:
	subq	$88, %rsp
.Ltmp21:
	.cfi_def_cfa_offset 96
	movq	%rdi, 80(%rsp)
	movq	%rsi, 72(%rsp)
	movq	%rdx, 64(%rsp)
	movq	$0, 56(%rsp)
.LBB21_1:                               # =>This Inner Loop Header: Depth=1
	movq	56(%rsp), %rax
	cmpq	64(%rsp), %rax
	jae	.LBB21_6
# BB#2:                                 #   in Loop: Header=BB21_1 Depth=1
	movq	56(%rsp), %rax
	movq	72(%rsp), %rcx
	movsbl	(%rcx,%rax), %edx
	movq	56(%rsp), %rax
	movq	72(%rsp), %rcx
	movsbl	(%rcx,%rax), %edi
	movl	%edx, 52(%rsp)          # 4-byte Spill
	callq	toupper
	movl	52(%rsp), %edx          # 4-byte Reload
	cmpl	%eax, %edx
	je	.LBB21_4
# BB#3:
	movq	stderr, %rdi
	movq	80(%rsp), %rdx
	movq	56(%rsp), %rcx
	movq	56(%rsp), %rax
	movq	72(%rsp), %rsi
	movsbl	(%rsi,%rax), %r8d
	movq	56(%rsp), %rax
	movq	72(%rsp), %rsi
	movsbl	(%rsi,%rax), %r9d
	movq	%rdi, 40(%rsp)          # 8-byte Spill
	movl	%r9d, %edi
	movl	%r8d, 36(%rsp)          # 4-byte Spill
	movq	%rdx, 24(%rsp)          # 8-byte Spill
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	callq	toupper
	movabsq	$.L.str.18, %rsi
	movq	40(%rsp), %rdi          # 8-byte Reload
	movq	24(%rsp), %rdx          # 8-byte Reload
	movq	16(%rsp), %rcx          # 8-byte Reload
	movl	36(%rsp), %r8d          # 4-byte Reload
	movl	%eax, %r9d
	movb	$0, %al
	callq	fprintf
	movl	%eax, 12(%rsp)          # 4-byte Spill
	callq	abort
.LBB21_4:                               #   in Loop: Header=BB21_1 Depth=1
	jmp	.LBB21_5
.LBB21_5:                               #   in Loop: Header=BB21_1 Depth=1
	movq	56(%rsp), %rax
	addq	$1, %rax
	movq	%rax, 56(%rsp)
	jmp	.LBB21_1
.LBB21_6:
	addq	$88, %rsp
	retq
.Lfunc_end21:
	.size	check_valid_toupper, .Lfunc_end21-check_valid_toupper
	.cfi_endproc

	.align	16, 0x90
	.type	myfree,@function
myfree:                                 # @myfree
	.cfi_startproc
# BB#0:
	subq	$24, %rsp
.Ltmp22:
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movq	16(%rsp), %rdi
	subq	$1, %rdi
	andq	$-16, %rdi
	movq	%rdi, 8(%rsp)
	movq	8(%rsp), %rdi
	callq	free
	addq	$24, %rsp
	retq
.Lfunc_end22:
	.size	myfree, .Lfunc_end22-myfree
	.cfi_endproc

	.align	16, 0x90
	.type	createChar,@function
createChar:                             # @createChar
	.cfi_startproc
# BB#0:
	pushq	%rax
.Ltmp23:
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	callq	rand
	movl	$100, %edi
	cltd
	idivl	%edi
	movb	%dl, %cl
	movb	%cl, 3(%rsp)
	movsbl	3(%rsp), %edx
	cmpl	4(%rsp), %edx
	jge	.LBB23_2
# BB#1:
	movb	$0, 3(%rsp)
	jmp	.LBB23_3
.LBB23_2:
	movb	$1, 3(%rsp)
.LBB23_3:
	callq	rand
	movl	$26, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movb	%dl, %sil
	movb	%sil, 2(%rsp)
	movsbl	3(%rsp), %ecx
	shll	$5, %ecx
	addl	$64, %ecx
	movsbl	2(%rsp), %edx
	addl	%edx, %ecx
	movb	%cl, %sil
	movsbl	%sil, %ecx
	movl	%ecx, %eax
	popq	%rcx
	retq
.Lfunc_end23:
	.size	createChar, .Lfunc_end23-createChar
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI24_0:
	.quad	4741671816366391296     # double 1.0E+9
	.text
	.align	16, 0x90
	.type	gettime,@function
gettime:                                # @gettime
	.cfi_startproc
# BB#0:
	subq	$40, %rsp
.Ltmp24:
	.cfi_def_cfa_offset 48
	movl	$1, %edi
	leaq	24(%rsp), %rax
	xorl	%esi, %esi
	movl	$16, %ecx
	movl	%ecx, %edx
	movq	%rax, %r8
	movl	%edi, 20(%rsp)          # 4-byte Spill
	movq	%r8, %rdi
	movq	%rax, 8(%rsp)           # 8-byte Spill
	callq	memset
	movl	20(%rsp), %edi          # 4-byte Reload
	movq	8(%rsp), %rsi           # 8-byte Reload
	callq	clock_gettime
	cmpl	$0, %eax
	je	.LBB24_2
# BB#1:
	movabsq	$.L.str.17, %rdi
	callq	perror
	callq	abort
.LBB24_2:
	vmovsd	.LCPI24_0, %xmm0        # xmm0 = mem[0],zero
                                        # implicit-def: %XMM1
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm1
	movq	32(%rsp), %rax
                                        # implicit-def: %XMM2
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	vdivsd	%xmm0, %xmm2, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	addq	$40, %rsp
	retq
.Lfunc_end24:
	.size	gettime, .Lfunc_end24-gettime
	.cfi_endproc

	.align	16, 0x90
	.type	printresults,@function
printresults:                           # @printresults
	.cfi_startproc
# BB#0:
	subq	$40, %rsp
.Ltmp25:
	.cfi_def_cfa_offset 48
	movabsq	$.L.str.19, %rdi
	movabsq	$.L.str.20, %rsi
	movb	$0, %al
	callq	printf
	movl	$0, 32(%rsp)
	movl	%eax, 20(%rsp)          # 4-byte Spill
.LBB25_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB25_3 Depth 2
                                        #       Child Loop BB25_5 Depth 3
	movl	32(%rsp), %eax
	cmpl	no_sz, %eax
	jge	.LBB25_12
# BB#2:                                 #   in Loop: Header=BB25_1 Depth=1
	movl	$0, 28(%rsp)
.LBB25_3:                               #   Parent Loop BB25_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB25_5 Depth 3
	movl	28(%rsp), %eax
	cmpl	no_ratio, %eax
	jge	.LBB25_10
# BB#4:                                 #   in Loop: Header=BB25_3 Depth=2
	movabsq	$.L.str.21, %rdi
	movslq	32(%rsp), %rax
	movq	sizes, %rcx
	movq	(%rcx,%rax,8), %rsi
	movslq	28(%rsp), %rax
	movq	ratios, %rcx
	vmovsd	(%rcx,%rax,8), %xmm0    # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	movl	$0, 36(%rsp)
	movl	%eax, 16(%rsp)          # 4-byte Spill
.LBB25_5:                               #   Parent Loop BB25_1 Depth=1
                                        #     Parent Loop BB25_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	36(%rsp), %eax
	cmpl	no_version, %eax
	jge	.LBB25_8
# BB#6:                                 #   in Loop: Header=BB25_5 Depth=3
	movabsq	$.L.str.22, %rdi
	movabsq	$toupperversion, %rax
	movl	28(%rsp), %ecx
	movl	%ecx, 24(%rsp)
	movl	32(%rsp), %ecx
	imull	no_ratio, %ecx
	addl	24(%rsp), %ecx
	movl	%ecx, 24(%rsp)
	movl	36(%rsp), %ecx
	imull	no_sz, %ecx
	imull	no_ratio, %ecx
	addl	24(%rsp), %ecx
	movl	%ecx, 24(%rsp)
	movslq	36(%rsp), %rdx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movslq	24(%rsp), %rax
	movq	results, %rdx
	vmovsd	(%rdx,%rax,8), %xmm0    # xmm0 = mem[0],zero
	movb	$1, %al
	callq	printf
	movl	%eax, 12(%rsp)          # 4-byte Spill
# BB#7:                                 #   in Loop: Header=BB25_5 Depth=3
	movl	36(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB25_5
.LBB25_8:                               #   in Loop: Header=BB25_3 Depth=2
	movabsq	$.L.str.23, %rdi
	movb	$0, %al
	callq	printf
	movl	%eax, 8(%rsp)           # 4-byte Spill
# BB#9:                                 #   in Loop: Header=BB25_3 Depth=2
	movl	28(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 28(%rsp)
	jmp	.LBB25_3
.LBB25_10:                              #   in Loop: Header=BB25_1 Depth=1
	jmp	.LBB25_11
.LBB25_11:                              #   in Loop: Header=BB25_1 Depth=1
	movl	32(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 32(%rsp)
	jmp	.LBB25_1
.LBB25_12:
	addq	$40, %rsp
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
	.asciz	"VARIANT1: clang -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O0 toupper.c"
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
