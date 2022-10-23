	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter the number of elements (0 < N <= %d): "
.LC1:
	.string	"%d"
.LC2:
	.string	"A[%d] = "
.LC3:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 448
	mov	DWORD PTR -436[rbp], edi  # argc
	mov	QWORD PTR -448[rbp], rsi  # argv
	mov	DWORD PTR -420[rbp], 0    # An
	mov	DWORD PTR -8[rbp], 0      # Bn
	mov	esi, 50                   # max_size
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rsi, -420[rbp]
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L3:
	mov	esi, DWORD PTR -4[rbp]
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdx, -208[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -420[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L3
	mov	esi, DWORD PTR -420[rbp]
	lea	rdx, -416[rbp]
	lea	rdi, -208[rbp]
	call	MakeB@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	esi, DWORD PTR -416[rbp+rax*4]
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jl	.L5
	mov	eax, 0
	leave
	ret
	.size	main, .-main
