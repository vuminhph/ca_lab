# Laboratory Week 6, Home Assignment 1
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
A: .word -2,6,-1,3,-2

.text
main:	
	la	$a0, A
	li	$a1, 5
	j	mspfx
	nop
continue:
end_of_main:
	li	$v0, 10
	syscall


mspfx:
	addi	$v0, $zero, 0	# Initialize length in $v0 to 0
	addi	$v1, $zero, 0	# Initialize max sum in $v1 = 0
	addi	$t0, $zero, 0	# Initialize index i in $t0 = 0
	addi	$t1, $zero, 0	# Initialize running sum in $t1 to 0
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