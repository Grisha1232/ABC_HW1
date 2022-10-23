
	.file	"MakeB.c"
	.intel_syntax noprefix
	.text
	.globl	MakeB
	.type	MakeB, @function
MakeB:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi   # B
	mov	DWORD PTR -28[rbp], esi   # N
	mov	QWORD PTR -40[rbp], rdx   # A
	mov	DWORD PTR -8[rbp], 0      # counter = 0
	mov	DWORD PTR -4[rbp], 0      # j = 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	je	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -28[rbp]
	cdqe
	sal	rax, 2
	lea	rcx, -4[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	je	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -40[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -8[rbp], 1
.L3:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L4
	mov	eax, DWORD PTR -8[rbp]
	pop	rbp
	ret
	.size	MakeB, .-MakeB
	.ident	"GCC: (Debian 11.3.0-5) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
