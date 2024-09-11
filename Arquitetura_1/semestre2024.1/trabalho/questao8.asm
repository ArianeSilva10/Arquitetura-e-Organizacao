; Escreva um programa que apresente 10 valores em um vetor e imprima o segundo menor e o segundo
; maior dentre os números informados.
global main
extern printf
extern scanf

section .bss
    numeros RESD 10

    segundo_menor RESD 1
    segundo_maior RESD 1


section .data
    tipo DD "%d", 0x0
    saida_maior DB "o segundo maior numero eh: %d", 0xA, 0x0
    saida_menor DB "o segundo menor numero eh: %d", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging   
    mov ECX, 0

    leitura:
    lea EBX, [numeros + 4*ECX]

        PUSH ECX

        push EBX
        push tipo
        call scanf
        add esp, 8

        POP ECX

        inc ECX
        cmp ECX, 10
        jne leitura

    ; fim da leitura
    
    mov ECX, 9
    externo:
        lea ESI, [numeros] ; aponto para o primeiro elemento
        mov EBX, ECX ; ebx vai ser o contador interno
        
        interno:
            mov EAX, [ESI] ; primeiro elemento vai pra eax
            mov EDX, [ESI+4] ; segundo elemento vai pra edx
            cmp EAX, EDX ; compara se eax eh menor que edx
            jle sem_troca ; se nao for, ele permanece onde esta e move o ponteiro em sem_troca
            
            mov [ESI], EDX ; se eax eh maior, ele troca de lugar com edx
            mov [ESI+4], EAX ; eax passa a ser o segundo elemento
            
            sem_troca:
                add ESI, 4 ; move o ponteiro para o proximo elemento
                dec EBX ; decremento o contador interno
                cmp EBX, 0 ; se ja chegou em 0, decremeto o externo
                jne interno ; se nao, continua o loop interno
                
                dec ECX
                cmp ECX, 0
                jne externo
                
    lea ESI, [numeros] ; posiciono esi para o primeiro elemento
    mov EAX, [ESI+4*8] ; movo pra eax o segundo valor maior
    mov EBX, [ESI +4] ; movo pra ebx o segundo valor menor
    mov [segundo_maior], EAX ; movo pras variaveis
    mov [segundo_menor], EBX

    ;isso acontece pq fiz o bubble sort, coloquei em ordem do menor para o menor

    push DWORD[segundo_maior]
    push saida_maior
    call printf
    add esp, 8
               
               
    push DWORD[segundo_menor]
    push saida_menor
    call printf
    add esp, 8

    xor eax, eax
    ret 