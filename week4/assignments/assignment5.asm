#Laboratory Week 3, Home Assignment 1
#Pham Vu Minh

#multiply by small power of 2

.data
prompt: 	.asciiz "Enter the number to be multiplied: "
prompt2:	.asciiz "Enter an small power of 2: "
output:		.asciiz	"Result: "
new_line:	.asciiz  "\n"

.text
start:
	la 	$a0, prompt		#get input for the number to be multiplied s0
	li	$v0, 4
	syscall
	move	$a0, $a1
	li	$v0, 5
	syscall
	move	$s0, $v0
	
	la	$a0, prompt2		#get input for power of 2, store in s1
	li	$v0, 4
	syscall 
	move	$a0, $a1
	li 	$v0, 5
	syscall
	move	$s1, $v0
	
	li 	$s3, 1
	
loop:	beq	$s1, $s3, end_loop
	addi	$s2, $s2, 1
	srl	$s1, $s1, 1 
	b	loop

end_loop:
	sllv	$s0, $s0, $s2
	la	$a0, output
	li 	$v0, 4
	syscall
	move	$a0, $s0
	li 	$v0, 1
	syscall
	
