section .data
    v1 dw '105', 0xA, 0xD

section .text

global _start
_start:

    call converter_valor
    call mostrar_valor

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL



converter_valor:
    lea esi, [v1] ; A função converter_valor inicia carregando o endereço de v1 em esi.
    mov ecx, 0x3 ; Define o comprimento do valor v1 em ecx.
    call string_to_int ; Chama a função string_to_int, que converte a string para um valor inteiro e armazena em eax.
    add eax, 0x2 ; Adiciona 2 ao valor inteiro resultante.
    ret ; Retorna o resultado.

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret    
    
    ;---------------------------
    ; string para inteiro
    ; ------------------------
    ; entrada : ESI(valor conv) ECX (tam)
    ; saida...: EAX
    ;------------------------------




    ; A função string_to_int converte uma string contendo dígitos numéricos em um valor inteiro.
    string_to_int:
        xor EBX, EBX ; Inicializa EBX com zero.
    .prox_digito:
        movzx EAX, byte[ESI] ; Esta instrução move o valor da memória apontada por ESI para o registrador EAX. O movzx estende o byte lido para 32 bits, preenchendo os bits de alta ordem com zeros.
        inc ESI ; Incrementa o registrador ESI, movendo-o para o próximo byte na string.
        sub al, '0' ; Subtrai o valor ASCII do caractere '0' do byte armazenado em AL. Isso converte o valor ASCII do dígito para o valor numérico correspondente. Por exemplo, se o byte armazenado em AL for '5' (ASCII 53), após essa operação AL conterá o valor 5.
        imul EBX, 0xA ; Multiplica o valor em EBX por 10, simulando o deslocamento decimal para a esquerda.
        add EBX, EAX ; EBX = EBX * 10 + EAX Adiciona o valor numérico do dígito (armazenado em EAX) ao valor acumulado em EBX. Isso compõe o número inteiro a partir dos dígitos lidos da string.
        loop .prox_digito ; while(--ECX) Decrementa o contador de loop em ECX e verifica se ele é diferente de zero. Se ECX não for zero, o loop continua, repetindo o processo para o próximo dígito na string.
        ret ; Retorna ao chamador da função após todos os dígitos da string terem sido processados.

    ;-----------------------------------------
    ; inteiro para string 
    ;-------------------------------------------
    ; Entrada: inteiro em EAX
    ; Saida: BUFFER (valor ECX) TAM_BUFFER(EDX)
    ;----------------------------------------


    ; A função int_to_string converte um valor inteiro em uma string contendo dígitos numéricos.
    int_to_string:
        lea ESI, [buffer] ; Carrega o endereço base da string de destino (`buffer`) no registrador `ESI`. A instrução `lea` (Load Effective Address) é usada para carregar um endereço na memória.
        add ESI, 0x9 ; Adiciona um deslocamento de 9 bytes ao endereço base em `ESI`. Isso posiciona `ESI` no último caractere da string, onde o primeiro dígito será escrito.
        mov byte[ESI], 0xA ; Coloca o caractere de terminação de linha (`LF`) no final da string. Isso indica o fim do texto.
        mov EBX, 0xA ; Configura o divisor como 10, pois estamos convertendo para base decimal.

    .prox_digito ; Este rótulo marca o início de um loop que será executado para cada dígito convertido.
        xor EDX, EDX ; Limpa o registrador `EDX` (divisor) para prepará-lo para a operação de divisão.
        div EBX ; Divide o valor no registrador `EAX` pelo valor em `EBX`. O resultado da divisão inteira é armazenado em `EAX`, e o resto é armazenado em `EDX`.
        add dl, '0' ; Converte o valor numérico no registrador `DL` (resto da divisão) em seu caractere ASCII equivalente, adicionando `'0'`. Isso é necessário porque estamos convertendo números inteiros em caracteres ASCII.
        dec ESI ; Decrementa o ponteiro `ESI`, movendo-o para o próximo byte na string.
        mov [ESI], dl ; Armazena o caractere convertido (no registrador `DL`) na posição atual da string.
        test EAX, EAX ; Testa se o valor em `EAX` é zero. Se for zero, indica que todos os dígitos foram convertidos e não há mais nada para processar.
        jnz .prox_digito ; Se `EAX` não for zero, o loop continua (`jnz` é uma instrução de salto condicional que salta para `.prox_digito` se a condição `EAX != 0` for verdadeira).
        ret ; Retorna ao chamador da função após todos os dígitos terem sido convertidos e escritos na string.