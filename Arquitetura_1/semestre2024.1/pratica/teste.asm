global main
extern printf

section .bss
    vx resd 1

section .data
    vy DD 4 ;2² = 4
    saida DB "valor eh %d", 0xA, 0x0

section .text
main:
    mov EAX, [vy]
    SHL EAX, 2
    mov [vx], EAX

    push DWORD [vx]
    push saida
    call printf
    add esp, 8

    mov EAX, 1
    mov EBX, 0
    int 0x80