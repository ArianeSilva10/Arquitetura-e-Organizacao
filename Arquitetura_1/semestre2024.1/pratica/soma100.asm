global main
extern printf ;chamada de uma funcao externa

section .data
    saida DB "O valor da saida de 1 ate 100 eh: %d", 0xA, 0x0 ; frase de 4 bytes onde no final tem quebra de linha e nulo

section .text
    main:
        xor EAX, EAX ; zero EAX
        mov ECX, 1 ; interador
    
    laco:
        add EAX, ECX ; comeca as operacoes
        inc ECX ; incrementa enquanto ECX nao for maior ou igual a 100
        cmp ECX, 100
        jbe laco ; Jump if Below or Equal, se ECX for menor ou igual a 100 continua p looping

        push EAX ; chama EAX onde esta armazenado o valor da soma
        push saida ; chama a frase no inicio declarada
        call printf ; chama a funcao externa
        add esp, 8 ; manda ŕa pilha

        mov EAX, 1 ; saida do programa
        mov ECX, 0
        int 0x80 ; interrupcao

; A saida eh a soma dos numeros de 1 a 100