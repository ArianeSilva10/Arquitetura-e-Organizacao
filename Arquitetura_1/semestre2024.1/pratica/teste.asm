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
    SHL EAX, 2 ; Realiza um deslocamento lógico à esquerda em EAX por 2 bits, multiplicando o valor por 4 (resultando em 16).
    mov [vx], EAX

    push DWORD [vx] ;adiciona vx na pilha (4 bytes, esp-4)
    push saida ; adiciona o printf na pilha (4 bytes, esp-4)
    call printf ; chama a função externa
    add esp, 8 ; retorna os 8 bytes que foram usados na pilha(-4-4 = -8, -8+8 = 0, pilha inicialmete vazia e finializada vazia)

    mov EAX, 1 ; chamada de sistema para saida do programa
    mov EBX, 0
    int 0x80