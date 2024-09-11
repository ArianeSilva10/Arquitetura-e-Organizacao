; Escreva um programa que leia 10 constantes numéricas inteiras e imprima o menor e o maior dentre
; os números informados.
global main
extern printf
extern scanf

section .bss
    numeros RESD 10
    menor RESD 1
    maior RESD 1

section .data
    tipo DD "%d", 0x0
    saida_maior DB "o maior numero eh: %d", 0xA, 0x0
    saida_menor DB "o menor numero eh: %d", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging   
    mov ECX, 0

    leitura:
    lea EBX, [numeros + 4*ECX] ; PEGA O ENDEREÇO DO VALOR NO INDICE DE ECX E MOVE P/ EBX

        PUSH ECX ; GUARDA O VALOR DO INDICE

        push EBX
        push tipo
        call scanf
        add esp, 8

        POP ECX ; RECUPERA O VALOR DO INDICE

        inc ECX
        cmp ECX, 10
        jne leitura

    ; fim da leitura

    mov EBX, [numeros] ; MOVE O PRIMEIRO VALOR DE numeros PARA EBX
    mov [menor], EBX ; OS DECLARA COMO MAIOR E MENOR
    mov [maior], EBX

    mov ECX, 9 ; CONTADOR
    lea ESI, [numeros+4] ; APONTA PARA O SEGUNDO ELEMENTO


    verifica_numero:
        mov EAX, [ESI] ; SEGUNDO ELEMENTO PARA EAX
        cmp EAX, [menor]
        jge vericar_maior ; JUMP IF GREATER OR EQUAL(MAIOR OU IGUAL)
        mov [menor], EAX ; SE NÃO FOR MAIOR OU IGUAL ENTAO A VARIAVEL menor = EAX

        vericar_maior:
            cmp EAX, [maior] ; PULOU PRA CÁ SE FOR MAIOR OU IGUAL
            jle continue ; JUMP IF LESS OR EQUAL(SE FOR MENOR OU IGUAL)
            mov [maior], EAX ; SE NÃO FOR MENOR OU IGUAL ATUALIZA O VALOR DE maior COM O DE EAX

        continue:
            add ESI, 4 ; PONTEIRO PARA VALOR SEGUINTE
            dec ECX
            cmp ECX, 0
            jne verifica_numero ; CONTINUA O LOOP SE ECX NÃO FOR 0

    push DWORD[maior]
    push saida_maior
    call printf
    add esp, 8

    push DWORD[menor]
    push saida_menor
    call printf
    add esp, 8

    xor eax, eax
    ret 

