global main
extern printf
extern scanf

section .bss
    media RESD 1

section .data 
    print1 DB "Digite a media final do aluno:", 0xA, 0x0
    tipo DD "%d", 0xA, 0x0
    print_invalido DB "Voce digitou um numero invalido!", 0xA, 0x0
    print_aprovado DB "APROVADO!", 0xA, 0x0
    print_reprovado DB "REPROVADO!", 0xA, 0x0
    print_fim DB  "Fim do programa!", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging
    mov DWORD[media], 0

    digitacao: 
        push print1
        call printf
        add esp, 8
        
        push media
        push tipo
        call scanf
        add esp, 8

        mov EAX, [media]
        cmp EAX, -1
        je fim_leitura

        cmp EAX, -1
        jl numero_invalido
        cmp EAX, 10
        jg numero_invalido

        cmp EAX, 7
        jge aprovado_p
        jmp reprovado_p

    numero_invalido:
        push print_invalido
        call printf
        add esp, 8
        jmp digitacao

    aprovado_p:
        push print_aprovado
        call printf
        add esp, 8
        jmp digitacao

    reprovado_p:
        push print_reprovado
        call printf
        add esp, 8
        jmp digitacao

    fim_leitura:
        push print_fim
        call printf
        add esp, 8

        xor EAX, EAX
        ret