.text
	la	$a0, prompt
	jal 	PromptInt
	move	$a0, $v0
	jal	Mult10
	move	$a1, $v0
	la	$a0, output
	jal	PrintInt
	jal	Exit
.data
prompt: .asciiz "Enter a number: "
output: .asciiz	"Result: "
.include "utils.asm"