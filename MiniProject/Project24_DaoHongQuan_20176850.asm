# Team 2 - Pham Vu Minh, Dao Hong Quan, Tran Cong Minh
# Project 24:
# Date : 17/05/2020

#Pseudo code:
#def check_cyclone_word(word):
#    ptr = 0
#    if(len(word)<2): return false
#    last_ptr = len(word) - 1
#
#    while True:
#	 next_ptr = last_ptr - ptr
#        if ptr > last_ptr//2:
#            next_ptr += 1
#
#	 if word[next_ptr].lower() < word[ptr].lower():
#            return False
#
#	 if ptr == next_ptr:
#	     return True
#
#	 ptr = next_ptr
#

.data
message: .asciiz "Input a word"
false: .asciiz "False"
true: .asciiz "True"
word: .space 30
sub_array: .space 30

.text
main:
	li $v0 54 			# input word
	la $a0 message
	la $a1 word
	la $a2 30
	syscall
	
	jal check_cyclone_word		# call function to check
	
end_main:
	li $v0 10			# exit
	syscall
	
	
	
check_cyclone_word:
	addi $sp $sp -4
	sw $ra 0($sp)
	li $t9 0
	la $s1 word
	li $t0, 0
	add $t8 $s1 $zero
	jal ToLower		# convert all the character to lower case
	
	check_length:
		lb $t0 0($s1)
		beqz $t0 end_check_length
		addi $t9 $t9 1
		addi $s1 $s1 1
		j check_length
		
	end_check_length:
	
	subi $t9 $t9 1		# $t9 = length(word)
	li $t1 2
	slt $t2 $t9 $t1
	beqz $t2 cont		# if(length(word) < 2) -> False
	la $a0 false
	li $a1 0
	li $v0 55
	syscall
	lw $ra 0($sp)
	add $sp $sp 4
	jr $ra
	
	cont:

	li $s2 0		# ptr = 0
	subi $s0 $t9 1		# $s0 = last_ptr = length(word) - 1

	li $t8 2
	div $s0 $t8
	mflo $t6		# store the quotient to $t6
	la $s1 word		# load address word to $s1
	
	loop:
		sub $s3 $s0 $s2		# $s3 = next_ptr = last_ptr - ptr
		
		if1:
			sgt $t1 $s2 $t6
			beqz $t1 end_if1	# if ptr < length/2, end if
			addi $s3 $s3 1		# else, next_ptr++
		end_if1:
		
		if2:
			add $t1 $s2 $s1
			add $t2 $s3 $s1
			lb $t3 0($t1)
			lb $t4 0($t2)
			slt $t5 $t4 $t3		
			beqz $t5 end_if2	# if word[next_ptr] >= word[ptr], end if
			la $a0 false		# else return false
			li $a1 0
			li $v0 55
			syscall
			lw $ra 0($sp)
			add $sp $sp 4
			jr $ra
		end_if2:
		
		if3:
			bne $s2 $s3 end_if3
			la $a0 true		# return true
			li $a1 1
			li $v0 55
			syscall
			lw $ra 0($sp)
			add $sp $sp 4
			jr $ra
		end_if3:
		
		add $s2 $s3 $zero		# ptr = next_ptr
		j loop
		
	end_loop:	
		
		
end_check_cyclone_word:
		
.include "utils.asm"	
	
		
