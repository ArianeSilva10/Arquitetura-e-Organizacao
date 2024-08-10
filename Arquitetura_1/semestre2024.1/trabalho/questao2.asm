; Escreva um programa que implemente a seguinte sentença da linguagem Java:
; a = (2 ∗ b) + (c/2) + 200;
; As variáveis a, b e c são valores inteiros armazenados na memória. O conteúdo das variáveis b e c
; deverão ser inicializados com valores definidos por você. EX: a = (2*3) + (4/2) + 200, a = 6 + 2 + 200, a = 208
global main
extern printf

section .bss
    a RESD 1
    res1 RESD 1
    res2 RESD 1

section .data
    b DD 3
    c DD 4
    saida DB "o resultado eh %d", 0xA, 0x0

section .text
main:
    xor EAX, EAX ; EAX = 0
    mov EAX, [b] ; EAX = 3
    mov EBX, 2 ; EDX = 2
    mul EBX ; EAX *EDX

    mov [res1], EAX

    xor EAX, EAX ; EAX = 0
    xor EDX, EDX ; EDX = 0

    mov EAX, [c] ; EAX = 4
    mov EBX, 2 ; EDX = 2
    div EBX ; EAX = EAX/ EDX

    mov [res2], EAX

    xor EAX, EAX
    mov EAX, [res1]
    add EAX, [res2]
    add EAX, 200
    mov [a], EAX

    push DWORD [a]
    push saida
    call printf
    add esp, 8


    mov EAX, 1
    mov EBX, 0
    int 0x80