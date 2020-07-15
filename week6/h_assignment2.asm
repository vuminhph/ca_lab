# Laboratory Week 6, Home Assignment 2
# Pham Vu Minh
# Purpose: Selection Sort

# Pseudo Code

# last_ptr = len(A) - 1
# while last_ptr != 0:
# 	max = A[0]
# 	max_ptr = 0
#
#	for i in range(last_ptr + 1):
#		if A[i] > max:
#			max = A[i]
#			max_ptr = i
#	A[max_ptr], A[last_ptr] = A[last_ptr], A[max_ptr]
#	last_ptr -= 1

.data
A: 	.word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
Aend: 	.word

.text
main:	
	la 	$a0, A		# $a0 = A[0]
	la	$a1, Aend	# $a1 = Aend
	addi	$a1, $a1, -4	# Aend -= 1
	j	sort		# sort
after_sort:
	li	$v0, 10		# exit
	syscall

sort:	
	beq	$a0, $a1, done	# single element list is sorted
	j	max		# call the max procedure
after_max:
	lw	$t0, 0($a1)	# load last element into $t0
	sw	$t0, 0($v0)	# copy last value to max location
	sw	$v1, 0($a1)	# copy max element to last location 
	addi	$a1, $a1, -4	# decrement last pointer
	j	sort
done:	j 	after_sort
	
	
max:
	addi	$v0, $a0, 0	# init max pointer to first element
	lw	$v1, 0($v0)	# init max value to first value
	addi	$t0, $a0, 0	# init next pointer to first
loop:
	beq	$t0, $a1, ret	# if next=last, return
	addi	$t0, $t0, 4	# advance to next element
	lw	$t1, 0($t0)	# load next element into $t1
	slt	$t2, $t1, $v1	# if element < max?
	bnez	$t2, loop	# if true, continue looping
	addi	$v0, $t0, 0	# next element is new max ptr
	addi	$v1, $t1, 0	# next value is new max value
	j	loop		# continue looping
ret:
	j	after_max