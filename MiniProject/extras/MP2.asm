# Mini Project: Project 2 - Find Primes in range
# Pham Vu Minh

# Pseudo code:
# def find_prime_in_range(start, end):
#     primes = []
#
#     for num in range(start, end + 1):
#        is_prime = True
#        for i in range(2, num // 2 + 1):
#             if num % i == 0:
#                 is_prime = False
#                 break
#        if is_prime and num > 1:
#             primes.append(num)
#    
#     return primes

.data	
	prompt1:	.asciiz "Enter lowerbound N: "
	prompt2:	.asciiz "Enter upperbound M: "
	
.text
	la	$a0, prompt1
	li	$v0, 51
	syscall
	move	$s1, $a0	# $s1 = N
	
	la	$a0, prompt2
	li	$v0, 51
	syscall
	move	$s2, $a0	# $s2 = M	
	
	li