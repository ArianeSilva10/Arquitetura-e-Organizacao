segment .data
    tam_buffer equ 0xA

segment .bss
    buffer resb 0x1

segment .text

saidaResultado:
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, buffer
    mov EDX, tam_buffer
    int 0x80
ret