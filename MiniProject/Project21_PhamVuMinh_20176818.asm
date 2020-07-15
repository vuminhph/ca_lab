# Miniproject 
# Pham Vu Minh
# Project 21: Input an integer, return the degree

# Pseudo Code

# def get_degree(num):
#    degree = 0
#    while True:
#        if num < 10:
#            break
#
#        cur_num = num
#        sum_digit = 0
#
#        while cur_num > 0:
#            cur_digit = cur_num % 10 
#            sum += cur_digit
#            cur_num //= 10
#        
#        num = sum_digit
#        degree += 1

#    return degree 

.data
	prompt:	 .asciiz "Input an integer: "
	message: .asciiz "Degree of the integer is: "

.text
	la	$a0, prompt	
	li	$v0, 51
	syscall
	move	$s0, $a0	# s0 = num
	
	addi	$s1, $zero, 0	# s1 = degree = 0
	j	loop
end_loop:
	la	$a0, message
	move	$a1, $s1
	li	$v0, 56
	syscall
	
	li	$v0, 10
	syscall
	
loop:
	slti	$t7, $s0, 10	# if num < 10, break
	bnez	$t7, end_loop
	
	addi	$s2, $s0, 0	# s2 = cur_num = num
	addi	$s3, $zero, 0	# s3 = sum = 0
	
get_sum_digit:
	sgt	$t6, $s2, 0	# if cur_num <= 0, done 
	beqz	$t6, got_sum_digit

	addi	$t0, $zero, 10
	div	$s2, $t0
	mflo	$s2		# cur_num = num // 10
	mfhi	$t1		# ti = num % 10
	
	add	$s3, $s3, $t1	# sum += cur_num % 10
	b	get_sum_digit

got_sum_digit:
	move	$s0, $s3	# num = sum
	addi	$s1, $s1, 1	# degree += 1
	b	loop
	
