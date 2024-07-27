section .data

section .text

global _start
    _start:
    mov EAX, 0X1 ; SO estou terminando o programa
    mov EBX, 0X0 ; SO o valor de retorno é 0
    int 0x80