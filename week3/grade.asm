.data
grade: .word 64
gradeA: .asciiz "Grade is A"
gradeB: .asciiz "Grade is B"
gradeC: .asciiz "Grade is C"
gradeD: .asciiz "Grade is D"
gradeF: .asciiz "Grade is F"
invalid: .asciiz "Grade must be between 0..100"

.text
lw $t0, grade
slti $t1, $t0, 0
sgt $t2, $t0, 100
or $t1, $t1, $t2
beqz $t1, grade_A
#if block
	# first if check, 
	la $a0, invalid
	li $v0, 4
	syscall
	b end_if
grade_A:
	sge $t3, $t0, 90
	beqz $t3, grade_B
	la $a0, gradeA
	li $v0, 4
	syscall
	b end_if
grade_B:
	sge $t4, $t0, 80
	beqz $t4, grade_C
	la $a0, gradeB
	li $v0, 4
	syscall
	b end_if
grade_C:
	sge $t5, $t0, 70
	beqz $t5, grade_D
	la $a0, gradeC
	li $v0, 4
	syscall
	b end_if
grade_D:
	sge $t6, $t0, 60
	beqz $t6, else
	la $a0, gradeD
	li $v0, 4
	syscall
	b end_if
else:
	la $a0, gradeF
	li $v0, 4
	syscall
	b end_if
end_if:
	li $v0, 10
	syscall
