segment .data
    LF        equ 0xA ; Line Feed (quebra de Linha ou \n)
    NULL      equ 0xD ; Final da String 
    SYS_CALL  equ 0x80 ; envia as informações ao SO

    ;EAX
    SYS_EXIT  equ 0x1 ; Código de chamada para finalizar
    SYS_READ  equ 0x3 ; Operação de leitura
    SYS_WRITE equ 0x4 ; Operação de escrita

    ;EBX 
    RET_EXIT  equ 0x0 ; Operação realizada com sucesso (return 0)
    STD_IN    equ 0x0 ; Entrada padrão 
    STD_OUT   equ 0x1 ; Saída padrão

section .data
    msg db "Entre com seu nome", LF, NULL
    tam equ $- msg
    msg1 db "Seu nome eh: ", LF, NULL
    tam1 equ $- msg1

section .bss
    nome resb 1

section .text

    global _start
    _start:
        ; escrita de msg:
        mov EAX, SYS_WRITE
        mov EBX, STD_OUT
        mov ECX, msg
        mov EDX, tam
        int SYS_CALL

        ;leitura de nome:
        mov EAX, SYS_READ
        mov EBX, STD_IN
        mov ECX, nome
        mov EDX, 0xA
        int SYS_CALL

        ;escrita de msg1:
        mov EAX, SYS_WRITE
        mov EBX, STD_OUT
        mov ECX, msg1
        mov EDX, tam1
        int SYS_CALL

        ;escrita de nome:
        mov EAX, SYS_WRITE
        mov EBX, STD_OUT
        mov ECX, nome
        mov EDX, 0xA
        int SYS_CALL

    saida:
        mov EAX, SYS_EXIT
        mov EBX, RET_EXIT
        int SYS_CALL