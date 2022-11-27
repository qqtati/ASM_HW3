	.file	"p1.c"
	.intel_syntax noprefix
	.text
	.globl	randomValue
	.type	randomValue, @function
randomValue:                                 #функция randomValue
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax                       #Convert Doubleword Integer to Scalar Double-Precision Floating-Point Value
	movsd	xmm2, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2                  #(double)rand()/RAND_MAX
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm1                  #результат левой части * 115
	movsd	xmm1, QWORD PTR .LC2[rip]
	subsd	xmm0, xmm1                  #представление 115
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	randomValue, .-randomValue
	.section	.rodata
.LC4:
	.string	"%lf"                       #формат-строка для получения double из консоли
.LC5:
	.string	"r"                         #r -> read строка формат для чтения из файлв
.LC6:
	.string	"Invalid input!"            #строка для обработки некорректного ввода
.LC12:
	.string	"w"                         #w -> write cтрока для запись в файл
.LC13:
	.string	"Result: %.50lf\n"          #строка-формат для вывода результата
.LC15:
	.string	"Precision: %.20lf%%\n"     #строка-формат для вывода точности
.LC16:
	.string	"Time: %lld ns\n"           #строка-формат для вывола времени исполнения программы
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 144
	mov	DWORD PTR -116[rbp], edi            #представление int argc
	mov	QWORD PTR -128[rbp], rsi             #представление char** argv
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax               #представление double result = 0
	xor	eax, eax
	pxor	xmm0, xmm0
	movsd	QWORD PTR -96[rbp], xmm0
	cmp	DWORD PTR -116[rbp], 2
	jne	.L4
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 49
	jne	.L4
	mov	eax, 0
	call	randomValue
	movq	rax, xmm0
	mov	QWORD PTR -104[rbp], rax
	jmp	.L5
.L4:
	cmp	DWORD PTR -116[rbp], 2
	jne	.L6
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 50
	jne	.L6
	lea	rax, -104[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L5
.L6:
	cmp	DWORD PTR -116[rbp], 4
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 51
	jne	.L7
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -104[rbp]
	mov	rax, QWORD PTR -80[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	jmp	.L5
.L7:
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L17
.L5:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -88[rbp], xmm0             #представление double a = 0
	lea	rax, -48[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	DWORD PTR -108[rbp], 0
	jmp	.L9
.L14:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -96[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -88[rbp], xmm0
.L13:
	movsd	xmm0, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR .LC7[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -136[rbp], xmm0
	movsd	xmm0, QWORD PTR -88[rbp]
	addsd	xmm0, xmm0
	mov	rax, QWORD PTR -104[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movapd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR -136[rbp]
	movsd	QWORD PTR -136[rbp], xmm3
	movsd	xmm0, QWORD PTR -88[rbp]
	movapd	xmm4, xmm0
	addsd	xmm4, xmm0
	movq	rax, xmm4
	movq	xmm0, rax
	call	factorial@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -136[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	xmm0, QWORD PTR -96[rbp]
	addsd	xmm0, QWORD PTR -56[rbp]
	comisd	xmm0, QWORD PTR .LC8[rip]
	ja	.L19
	movsd	xmm0, QWORD PTR -96[rbp]
	addsd	xmm0, QWORD PTR -56[rbp]
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm1, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR .LC9[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -88[rbp], xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movq	xmm1, QWORD PTR .LC10[rip]
	andpd	xmm0, xmm1
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1
	ja	.L13
	jmp	.L12
.L19:
	nop
.L12:
	add	DWORD PTR -108[rbp], 1
.L9:
	cmp	DWORD PTR -108[rbp], 999
	jle	.L14
	lea	rax, -32[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -32[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR -48[rbp]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	mulsd	xmm1, xmm2
	subsd	xmm0, xmm1
	mov	rax, QWORD PTR -40[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	subsd	xmm0, xmm1
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -72[rbp], rax
	cmp	DWORD PTR -116[rbp], 4
	jne	.L15
	mov	rax, QWORD PTR -128[rbp]            #Представление FILE *output_file
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	xorpd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	call	exp@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -96[rbp]
	subsd	xmm0, xmm1
	movq	xmm1, QWORD PTR .LC10[rip]
	andpd	xmm0, xmm1
	movsd	QWORD PTR -136[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	movapd	xmm5, xmm0
	xorpd	xmm5, xmm1
	movq	rax, xmm5
	movq	xmm0, rax
	call	exp@PLT
	movsd	xmm1, QWORD PTR -136[rbp]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movq	rdx, xmm1
	mov	rax, QWORD PTR -64[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC15[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -64[rbp]
	lea	rcx, .LC16[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L16
.L15:
	mov	rax, QWORD PTR -96[rbp]
	movq	xmm0, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	xorpd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	call	exp@PLT
	movapd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -96[rbp]
	subsd	xmm0, xmm1
	movq	xmm1, QWORD PTR .LC10[rip]
	andpd	xmm0, xmm1
	movsd	QWORD PTR -136[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	movq	xmm1, QWORD PTR .LC14[rip]
	movapd	xmm6, xmm0
	xorpd	xmm6, xmm1
	movq	rax, xmm6
	movq	xmm0, rax
	call	exp@PLT
	movsd	xmm1, QWORD PTR -136[rbp]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movq	rax, xmm1
	movq	xmm0, rax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -72[rbp]
	mov	rsi, rax
	lea	rax, .LC16[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L16:
	mov	eax, 0
.L17:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
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
	.align 16
.LC10:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC11:
	.long	0
	.long	1104006501
	.align 16
.LC14:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
