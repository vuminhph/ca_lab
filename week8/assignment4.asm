# Laboratory Week 8, Assignment 4
# Pham Vu Minh
# Calculate factorial using stack pointer

.data
message: .asciiz	"Ket qua tinh giai thuat la: "
prompt:	.asciiz		"Nhap gia tri can tinh giai thua: "

.text
main:	jal	WARP

print:	add	$a1, $v0, $zero		# $a1 = result from N!
	li	$v0, 56
	la	$a0, message
	syscall
quit:
	li	$v0, 10			# terminate
	syscall
endmain:


# Procedure WARP: assign value and call FACT
WARP:
	sw	$fp, -4($sp)		# save frame pointer (1)
	addi	$fp, $sp, 0		# new frame pointer to the top (2)
	addi	$sp, $sp, -8		# adjust stack pointer (3)
	sw	$ra, 0($sp)		# save return address (4)
	
	la	$a0, prompt
	jal	PromptInt
	
	move	$a0, $v0		# load test input N
	jal	FACT			# call fact procedure
	nop
	
	lw	$ra, 0($sp)		# restore return address (5)
	addi	$sp, $fp, 0		# return stack pointer (6)
	lw	$fp, -4($sp)		# return frame pointer (7)
	jr	$ra
wrap_end:

# Procedure FACT: Compute N!
# input: $a0 - integer N
# return $v0 - the largest value

FACT:
	sw	$fp, -4($sp)		# save frame pointer
	addi	$fp, $sp, 0		# new frame pointer point to stack's 
top:
	addi	$sp, $sp, -12		# allocate space for $fp, $ra, $a0 in stack
	sw	$ra, 4($sp)		# save return address
	sw	$a0, 0($sp)		# save $a0 register
	
	slti	$t0, $a0, 2		# if input argument N < 2
	beq	$t0, $zero, recursive	# if false ((a0 = N) >= 2)
	nop
	li	$v0, 1			# return the result N! = 1
	j	done
	nop
recursive:
	addi	$a0, $a0, -1		# adjust input argument
	jal	FACT			# recursive call
	nop
	lw	$v1, 0($sp)		# load a0
	mult	$v1, $v0		# compute the result
	mflo	$v0
done:
	lw	$ra, 4($sp)		# restore return address
	lw	$a0, 0($sp)		# restore a0
	addi	$sp, $fp, 0		# restore stack pointer
	lw	$fp, -4($sp)		# restore frame pointer
	jr	$ra			# jump to calling
jact_end:

.include "../utils.asm"