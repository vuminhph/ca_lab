.text
	la	$a0, message
	jal	PrintString
	jal	PrintNewLine
	
	la	$a0, message
	jal	ToUpper
	move	$a0, $v0
	jal	PrintString
	
	move	$s0, $a0
	jal	PrintNewLine
	
	move	$a0, $s0
	jal	ToLower
	jal	PrintString
	jal	Exit
.data
	message: .asciiz "Cat"
.include	"utils.asm"