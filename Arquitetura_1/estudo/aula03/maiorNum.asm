section .data
    x dd 5 ; Define Double word (4 bytes)
    y dd 10
    msg1 db 'X maior que Y', 0xA, 0xD
    tam1 equ $- msg1
    msg2 db 'Y maior que X', 0xA, 0xD
    tam2 equ $- msg2

section .text

global _start
_start:
    mov EAX, DWORD[x] ; usando DWORD pela movimentação de section .data  p/ registradores. (mover o ponteiro da DWORD p/ registrador)
    mov EBX, DWORD[y]

    cmp EAX, EBX ;compara EAX e EBX
    jge maior ; comando de >= (Jump Greater or Equal) , se for maior pula para o comando maior(linha 22)
        mov ECX, msg2  ; se EAX não for maior ou igual à EBX ele vem pra cá
        mov EDX, tam2

    jmp final ; após a comparação ele salta para os comandos em 'final' (linha 26)
maior:
    mov ECX, msg1 ; comandos caso EAX >= EBX
    mov EDX, tam1

final:
    mov EAX, 0x4 ; comando após as comparações (Operação de escrita)
    mov EBX, 0x1
    int 0x80

saida:
    mov EAX, 0x1 ;fechar o programa
    mov EBX, 0x0
    int 0x80