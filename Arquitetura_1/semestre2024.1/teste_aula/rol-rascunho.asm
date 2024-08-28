global main
extern printf

section .bss
    a_rol resd 1               ; Espaço reservado para o valor após rotação

section .data
    i      dd 0x0              ; Inicializa o contador com 0
    limite dd 0x3              ; Limite para o loop
    saida_ant_rol db "valor antigo rol: %b", 0xA, 0x0
    saida_nov_rol db "valor novo rol: %b (1 << %d): %b", 0xA, 0x0

section .text
calculo_rol:
    mov al, 0b11110000         ; Move o valor 0b11110000 para o registrador AL (240 em decimal)
    mov [a_rol], al            ; Armazena AL em a_rol
    push dword [a_rol]         ; Coloca o valor original na pilha
    push saida_ant_rol         ; Coloca a string de formato na pilha
    call printf                ; Chama printf para imprimir o valor original
    add esp, 8                 ; Limpa os argumentos de printf da pilha (2x 4 bytes)
    
    mov ebx, [i]               ; Carrega o valor de i em EBX (contador)
laco_rol:
    cmp ebx, [limite]          ; Compara o contador EBX com o limite
    jae next_rol               ; Se EBX >= limite, salta para next_rol
    inc ebx                    ; Incrementa o contador
    mov al, [a_rol]            ; Carrega o valor atual de a_rol em AL
    rol al, 1                  ; Realiza a rotação à esquerda em AL
    mov [a_rol], al            ; Armazena o valor rotacionado em a_rol
    
    push dword [a_rol]         ; Coloca o valor rotacionado na pilha
    push ebx                   ; Coloca o contador (EBX) na pilha
    push dword [a_rol]         ; Coloca o valor original na pilha
    push saida_nov_rol         ; Coloca a string de formato na pilha
    call printf                ; Chama printf para imprimir o novo valor
    add esp, 16                ; Limpa os argumentos de printf da pilha (4x 4 bytes)
    
    jmp laco_rol               ; Repete o loop
    
next_rol:
    ret                        ; Retorna para a função chamadora

main:
    mov ebp, esp               ; Configura EBP para o rastreamento de pilha (debugging)
    call calculo_rol           ; Chama a função calculo_rol

    xor eax, eax               ; Define EAX como 0 (valor de retorno)
    ret                        ; Retorna da função main
