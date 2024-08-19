global main
extern printf

section .data
    str_format_soma db "Soma: %d", 0xA, 0
    str_format_diff db "Diferenca: %d", 0xA, 0

section .text

; Função que retorna a soma e a diferença de dois números
somadiff:
    ; Entrada: EBX = primeiro número, ECX = segundo número

    ; Soma
    mov EAX, EBX      ; EAX = primeiro número
    add EAX, ECX      ; EAX = soma dos dois números

    ; Diferença
    mov EDX, EBX      ; EDX = primeiro número
    sub EDX, ECX      ; EDX = diferença dos dois números

    ret

main:
    ; Inicializa os valores
    mov EBX, 15
    mov ECX, 5

    ; Chama a função 'somadiff'
    call somadiff

    ; EAX agora contém a soma (20) e EDX contém a diferença (10)
    ; Exibe a soma
    push EDX

    push EAX
    push str_format_soma
    call printf
    add esp, 8

    pop EDX
    ; Exibe a diferença
    push EDX
    push str_format_diff
    call printf
    add esp, 8

    xor EAX, EAX
    ret

