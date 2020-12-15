.data 
	mensagem: .asciiz "Digite um numero.\n"
	inp:	.word 1
	res:	.double 0.00
	weight: .double 0.8233245475,1.1233256475,1.0533245475
		
.text
	main:
		li $v0, 4                                
		la $a0, mensagem    
		syscall                          
		li $v0, 5
		syscall
		sw $v0, inp
		move $t0, $zero	 #index
		li $t1, 24       #Array size
		lw $s1, res
    lw $s2, inp
		loop:	
		beq $t0, $t1,exit
    mul $t3, $s2, weight($t0)
		addi $s1, $s1,$t3
		addi $t0,$t0, 4   #add 4 to 
		j loop
		exit:
    li $v0, 4
    la $a0, res
    syscall