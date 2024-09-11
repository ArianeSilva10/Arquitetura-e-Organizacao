global main
extern printf
extern scanf

section .bss
    valor RESD 1

section .data
    tipo DD "%d", 0xA, 0x0
    saida_par DB "%d eh par", 0xA, 0x0
    saida_impar DB "%d eh impar", 0xA, 0x0

section .text
main:
    push valor
    push tipo
    call scanf ; LEIO UM VALOR 
    add esp, 8

    xor EAX, EAX
    mov EAX, [valor] ; MOVO PRA EAX
    and EAX, 1 ; SE O BIT MENOS SIGNIFICATIVO FOR 0 - PAR SENÃO ÍMPAR
    jz par ; JUMP IF ZERO

    push DWORD[valor] ; SE FOR IMPAR IMPRIME LOGO
    push saida_impar
    call printf
    add esp, 8
    jmp fim

    par: ; PULOU PRA CÁ SE FOR PAR
    push DWORD[valor]
    push saida_par
    call printf
    add esp, 8

    fim:
    mov EAX, 1
    mov EBX, 0
    int 0x80
