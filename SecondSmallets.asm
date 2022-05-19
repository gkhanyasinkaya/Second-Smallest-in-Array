.data
array1: .word 13, 13, 13, 13, 13
size1: .word 5
msg:    .asciiz    "There is No Second Smallest \n"
.text

Main:
	la $a0, array1
	lw  $a1, size1

	li $t0,0 #counter
	li $t1,0 #location of array
	li $t2, 100000 #min = 100000
Loop:
	bge $t0,$a1,Re_varaible
	lw $a0, array1($t1)
	
	blt $a0, $t2, new_min
	j update_counter
		
	new_min: move $t2, $a0
	j update_counter
	
	update_counter:
	addi $t1,$t1,4
	addi $t0,$t0,1
	j Loop

Re_varaible: # Re-looping for second min. varaible
	li $t0,0
	li $t1,0
	li $t3,10000

Loop2:
	bge $t0,$a1,Exit
	lw $a0, array1($t1)
	
	beq $a0,$t2 update_counter2	
	blt   $a0, $t3, sec_min
	j update_counter2	
	sec_min: move $t3, $a0
	j update_counter2
	
	update_counter2:
	addi $t1,$t1,4 
	addi $t0,$t0,1
	j Loop2	
				
Exit: # Normal output for arrays that has second min.
	li $t4, 10000
	beq  $t3,$t4 Exit2
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 10
	syscall
		
Exit2: # Second output for arrays that has not second min.
	li    $v0,4     
	la    $a0, msg   
	syscall
	li $v0, 10
	syscall			


