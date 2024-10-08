; Escreva um programa que receba um array de 10 números inteiros de dois bytes (tipo WORD) e que
; exiba o valor da soma desses 10 números.

global main
extern printf
extern scanf


section .bss
    array RESW 10
    res RESW 1

section .data
    tipo DW "%d", 0x0
    saida DB "O resultado da soma eh: %d", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging
    mov ECX, 0

    leitura:
    lea EBX, [array + 4*ECX] ; CALCULA O ENDEREÇO DE ARRAY E MOVE PRA EBX

        PUSH ECX ; GUARDA ECX ANTES DE SCANF

        PUSH EBX
        push tipo
        call scanf
        add esp, 8

        POP ECX

        inc ECX
        cmp ECX, 10
        jne leitura
    ;fim da leitura


    mov ECX, 9
    mov EAX, [array] ; PRIMEIRO VALOR PRA EAX
    lea ESI, [array+4] ; POSICIONA O PONTEIRO
    xor EBX, EBX

    operacao:
        mov EBX, [ESI]
        add EAX, EBX ; SOMA O PRIMEIRO E SEGUNDO VALOR

        add ESI, 4 ; +4 BYTES
        dec ECX
        cmp ECX, 0
        jne operacao

    mov [res], EAX
    push DWORD[res]
    push saida
    call printf
    add esp, 8

    xor EAX, EAX
    ret


