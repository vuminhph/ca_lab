.text
	la 	$a0, prompt1
	jal	PromptInt
	move	$s0, $v0
	la 	$a0, prompt2
	jal	PromptInt
	move	$s1, $v0
	
	la	$a0, message
	jal	PrintString
	
	addi	$a0, $s0, 0
	addi	$a1, $s1, 0
	jal	Swap
	move	$s0, $a0
	move	$s1, $a1
	
	la	$a0, output1
	move	$a1, $s0
	jal	PrintInt
	jal	PrintNewLine
	la	$a0, output2
	move	$a1, $s1
	jal	PrintInt
	jal	Exit
	
.data
	prompt1: .asciiz "Enter first num: "
	prompt2: .asciiz "Enter second num: "
	message: .asciiz "Swapping two numbers...\n"
	output1: .asciiz "First num is: "
	output2: .asciiz "Second num is: "
.include "utils.asm"