	.file	"toupper.c"
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.comm	results,8,8
	.comm	ratios,8,8
	.comm	sizes,8,8
	.globl	no_sz
	.data
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.text
	.type	rte_prefetch0, @function
rte_prefetch0:
.LFB3695:
	.cfi_startproc
	movq	%rdi, -8(%rsp)
	movq	-8(%rsp), %rax
#APP
# 24 "toupper.c" 1
	prefetcht0 (%rax)
# 0 "" 2
#NO_APP
	nop
	ret
	.cfi_endproc
.LFE3695:
	.size	rte_prefetch0, .-rte_prefetch0
	.section	.rodata
.LC0:
	.string	"getting time"
	.text
	.type	gettime, @function
gettime:
.LFB3696:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	%rsp, %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime
	testl	%eax, %eax
	je	.L3
	movl	$.LC0, %edi
	call	perror
	call	abort
.L3:
	movq	(%rsp), %rax
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	%rax, %xmm1, %xmm1
	movq	8(%rsp), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	.LC1(%rip), %xmm2
	vdivsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vmovq	%xmm0, %rax
	vmovq	%rax, %xmm0
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail
.L5:
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3696:
	.size	gettime, .-gettime
	.section	.rodata
	.align 8
.LC2:
	.string	"%s failed check at %zu: %c should be %c\n"
	.text
	.type	check_valid_toupper, @function
check_valid_toupper:
.LFB3697:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	$0, 40(%rsp)
	jmp	.L7
.L9:
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %ebx
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	toupper
	cmpl	%eax, %ebx
	je	.L8
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	toupper
	movl	%eax, %edi
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %esi
	movq	stderr(%rip), %rax
	movq	40(%rsp), %rcx
	movq	24(%rsp), %rdx
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	call	abort
.L8:
	addq	$1, 40(%rsp)
.L7:
	movq	40(%rsp), %rax
	cmpq	8(%rsp), %rax
	jb	.L9
	nop
	addq	$48, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3697:
	.size	check_valid_toupper, .-check_valid_toupper
	.type	upper_fn, @function
upper_fn:
.LFB3698:
	.cfi_startproc
	movl	%edi, %eax
	movb	%al, -4(%rsp)
	cmpb	$96, -4(%rsp)
	jle	.L11
	cmpb	$122, -4(%rsp)
	jg	.L11
	movzbl	-4(%rsp), %eax
	subl	$32, %eax
	jmp	.L12
.L11:
	movzbl	-4(%rsp), %eax
.L12:
	ret
	.cfi_endproc
.LFE3698:
	.size	upper_fn, .-upper_fn
	.type	toupper_naive_fn_no_size, @function
toupper_naive_fn_no_size:
.LFB3699:
	.cfi_startproc
	subq	$32, %rsp
	.cfi_def_cfa_offset 40
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
.L16:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, 31(%rsp)
	cmpb	$0, 31(%rsp)
	je	.L18
	movsbl	31(%rsp), %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	jmp	.L16
.L18:
	nop
	nop
	addq	$32, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3699:
	.size	toupper_naive_fn_no_size, .-toupper_naive_fn_no_size
	.type	toupper_naive_define_no_size, @function
toupper_naive_define_no_size:
.LFB3700:
	.cfi_startproc
	movq	%rdi, -24(%rsp)
	movq	%rsi, -32(%rsp)
.L24:
	movq	-24(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rsp)
	cmpb	$0, -1(%rsp)
	je	.L26
	cmpb	$96, -1(%rsp)
	jle	.L22
	cmpb	$122, -1(%rsp)
	jg	.L22
	movzbl	-1(%rsp), %eax
	subl	$32, %eax
	jmp	.L23
.L22:
	movzbl	-1(%rsp), %eax
.L23:
	movq	-24(%rsp), %rdx
	movb	%al, (%rdx)
	addq	$1, -24(%rsp)
	jmp	.L24
.L26:
	nop
	nop
	ret
	.cfi_endproc
.LFE3700:
	.size	toupper_naive_define_no_size, .-toupper_naive_define_no_size
	.type	toupper_library_no_size, @function
toupper_library_no_size:
.LFB3701:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	jmp	.L28
.L29:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	toupper
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
.L28:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L29
	nop
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3701:
	.size	toupper_library_no_size, .-toupper_library_no_size
	.type	toupper_library_size, @function
toupper_library_size:
.LFB3702:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	$0, 24(%rsp)
	jmp	.L31
.L32:
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	toupper
	movb	%al, (%rbx)
	addq	$1, 24(%rsp)
.L31:
	movq	24(%rsp), %rax
	cmpq	(%rsp), %rax
	jb	.L32
	nop
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3702:
	.size	toupper_library_size, .-toupper_library_size
	.type	toupper_loop_fn, @function
toupper_loop_fn:
.LFB3703:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	$0, 24(%rsp)
	jmp	.L34
.L35:
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	8(%rsp), %rdx
	movq	24(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movb	%al, (%rbx)
	addq	$1, 24(%rsp)
.L34:
	movq	24(%rsp), %rax
	cmpq	(%rsp), %rax
	jb	.L35
	nop
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3703:
	.size	toupper_loop_fn, .-toupper_loop_fn
	.type	toupper_loop_define, @function
toupper_loop_define:
.LFB3704:
	.cfi_startproc
	movq	%rdi, -24(%rsp)
	movq	%rsi, -32(%rsp)
	movq	$0, -8(%rsp)
	jmp	.L37
.L40:
	movq	-24(%rsp), %rdx
	movq	-8(%rsp), %rax
	addq	%rax, %rdx
	movq	-24(%rsp), %rcx
	movq	-8(%rsp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L38
	movq	-24(%rsp), %rcx
	movq	-8(%rsp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L38
	movq	-24(%rsp), %rcx
	movq	-8(%rsp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	subl	$32, %eax
	jmp	.L39
.L38:
	movq	-24(%rsp), %rcx
	movq	-8(%rsp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
.L39:
	movb	%al, (%rdx)
	addq	$1, -8(%rsp)
.L37:
	movq	-8(%rsp), %rax
	cmpq	-32(%rsp), %rax
	jb	.L40
	nop
	ret
	.cfi_endproc
.LFE3704:
	.size	toupper_loop_define, .-toupper_loop_define
	.type	toupper_unroll, @function
toupper_unroll:
.LFB3705:
	.cfi_startproc
	subq	$32, %rsp
	.cfi_def_cfa_offset 40
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	$0, 16(%rsp)
	jmp	.L42
.L43:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	addq	$8, 16(%rsp)
.L42:
	movq	16(%rsp), %rax
	cmpq	(%rsp), %rax
	jb	.L43
	movq	$0, 24(%rsp)
	jmp	.L44
.L45:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	addq	$1, 24(%rsp)
.L44:
	movq	(%rsp), %rax
	andl	$7, %eax
	cmpq	24(%rsp), %rax
	ja	.L45
	nop
	addq	$32, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3705:
	.size	toupper_unroll, .-toupper_unroll
	.type	toupper_prefetch_branch, @function
toupper_prefetch_branch:
.LFB3706:
	.cfi_startproc
	subq	$32, %rsp
	.cfi_def_cfa_offset 40
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
	movq	8(%rsp), %rax
	movq	%rax, %rdi
	call	rte_prefetch0
	movq	8(%rsp), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	call	rte_prefetch0
	movq	8(%rsp), %rax
	subq	$-128, %rax
	movq	%rax, %rdi
	call	rte_prefetch0
.L49:
	movq	8(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, 31(%rsp)
	cmpb	$0, 31(%rsp)
	sete	%al
	movzbl	%al, %eax
	testq	%rax, %rax
	jne	.L51
	movsbl	31(%rsp), %eax
	movl	%eax, %edi
	call	upper_fn
	movl	%eax, %edx
	movq	8(%rsp), %rax
	movb	%dl, (%rax)
	addq	$1, 8(%rsp)
	jmp	.L49
.L51:
	nop
	nop
	addq	$32, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3706:
	.size	toupper_prefetch_branch, .-toupper_prefetch_branch
	.type	toupper_si128, @function
toupper_si128:
.LFB3707:
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
	subq	$208, %rsp
	.cfi_def_cfa_offset 264
	vmovaps	%xmm0, -104(%rsp)
	movb	$-31, -75(%rsp)
	movsbl	-75(%rsp), %eax
	movl	%eax, -108(%rsp)
	movsbl	-75(%rsp), %edx
	movsbl	-75(%rsp), %ecx
	movsbl	-75(%rsp), %esi
	movsbl	-75(%rsp), %edi
	movsbl	-75(%rsp), %r8d
	movsbl	-75(%rsp), %r9d
	movsbl	-75(%rsp), %r10d
	movsbl	-75(%rsp), %r11d
	movsbl	-75(%rsp), %ebx
	movsbl	-75(%rsp), %ebp
	movsbl	-75(%rsp), %r12d
	movsbl	-75(%rsp), %r13d
	movsbl	-75(%rsp), %r14d
	movsbl	-75(%rsp), %r15d
	movsbl	-75(%rsp), %eax
	movb	%al, -40(%rsp)
	movb	%r15b, -39(%rsp)
	movb	%r14b, -38(%rsp)
	movb	%r13b, -37(%rsp)
	movb	%r12b, -36(%rsp)
	movb	%bpl, -35(%rsp)
	movb	%bl, -34(%rsp)
	movb	%r11b, -33(%rsp)
	movb	%r10b, -32(%rsp)
	movb	%r9b, -31(%rsp)
	movb	%r8b, -30(%rsp)
	movb	%dil, -29(%rsp)
	movb	%sil, -28(%rsp)
	movb	%cl, -27(%rsp)
	movb	%dl, -26(%rsp)
	movzbl	-108(%rsp), %eax
	movb	%al, -25(%rsp)
	movzbl	-25(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-26(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-27(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-28(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-29(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-30(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-31(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-32(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-33(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-34(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-35(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-36(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-37(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-38(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-39(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-40(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 184(%rsp)
	vmovdqa	184(%rsp), %xmm0
	vmovdqa	-104(%rsp), %xmm1
	vmovaps	%xmm1, -8(%rsp)
	vmovaps	%xmm0, 168(%rsp)
	vmovdqa	-8(%rsp), %xmm0
	vmovdqa	168(%rsp), %xmm1
	vpsubb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -24(%rsp)
	movb	$-103, -74(%rsp)
	movsbl	-74(%rsp), %eax
	movl	%eax, -108(%rsp)
	movsbl	-74(%rsp), %edx
	movsbl	-74(%rsp), %ecx
	movsbl	-74(%rsp), %esi
	movsbl	-74(%rsp), %edi
	movsbl	-74(%rsp), %r8d
	movsbl	-74(%rsp), %r9d
	movsbl	-74(%rsp), %r10d
	movsbl	-74(%rsp), %r11d
	movsbl	-74(%rsp), %ebx
	movsbl	-74(%rsp), %ebp
	movsbl	-74(%rsp), %r12d
	movsbl	-74(%rsp), %r13d
	movsbl	-74(%rsp), %r14d
	movsbl	-74(%rsp), %r15d
	movsbl	-74(%rsp), %eax
	movb	%al, -56(%rsp)
	movb	%r15b, -55(%rsp)
	movb	%r14b, -54(%rsp)
	movb	%r13b, -53(%rsp)
	movb	%r12b, -52(%rsp)
	movb	%bpl, -51(%rsp)
	movb	%bl, -50(%rsp)
	movb	%r11b, -49(%rsp)
	movb	%r10b, -48(%rsp)
	movb	%r9b, -47(%rsp)
	movb	%r8b, -46(%rsp)
	movb	%dil, -45(%rsp)
	movb	%sil, -44(%rsp)
	movb	%cl, -43(%rsp)
	movb	%dl, -42(%rsp)
	movzbl	-108(%rsp), %eax
	movb	%al, -41(%rsp)
	movzbl	-41(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-42(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-43(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-44(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-45(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-46(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-47(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-48(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-49(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-50(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-51(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-52(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-53(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-54(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-55(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-56(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 152(%rsp)
	vmovdqa	152(%rsp), %xmm0
	vmovdqa	-24(%rsp), %xmm1
	vmovaps	%xmm1, 24(%rsp)
	vmovaps	%xmm0, 136(%rsp)
	vmovdqa	24(%rsp), %xmm0
	vmovdqa	136(%rsp), %xmm1
	vpcmpgtb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, 8(%rsp)
	movb	$32, -73(%rsp)
	movsbl	-73(%rsp), %eax
	movl	%eax, -108(%rsp)
	movsbl	-73(%rsp), %edx
	movsbl	-73(%rsp), %ecx
	movsbl	-73(%rsp), %esi
	movsbl	-73(%rsp), %edi
	movsbl	-73(%rsp), %r8d
	movsbl	-73(%rsp), %r9d
	movsbl	-73(%rsp), %r10d
	movsbl	-73(%rsp), %r11d
	movsbl	-73(%rsp), %ebx
	movsbl	-73(%rsp), %ebp
	movsbl	-73(%rsp), %r12d
	movsbl	-73(%rsp), %r13d
	movsbl	-73(%rsp), %r14d
	movsbl	-73(%rsp), %r15d
	movsbl	-73(%rsp), %eax
	movb	%al, -72(%rsp)
	movb	%r15b, -71(%rsp)
	movb	%r14b, -70(%rsp)
	movb	%r13b, -69(%rsp)
	movb	%r12b, -68(%rsp)
	movb	%bpl, -67(%rsp)
	movb	%bl, -66(%rsp)
	movb	%r11b, -65(%rsp)
	movb	%r10b, -64(%rsp)
	movb	%r9b, -63(%rsp)
	movb	%r8b, -62(%rsp)
	movb	%dil, -61(%rsp)
	movb	%sil, -60(%rsp)
	movb	%cl, -59(%rsp)
	movb	%dl, -58(%rsp)
	movzbl	-108(%rsp), %eax
	movb	%al, -57(%rsp)
	movzbl	-57(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-58(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-59(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-60(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-61(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-62(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-63(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-64(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-65(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-66(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-67(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-68(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-69(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-70(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-71(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-72(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 120(%rsp)
	vmovdqa	120(%rsp), %xmm0
	vmovdqa	8(%rsp), %xmm1
	vmovaps	%xmm1, 56(%rsp)
	vmovaps	%xmm0, 104(%rsp)
	vmovdqa	56(%rsp), %xmm0
	vpandn	104(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, 40(%rsp)
	vmovdqa	-104(%rsp), %xmm0
	vmovaps	%xmm0, 72(%rsp)
	vmovdqa	40(%rsp), %xmm0
	vmovaps	%xmm0, 88(%rsp)
	vmovdqa	72(%rsp), %xmm1
	vmovdqa	88(%rsp), %xmm0
	vpxor	%xmm0, %xmm1, %xmm0
	nop
	addq	$208, %rsp
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
.LFE3707:
	.size	toupper_si128, .-toupper_si128
	.type	toupper_sse_1, @function
toupper_sse_1:
.LFB3708:
	.cfi_startproc
	subq	$168, %rsp
	.cfi_def_cfa_offset 176
	movq	%rdi, 8(%rsp)
	movq	%rsi, (%rsp)
.L71:
	movq	8(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	40(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vmovaps	%xmm0, 48(%rsp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, 80(%rsp)
	vmovdqa	48(%rsp), %xmm0
	vmovaps	%xmm0, 128(%rsp)
	vmovdqa	80(%rsp), %xmm1
	vmovdqa	128(%rsp), %xmm0
	vpcmpeqb	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 64(%rsp)
	vmovdqa	64(%rsp), %xmm0
	vmovaps	%xmm0, 112(%rsp)
	vmovdqa	112(%rsp), %xmm0
	vpmovmskb	%xmm0, %eax
	movl	%eax, 24(%rsp)
	cmpl	$0, 24(%rsp)
	jne	.L77
	vmovdqa	48(%rsp), %xmm0
	call	toupper_si128
	vmovaps	%xmm0, 96(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, 32(%rsp)
	vmovdqa	96(%rsp), %xmm0
	vmovaps	%xmm0, 144(%rsp)
	vmovdqa	144(%rsp), %xmm0
	movq	32(%rsp), %rax
	vmovups	%xmm0, (%rax)
	addq	$16, 8(%rsp)
	jmp	.L71
.L77:
	nop
	movl	24(%rsp), %eax
	movl	%eax, %edi
	call	ffs
	subl	$1, %eax
	movl	%eax, 28(%rsp)
	cmpl	$0, 28(%rsp)
	je	.L78
	movl	$0, 20(%rsp)
	jmp	.L73
.L75:
	movl	20(%rsp), %edx
	movq	8(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L74
	movl	20(%rsp), %edx
	movq	8(%rsp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L74
	movl	20(%rsp), %edx
	movq	8(%rsp), %rax
	addq	%rdx, %rax
	movl	20(%rsp), %ecx
	movq	8(%rsp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$32, %edx
	movb	%dl, (%rax)
.L74:
	addl	$1, 20(%rsp)
.L73:
	movl	20(%rsp), %eax
	cmpl	28(%rsp), %eax
	jbe	.L75
.L78:
	nop
	addq	$168, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3708:
	.size	toupper_sse_1, .-toupper_sse_1
	.type	toupper_mmx, @function
toupper_mmx:
.LFB3709:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, -112(%rsp)
	movq	%rsi, -120(%rsp)
	movq	$0, -64(%rsp)
	jmp	.L80
.L93:
	movq	-112(%rsp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rsp)
	movq	-48(%rsp), %rax
	movq	%rax, -56(%rsp)
	movb	$-31, -91(%rsp)
	movsbl	-91(%rsp), %eax
	movsbl	-91(%rsp), %edx
	movsbl	-91(%rsp), %ecx
	movsbl	-91(%rsp), %esi
	movsbl	-91(%rsp), %edi
	movsbl	-91(%rsp), %r8d
	movsbl	-91(%rsp), %r9d
	movsbl	-91(%rsp), %r10d
	movb	%r10b, -72(%rsp)
	movb	%r9b, -71(%rsp)
	movb	%r8b, -70(%rsp)
	movb	%dil, -69(%rsp)
	movb	%sil, -68(%rsp)
	movb	%cl, -67(%rsp)
	movb	%dl, -66(%rsp)
	movb	%al, -65(%rsp)
	movsbl	-72(%rsp), %eax
	movsbl	-71(%rsp), %r10d
	movsbl	-70(%rsp), %r9d
	movsbl	-69(%rsp), %r8d
	movsbl	-68(%rsp), %edi
	movsbl	-67(%rsp), %esi
	movsbl	-66(%rsp), %ecx
	movsbl	-65(%rsp), %edx
	movzbl	%al, %eax
	movzbl	%r10b, %r10d
	salq	$8, %rax
	orq	%r10, %rax
	movzbl	%r9b, %r9d
	salq	$8, %rax
	orq	%r9, %rax
	movzbl	%r8b, %r8d
	salq	$8, %rax
	orq	%r8, %rax
	movzbl	%dil, %edi
	salq	$8, %rax
	orq	%rdi, %rax
	movzbl	%sil, %esi
	salq	$8, %rax
	orq	%rsi, %rax
	movzbl	%cl, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%dl, %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	movq	-56(%rsp), %rax
	movq	%rax, -32(%rsp)
	movq	%rdx, 48(%rsp)
	movq	48(%rsp), %mm1
	movq	-32(%rsp), %mm0
	psubb	%mm1, %mm0
	movq	%mm0, %rax
	movq	%rax, -40(%rsp)
	movb	$-103, -90(%rsp)
	movsbl	-90(%rsp), %eax
	movsbl	-90(%rsp), %edx
	movsbl	-90(%rsp), %ecx
	movsbl	-90(%rsp), %esi
	movsbl	-90(%rsp), %edi
	movsbl	-90(%rsp), %r8d
	movsbl	-90(%rsp), %r9d
	movsbl	-90(%rsp), %r10d
	movb	%r10b, -80(%rsp)
	movb	%r9b, -79(%rsp)
	movb	%r8b, -78(%rsp)
	movb	%dil, -77(%rsp)
	movb	%sil, -76(%rsp)
	movb	%cl, -75(%rsp)
	movb	%dl, -74(%rsp)
	movb	%al, -73(%rsp)
	movsbl	-80(%rsp), %eax
	movsbl	-79(%rsp), %r10d
	movsbl	-78(%rsp), %r9d
	movsbl	-77(%rsp), %r8d
	movsbl	-76(%rsp), %edi
	movsbl	-75(%rsp), %esi
	movsbl	-74(%rsp), %ecx
	movsbl	-73(%rsp), %edx
	movzbl	%al, %eax
	movzbl	%r10b, %r10d
	salq	$8, %rax
	orq	%r10, %rax
	movzbl	%r9b, %r9d
	salq	$8, %rax
	orq	%r9, %rax
	movzbl	%r8b, %r8d
	salq	$8, %rax
	orq	%r8, %rax
	movzbl	%dil, %edi
	salq	$8, %rax
	orq	%rdi, %rax
	movzbl	%sil, %esi
	salq	$8, %rax
	orq	%rsi, %rax
	movzbl	%cl, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%dl, %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	movq	-40(%rsp), %rax
	movq	%rax, -16(%rsp)
	movq	%rdx, 40(%rsp)
	movq	40(%rsp), %mm1
	movq	-16(%rsp), %mm0
	pcmpgtb	%mm1, %mm0
	movq	%mm0, %rax
	movq	%rax, -24(%rsp)
	movb	$32, -89(%rsp)
	movsbl	-89(%rsp), %eax
	movsbl	-89(%rsp), %edx
	movsbl	-89(%rsp), %ecx
	movsbl	-89(%rsp), %esi
	movsbl	-89(%rsp), %edi
	movsbl	-89(%rsp), %r8d
	movsbl	-89(%rsp), %r9d
	movsbl	-89(%rsp), %r10d
	movb	%r10b, -88(%rsp)
	movb	%r9b, -87(%rsp)
	movb	%r8b, -86(%rsp)
	movb	%dil, -85(%rsp)
	movb	%sil, -84(%rsp)
	movb	%cl, -83(%rsp)
	movb	%dl, -82(%rsp)
	movb	%al, -81(%rsp)
	movsbl	-88(%rsp), %eax
	movsbl	-87(%rsp), %r10d
	movsbl	-86(%rsp), %r9d
	movsbl	-85(%rsp), %r8d
	movsbl	-84(%rsp), %edi
	movsbl	-83(%rsp), %esi
	movsbl	-82(%rsp), %ecx
	movsbl	-81(%rsp), %edx
	movzbl	%al, %eax
	movzbl	%r10b, %r10d
	salq	$8, %rax
	orq	%r10, %rax
	movzbl	%r9b, %r9d
	salq	$8, %rax
	orq	%r9, %rax
	movzbl	%r8b, %r8d
	salq	$8, %rax
	orq	%r8, %rax
	movzbl	%dil, %edi
	salq	$8, %rax
	orq	%rdi, %rax
	movzbl	%sil, %esi
	salq	$8, %rax
	orq	%rsi, %rax
	movzbl	%cl, %ecx
	salq	$8, %rax
	orq	%rcx, %rax
	movzbl	%dl, %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	movq	-24(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%rdx, 32(%rsp)
	movq	(%rsp), %mm0
	pandn	32(%rsp), %mm0
	movq	%mm0, -8(%rsp)
	movq	-56(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	-8(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %mm0
	pxor	24(%rsp), %mm0
	movq	%mm0, 16(%rsp)
	movq	16(%rsp), %rdx
	movq	-112(%rsp), %rax
	movq	%rdx, (%rax)
	addq	$1, -64(%rsp)
	addq	$8, -112(%rsp)
.L80:
	movq	-120(%rsp), %rax
	shrq	$3, %rax
	cmpq	-64(%rsp), %rax
	ja	.L93
	nop
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3709:
	.size	toupper_mmx, .-toupper_mmx
	.type	toupper_sse, @function
toupper_sse:
.LFB3710:
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
	subq	$256, %rsp
	.cfi_def_cfa_offset 312
	movq	%rdi, -96(%rsp)
	movq	%rsi, -104(%rsp)
	movq	$0, -32(%rsp)
	jmp	.L95
.L107:
	movq	-96(%rsp), %rax
	movq	%rax, -24(%rsp)
	movq	-24(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vmovaps	%xmm0, -8(%rsp)
	movb	$-31, -83(%rsp)
	movsbl	-83(%rsp), %eax
	movl	%eax, -108(%rsp)
	movsbl	-83(%rsp), %edx
	movsbl	-83(%rsp), %ecx
	movsbl	-83(%rsp), %esi
	movsbl	-83(%rsp), %edi
	movsbl	-83(%rsp), %r8d
	movsbl	-83(%rsp), %r9d
	movsbl	-83(%rsp), %r10d
	movsbl	-83(%rsp), %r11d
	movsbl	-83(%rsp), %ebx
	movsbl	-83(%rsp), %ebp
	movsbl	-83(%rsp), %r12d
	movsbl	-83(%rsp), %r13d
	movsbl	-83(%rsp), %r14d
	movsbl	-83(%rsp), %r15d
	movsbl	-83(%rsp), %eax
	movb	%al, -48(%rsp)
	movb	%r15b, -47(%rsp)
	movb	%r14b, -46(%rsp)
	movb	%r13b, -45(%rsp)
	movb	%r12b, -44(%rsp)
	movb	%bpl, -43(%rsp)
	movb	%bl, -42(%rsp)
	movb	%r11b, -41(%rsp)
	movb	%r10b, -40(%rsp)
	movb	%r9b, -39(%rsp)
	movb	%r8b, -38(%rsp)
	movb	%dil, -37(%rsp)
	movb	%sil, -36(%rsp)
	movb	%cl, -35(%rsp)
	movb	%dl, -34(%rsp)
	movzbl	-108(%rsp), %eax
	movb	%al, -33(%rsp)
	movzbl	-33(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-34(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-35(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-36(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-37(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-38(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-39(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-40(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-41(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-42(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-43(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-44(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-45(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-46(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-47(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-48(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 232(%rsp)
	vmovdqa	232(%rsp), %xmm0
	vmovdqa	-8(%rsp), %xmm1
	vmovaps	%xmm1, 24(%rsp)
	vmovaps	%xmm0, 216(%rsp)
	vmovdqa	24(%rsp), %xmm0
	vmovdqa	216(%rsp), %xmm1
	vpsubb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, 8(%rsp)
	movb	$-103, -82(%rsp)
	movsbl	-82(%rsp), %eax
	movl	%eax, -108(%rsp)
	movsbl	-82(%rsp), %edx
	movsbl	-82(%rsp), %ecx
	movsbl	-82(%rsp), %esi
	movsbl	-82(%rsp), %edi
	movsbl	-82(%rsp), %r8d
	movsbl	-82(%rsp), %r9d
	movsbl	-82(%rsp), %r10d
	movsbl	-82(%rsp), %r11d
	movsbl	-82(%rsp), %ebx
	movsbl	-82(%rsp), %ebp
	movsbl	-82(%rsp), %r12d
	movsbl	-82(%rsp), %r13d
	movsbl	-82(%rsp), %r14d
	movsbl	-82(%rsp), %r15d
	movsbl	-82(%rsp), %eax
	movb	%al, -64(%rsp)
	movb	%r15b, -63(%rsp)
	movb	%r14b, -62(%rsp)
	movb	%r13b, -61(%rsp)
	movb	%r12b, -60(%rsp)
	movb	%bpl, -59(%rsp)
	movb	%bl, -58(%rsp)
	movb	%r11b, -57(%rsp)
	movb	%r10b, -56(%rsp)
	movb	%r9b, -55(%rsp)
	movb	%r8b, -54(%rsp)
	movb	%dil, -53(%rsp)
	movb	%sil, -52(%rsp)
	movb	%cl, -51(%rsp)
	movb	%dl, -50(%rsp)
	movzbl	-108(%rsp), %eax
	movb	%al, -49(%rsp)
	movzbl	-49(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-50(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-51(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-52(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-53(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-54(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-55(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-56(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-57(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-58(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-59(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-60(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-61(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-62(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-63(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-64(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 200(%rsp)
	vmovdqa	200(%rsp), %xmm0
	vmovdqa	8(%rsp), %xmm1
	vmovaps	%xmm1, 56(%rsp)
	vmovaps	%xmm0, 184(%rsp)
	vmovdqa	56(%rsp), %xmm0
	vmovdqa	184(%rsp), %xmm1
	vpcmpgtb	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, 40(%rsp)
	movb	$32, -81(%rsp)
	movsbl	-81(%rsp), %eax
	movl	%eax, -108(%rsp)
	movsbl	-81(%rsp), %edx
	movsbl	-81(%rsp), %ecx
	movsbl	-81(%rsp), %esi
	movsbl	-81(%rsp), %edi
	movsbl	-81(%rsp), %r8d
	movsbl	-81(%rsp), %r9d
	movsbl	-81(%rsp), %r10d
	movsbl	-81(%rsp), %r11d
	movsbl	-81(%rsp), %ebx
	movsbl	-81(%rsp), %ebp
	movsbl	-81(%rsp), %r12d
	movsbl	-81(%rsp), %r13d
	movsbl	-81(%rsp), %r14d
	movsbl	-81(%rsp), %r15d
	movsbl	-81(%rsp), %eax
	movb	%al, -80(%rsp)
	movb	%r15b, -79(%rsp)
	movb	%r14b, -78(%rsp)
	movb	%r13b, -77(%rsp)
	movb	%r12b, -76(%rsp)
	movb	%bpl, -75(%rsp)
	movb	%bl, -74(%rsp)
	movb	%r11b, -73(%rsp)
	movb	%r10b, -72(%rsp)
	movb	%r9b, -71(%rsp)
	movb	%r8b, -70(%rsp)
	movb	%dil, -69(%rsp)
	movb	%sil, -68(%rsp)
	movb	%cl, -67(%rsp)
	movb	%dl, -66(%rsp)
	movzbl	-108(%rsp), %eax
	movb	%al, -65(%rsp)
	movzbl	-65(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-66(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-67(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-68(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-69(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-70(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-71(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-72(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-73(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-74(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-75(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-76(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-77(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-78(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-79(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	-80(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 168(%rsp)
	vmovdqa	168(%rsp), %xmm0
	vmovdqa	40(%rsp), %xmm1
	vmovaps	%xmm1, 88(%rsp)
	vmovaps	%xmm0, 152(%rsp)
	vmovdqa	88(%rsp), %xmm0
	vpandn	152(%rsp), %xmm0, %xmm0
	vmovaps	%xmm0, 72(%rsp)
	vmovdqa	-8(%rsp), %xmm0
	vmovaps	%xmm0, 104(%rsp)
	vmovdqa	72(%rsp), %xmm0
	vmovaps	%xmm0, 136(%rsp)
	vmovdqa	104(%rsp), %xmm1
	vmovdqa	136(%rsp), %xmm0
	vpxor	%xmm0, %xmm1, %xmm0
	movq	-96(%rsp), %rax
	movq	%rax, -16(%rsp)
	vmovaps	%xmm0, 120(%rsp)
	vmovdqa	120(%rsp), %xmm0
	movq	-16(%rsp), %rax
	vmovups	%xmm0, (%rax)
	addq	$1, -32(%rsp)
	addq	$16, -96(%rsp)
.L95:
	movq	-104(%rsp), %rax
	shrq	$4, %rax
	cmpq	-32(%rsp), %rax
	ja	.L107
	nop
	addq	$256, %rsp
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
.LFE3710:
	.size	toupper_sse, .-toupper_sse
	.type	toupper_si256, @function
toupper_si256:
.LFB3711:
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
	subq	$552, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vmovdqa	%ymm0, -656(%rbp)
	movb	$-31, -595(%rbp)
	movsbl	-595(%rbp), %eax
	movl	%eax, -612(%rbp)
	movsbl	-595(%rbp), %edx
	movl	%edx, -616(%rbp)
	movsbl	-595(%rbp), %ecx
	movl	%ecx, -620(%rbp)
	movsbl	-595(%rbp), %esi
	movl	%esi, -624(%rbp)
	movsbl	-595(%rbp), %edi
	movl	%edi, -660(%rbp)
	movsbl	-595(%rbp), %ebx
	movl	%ebx, -664(%rbp)
	movsbl	-595(%rbp), %r8d
	movl	%r8d, -668(%rbp)
	movsbl	-595(%rbp), %r9d
	movl	%r9d, -672(%rbp)
	movsbl	-595(%rbp), %r10d
	movl	%r10d, -676(%rbp)
	movsbl	-595(%rbp), %r11d
	movl	%r11d, -680(%rbp)
	movsbl	-595(%rbp), %r14d
	movl	%r14d, -684(%rbp)
	movsbl	-595(%rbp), %r15d
	movl	%r15d, -688(%rbp)
	movsbl	-595(%rbp), %r12d
	movl	%r12d, -692(%rbp)
	movsbl	-595(%rbp), %r13d
	movl	%r13d, -696(%rbp)
	movsbl	-595(%rbp), %eax
	movl	%eax, -700(%rbp)
	movsbl	-595(%rbp), %edx
	movl	%edx, -704(%rbp)
	movsbl	-595(%rbp), %ecx
	movl	%ecx, -708(%rbp)
	movsbl	-595(%rbp), %esi
	movl	%esi, -712(%rbp)
	movsbl	-595(%rbp), %r15d
	movsbl	-595(%rbp), %r14d
	movsbl	-595(%rbp), %r13d
	movsbl	-595(%rbp), %r12d
	movsbl	-595(%rbp), %ebx
	movsbl	-595(%rbp), %r11d
	movsbl	-595(%rbp), %r10d
	movsbl	-595(%rbp), %r9d
	movsbl	-595(%rbp), %r8d
	movsbl	-595(%rbp), %edi
	movsbl	-595(%rbp), %esi
	movsbl	-595(%rbp), %ecx
	movsbl	-595(%rbp), %edx
	movsbl	-595(%rbp), %eax
	movb	%al, -528(%rbp)
	movb	%dl, -527(%rbp)
	movb	%cl, -526(%rbp)
	movb	%sil, -525(%rbp)
	movb	%dil, -524(%rbp)
	movb	%r8b, -523(%rbp)
	movb	%r9b, -522(%rbp)
	movb	%r10b, -521(%rbp)
	movb	%r11b, -520(%rbp)
	movb	%bl, -519(%rbp)
	movb	%r12b, -518(%rbp)
	movb	%r13b, -517(%rbp)
	movb	%r14b, -516(%rbp)
	movb	%r15b, -515(%rbp)
	movzbl	-712(%rbp), %edi
	movb	%dil, -514(%rbp)
	movzbl	-708(%rbp), %ebx
	movb	%bl, -513(%rbp)
	movzbl	-704(%rbp), %edx
	movb	%dl, -512(%rbp)
	movzbl	-700(%rbp), %eax
	movb	%al, -511(%rbp)
	movzbl	-696(%rbp), %r13d
	movb	%r13b, -510(%rbp)
	movzbl	-692(%rbp), %r12d
	movb	%r12b, -509(%rbp)
	movzbl	-688(%rbp), %r15d
	movb	%r15b, -508(%rbp)
	movzbl	-684(%rbp), %r14d
	movb	%r14b, -507(%rbp)
	movzbl	-680(%rbp), %r11d
	movb	%r11b, -506(%rbp)
	movzbl	-676(%rbp), %r10d
	movb	%r10b, -505(%rbp)
	movzbl	-672(%rbp), %r9d
	movb	%r9b, -504(%rbp)
	movzbl	-668(%rbp), %r8d
	movb	%r8b, -503(%rbp)
	movzbl	-664(%rbp), %ebx
	movb	%bl, -502(%rbp)
	movzbl	-660(%rbp), %edi
	movb	%dil, -501(%rbp)
	movzbl	-624(%rbp), %esi
	movb	%sil, -500(%rbp)
	movzbl	-620(%rbp), %ecx
	movb	%cl, -499(%rbp)
	movzbl	-616(%rbp), %edx
	movb	%dl, -498(%rbp)
	movzbl	-612(%rbp), %eax
	movb	%al, -497(%rbp)
	movzbl	-497(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-498(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-499(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-500(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-501(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-502(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-503(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-504(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-505(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-506(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-507(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-508(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-509(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-510(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-511(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-512(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-513(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-514(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-515(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-516(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm9
	movzbl	-517(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-518(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	movzbl	-519(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-520(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-521(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-522(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-523(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-524(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-525(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-526(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-527(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-528(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm8, %xmm5, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm7, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpcklwd	%xmm6, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpckldq	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpckldq	%xmm4, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -80(%rbp)
	vmovdqa	-80(%rbp), %ymm0
	vmovdqa	-656(%rbp), %ymm1
	vmovdqa	%ymm1, -464(%rbp)
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	-464(%rbp), %ymm0
	vmovdqa	-112(%rbp), %ymm1
	vpsubb	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -496(%rbp)
	movb	$-103, -594(%rbp)
	movsbl	-594(%rbp), %eax
	movl	%eax, -612(%rbp)
	movsbl	-594(%rbp), %ecx
	movl	%ecx, -616(%rbp)
	movsbl	-594(%rbp), %esi
	movl	%esi, -620(%rbp)
	movsbl	-594(%rbp), %edi
	movl	%edi, -624(%rbp)
	movsbl	-594(%rbp), %ebx
	movl	%ebx, -660(%rbp)
	movsbl	-594(%rbp), %edx
	movl	%edx, -664(%rbp)
	movsbl	-594(%rbp), %r8d
	movl	%r8d, -668(%rbp)
	movsbl	-594(%rbp), %r9d
	movl	%r9d, -672(%rbp)
	movsbl	-594(%rbp), %r10d
	movl	%r10d, -676(%rbp)
	movsbl	-594(%rbp), %r11d
	movl	%r11d, -680(%rbp)
	movsbl	-594(%rbp), %r14d
	movl	%r14d, -684(%rbp)
	movsbl	-594(%rbp), %r15d
	movl	%r15d, -688(%rbp)
	movsbl	-594(%rbp), %r12d
	movl	%r12d, -692(%rbp)
	movsbl	-594(%rbp), %r13d
	movl	%r13d, -696(%rbp)
	movsbl	-594(%rbp), %eax
	movl	%eax, -700(%rbp)
	movsbl	-594(%rbp), %ecx
	movl	%ecx, -704(%rbp)
	movsbl	-594(%rbp), %esi
	movl	%esi, -708(%rbp)
	movsbl	-594(%rbp), %edi
	movl	%edi, -712(%rbp)
	movsbl	-594(%rbp), %r15d
	movsbl	-594(%rbp), %r14d
	movsbl	-594(%rbp), %r13d
	movsbl	-594(%rbp), %r12d
	movsbl	-594(%rbp), %ebx
	movsbl	-594(%rbp), %r11d
	movsbl	-594(%rbp), %r10d
	movsbl	-594(%rbp), %r9d
	movsbl	-594(%rbp), %r8d
	movsbl	-594(%rbp), %edi
	movsbl	-594(%rbp), %esi
	movsbl	-594(%rbp), %ecx
	movsbl	-594(%rbp), %edx
	movsbl	-594(%rbp), %eax
	movb	%al, -560(%rbp)
	movb	%dl, -559(%rbp)
	movb	%cl, -558(%rbp)
	movb	%sil, -557(%rbp)
	movb	%dil, -556(%rbp)
	movb	%r8b, -555(%rbp)
	movb	%r9b, -554(%rbp)
	movb	%r10b, -553(%rbp)
	movb	%r11b, -552(%rbp)
	movb	%bl, -551(%rbp)
	movb	%r12b, -550(%rbp)
	movb	%r13b, -549(%rbp)
	movb	%r14b, -548(%rbp)
	movb	%r15b, -547(%rbp)
	movzbl	-712(%rbp), %ebx
	movb	%bl, -546(%rbp)
	movzbl	-708(%rbp), %edx
	movb	%dl, -545(%rbp)
	movzbl	-704(%rbp), %ecx
	movb	%cl, -544(%rbp)
	movzbl	-700(%rbp), %eax
	movb	%al, -543(%rbp)
	movzbl	-696(%rbp), %r13d
	movb	%r13b, -542(%rbp)
	movzbl	-692(%rbp), %r12d
	movb	%r12b, -541(%rbp)
	movzbl	-688(%rbp), %r15d
	movb	%r15b, -540(%rbp)
	movzbl	-684(%rbp), %r14d
	movb	%r14b, -539(%rbp)
	movzbl	-680(%rbp), %r11d
	movb	%r11b, -538(%rbp)
	movzbl	-676(%rbp), %r10d
	movb	%r10b, -537(%rbp)
	movzbl	-672(%rbp), %r9d
	movb	%r9b, -536(%rbp)
	movzbl	-668(%rbp), %r8d
	movb	%r8b, -535(%rbp)
	movzbl	-664(%rbp), %edx
	movb	%dl, -534(%rbp)
	movzbl	-660(%rbp), %ebx
	movb	%bl, -533(%rbp)
	movzbl	-624(%rbp), %edi
	movb	%dil, -532(%rbp)
	movzbl	-620(%rbp), %esi
	movb	%sil, -531(%rbp)
	movzbl	-616(%rbp), %ecx
	movb	%cl, -530(%rbp)
	movzbl	-612(%rbp), %eax
	movb	%al, -529(%rbp)
	movzbl	-529(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-530(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-531(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-532(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-533(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-534(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-535(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-536(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-537(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-538(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-539(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-540(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-541(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-542(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-543(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-544(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-545(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-546(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-547(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-548(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm9
	movzbl	-549(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-550(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	movzbl	-551(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-552(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-553(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-554(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-555(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-556(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-557(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-558(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-559(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-560(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm8, %xmm5, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm7, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpcklwd	%xmm6, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpckldq	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpckldq	%xmm4, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	-144(%rbp), %ymm0
	vmovdqa	-496(%rbp), %ymm1
	vmovdqa	%ymm1, -400(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqa	-400(%rbp), %ymm0
	vmovdqa	-176(%rbp), %ymm1
	vpcmpgtb	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	movb	$32, -593(%rbp)
	movsbl	-593(%rbp), %eax
	movl	%eax, -612(%rbp)
	movsbl	-593(%rbp), %esi
	movl	%esi, -616(%rbp)
	movsbl	-593(%rbp), %edi
	movl	%edi, -620(%rbp)
	movsbl	-593(%rbp), %ebx
	movl	%ebx, -624(%rbp)
	movsbl	-593(%rbp), %edx
	movl	%edx, -660(%rbp)
	movsbl	-593(%rbp), %ecx
	movl	%ecx, -664(%rbp)
	movsbl	-593(%rbp), %r8d
	movl	%r8d, -668(%rbp)
	movsbl	-593(%rbp), %r9d
	movl	%r9d, -672(%rbp)
	movsbl	-593(%rbp), %r10d
	movl	%r10d, -676(%rbp)
	movsbl	-593(%rbp), %r11d
	movl	%r11d, -680(%rbp)
	movsbl	-593(%rbp), %r14d
	movl	%r14d, -684(%rbp)
	movsbl	-593(%rbp), %r15d
	movl	%r15d, -688(%rbp)
	movsbl	-593(%rbp), %r12d
	movl	%r12d, -692(%rbp)
	movsbl	-593(%rbp), %r13d
	movl	%r13d, -696(%rbp)
	movsbl	-593(%rbp), %eax
	movl	%eax, -700(%rbp)
	movsbl	-593(%rbp), %esi
	movl	%esi, -704(%rbp)
	movsbl	-593(%rbp), %edi
	movl	%edi, -708(%rbp)
	movsbl	-593(%rbp), %ebx
	movl	%ebx, -712(%rbp)
	movsbl	-593(%rbp), %r15d
	movsbl	-593(%rbp), %r14d
	movsbl	-593(%rbp), %r13d
	movsbl	-593(%rbp), %r12d
	movsbl	-593(%rbp), %ebx
	movsbl	-593(%rbp), %r11d
	movsbl	-593(%rbp), %r10d
	movsbl	-593(%rbp), %r9d
	movsbl	-593(%rbp), %r8d
	movsbl	-593(%rbp), %edi
	movsbl	-593(%rbp), %esi
	movsbl	-593(%rbp), %ecx
	movsbl	-593(%rbp), %edx
	movsbl	-593(%rbp), %eax
	movb	%al, -592(%rbp)
	movb	%dl, -591(%rbp)
	movb	%cl, -590(%rbp)
	movb	%sil, -589(%rbp)
	movb	%dil, -588(%rbp)
	movb	%r8b, -587(%rbp)
	movb	%r9b, -586(%rbp)
	movb	%r10b, -585(%rbp)
	movb	%r11b, -584(%rbp)
	movb	%bl, -583(%rbp)
	movb	%r12b, -582(%rbp)
	movb	%r13b, -581(%rbp)
	movb	%r14b, -580(%rbp)
	movb	%r15b, -579(%rbp)
	movzbl	-712(%rbp), %edx
	movb	%dl, -578(%rbp)
	movzbl	-708(%rbp), %ecx
	movb	%cl, -577(%rbp)
	movzbl	-704(%rbp), %esi
	movb	%sil, -576(%rbp)
	movzbl	-700(%rbp), %eax
	movb	%al, -575(%rbp)
	movzbl	-696(%rbp), %r13d
	movb	%r13b, -574(%rbp)
	movzbl	-692(%rbp), %r12d
	movb	%r12b, -573(%rbp)
	movzbl	-688(%rbp), %r15d
	movb	%r15b, -572(%rbp)
	movzbl	-684(%rbp), %r14d
	movb	%r14b, -571(%rbp)
	movzbl	-680(%rbp), %r11d
	movb	%r11b, -570(%rbp)
	movzbl	-676(%rbp), %r10d
	movb	%r10b, -569(%rbp)
	movzbl	-672(%rbp), %r9d
	movb	%r9b, -568(%rbp)
	movzbl	-668(%rbp), %r8d
	movb	%r8b, -567(%rbp)
	movzbl	-664(%rbp), %ecx
	movb	%cl, -566(%rbp)
	movzbl	-660(%rbp), %edx
	movb	%dl, -565(%rbp)
	movzbl	-624(%rbp), %ebx
	movb	%bl, -564(%rbp)
	movzbl	-620(%rbp), %edi
	movb	%dil, -563(%rbp)
	movzbl	-616(%rbp), %esi
	movb	%sil, -562(%rbp)
	movzbl	-612(%rbp), %eax
	movb	%al, -561(%rbp)
	movzbl	-561(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-562(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-563(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-564(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-565(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-566(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-567(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-568(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-569(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-570(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-571(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-572(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	-573(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-574(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-575(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-576(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	-577(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-578(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	-579(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-580(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm9
	movzbl	-581(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-582(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	movzbl	-583(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-584(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	-585(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-586(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	-587(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-588(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	-589(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-590(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	-591(%rbp), %eax
	vmovd	%eax, %xmm0
	movzbl	-592(%rbp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm8, %xmm5, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm7, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpcklwd	%xmm6, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpckldq	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpckldq	%xmm4, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	-208(%rbp), %ymm0
	vmovdqa	-432(%rbp), %ymm1
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	vmovdqa	-336(%rbp), %ymm0
	vpandn	-240(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -368(%rbp)
	vmovdqa	-656(%rbp), %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vmovdqa	-368(%rbp), %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	vmovdqa	-304(%rbp), %ymm1
	vmovdqa	-272(%rbp), %ymm0
	vpxor	%ymm0, %ymm1, %ymm0
	nop
	addq	$552, %rsp
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3711:
	.size	toupper_si256, .-toupper_si256
	.type	toupper_avx_1, @function
toupper_avx_1:
.LFB3712:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$296, %rsp
	movq	%rdi, -280(%rbp)
	movq	%rsi, -288(%rbp)
.L127:
	movq	-280(%rbp), %rax
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	vmovdqu	(%rax), %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqa	-240(%rbp), %ymm0
	vmovdqa	%ymm0, -80(%rbp)
	vmovdqa	-176(%rbp), %ymm1
	vmovdqa	-80(%rbp), %ymm0
	vpcmpeqb	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	-208(%rbp), %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	-112(%rbp), %ymm0
	vpmovmskb	%ymm0, %eax
	movl	%eax, -264(%rbp)
	cmpl	$0, -264(%rbp)
	jne	.L133
	vmovdqa	-240(%rbp), %ymm0
	call	toupper_si256
	vmovdqa	%ymm0, -144(%rbp)
	movq	-280(%rbp), %rax
	movq	%rax, -256(%rbp)
	vmovdqa	-144(%rbp), %ymm0
	vmovdqa	%ymm0, -48(%rbp)
	vmovdqa	-48(%rbp), %ymm0
	movq	-256(%rbp), %rax
	vmovdqu	%ymm0, (%rax)
	addq	$32, -280(%rbp)
	jmp	.L127
.L133:
	nop
	movl	-264(%rbp), %eax
	movl	%eax, %edi
	call	ffs
	subl	$1, %eax
	movl	%eax, -260(%rbp)
	cmpl	$0, -260(%rbp)
	je	.L134
	movl	$0, -268(%rbp)
	jmp	.L129
.L131:
	movl	-268(%rbp), %edx
	movq	-280(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L130
	movl	-268(%rbp), %edx
	movq	-280(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L130
	movl	-268(%rbp), %edx
	movq	-280(%rbp), %rax
	addq	%rdx, %rax
	movl	-268(%rbp), %ecx
	movq	-280(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$32, %edx
	movb	%dl, (%rax)
.L130:
	addl	$1, -268(%rbp)
.L129:
	movl	-268(%rbp), %eax
	cmpl	-260(%rbp), %eax
	jbe	.L131
.L134:
	nop
	addq	$296, %rsp
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3712:
	.size	toupper_avx_1, .-toupper_avx_1
	.type	mymalloc, @function
mymalloc:
.LFB3713:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	movq	8(%rsp), %rax
	addq	$32, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rax
	shrq	$4, %rax
	addq	$1, %rax
	salq	$4, %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3713:
	.size	mymalloc, .-mymalloc
	.type	myfree, @function
myfree:
.LFB3714:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	movq	8(%rsp), %rax
	subq	$1, %rax
	andq	$-16, %rax
	movq	%rax, 24(%rsp)
	movq	24(%rsp), %rax
	movq	%rax, %rdi
	call	free
	nop
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3714:
	.size	myfree, .-myfree
	.type	createChar, @function
createChar:
.LFB3715:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, 12(%rsp)
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movb	%al, 30(%rsp)
	movsbl	30(%rsp), %eax
	cmpl	12(%rsp), %eax
	jge	.L139
	movb	$0, 30(%rsp)
	jmp	.L140
.L139:
	movb	$1, 30(%rsp)
.L140:
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$26, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	movb	%al, 31(%rsp)
	movsbl	30(%rsp), %eax
	addl	$2, %eax
	sall	$5, %eax
	movl	%eax, %edx
	movzbl	31(%rsp), %eax
	addl	%edx, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3715:
	.size	createChar, .-createChar
	.type	init, @function
init:
.LFB3716:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	movl	%esi, 4(%rsp)
	movl	$0, 20(%rsp)
	movq	8(%rsp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	mymalloc
	movq	%rax, 24(%rsp)
	movl	$1, %edi
	call	srand
	movl	$0, 20(%rsp)
	jmp	.L143
.L144:
	movl	20(%rsp), %eax
	movslq	%eax, %rdx
	movq	24(%rsp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	4(%rsp), %eax
	movl	%eax, %edi
	call	createChar
	movb	%al, (%rbx)
	addl	$1, 20(%rsp)
.L143:
	movl	20(%rsp), %eax
	cltq
	cmpq	8(%rsp), %rax
	jb	.L144
	movl	20(%rsp), %eax
	movslq	%eax, %rdx
	movq	24(%rsp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	24(%rsp), %rax
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3716:
	.size	init, .-init
	.section	.rodata
.LC3:
	.string	"Before: %.40s...\n"
.LC4:
	.string	"After:  %.40s...\n"
	.text
	.type	run_toupper, @function
run_toupper:
.LFB3717:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, 28(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%r8, 8(%rsp)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L147
	movq	40(%rsp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
.L147:
	call	gettime
	vmovq	%xmm0, %rax
	movq	%rax, 48(%rsp)
	movq	32(%rsp), %rcx
	movq	40(%rsp), %rdx
	movq	16(%rsp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	call	gettime
	vmovq	%xmm0, %rax
	movq	%rax, 56(%rsp)
	movq	results(%rip), %rax
	movl	28(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	vmovsd	56(%rsp), %xmm0
	vsubsd	48(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L149
	movq	40(%rsp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L149:
	nop
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3717:
	.size	run_toupper, .-run_toupper
	.globl	toupperversion
	.section	.rodata
.LC5:
	.string	"naive,fn,no size"
.LC6:
	.string	"naive,define,no size"
.LC7:
	.string	"library,no size"
.LC8:
	.string	"library,size"
.LC9:
	.string	"loop,fn"
.LC10:
	.string	"loop,define"
.LC11:
	.string	"unroll"
.LC12:
	.string	"mmx"
.LC13:
	.string	"sse2,rest"
.LC14:
	.string	"sse2"
.LC15:
	.string	"avx2"
.LC16:
	.string	"prefetch"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 208
toupperversion:
	.quad	.LC5
	.quad	toupper_naive_fn_no_size
	.quad	.LC6
	.quad	toupper_naive_define_no_size
	.quad	.LC7
	.quad	toupper_library_no_size
	.quad	.LC8
	.quad	toupper_library_size
	.quad	.LC9
	.quad	toupper_loop_fn
	.quad	.LC10
	.quad	toupper_loop_define
	.quad	.LC11
	.quad	toupper_unroll
	.quad	.LC12
	.quad	toupper_mmx
	.quad	.LC13
	.quad	toupper_sse_1
	.quad	.LC14
	.quad	toupper_sse
	.quad	.LC15
	.quad	toupper_avx_1
	.quad	.LC16
	.quad	toupper_prefetch_branch
	.quad	0
	.quad	0
	.text
	.type	run, @function
run:
.LFB3718:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, 12(%rsp)
	movl	%esi, 8(%rsp)
	movq	ratios(%rip), %rax
	movl	8(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	vmovsd	(%rax), %xmm0
	vcvttsd2si	%xmm0, %edx
	movq	sizes(%rip), %rax
	movl	12(%rsp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	init
	movq	%rax, 32(%rsp)
	movl	$0, 24(%rsp)
	jmp	.L151
.L152:
	movq	sizes(%rip), %rax
	movl	12(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	mymalloc
	movq	%rax, 40(%rsp)
	movq	sizes(%rip), %rax
	movl	12(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	32(%rsp), %rcx
	movq	40(%rsp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	movl	no_ratio(%rip), %eax
	imull	12(%rsp), %eax
	movl	%eax, %edx
	movl	8(%rsp), %eax
	leal	(%rdx,%rax), %ecx
	movl	no_sz(%rip), %eax
	imull	24(%rsp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, 28(%rsp)
	movl	24(%rsp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rdi
	movl	24(%rsp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rcx
	movq	sizes(%rip), %rax
	movl	12(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movl	28(%rsp), %edx
	movq	40(%rsp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	run_toupper
	movq	sizes(%rip), %rax
	movl	12(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	24(%rsp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rax
	movq	40(%rsp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	check_valid_toupper
	movq	40(%rsp), %rax
	movq	%rax, %rdi
	call	myfree
	addl	$1, 24(%rsp)
.L151:
	movl	24(%rsp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L152
	movq	32(%rsp), %rax
	movq	%rax, %rdi
	call	myfree
	nop
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3718:
	.size	run, .-run
	.section	.rodata
	.align 8
.LC17:
	.string	"VARIANT1: gcc -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm -O0 toupper.c"
	.align 8
.LC18:
	.string	"Size: %ld \tRatio: %f \tRunning time:\n"
.LC19:
	.string	"\t%-16s:\t%9.5f \n"
	.text
	.type	printresults, @function
printresults:
.LFB3719:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC17, %edi
	call	puts
	movl	$0, 4(%rsp)
	jmp	.L154
.L159:
	movl	$0, 8(%rsp)
	jmp	.L155
.L158:
	movq	ratios(%rip), %rax
	movl	8(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	sizes(%rip), %rax
	movl	4(%rsp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	vmovq	%rdx, %xmm0
	movq	%rax, %rsi
	movl	$.LC18, %edi
	movl	$1, %eax
	call	printf
	movl	$0, (%rsp)
	jmp	.L156
.L157:
	movl	8(%rsp), %eax
	movl	%eax, 12(%rsp)
	movl	no_ratio(%rip), %eax
	imull	4(%rsp), %eax
	addl	%eax, 12(%rsp)
	movl	no_sz(%rip), %eax
	imull	(%rsp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	addl	%eax, 12(%rsp)
	movq	results(%rip), %rax
	movl	12(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	(%rsp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rax
	vmovq	%rdx, %xmm0
	movq	%rax, %rsi
	movl	$.LC19, %edi
	movl	$1, %eax
	call	printf
	addl	$1, (%rsp)
.L156:
	movl	no_version(%rip), %eax
	cmpl	%eax, (%rsp)
	jl	.L157
	movl	$10, %edi
	call	putchar
	addl	$1, 8(%rsp)
.L155:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, 8(%rsp)
	jl	.L158
	addl	$1, 4(%rsp)
.L154:
	movl	no_sz(%rip), %eax
	cmpl	%eax, 4(%rsp)
	jl	.L159
	nop
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3719:
	.size	printresults, .-printresults
	.section	.rodata
.LC20:
	.string	"-d"
.LC21:
	.string	"-l"
.LC22:
	.string	"-r"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3720:
	.cfi_startproc
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, 12(%rsp)
	movq	%rsi, (%rsp)
	movq	$800000, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$10000, 64(%rsp)
	movl	$50, 16(%rsp)
	movl	$0, 20(%rsp)
	movl	$1, 24(%rsp)
	movl	$1, 28(%rsp)
	jmp	.L161
.L174:
	movl	28(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC20, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L162
	movl	$1, debug(%rip)
.L162:
	movl	28(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC21, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L163
	movl	28(%rsp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rax
	andl	$63, %eax
	movq	%rax, 72(%rsp)
	cmpq	$0, 72(%rsp)
	je	.L164
	movq	48(%rsp), %rax
	subq	72(%rsp), %rax
	addq	$64, %rax
	movq	%rax, 48(%rsp)
.L164:
	movl	28(%rsp), %eax
	addl	$2, %eax
	cmpl	12(%rsp), %eax
	jge	.L190
	movl	28(%rsp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC22, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L191
	movl	28(%rsp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC20, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L192
	movl	28(%rsp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, 56(%rsp)
	movq	56(%rsp), %rax
	andl	$63, %eax
	movq	%rax, 72(%rsp)
	cmpq	$0, 72(%rsp)
	je	.L169
	movq	56(%rsp), %rax
	subq	72(%rsp), %rax
	addq	$64, %rax
	movq	%rax, 56(%rsp)
.L169:
	movl	28(%rsp), %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, 64(%rsp)
	movq	64(%rsp), %rax
	andl	$63, %eax
	movq	%rax, 72(%rsp)
	cmpq	$0, 72(%rsp)
	je	.L163
	movq	64(%rsp), %rax
	subq	72(%rsp), %rax
	addq	$64, %rax
	movq	%rax, 64(%rsp)
.L163:
	movl	28(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC22, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L170
	movl	28(%rsp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, 16(%rsp)
	movl	28(%rsp), %eax
	addl	$2, %eax
	cmpl	12(%rsp), %eax
	jge	.L193
	movl	28(%rsp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC21, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L194
	movl	28(%rsp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC20, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L195
	movl	28(%rsp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, 20(%rsp)
	movl	28(%rsp), %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	(%rsp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, 24(%rsp)
.L170:
	addl	$1, 28(%rsp)
.L161:
	movl	28(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.L174
	jmp	.L166
.L190:
	nop
	jmp	.L166
.L191:
	nop
	jmp	.L166
.L192:
	nop
	jmp	.L166
.L193:
	nop
	jmp	.L166
.L194:
	nop
	jmp	.L166
.L195:
	nop
.L166:
	movl	$0, 40(%rsp)
	jmp	.L175
.L176:
	movl	40(%rsp), %eax
	addl	$1, %eax
	movl	%eax, no_version(%rip)
	addl	$1, 40(%rsp)
.L175:
	movl	40(%rsp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L176
	cmpq	$0, 56(%rsp)
	jne	.L177
	movl	$1, no_sz(%rip)
	jmp	.L178
.L177:
	movq	56(%rsp), %rax
	subq	48(%rsp), %rax
	movl	$0, %edx
	divq	64(%rsp)
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L178:
	cmpl	$0, 20(%rsp)
	jne	.L179
	movl	$1, no_ratio(%rip)
	jmp	.L180
.L179:
	movl	20(%rsp), %eax
	subl	16(%rsp), %eax
	cltd
	idivl	24(%rsp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L180:
	movl	no_sz(%rip), %eax
	imull	40(%rsp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	movl	%eax, 44(%rsp)
	movl	44(%rsp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, results(%rip)
	movl	no_ratio(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, ratios(%rip)
	movl	no_sz(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, sizes(%rip)
	movl	$0, 32(%rsp)
	jmp	.L181
.L182:
	movq	sizes(%rip), %rax
	movl	32(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	32(%rsp), %eax
	cltq
	imulq	64(%rsp), %rax
	movq	%rax, %rcx
	movq	48(%rsp), %rax
	addq	%rcx, %rax
	movq	%rax, (%rdx)
	addl	$1, 32(%rsp)
.L181:
	movl	no_sz(%rip), %eax
	cmpl	%eax, 32(%rsp)
	jl	.L182
	movl	$0, 32(%rsp)
	jmp	.L183
.L184:
	movq	ratios(%rip), %rax
	movl	32(%rsp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	32(%rsp), %eax
	imull	24(%rsp), %eax
	movl	%eax, %ecx
	movl	16(%rsp), %eax
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	addl	$1, 32(%rsp)
.L183:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, 32(%rsp)
	jl	.L184
	movl	$0, 32(%rsp)
	jmp	.L185
.L188:
	movl	$0, 36(%rsp)
	jmp	.L186
.L187:
	movl	36(%rsp), %edx
	movl	32(%rsp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	run
	addl	$1, 36(%rsp)
.L186:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, 36(%rsp)
	jl	.L187
	addl	$1, 32(%rsp)
.L185:
	movl	no_sz(%rip), %eax
	cmpl	%eax, 32(%rsp)
	jl	.L188
	movl	$0, %eax
	call	printresults
	movl	$0, %eax
	addq	$88, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE3720:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits
