	.file	"p1.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	randomValue
	.type	randomValue, @function
randomValue:
	endbr64
	sub	rsp, 8
	xor	edi, edi
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC0[rip]
	mulsd	xmm0, QWORD PTR .LC1[rip]
	subsd	xmm0, QWORD PTR .LC2[rip]
	add	rsp, 8
	ret
	.size	randomValue, .-randomValue
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"%lf"
.LC5:
	.string	"r"
.LC6:
	.string	"Invalid input!"
.LC12:
	.string	"w"
.LC13:
	.string	"Result: %.50lf\n"
.LC15:
	.string	"Precision: %.20lf%%\n"
.LC16:
	.string	"Time: %lld ns\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r13              #использование регистров
	push	r12              #использование регистров
	mov	r12, rsi             #помещаем argc в регистр r12d вместо DWORD PTR -116[rbp]
	push	rbp
	mov	ebp, edi
	push	rbx
	sub	rsp, 88
	cmp	edi, 2
	je	.L17
	cmp	edi, 4
	jne	.L8
	mov	rax, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rax], 51
	je	.L18
.L8:
	lea	rsi, .LC6[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L9:
	add	rsp, 88
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
.L17:
	mov	rax, QWORD PTR 8[rsi]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 49
	je	.L19
	cmp	al, 50
	jne	.L8
	lea	rsi, 40[rsp]
	lea	rdi, .LC4[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	jmp	.L7
.L18:
	mov	rdi, QWORD PTR 16[rsi]
	lea	rsi, .LC5[rip]
	call	fopen@PLT
	lea	rdx, 40[rsp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
.L7:
	lea	rsi, 48[rsp]
	mov	edi, 1
	mov	ebx, 1000
	call	clock_gettime@PLT
	.p2align 4,,10
	.p2align 3
.L12:
	pxor	xmm3, xmm3
	movapd	xmm4, xmm3
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L21:
	andpd	xmm0, XMMWORD PTR .LC10[rip]
	pxor	xmm5, xmm5
	movsd	xmm3, QWORD PTR 24[rsp]
	addsd	xmm3, QWORD PTR .LC9[rip]
	comisd	xmm0, xmm5
	jbe	.L20
.L11:
	mov	rax, QWORD PTR .LC7[rip]
	movapd	xmm1, xmm3
	movsd	QWORD PTR 16[rsp], xmm4
	movsd	QWORD PTR 8[rsp], xmm3
	movq	xmm0, rax
	call	pow@PLT
	movsd	xmm3, QWORD PTR 8[rsp]
	movsd	QWORD PTR [rsp], xmm0
	movsd	xmm0, QWORD PTR 40[rsp]
	movapd	xmm1, xmm3
	movsd	QWORD PTR 24[rsp], xmm3
	addsd	xmm1, xmm3
	movsd	QWORD PTR 8[rsp], xmm1
	call	pow@PLT
	movsd	xmm2, QWORD PTR [rsp]
	movsd	xmm1, QWORD PTR 8[rsp]
	mulsd	xmm2, xmm0
	movapd	xmm0, xmm1
	movsd	QWORD PTR [rsp], xmm2
	call	factorial@PLT
	movsd	xmm2, QWORD PTR [rsp]
	movsd	xmm4, QWORD PTR 16[rsp]
	divsd	xmm2, xmm0
	movapd	xmm1, xmm4
	addsd	xmm4, xmm2
	comisd	xmm4, QWORD PTR .LC8[rip]
	movapd	xmm0, xmm2
	jbe	.L21
	sub	ebx, 1
	jne	.L12
.L23:
	lea	rsi, 64[rsp]
	mov	edi, 1
	movsd	QWORD PTR [rsp], xmm1
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	pxor	xmm2, xmm2
	cmp	ebp, 4
	cvtsi2sd	xmm0, QWORD PTR 64[rsp]
	movsd	xmm3, QWORD PTR .LC11[rip]
	movsd	xmm1, QWORD PTR [rsp]
	cvtsi2sd	xmm2, QWORD PTR 72[rsp]
	mulsd	xmm0, xmm3
	addsd	xmm0, xmm2
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, QWORD PTR 48[rsp]
	mulsd	xmm2, xmm3
	subsd	xmm0, xmm2
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, QWORD PTR 56[rsp]
	subsd	xmm0, xmm2
	cvttsd2si	r13, xmm0                       #использование регистров
	je	.L22
	movapd	xmm0, xmm1
	mov	edi, 1
	mov	eax, 1
	movsd	QWORD PTR 16[rsp], xmm1
	lea	rsi, .LC13[rip]
	call	__printf_chk@PLT
	movsd	xmm2, QWORD PTR 40[rsp]
	xorpd	xmm2, XMMWORD PTR .LC14[rip]
	movapd	xmm0, xmm2
	movsd	QWORD PTR 8[rsp], xmm2
	call	exp@PLT
	movsd	xmm2, QWORD PTR 8[rsp]
	movsd	QWORD PTR [rsp], xmm0
	movapd	xmm0, xmm2
	call	exp@PLT
	movsd	xmm1, QWORD PTR 16[rsp]
	subsd	xmm1, QWORD PTR [rsp]
	lea	rsi, .LC15[rip]
	movapd	xmm2, xmm0
	mov	edi, 1
	mov	eax, 1
	movapd	xmm0, xmm1
	andpd	xmm0, XMMWORD PTR .LC10[rip]
	divsd	xmm0, xmm2
	mulsd	xmm0, QWORD PTR .LC2[rip]
	call	__printf_chk@PLT
	mov	rdx, r13                            #использование регистров
	mov	edi, 1
	xor	eax, eax
	lea	rsi, .LC16[rip]
	call	__printf_chk@PLT
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L20:
	movapd	xmm1, xmm4
	sub	ebx, 1
	jne	.L12
	jmp	.L23
.L22:
	mov	rdi, QWORD PTR 24[r12]
	lea	rsi, .LC12[rip]
	call	fopen@PLT
	movsd	xmm1, QWORD PTR [rsp]
	mov	esi, 1
	lea	rdx, .LC13[rip]
	mov	rdi, rax
	mov	rbp, rax
	mov	eax, 1
	movapd	xmm0, xmm1
	movsd	QWORD PTR 16[rsp], xmm1
	call	__fprintf_chk@PLT
	movsd	xmm2, QWORD PTR 40[rsp]
	xorpd	xmm2, XMMWORD PTR .LC14[rip]
	movapd	xmm0, xmm2
	movsd	QWORD PTR 8[rsp], xmm2
	call	exp@PLT
	movsd	xmm2, QWORD PTR 8[rsp]
	movsd	QWORD PTR [rsp], xmm0
	movapd	xmm0, xmm2
	call	exp@PLT
	movsd	xmm1, QWORD PTR 16[rsp]
	subsd	xmm1, QWORD PTR [rsp]
	mov	rdi, rbp
	movapd	xmm2, xmm0
	mov	esi, 1
	mov	eax, 1
	lea	rdx, .LC15[rip]
	movapd	xmm0, xmm1
	andpd	xmm0, XMMWORD PTR .LC10[rip]
	divsd	xmm0, xmm2
	mulsd	xmm0, QWORD PTR .LC2[rip]
	call	__fprintf_chk@PLT
	mov	rcx, r13                            #использование регистров
	mov	esi, 1
	mov	rdi, rbp
	lea	rdx, .LC16[rip]
	xor	eax, eax
	call	__fprintf_chk@PLT
	jmp	.L9
.L19:
	xor	eax, eax
	call	randomValue
	movsd	QWORD PTR 40[rsp], xmm0
	jmp	.L7
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-4194304
	.long	1105199103
	.align 8
.LC1:
	.long	0
	.long	1079820288
	.align 8
.LC2:
	.long	0
	.long	1079574528
	.align 8
.LC7:
	.long	0
	.long	-1074790400
	.align 8
.LC8:
	.long	-1
	.long	2146435071
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC10:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	0
	.long	1104006501
	.section	.rodata.cst16
	.align 16
.LC14:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
