# Laboratory Week 6, Assignment 4
# Pham Vu Minh
# Purpose: implementing Insertion Sort

# Pseudo code

# def insertionSort(A):
#     if len(A) <= 1:
#         return A
# 
#     sort_ptr = 1
# 
#     while sort_ptr != len(A):
#         for i in range(sort_ptr, 0, -1):
#             if A[i - 1] > A[i]:
#                 A[i], A[i - 1] = A[i - 1], A[i]
#         sort_ptr += 1
#     
#     return A

.data
A: 	.word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
A_end:	.word

.text
main:	
	la 	$a0, A		# $a0 = A[0]
	la	$a1, A_end	# $a1 = A_end
	addi	$a2, $a0, 4	# sort_ptr = 1
	j	pre_sort	# pre sort (check condition)
done:
	li	$v0, 10
	syscall
pre_sort:
	addi	$a2, $a2 4		# sort_ptr++
	beq	$a1, $a2, done
	addi	$t0, $a2, 0	# i = sort_ptr
	j	sort
sort:
	lw	$t1, 0($t0)	# $ti = A[i]
	addi	$t2, $t0, -4	# $t2 = i - 1
	lw	$t3, 0($t2)	# $t3 = A[i-1]
	sgt	$t4, $t3, $t1	# if A[i - 1] > A[i]
	bnez	$t4, swap
after_sort:
	addi	$t0, $t0, -4	# i--
	beq	$t0, $a0, pre_sort	# if i == 0, close loop
	j	sort		# else continue looping
	
	
swap:
	sw	$t1, 0($t2)	# A[i - 1] = A[i]
	sw	$t3, 0($t0)	# A[i] = A[i - 1]
	j	after_sort
	
	