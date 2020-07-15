# File: utils.asm
# Purpose: To define utilities which will be used in MIPS programs
# Author: Dao Hong Quan

# Subprograms Index:
#	Exit -		Exit the program
#	Newline - 	Print a new line
#	PrintInt -	Print a string with an integer
#	PrintString - 	Print a string
#	PromptInt -	Prompt the user to enter an integer

# Modification History
#	21/04/2020 - Initial release

# NOR operation-------------------
.text
NotOR:
	la $a0 not_or
	li $v0 4
	syscall
	nor $a0, $t1, $t2
	li $v0, 34
	syscall
	jr $ra
.data
not_or: .asciiz "\nNOR: "


# NAND operation------------------
.text
NotAND:
	la $a0 not_and
	li $v0 4
	syscall
	and $t0, $t1, $t2
	not $a0 $t0
	li $v0, 34
	syscall
	jr $ra
.data
not_and: .asciiz "\nNAND: "


# NOT operation-------------------
.text
NotOp:
	la $a0 not_op
	li $v0 4
	syscall
	not $a0 $t1 
	li $v0 34
	syscall
	jr $ra
.data
not_op: .asciiz "\nNOT: "


# Multiplied by 4----------------------
.text
Mult4:
	la $a0 multi_4
	li $v0 4
	syscall
	sll $a0 $t1 2
	li $v0 34
	syscall
	jr $ra
.data
multi_4: .asciiz "\nMultiplied by 4 is: "



# Multiplied by 10---------------------
.text
Mult10:
	la $a0 multi_10
	li $v0 4
	syscall
	sll $a0 $t1 2
	add $a0, $a0, $a0
	sll $a1 $t1 1
	add $a0 $a0 $a1
	li $v0 34
	syscall
	jr $ra
.data
multi_10: .asciiz "\nMultiplied by 10 is: "


# Swap --------------------------------
.text
Swap:
	xor $t1 $t1 $t2
	xor $t2 $t1 $t2
	xor $t1 $t1 $t2
	jr $ra
	

# Right Circular Shift-----------------
.text
RCShift:
	ror $a0 $t1 1
	jr $ra
	
	
	
# Left Circular Shift------------------
.text
LCShift:
	rol $a0 $t1 1
	jr $ra
	
	
	
# To Upper Case -----------------------
.text
ToUpper:
loopUp:
	lb $t1 ($t0)
	beqz $t1 end_funcUp
	blt $t1, 'a', nextUp
	bgt $t1, 'z', nextUp
	subi $t1, $t1, 32
	sb $t1 ($t0)
nextUp:
	addi $t0, $t0, 1
	j loopUp
end_funcUp:
	jr $ra
	
	
	
# To Lower Case -----------------------
.text
ToLower:
loopLo:
	lb $t6 ($t8)
	beqz $t6 end_funcLo
	blt $t6, 'A', nextLo
	bgt $t6, 'Z', nextLo
	addi $t6, $t6, 32
	sb $t6 ($t8)
nextLo:
	addi $t8, $t8, 1
	j loopLo
end_funcLo:
	jr $ra
	
	


.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
	__PNL_newline: .asciiz "\n"
	
.text
PrintInt:
	li $v0, 4
	syscall
	move $a0, $a1
	li $v0, 1
	syscall
	jr $ra
	
.text
PrompInt:
	li $v0, 4
	syscall
	move $a0, $a1
	li $v0, 5
	syscall
	jr $ra
	
.text
PrintString:
	addi $v0, $zero, 4
	syscall
	jr $ra
	
.text
Exit:
	li $v0, 10
	syscall
