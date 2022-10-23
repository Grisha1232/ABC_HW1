	.intel_syntax noprefix				# Default intel syntax
	
	
	.text						# Section with constants
	.section	.rodata
.Read:		#LC0
	.string	"r"
.InputFile:	#LC1
	.string	"tests/input.txt"
.Digit:		#LC2
	.string	"%d"
.Write:		#LC3
	.string	"w"
.OutputFile:	#LC4
	.string	"tests/output.txt"
.DigitWithSpace:		#LC5
	.string	"%d "
	
	.align 8
.TipMessage:		#LC6
	.string	"Enter the number of elements (0 < N <= %d): "
.AskMessage:		#LC7
	.string	"Random input? (y/n): "
.Char:		#LC8
	.string	" %c"
.LC9:		#LC9
	.string	"A[%d] = %d\n"
.OutputAinConsole:		#LC10
	.string	"A[%d] = "
.Float:		#LC11
	.string	"\n%f\n"
	
	
	.text						# Section with main code
	.globl	main
	.type	main, @function
	
main:	
	push	rbp				# Prologue
	mov	rbp, rsp			# 
	
	sub	rsp, 896			# Reserve 896 byte
	
	mov	DWORD PTR -884[rbp], edi	# Argc
	mov	QWORD PTR -896[rbp], rsi	# Argv
	
	mov	DWORD PTR -852[rbp], 0		# An = 0;
	mov	DWORD PTR -4[rbp], 0		# Bn = 0;
	
	cmp	DWORD PTR -884[rbp], 2		# Compare argc and 2
	jne	.InputNotFile				# Jump if argc != 2 to InputNotFile
	
						# otherwise go to if section
	lea	rsi, .Read[rip]			# path to the input file
	lea	rdi, .InputFile[rip]		# Format for the input 
	
	call	fopen@PLT			# Open file by path
	mov	QWORD PTR -32[rbp], rax		# put opened file to variable input
	
	lea	rdx, -852[rbp]			# Redirect An to register for input value to func
	mov	rdi, QWORD PTR -32[rbp]		# Redirect file input to func
	lea	rsi, .Digit[rip]		# Format for read from file	
	mov	eax, 0
	call	fscanf@PLT			# fscanf (input from file) An
	
	mov	DWORD PTR -8[rbp], 0		# i = 0;
	jmp	.CycleForReadFromFile		# go to the Cycle
	
.BodyOfTheFirstCycle:			# Body section of first cycle
	lea	rdx, -448[rbp]			# taking A[] for input value
	mov	eax, DWORD PTR -8[rbp]		# taking i
	cdqe
	sal	rax, 2
	add	rdx, rax			# A[i]
	
	mov	rdi, QWORD PTR -32[rbp]		# FILE input
	lea	rsi, .Digit[rip]		# Format for read
	mov	eax, 0
	call	fscanf@PLT			# fscanf (input from file) A[i]
	
	add	DWORD PTR -8[rbp], 1		# i++;
	
.CycleForReadFromFile:			# First Cycle
	mov	eax, DWORD PTR -852[rbp]	# move An for compare
	cmp	DWORD PTR -8[rbp], eax		# Compare i and An
	jl	.BodyOfTheFirstCycle		# if i < An the go to the body of the cycle
	
						# otherwise exit the cycle
	mov	rdi, QWORD PTR -32[rbp]		# move input in another register for closing it
	call	fclose@PLT			# fclose(input);
	
	lea	rsi, .Write[rip]		# Set write for opening file
	lea	rdi, .OutputFile[rip]		# Path to output File
	call	fopen@PLT			# opening file for output
	
	mov	QWORD PTR -40[rbp], rax		# output = fopen(...);
	
	mov	esi, DWORD PTR -852[rbp]	# Redirect An to func MakeB
	lea	rdx, -848[rbp]			# Redirect B[] to func MakeB
	lea	rdi, -448[rbp]			# Redirect A[] to func MakeB
	call	MakeB@PLT			# Call MakeB(A, N, B);
	
	mov	DWORD PTR -4[rbp], eax		# Bn = MakeB(...);
	
	mov	DWORD PTR -8[rbp], 0		# i = 0;
	jmp	.SecondCycleForOutputFile	# jump to the Cycle
	
	
.BodyOfTheSecondCycle:				# Body of the second cycle
	mov	eax, DWORD PTR -8[rbp]		# taking i for taking B[i]	
	cdqe
	mov	edx, DWORD PTR -848[rbp+rax*4]	#
	mov	rdi, QWORD PTR -40[rbp]
	lea	rsi, .DigitWithSpace[rip]
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -8[rbp], 1
	
.SecondCycleForOutputFile:			# Cycle for output to file
	mov	eax, DWORD PTR -8[rbp]		# mode i to register for compare
	cmp	eax, DWORD PTR -4[rbp]		# Compare i and Bn
	jl	.BodyOfTheSecondCycle		# if i < Bn go to the body of cycle
	
						# otherwise exit the cycle
	mov	rdi, QWORD PTR -40[rbp]		# move FILE output to register for close
	call	fclose@PLT			# fclose(output);
	
	mov	eax, 0				# return 0;
	jmp	.EndProgramm			# shut the prog
	
.InputNotFile:
	mov	esi, 100			# max_size
	lea	rdi, .TipMessage[rip]		# Format of the output message	
	mov	eax, 0
	call	printf@PLT			# print tip message
	
	lea	rsi, -852[rbp]			# move An to register for input
	lea	rdi, .Digit[rip]		# Set format of input
	mov	eax, 0
	call	scanf@PLT			# scanf An
	
	lea	rdi, .AskMessage[rip]		# Set format ask message
	mov	eax, 0	
	call	printf@PLT			# print ask message
	
	lea	rsi, -853[rbp]			# char isRandom moved to reg for input
	lea	rdi, .Char[rip]			# Set format for input
	mov	eax, 0
	call	scanf@PLT			# scanf isRandom
	
	movzx	eax, BYTE PTR -853[rbp]		# save isRandom
	cmp	al, 121				# compare isRandom to 'y'
	jne	.NotRandom			# if isRandom != 'y' jump to NotRandom
	
						# otherwise go to the body of IF
	lea	rsi, -880[rbp]			# Clock
	mov	edi, 0
	call	clock_gettime@PLT		# clock_gettime
	
	mov	rax, QWORD PTR -872[rbp]	# srand(...);
	mov	edi, eax
	call	srand@PLT
	
	mov	DWORD PTR -8[rbp], 0		# i = 0;
	jmp	.RandomCycle		# go to the Cycle
	
.BodyOfTheRandomCycle:
	call	rand@PLT		# rand()
	movsx	rdx, eax
	imul	rdx, rdx, 274877907	# rand() % 1000
	shr	rdx, 32			#
	sar	edx, 6			#
	mov	ecx, eax		#
	sar	ecx, 31			#
	sub	edx, ecx		#
	imul	ecx, edx, 1000		#
	sub	eax, ecx		#
	mov	edx, eax		#
	
	mov	eax, DWORD PTR -8[rbp]		# A[i] = rand() % 1000
	cdqe					#
	mov	DWORD PTR -448[rbp+rax*4], edx	#
	
	mov	eax, DWORD PTR -8[rbp]		# print result
	cdqe					#
	mov	edx, DWORD PTR -448[rbp+rax*4]	#
	mov	esi, DWORD PTR -8[rbp]		#
	lea	rdi, .LC9[rip]			# Set format
	mov	eax, 0				#
	call	printf@PLT			# print message
	
	
	add	DWORD PTR -8[rbp], 1		# i++
	
.RandomCycle:			# Cycle for randomize A[]
	mov	eax, DWORD PTR -852[rbp]	# move An to register for compare
	cmp	DWORD PTR -8[rbp], eax		# Compare i and An
	jl	.BodyOfTheRandomCycle		# if i < An go to the body
	
						# othewise exit the cycle
	jmp	.CalculateTime			# go to calculate time
	
.NotRandom:					# input A[] if not random
	mov	DWORD PTR -8[rbp], 0		# i = 0;
	jmp	.NotRandomCycle
	
.BodyOfTheNotRandomCycle:			# body of the cycle
	mov	esi, DWORD PTR -8[rbp]		# taking i for taking A[i]
	lea	rdi, .OutputAinConsole[rip]	# Set Format for output tip message
	mov	eax, 0
	call	printf@PLT			# print tip message A[i] = 
	
	lea	rdx, -448[rbp]			# take A
	mov	eax, DWORD PTR -8[rbp]		# take i
	cdqe
	sal	rax, 2
	add	rax, rdx			# A[i]
	mov	rsi, rax
	lea	rdi, .Digit[rip]		# Set format for output
	mov	eax, 0
	call	scanf@PLT			# scanf A[i]
	
	add	DWORD PTR -8[rbp], 1		# i++;
	
.NotRandomCycle:				# input A[] in cycle
	mov	eax, DWORD PTR -852[rbp]	# move An to register for compare
	cmp	DWORD PTR -8[rbp], eax		# Compare i and An
	jl	.BodyOfTheNotRandomCycle	# if i < An then go to the body
	
.CalculateTime:			# Section for campute time 
	call	clock@PLT	
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -8[rbp], 0
	jmp	.TakeTimeCycle		# jump to the TakeTimeCycle
	
.BodyOfTheTakeTimeCycle:		# body of the cycle
	mov	esi, DWORD PTR -852[rbp]	# Redirect An to the func MakeB;
	lea	rdx, -848[rbp]			# Redirect B[] to the func MakeB
	lea	rdi, -448[rbp]			# Redirect A[] to the func MakeB
	
	call	MakeB@PLT			# call func with arguments
	mov	DWORD PTR -4[rbp], eax		# Save Bn = MakeB;
	add	DWORD PTR -8[rbp], 1		# i++
	

.TakeTimeCycle:			# Calculate time execute
	cmp	DWORD PTR -8[rbp], 4999999 	# Compare i and 5000000
	jle	.BodyOfTheTakeTimeCycle		# if i <= 4999999 go to the body
	
						# otherwise exit the cycle
	call	clock@PLT			# call clock()
	
	mov	QWORD PTR -24[rbp], rax		# end_time = clock()
	
	mov	rsi, QWORD PTR -16[rbp]		# start_time
	mov	rdi, QWORD PTR -24[rbp]		# end_time
	call	difftime@PLT			# diff(start, end);
	
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rdi, .Float[rip]		# Set format for the output message
	mov	eax, 1
	call	printf@PLT			# print message
	
	mov	DWORD PTR -8[rbp], 0		# i = 0
	jmp	.OutputCycle			# jump to the output Cycle
	
.BodyOfTheOutputCycle:		# body of the cycle
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	eax, DWORD PTR -848[rbp+rax*4]
	mov	esi, eax
	lea	rax, .DigitWithSpace[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1
.OutputCycle:
	mov	eax, DWORD PTR -8[rbp]	# move i to the register fro compare
	cmp	eax, DWORD PTR -4[rbp]	# compare i and Bn
	jl	.BodyOfTheOutputCycle	# if i < Bn the go to the body
					# otherwise exit the cycle
	mov	eax, 0			# return 0;
	
.EndProgramm:
	leave				# prologue
	ret
	.size	main, .-main
