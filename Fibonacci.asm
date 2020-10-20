#Sequência de Fibonacci em Assembly MIPS
#Rodrigo Rossi dos Santos
#São Paulo, 19 de outubro de 2020

.data
	msg: .asciiz "Insira o valor de n:\n"
	quebra: .asciiz "\n" #imprime quebra de linha
	
.text
	
	li $t0, 1 #f(0) = 1
	li $t1, 1 #f(1) = 1
	li $t2, 0 #f(n) = f(n-1) + f(n-2), n >= 2
	
	li $s0, 0 #variável de iteração (varia de 0 até n)
	li $s1, 0 #recebe entrada do usuário
	
	li $v0, 4 #Imprime mensagem inicial
	la $a0, msg
	syscall
	
	li $v0, 5 #Captura entrada do usuário
	syscall
	
	move $s1, $v0 #Atribui entrada do usuário ao registrador $s1
	
	li $v0, 4 #Imprime quebra de linha
	la $a0, quebra
	syscall
	
	WHILE:
	bgt $s0, $s1, FIM_WHILE #Enquanto $s0 <= $s1
	blt $s0, 2, PRINT1 #Verifica se n < 2
	add $t2, $t1, $t0 #Atribui f(n) = f(n-1) + f(n-2)
	li $v0, 1 #Imprime o resultado parcial
	move $a0, $t2
	syscall
	li $v0, 4 #Imprime quebra de linha
	la $a0, quebra
	syscall
	move $t0, $t1 #Altera o valor de f(n-2)
	move $t1, $t2 #Altera o valor de f(n-1)
	addi $s0, $s0, 1 #Incrementa 1 em $s0
	j WHILE
	
	FIM_WHILE: #Fim do programa
	li $v0, 10
	syscall
	
	PRINT1: #Imprime f(n) quando n < 2
	li $v0, 1
	li $a0, 1
	syscall
	li $v0, 4
	la $a0, quebra
	syscall
	addi $s0, $s0, 1
	j WHILE
	
