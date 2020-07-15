# Laboratory Week 7, Assignment 3
# Pham Vu Minh

.data
prompt1: .asciiz "Enter the first value: "
prompt2: .asciiz "Enter the second value: "
message1: .asciiz "First value after swap: "
message2: .asciiz "Second value after swap: "

.text
la	$a0, prompt1
jal	PromptInt
move	$s0, $v0
la	$a0, prompt2
jal	PromptInt
move	$s1, $v0

push:
	addi	$sp, $sp, -8		# adjust the stack pointer
	sw	$s0, 4($sp)		# push $s0 to stack
	sw	$s1, 0($sp)		# push $s1 to stack
work:
	nop
	nop
	nop
pop:
	lw	$s0, 0($sp)		# pop from stack to $s0
	lw	$s1, 4($sp)		# pop from stack to $s1
	addi	$sp, $sp, 8		# adjust the stack pointer

la	$a0, message1
move	$a1, $s0
jal	PrintInt
jal	PrintNewLine
la	$a0, message2
move	$a1, $s1
jal	PrintInt
jal	Exit

.include "../utils.asm"