global main
extern printf
extern funcao_soma
extern fim

section .bss
    soma RESD 1

section .data
    saida DB "soma eh %d", 0xA, 0x0

section .text

main:
    mov ebp, esp; for correct debugging
    
    
    push dword 2 ; 2 para ebp + 8

    call funcao_soma
    mov [soma], EAX

    push dword[soma]
    push saida
    call printf
    add esp, 12

    call fim
