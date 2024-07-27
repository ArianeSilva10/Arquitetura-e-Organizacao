section .data
    msg db "Entre com seu nome:", 0xA, 0xD
    tam equ $- msg
    msg1 db "Seu nome eh", 0xA, 0xD
    tam1 equ $- msg1

section .bss
    nome resb 1

section .text

global _start
_start:
    ; escrita de msg
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tam
    int 0x80

    ; leitura de nome
    mov EAX, 0x3
    mov EBX, 0x0
    mov ECX, nome
    mov EDX, 0xA
    int 0x80

    ; escrita de msg1
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg1
    mov EDX, tam1
    int 0x80

    ; escrita de nome
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, nome
    mov EDX, 0xA
    int 0x80

saida:
    mov EAX, 0x1 
    mov EBX, 0x0
    int 0x80