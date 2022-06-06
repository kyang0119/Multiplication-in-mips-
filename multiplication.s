	.data	
prompt1: .asciiz "\nPlease enter the first number : " #user prompt
prompt2: .asciiz "\nPlease enter the second number : " #user prompt
prompt3: .asciiz "\nThe multiplication result is : " #print out result


	.text
	.globl main
main:
	li	$v0, 4 # system code for print string
	la	$a0, prompt1 # load prompt1 into $a0
	syscall #syscall will print out what's in $a0
	li	$v0, 5 #system call code for read integer
	syscall # system ask os to read the integer into $vo
	move	$s1, $v0 #save the keyboard input to $s1
	
	li 	$v0, 4 #system code for print string
	la	$a0, prompt2 #load prompt2 into $ao
	syscall #print out whats in $a0
	li	$v0,5 #system call code for read integer
	syscall #read the integer into $v0
	move	$t1, $v0 # load arg2 in $t1
	
	bgt 	$t1, $zero, skip1 #if $t1 > 0, go to skip1 , if 
	li	$s3,0 #set $s3 = 0
	j 	fin # exit
	skip1: 
	
	bgt 	$s1, $zero, skip2 #if $s1 > 0 , go to skip 2
	li	$s3,0
	j	fin #exit
	skip2:
	

	addi	$s3, $zero, 0 # let $s3 == 0
	 		
fori: ## loop
	add	$s3, $s3, $s1 #$3 += $s1
	addi	$t1, $t1, -1 # $t1-- 
	bnez	$t1, fori # if $t1!=o, continue with loop, if $t1=0, go to fin		
fin:
	li	$v0, 4 # system call code for print stirng 
	la	$a0, prompt3 #load prompt3 into $a0
	syscall # print out whats in $a0
	li	$v0, 1 # system call to print a integer
	move	$a0, $s3 #load whats in $s3 into $a0
	syscall #print out whats in $a0
	
	li	$v0, 10 # load 10 into $vo , syscal check $v0 = 10 , exit program
	syscall		
