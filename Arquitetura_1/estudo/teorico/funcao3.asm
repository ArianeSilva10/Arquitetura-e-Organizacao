global main
extern printf

section .data
    fmt db "Resultado: %d", 0xA, 0 ; Formato para impressão

section .text
    global main
    extern printf

; Função que multiplica dois números
multiplica:
    ; A função espera que os dois números estejam no topo da pilha
    ; No início da função, a pilha está assim:
    ; ESP + 0  -> Return Address (endereço de retorno)
    ; ESP + 4  -> Primeiro número (parâmetro)
    ; ESP + 8  -> Segundo número (parâmetro)

    ; Obtém o primeiro número
    mov eax, [esp + 4]

    ; Obtém o segundo número
    mov ebx, [esp + 8]

    ; Multiplica os dois números
    imul eax, ebx  ; EAX = EAX * EBX

    ; O resultado da multiplicação está agora em EAX
    ; Retorna o valor no topo da pilha
    ret

main:
    ; Configura os parâmetros para a função
    push dword 5   ; Segundo número
    push dword 7   ; Primeiro número

    ; Chama a função 'multiplica'
    call multiplica

    ; O resultado da multiplicação agora está em EAX
    ; Vamos imprimir o resultado
    push eax       ; Coloca o resultado na pilha
    push fmt       ; Formato da string
    call printf
    add esp, 8     ; Limpa a pilha dos parâmetros passados para printf

    ; Finaliza o programa
    xor eax, eax
    ret
