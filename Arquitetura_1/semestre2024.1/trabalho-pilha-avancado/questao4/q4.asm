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
    
    
    push dword 2 ; coloca os parâmetros
    push dword 3

    call funcao_soma
    mov [soma], EAX ; move o retorno pra variavel

    push dword[soma]
    push saida
    call printf
    add esp, 16; 4 B printf + 4 B parametro1 + 4 B parametro2 + 4 B retorno

    call fim
