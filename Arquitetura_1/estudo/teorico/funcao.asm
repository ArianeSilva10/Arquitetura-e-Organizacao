global main        ; Tornando o main acessível
extern printf      ; Chamando printf

section .data
    str_format db "Resultado: %d", 0xA, 0

    
section .text

    ; Função para somar dois números
soma:
    ; Parâmetros de entrada:
    ;   - EBX: primeiro número
    ;   - ECX: segundo número

    ; A função soma EBX e ECX e coloca o resultado em EAX
    mov EAX, EBX       ; Coloca o primeiro número em EAX
    add EAX, ECX       ; Soma o segundo número ao valor em EAX

    ret                ; Retorna o controle para o chamador

main:
    ; Inicializa os valores a serem somados
    mov EBX, 5         ; Primeiro número
    mov ECX, 10        ; Segundo número

    ; Chama a função 'soma'
    call soma

    ; Agora, EAX contém o resultado da soma (5 + 10 = 15)
    ; Vamos imprimir o resultado
    push EAX
    push str_format
    call printf
    add esp, 8

    ; Finaliza o programa
    xor EAX, EAX
    ret

