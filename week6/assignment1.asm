# Laboratory Week 6, Assignment 1
# Pham Vu Minh
# Pseudo code

# max_sum = 0
# max_sum_pref = 0
# running_sum = 0

# for i in range (len(A)):
#	running_sum += A[i]
#	if running_sum > max_sum:
#		max_sum = running_sum
#		max_sum_pref += 1
	

.data
A:		.word -2,6,-1,3,-2
message1:	.asciiz	"Max prefix: "
message2:	.asciiz "\nMax sum: "

.text
main:	
	la	$a0, A
	li	$a1, 5
	j	mspfx
	nop
continue:
end_of_main:
	move	$s0, $v0
	move	$s1, $v1
	la	$a0, message1
	li	$v0, 4
	syscall
	move	$a0, $s0
	li	$v0, 1
	syscall
	
	la	$a0, message2
	li	$v0, 4
	syscall
	move	$a0, $s1
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall


mspfx:
	addi	$v0, $zero, 0	# Initialize length in $v0 to 0
	lw	$v1, 0($a0)	# Initialize max sum in $v1 = first element of the list
	addi	$t0, $zero, 1	# Initialize index i in $t0 = 4
	addi	$t1, $v1, 0	# Initialize running sum in $t1 to first element of the list
loop:
	sll	$t2, $t0, 2	# put 4i in $t2
	add	$t3, $t2, $a0	# put 4i + A in $t3
	lw	$t4, 0($t3)
	add 	$t1 $t4, $t1	# add A[i] to runnign sum in $t1
	slt	$t5, $v1, $t1	# set $t5 to 1 if max sum < new sum
	bnez	$t5, mdfy	# if max sum < running sum, modify results
	j	test
mdfy:
	addi	$v0, $t0, 1	# new max_sum prefix has length i + 1
	addi	$v1, $t1, 0	# new max sum = running sum in $t1
test:	
	addi	$t0, $t0, 1	# advance the index i
	slt	$t5, $t0, $a1	# set $t5 = 1 if i < n
	bnez	$t5, loop 	# if true continue looping
done:	j continue