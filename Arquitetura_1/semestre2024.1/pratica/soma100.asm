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

        push EAX ;  Empurra o valor armazenado em EAX (a soma dos números) para a pilha. Este é o argumento para printf.
        push saida ; Empurra o endereço da string saida para a pilha. Este é o formato string usado por printf.
        call printf ; chama a funcao externa
        add esp, 8 ; Ajusta o ponteiro da pilha (ESP) após a chamada da função. Como empurramos dois valores (8 bytes no total), ajustamos ESP para liberar espaço.

        mov EAX, 1 ; saida do programa
        mov ECX, 0
        int 0x80 ; interrupcao

; A saida eh a soma dos numeros de 1 a 100