# Laboratory Week 6, Assignment 3
# Pham Vu Minh
# Purpose: implement bubble sort

# Pseudo Code

# def bubbleSort(A):
#     Aend = len(A) - 1
#     while Aend != 0:
#         for i in range(Aend):
#             if A[i] > A[i + 1]:
#                 A[i], A[i + 1] = A[i + 1], A[i]
#         Aend -= 1
#     return A

.data
A: 	.word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
Aend: 	.word

.text
main:	
	la 	$a0, A		# $a0 = A[0]
	la	$a1, Aend	# $a1 = Aend
	addi	$a1, $a1, -4	# Aend -= 1
	j	pre_sort	# pre sort (check condition)

done:
	li	$v0, 10
	syscall
	
after_bubble:
	addi	$a1, $a1, -4	# A_end --
	j	pre_sort

pre_sort:
	beq	$a0, $a1, done	# list is sorted
	addi	$t0, $a0, 0	# i = 0
	j	sort		# call the sort procedure
sort:
	lw	$t1, 0($t0)	# $t1 = A[i]
	addi	$t2, $t0, 4	# $t2 = i + 1
	lw	$t3, 0($t2)	# $t3 = A[i + 1]
	sgt	$t4, $t1, $t3	# if A[i] > A[i + 1]
	bnez	$t4, swap
after_swap:
	addi	$t0, $t0, 4	# i ++
	seq	$t5, $t0, $a1	# if i == A_end
	bnez	$t5, after_bubble
	j	sort		# else continue looping
		
swap:
	sw	$t1, 0($t2)	# A[i + 1] = A [i]
	sw	$t3, 0($t0)	# A[i] = A[i + 1]
	j	after_swap
	
	
