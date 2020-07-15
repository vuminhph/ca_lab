# Team 2 - Pham Vu Minh, Dao Hong Quan, Tran Cong Minh
# Date : 12/05/2020
# Mini Project : Project 23 - Surpassing Words

# ----------
# Pseudo code :
#-----------

# def check_surpassing_word(word):
#    word_size = len(word)
#    last_gap = 0

#    for i in range(word_size -  2):
#        cur_gap = ord(word[i + 1]) - ord(word[i])
#        cur_gap = math.abs(cur_gap)

#        if i != 0:
#            if cur_gap < last_gap:
#                return False
#        last_gap = cur_gap

#    return True

#print(check_surpassing_word('superb'))

# ----------

.data 

word : .space 50
prompt : .asciiz "Enter a word : "
true : .asciiz "\nTrue"
false : .asciiz "\nFalse"

.text
main: 

	li $v0, 54
	la $a0, prompt
	la $a1, word
	la $a2, 50
	syscall

	la $a1, word

	jal strlen

	move $s0, $v0   # $s0 = len(word)
	subi $s0, $s0, 2 # word_size -2

	addi $s1, $zero, 0  # last_gap = 0

	li $t0, -1      # i = -1

	loop :
		addi $t0, $t0, 1   # i
		addi $t1, $t0, 1   # i + 1
		bgt $t0, $s0, done  # i out of range -> done

		add $t2, $t0, $a1   # word[i]
		add $t3, $t1, $a1   # word[i+1]

		lb $t4, 0($t2)
		lb $t5, 0($t3)

		sub $s2, $t5, $t4  # cur_gap = word[i+1] - word[i]


		abs $s2, $s2    # cur_gap = abs(cur_gap)

		beqz $t0, new_lastgap   # if ( i = 0) -> new_lastgap

		blt $s2, $s1, returnFalse  # if ( cur_gap < last_gap ) return False;

		j new_lastgap    


		j loop

	new_lastgap :
		addi $s1, $s2, 0   # last_gap = cur_gap
		j loop

	done :
		li $v0, 55
		la $a0, true
		la $a1, 1
		syscall

		j quit

	returnFalse :
		li $v0, 55
		la $a0, false
		la $a1, 1
		syscall

	quit :
		li $v0, 10
		syscall


#--------
# subprogram : strlen
# input : - $a1
# output : - $v0

strlen :

	li $t0, 0
	li $t2, 0

	strlen_loop:
		add $t2, $a1, $t0   # $t2 -> word[i]
		addi $sp, $sp, -4   
		sw $ra, 0($sp)      # store $ra in stack 
		move $t8, $t2     
		jal ToLower         # change to lower case
		lb $t1, 0 ($t2)     # load to $t1
		beq $t1, '\n', strlen_exit    # if $t1 = '\n' -> exit
		addiu $t0, $t0, 1   # i = i + 1
		j strlen_loop

	strlen_exit :
		add $v0, $zero, $t0   # save i to $v0
		lw $ra, 0($sp)        # load $ra from stack
		addi $sp, $sp, 4
		jr $ra

.include "utils.asm"



















