; Escreva um programa que leia 10 constantes numéricas inteiras e imprima o menor e o maior dentre
; os números informados.
global main
extern printf
extern scanf

section .bss
    numeros RESD 10
    menor RESD 1
    maior RESD 1

section .data
    tipo DD "%d", 0x0
    saida_maior DB "o maior numero eh: %d", 0xA, 0x0
    saida_menor DB "o menor numero eh: %d", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging   
    mov ECX, 0

    leitura:
    lea EBX, [numeros + 4*ECX]

        PUSH ECX

        push EBX
        push tipo
        call scanf
        add esp, 8

        POP ECX

        inc ECX
        cmp ECX, 10
        jne leitura

    ; fim da leitura

    mov EBX, [numeros]
    mov [menor], EBX
    mov [maior], EBX

    mov ECX, 9
    lea ESI, [numeros+4]


    verifica_numero:
        mov EAX, [ESI]
        cmp EAX, [menor]
        jge vericar_maior
        mov [menor], EAX

        vericar_maior:
            cmp EAX, [maior]
            jle continue
            mov [maior], EAX

        continue:
            add ESI, 4
            dec ECX
            cmp ECX, 0
            jne verifica_numero

    push DWORD[maior]
    push saida_maior
    call printf
    add esp, 8

    push DWORD[menor]
    push saida_menor
    call printf
    add esp, 8

    xor eax, eax
    ret 

