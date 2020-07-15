# Laboratory Week 8, Assignment 5
# Pham Vu Minh
# Purpose: Find min, max from array [$s0 : $s7]

.data	
	message1: .asciiz "Largest: "
	message2: .asciiz "Smallest: "
	
.text
	li	$s0, 1
	li	$s1, 13
	li	$s2, -2
	li	$s3, 5
	li	$s4, 7
	li	$s5, -5
	li	$s6, 17
	li	$s7, 8
	
	addi	$sp, $sp, -32
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)
	sw	$s4, 16($sp)
	sw	$s5, 20($sp)
	sw	$s6, 24($sp)
	sw	$s7, 28($sp)
	
	li	$t1, 0		# max index = 0
	addi	$t2, $s0, 0	# max value = s0
	li	$t3, 0		# min index = 0
	addi	$t4, $s0, 0 	# min value = s0
	li	$t0, 0		# current index = 0
	addi	$sp, $sp, 4
	
	li	$t5, 7		# set max pointer = 7
	j	Find_max_min
Found_max_min:
	la	$a0, message1
	move	$a1, $t2
	move	$a2, $t1
	jal	PrintResult
	
	jal	PrintNewLine
	
	la	$a0, message2
	move	$a1, $t4
	move	$a2, $t3
	jal	PrintResult
	
	jal	Exit
	

Find_max_min:	
	beq	$t0, $t5, done	# if i == 7, done
	addi	$t0, $t0, 1	# i += 1
	lw	$t6, 0($sp)	# t6 = A[i]
	addi	$sp, $sp, 4
	
	sgt	$t7, $t6, $t2	# if A[i] > max value
	bnez	$t7, update_max
max_updated:
	slt	$t7, $t6, $t4	# if A[i] < min value
	bnez	$t7, update_min
min_updated:
	j	Find_max_min
update_max:
	add	$t2, $zero, $t6	# max = A[i]
	add	$t1, $zero, $t0	# max index = i
	j	max_updated
update_min:
	add	$t4, $zero, $t6	# min = A[i]
	add	$t3, $zero, $t0	# min index = i
	j	min_updated

done:
	j	Found_max_min
	
PrintResult:
.text
	li	$v0, 4
	syscall
	
	move	$a0, $a1
	li	$v0, 1
	syscall
	
	la	$a0, __comma
	li	$v0, 4
	syscall
	
	li	$v0, 1
	move	$a0, $a2
	syscall
	
	jr	$ra
.data
	__comma: .asciiz ", " 
	
.include	"../utils.asm"
	