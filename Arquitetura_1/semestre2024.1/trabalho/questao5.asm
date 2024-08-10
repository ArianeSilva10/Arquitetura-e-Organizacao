; Escreva um programa que exiba na console os números entre 1000 e 1999 que divididos por 11 dão
; resto 5.

global main
extern printf

section .bss
    numero RESD 1

section .data
    saida DB "%d", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging   
    xor ECX, ECX
    mov ECX, 1000
    loop_div:
        mov EAX, ECX
        xor EDX, EDX
        mov EBX, 11
        div EBX

        cmp EDX, 5
        jne prox_valor

        mov [numero], ECX
        push ECX
        
        push DWORD[numero]
        push saida
        call printf
        add esp, 8

        pop ECX

        prox_valor:
            inc ECX
            cmp ECX, 2000
            jl loop_div

    xor EAX, EAX
    ret