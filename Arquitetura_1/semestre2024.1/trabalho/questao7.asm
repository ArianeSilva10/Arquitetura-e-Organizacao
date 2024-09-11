; Escreva um programa que receba um array de 5 números inteiros de dois bytes (tipo WORD) e que
; exiba o valor da multiplicação desses 5 números.

global main
extern printf
extern scanf


section .bss
    array RESW 5
    res RESW 1

section .data
    tipo DW "%d", 0x0
    saida DB "O resultado da multiplicacao eh: %d", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging
    mov ECX, 0

    leitura:
        lea EBX, [array + 4*ECX] ; PEGA O ENDEREÇO DO PRIMEIRO ELEMENTO E JOGA EM EBX

        PUSH ECX

        PUSH EBX
        push tipo
        call scanf
        add esp, 8

        POP ECX

        inc ECX
        cmp ECX, 5
        jne leitura
    ;fim da leitura


    mov ECX, 4
    mov EAX, [array]
    lea ESI, [array+4]
    xor EBX, EBX

    operacao:
        mov EBX,[ESI]
        mul EBX

        add ESI, 4
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


