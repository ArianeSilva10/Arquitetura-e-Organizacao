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
        xor EDX, EDX ; ZERA O REG Q GUARDA O MODULO
        mov EBX, 11
        div EBX

        cmp EDX, 5
        jne prox_valor ; SE NAO FOR IGUAL, PROXIMO VALOR

        mov [numero], ECX ; SE FOR IGUAL MOVE ECX PRA NUMERO
        push ECX ; GUARDA O VALOR DE ECX
        
        push DWORD[numero]; IMPRIME
        push saida
        call printf
        add esp, 8

        pop ECX

        prox_valor:
            inc ECX
            cmp ECX, 2000 ; INCREMENTA ATÉ 1999
            jl loop_div ; SE FOR MENOR QUE 2000 VOLTA PRO LOOP

    xor EAX, EAX
    ret