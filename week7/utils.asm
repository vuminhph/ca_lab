# File: utils.asm
# Purpose: To define utilities which will be used in MIPS programs
# Author: Pham vu Minh

# Subprograms Index:
# Exit	-	Call syscall with a service 10 to exit the program
# Newline - 	Print a new line character (\n) to the console
# PrintInt - 	Print a string with an integer to the console
# PrintString - Print a stirng to the console
# PromptInt - 	Prompt the user to enter an integer, and return it to the calling program
	
# Subprogram: PromptInt
# purpose: To prompt the user for an integer, input, and return that input value to the caller
# Input: $a0 - The address of the string to print
# Return: $v0 - The value the user entered
# side effects: The String is printed followed by the Integer value
.text
PromptInt:
	# Print the prompt, which is already in $a0
	li $v0, 4
	syscall
	
	move $a0, $a1
	li $v0, 5
	syscall
	
	jr $ra
# Subprogram: PrintNewLine
# purpose: To output a new line to the user console
# input: None
# return: None
# side effects: A new line character is printed to the user's console
.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
	__PNL_newline: .asciiz "\n"


# Subprogram: PrintString
# purpose: Print a string to the console
# input: $a0 - The address of the string to be printed
# return: None
# side effects: The string is printed to the console
.text
PrintString:
	li $v0, 4
	syscall
	jr $ra
	
# Subprogram: PrintInt
# purpose: To print a integer to the console
# input: $a0 - The address fo the string to print
#	 $a1 - The value of the int to print
# return: None
# side effects: The string is printed followed by the integer value

.text
PrintInt:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer, the integer value is in $a1, and must be first moved to $a0
	move $a0, $a1
	li $v0, 1
	syscall
	# return
	jr $ra
	
# Subprogram: PrintBinary
# purpose: To print a Binary to the console
# input: $a0 - The address fo the string to print
#	 $a1 - The value of the int to print
# return: None
# side effects: The string is printed followed by the binary value

.text
PrintBinary:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer, the integer value is in $a1, and must be first moved to $a0
	move $a0, $a1
	li $v0, 35
	syscall
	# return
	jr $ra

# Subprogram: Exit
# purpose: To use syscall service 10 to exit a program 
# input: None
# return: None
# side effects: The program is exited
.text
Exit:
	li $v0, 10
	syscall

# Subprogram: NOR
# purpose: Take two parameters and do NOR operation on them
# input: $a0, $a1: operants of NOR operation
# return: Result of NOR operation
# side effects: None
.text
NOR:
	nor	$v0, $a0, $a1
	jr	$ra
		
# Subprogram: NAND
# Purpose: Take two parameters and do NAND operation on them
# input: $a0, $a1 - operants of NAND operation
# return: Result of NAND operation
# side effect: None
.text
NAND:
	and	$v0, $a0, $a1
	not	$v0, $v0
	jr	$ra

# Subprogram: Mult4
# Purpose: Multiply a number by 4
# input: $a0 - number to be multiplied by 4 
# output: number multiplied by 4
# side effect: May cause overflow
.text
Mult4:
	sll	$v0, $a0, 2
	jr	$ra

# Subprogram: Mult10
# Purpose: Multiply a number by 10
# input: $a0 - Number to be multiplied by 10
# output: number multiplied by 10
# side effect: May cause overflow
.text
Mult10:
	sll	$t0, $a0, 1
	sll	$t1, $a0, 3
	add	$v0, $t0, $t1
	jr	$ra

# Subprogramm: Swap
# Purpose: Swap two numbers 
# input: $a0, $a1 - two addresses to be swapped
# output: None
# side effect: None
.text
Swap:
	xori 	$v0, $a0, 0
	xori	$a0, $a1, 0
	xori	$a1, $v0, 0
	jr	$ra
	
# Subprogram: RightCircularShift
# Purpose: Circularly shifts input to the right by 1 bit
# input: $a0 - number to be shifted
# ouput: $v0 - the shifted value
#	 $v1 - value of the bit shifted
# Side effect: None
.text
RightCircularShift:
	ror	$v0, $a0, 1
	andi	$v1, $a0, 1
	jr	$ra
	
# Subprogram: LeftCircularShift
# Purpose: Circularly shifts input to the left by 1 bit
# input: $a0 - number to be shifted
# ouput: $v0 - the shifted value
#	 $v1 - value of the bit shifted
# Side effect: None
.text
LeftCircularShift:
	rol	$v0, $a0, 1
	andi	$v1, $a0, 1
	jr	$ra
	
# Subprogram: ToUpper
# Purpose: Turn lowercase char to uppercase char
# input: $a0 - 3 character string
# output: $v0 - 3 character string containing all uppercase letters
# side effect: Using ori to add 0x20 to each char
.text
ToUpper:
	addi	$v0, $a0, 0			# ptr = A
	upper_loop:	
		lb	$v1, 0($v0)		# if A[i] == '\0' return
		beqz	$v1, done_upper		
		addi	$a2, $zero, 0x20
		xori	$a2, 0xffffffff		# a2 = 11011111
		and	$v1, $v1, $a2		# A[i] = A[i].upper()
		sb	$v1, 0($v0)		
		addi	$v0, $v0, 1		# i++
		j	upper_loop
	done_upper:	
		move	$v0, $a0		
		jr	$ra
		
# Subprogram: ToLower
# Purpose: Turn uppercase char to lowercase char
# input: $a0 - 3 character string
# output: $v0 - 3 character string containing all lowercase letters
# side effect: Using ori to add 0x20 to each char
.text
ToLower:
	addi	$v0, $a0, 0			# ptr = A
	lower_loop:	
		lb	$v1, 0($v0)		# if A[i] == '\0' return
		beqz	$v1, done_lower		
		ori	$v1, $v1, 0x20		# A[i] = A[i].lower()
		sb	$v1, 0($v0)		
		addi	$v0, $v0, 1		# i++
		j	lower_loop
	done_lower:	
		move	$v0, $a0		
		jr	$ra
		
