global main
extern printf
extern scanf

section .bss
    valor RESD 1

section .data
    tipo DD "%d", 0xA, 0x0
    saida_par DB "%d eh par", 0xA, 0x0
    saida_impar DB "%d eh impar", 0xA, 0x0

section .text
main:
    push valor
    push tipo
    call scanf
    add esp, 8

    xor EAX, EAX
    mov EAX, [valor]
    and EAX, 1
    jz par
    push DWORD[valor]
    push saida_impar
    call printf
    add esp, 8
    jmp fim

    par:
    push DWORD[valor]
    push saida_par
    call printf
    add esp, 8

    fim:
    mov EAX, 1
    mov EBX, 0
    int 0x80
