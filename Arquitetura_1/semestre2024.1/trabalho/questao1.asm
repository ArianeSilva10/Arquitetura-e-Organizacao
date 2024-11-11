; Escreva um programa que calcule a soma dos números par e impar de 1 até 100. O resultado deverá
; ser armazenado no registrador eax e também deverá ser exibido na tela.
global main
extern printf

section .data
    saida_par DB "A soma de 1 ate 100 de numeros pares eh: %d", 0xA, 0x0
    saida_impar DB "A soma de 1 ate 100 de numeros impares eh: %d", 0xA, 0x0

section .text
    main:
    xor EAX, EAX
    xor EBX, EBX
    mov ECX, 1

    laco:
    push ECX ; armazeno o valor original de ECX na pilha 
    and ECX, 1 ; comparo EXC e ele recebe esse novo valor com o and
    jz par ;jump if zero, comparo o novo valor de ECX
    ; se não for par:
    pop ECX ; recupero o valor original de ECX
    add EBX, ECX
    jmp proximo

    par: ; se for par
    pop ECX
    add EAX, ECX

    proximo:
    inc ECX
    cmp ECX, 100
    jbe laco

    push EAX
    push saida_par
    call printf
    add esp, 8

    push EBX
    push saida_impar
    call printf
    add esp, 8

    mov EAX, 1
    mov EBX, 0
    int 0x80
    // teste