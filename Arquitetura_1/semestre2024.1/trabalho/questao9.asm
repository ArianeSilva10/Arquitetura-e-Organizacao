; Escreva um programa que calcula a média ponderada das 3 notas de um aluno. A primeira nota tem
; peso 1, a segunda tem peso 2 e a terceira tem peso 3.
; Media = ((N1 ∗ 1) + (N2 ∗ 2) + (N3 ∗ 3))/6;
; ex : n1 = 5, n2= 5, n3 = 7
; 5 + 10 + 21
; 36/ 6 = 6
; Imprima a situação do aluno dependendo da sua média final:
; • “Aluno Aprovado” (para média maior ou igual a 7)
; • “Aluno em Avaliação Final” (para média maior ou igual a 4 e menor que 7)
; • “Aluno Reprovado” (para média menor que 4).

global main
extern scanf
extern printf

section .bss
    nota RESD 1
    n1 RESD 1
    n2 RESD 1
    n3 RESD 1

section .data
    saida_aprovado DB "Aluno Aprovado, nota: %d", 0xA, 0x0
    saida_af DB "Aluno em Avaliacao Final, nota: %d", 0xA, 0x0
    saida_reprovado DB "Aluno Reprovado, nota: %d", 0xA, 0x0
    tipo DB "%d", 0x0

section .text
main:
    ; leio as 3 notas
    push n1
    push tipo
    call scanf
    add esp, 8

    push n2
    push tipo
    call scanf
    add esp, 8

    push n3
    push tipo
    call scanf
    add esp, 8

    mov EAX, [n1]
    mov EBX, 1
    mul EBX ; eax *= ebx
    mov [nota], EAX

    mov EAX, [n2]
    mov EBX, 2
    mul EBX ; eax *= ebx
    add [nota], EAX

    mov EAX, [n3]
    mov EBX, 3
    mul EBX ; eax *= ebx
    add [nota], EAX

    mov EAX, [nota]
    mov EBX, 6
    div EBX ; eax /= ebx
    mov [nota], EAX

    cmp EAX, 7
    jge print_aprovado
    cmp EAX, 4
    jl print_reprovado

    push DWORD[nota]
    push saida_af
    call printf
    add esp, 8
    jmp fim

    print_aprovado:
        push DWORD[nota]
        push saida_aprovado
        call printf
        add esp, 8

    print_reprovado:
        push DWORD[nota]
        push saida_reprovado
        call printf
        add esp, 8

    fim:
    xor EAX, EAX
    ret
