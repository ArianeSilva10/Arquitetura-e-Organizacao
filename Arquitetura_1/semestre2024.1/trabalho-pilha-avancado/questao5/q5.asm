global main
extern printf
extern par
extern fim


section .bss
    a RESD 1

section .data
    impressao_par DB "par = %d", 0xA, 0x0
    impressao_impar  DB "impar = %d", 0xA, 0x0

section .text


main:
    mov ebp, esp; for correct debugging
    
    
    push dword 4 ; parametro

    call par
    mov [a], EDX ; o resto fica em edx
    
    cmp dword[a], 0
    je saida_par
    
    push dword[a]
    push impressao_impar
    call printf
    add esp, 12 ; 4 B printf + 4 B parametro + 4 B retorno
    
    jmp fim0
    
    saida_par:
        push dword[a]
        push impressao_par
        call printf
        add esp, 12

    fim0:
        call fim