section .data
    msg db 'Insira o primeiro numero: ', 0xA, 0xD
    tam equ $- msg
    msg0 db 'Insira o segundo numero:', 0xA, 0xD
    tam0 equ $- msg0
    msg1 db 'O primeiro numero eh  maior que o segundo!', 0xA, 0xD
    tam1 equ $- msg1
    msg2 db 'O segundo numero eh maior que o primeiro', 0xA, 0xD
    tam2 equ $- msg2

section .bss
    X resd 1
    Y resd 1

section .text

global _start
_start:
    ;escrita de msg
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tam
    int 0x80

    ;leitura de X
    mov EAX, 0x3
    mov EBX, 0x0
    mov ECX, X
    mov EDX, 0xA
    int 0x80

    ;escrita de msg0
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg0
    mov EDX, tam0
    int 0x80

    ;leitura de Y
    mov EAX, 0x3
    mov EBX, 0x0
    mov ECX, Y
    mov EDX, 0xA
    int 0x80

    ; movimentação para comparar
    mov EAX,DWORD[X]
    mov EBX, DWORD[Y]

    ; comparação
    cmp EAX, EBX
    jge maior
        mov ECX, msg2
        mov EDX, tam2

    jmp final

    maior:
        mov ECX, msg1
        mov EDX, tam1

    final:
        mov EAX, 0x4
        mov EBX, 0x1
        int 0x80

    saida:
        mov EAX, 0x1
        mov EBX, 0x0
        int 0x80