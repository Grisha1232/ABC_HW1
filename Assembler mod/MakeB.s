	.intel_syntax noprefix
	.text
	.globl	MakeB
	.type	MakeB, @function
MakeB:
	push	rbp
	mov	rbp, rsp
	
	mov	QWORD PTR -24[rbp], rdi		    # B
	mov	DWORD PTR -28[rbp], esi		    # N
	mov	QWORD PTR -40[rbp], rdx		    # A
	
	mov	DWORD PTR -8[rbp], 0		      # counter = 0;
	mov	DWORD PTR -4[rbp], 0		      # j = 0;
	jmp	.L2				                    # go to the loop
	
.L4:			                           #body of the loop

	mov	eax, DWORD PTR -4[rbp]		      #/
	cdqe					                      #|
	lea	rdx, 0[0+rax*4]			            #|
	mov	rax, QWORD PTR -24[rbp]		      #|
	add	rax, rdx			                  #| A[j] != A[0]
	mov	edx, DWORD PTR [rax]		        #|
	mov	rax, QWORD PTR -24[rbp]		      #|
	mov	eax, DWORD PTR [rax]		        #|
	cmp	edx, eax			                  #\
	je	.L3				                      # if A[j] == A[0]
	
	mov	eax, DWORD PTR -4[rbp]		      #/
	cdqe					                      #|
	lea	rdx, 0[0+rax*4]			            #|
	mov	rax, QWORD PTR -24[rbp]		      #|
	add	rax, rdx			                  #|
	mov	edx, DWORD PTR [rax]		        #|
	mov	eax, DWORD PTR -28[rbp]		      #| A[j] != A[N - 1]
	cdqe					                      #|
	sal	rax, 2				                  #|
	lea	rcx, -4[rax]			              #|
	mov	rax, QWORD PTR -24[rbp]		      #|
	add	rax, rcx			                  #|
	mov	eax, DWORD PTR [rax]		        #|
	cmp	edx, eax			                  #\
	je	.L3				                      # if A[j] == A[N - 1]
	
	mov	eax, DWORD PTR -4[rbp]		      #/
	cdqe					                      #|
	lea	rdx, 0[0+rax*4]			            #|
	mov	rax, QWORD PTR -24[rbp]		      #|
	add	rax, rdx			                  #|
	mov	edx, DWORD PTR -8[rbp]		      #|
	movsx	rdx, edx			                #| B[counter] = A[j]
	lea	rcx, 0[0+rdx*4]			            #|
	mov	rdx, QWORD PTR -40[rbp]		      #|
	add	rdx, rcx			                  #|
	mov	eax, DWORD PTR [rax]		        #|
	mov	DWORD PTR [rdx], eax		        #\
	add	DWORD PTR -8[rbp], 1		        # counter++;
.L3:
	add	DWORD PTR -4[rbp], 1		        # j++;
.L2:					                        # loop
	mov	eax, DWORD PTR -4[rbp]		      # move j to the register for compare
	cmp	eax, DWORD PTR -28[rbp]		      # Compare j and N
	jl	.L4				                      # if i < N go to the 
	
	mov	eax, DWORD PTR -8[rbp]		      # return counter
	pop	rbp
	ret					                        # return to place where called
	.size	MakeB, .-MakeB

