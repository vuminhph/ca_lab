# Laboratory Week 3, Assignment 6
# Pham Vu Minh

.data
array:  .word	 0, 1, -23, 3, 4, -56, 6, 7, 8, 9
output: .asciiz  "\nInteger with the largest absolute value: "
.text
	li $s4, 1		# step = 1
	li $s1, 0		# i = 0
	la $s2, array		# load address of array to s2
	
	li $s3, -100		# set default max = -100
	
loop: 
	add $s1,$s1,$s4 	# i=i+step	
	add $t1,$s1,$s1		# t1=2*s1
	add $t1,$t1,$t1 	# t1=4*s1
	add $t1,$t1,$s2		# t1 store the address of A[i]
	lw $t0,0($t1) 		# load value of A[i] in $t0
	
	b find_absolute		# get absolute value
got_absolute:
	slt $t2, $s3, $s6	# check if max < A[i]
	beqz $t2, got_max	# if false, continue loop 
	move $s3, $s6		# else max = A[i]	
	move $s5, $t0
got_max:
	slti $t3, $s1, 9	# check if i < 9
	bnez $t3, loop		# if true, start loop
	
	b end_loop
	
find_absolute:
	addi $s6, $t0, 0
	slt $t2, $t0, $zero	# check if A[i] < 0
	beqz $t2, got_absolute  # if false, return
	li $t3, 0xffffffff
	xor $s6, $s6, $t3
	addi $s6, $s6, 1
	
	b got_absolute

end_loop:
	la $a0, output
	li $v0, 4
	syscall
	move $a0, $s5
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
