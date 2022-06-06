	.data
	N:.word 9
	result:.word 0
	prompt : .asciiz"Result\n"
	prompt1: .asciiz "\nPlease enter the value for N : " #user prompt
	errorMsg: .asciiz"N < 0, invalid for this program!"

	.text
	.globl main
main:
	li	$v0, 4 # system code for print string
	la	$a0, prompt1 # load prompt1 into $a0
	syscall #syscall will print out what's in $a0
	li	$v0, 5 #system call code for read integer
	syscall # system ask os to read the integer into $vo
	move	$t1, $v0 #save the keyboard input to $t1
	
	blt	$t1, 0, error
	li	$t0, 1 # load 1 to $t0
	add	$s1, $zero, 0 #load zero into $s1
loop:	
	div	$t3, $t0, 2 #divide by 2
	mfhi	$t3  #load remainder to $t3
	bne	$t3, $0, oddNumber
	add	$s1, $s1, $t0 # add the even number to $s1

oddNumber:	
	add 	$t0, $t0, 1 #increment t1
	ble	$t0, $t1, loop # if $to less than N , jump back to loop
	
	
	li	$v0, 4 # system call code for print stirng 
	la	$a0, prompt #load prompt into $a0
	syscall # print out whats in $a0
	li	$v0, 1 # system call to print a integer
	move	$a0, $s1 #load whats in $s3 into $a0
	syscall #print out whats in $a0
	
	j exit
	
	error:
	li	$v0, 4 #system code for print string
	la	$a0, errorMsg # load erororMsg string to $a0
	syscall 
	
	exit:
	sw	$s1,result
	li	$v0, 10 # system code to terminate 
	syscall # terminate the program 
	
	
	
	
	
	
	
