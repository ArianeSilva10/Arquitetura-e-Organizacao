global main
extern funcao_soma
extern fim

section .text

main:
    mov ebp, esp; for correct debugging
    
    call funcao_soma

    call fim
