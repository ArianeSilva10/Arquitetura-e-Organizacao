%include 'bibliotecaE.inc'

section .text

global _start
_start:
    lea esi[buffer] ; Load Effective Adress
    add  esi, 0x9
    mov byte[esi], 0xA

    dec esi
    mov dl, 0x11
    add dl, '0'
    mov [esi], dl

    call saidaResultado

saida:
    mov EAX, 0x1
    mov EBX, 0x0
    int 0x80
