global main
extern printf

funcao_soma:
    push ebp
    mov ebp, esp

    mov EAX, 0
    add EAX, dword[ebp + 8]
    add EAX, dword[ebp + 12]

    mov esp, ebp
    pop ebp
    ret

section .data
    saida DB "soma eh %d", 0xA, 0x0

section .text

main:
    mov ebp, esp; for correct debugging
    
    
    push dword 2
    push dword 3

    call funcao_soma

    push EAX
    push saida
    call printf
    add esp, 16

    xor EAX, EAX
    ret