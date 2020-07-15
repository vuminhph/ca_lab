# Mini Project: Project 1 - Check Palindrome
# Pham Vu Minh

# Pseudo code:

# def if_palindrome(word):
#     head_ptr = 0
#     end_ptr = len(word) - 1
#     
#     while head_ptr < end_ptr:
#         if word[head_ptr] != word[end_ptr]:
#             return False
#         head_ptr += 1
#         end_ptr -= 1

#     return True

.data	
	prompt:	.asciiz	"Input a word: "
	word:	.space	30
	True_mes: .asciiz "True"
	False_mes: .asciiz "False"
	
.text
	la	$a0, prompt
	la	$a1, word
	addi	$a2, $zero, 30
		
	li	$v0, 54				# input word
	syscall
	
	la	$a0, word
	addi	$a1, $zero, 1

	jal	Length				# get word length
	move	$s0, $v0			# $a0 = length
	la	$s1, word			# $s1 = head_ptr
	add	$s2, $s1, $s0			# $s2 = end_ptr
	addi	$s2, $s2, -1
	j	check_palindrome
			
	check_palindrome:	
		slt	$t0, $s1, $s2		# check head_ptr < end_ptr
		beqz	$t0, return_true	# if false, return true
		
		lb	$t1, 0($s1)		# $t1 = A[head_ptr]
		lb	$t2, 0($s2)		# $t2 = A[end_ptr]
		seq	$t3, $t1, $t2		# check A[head_ptr] = A[end_ptr]
		beqz	$t3, return_false	# if false, return false
		
		addi	$s1, $s1, 1		# head_ptr += 1
		addi	$s2, $s2, -1		# end_ptr -= 1
		j	check_palindrome
		
	return_true:
		la	$a0, True_mes
		li	$a1, 1
		li	$v0, 55
		syscall
	
		jal	Exit
		
	return_false:
		la	$a0, False_mes
		li	$a1, 1
		li	$v0, 55
		syscall
		
		jal	Exit
	

.include	"utils.asm"
	