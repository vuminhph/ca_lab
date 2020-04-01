# Laboratory Week 3, Assignment 2
# Pham Vu Minh

.data
prompt: .asciiz "\nEnter the value of n: "
array:  .word	 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
output: .asciiz "\nResult: "
.text
	li $s4, 1		# step = 1
	li $s1, 0		# i = 1
	la $s2, array		# load address of array to s2
	
	la $a0, prompt		# prompt user for the value of n
	li $v0, 4
	syscall
	move $a0 $a1
	li $v0, 5
	syscall
	move $s3, $v0
	

loop: 
	add $s1,$s1,$s4 	# i=i+step
	add $t1,$s1,$s1		# t1=2*s1
	add $t1,$t1,$t1 	# t1=4*s1
	add $t1,$t1,$s2		# t1 store the address of A[i]
	lw $t0,0($t1) 		# load value of A[i] in $t0
	add $s5,$s5,$t0		# sum=sum+A[i]
	bne $s1,$s3,loop 	# if i != n, goto loop
	
	la $a0, output
	li $v0, 4
	syscall
	move $a0, $s5
	li $v0, 1
	syscall
	li $v0, 10
	syscall