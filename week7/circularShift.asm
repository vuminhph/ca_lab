.text
	la	$a0, prompt
	jal	PromptInt
	move	$s0, $v0
	la	$a0, message
	addi	$a1, $s0, 0
	jal	PrintBinary
	
	jal	PrintNewLine
	
	move	$a0, $s0
	jal	RightCircularShift
	move	$s0, $v0
	move	$s1, $v1
	
	la	$a0, output1	
	move	$a1, $s0
	jal	PrintBinary
	jal	PrintNewLine
	la	$a0, output2
	move	$a1, $s1
	jal	PrintInt
	jal	Exit
.data
	prompt: .asciiz "Enter num: "
	message: .asciiz "Binary value of num: "
	output1: .asciiz "Output 1: "
	output2: .asciiz "Output 2: "
.include	"utils.asm"