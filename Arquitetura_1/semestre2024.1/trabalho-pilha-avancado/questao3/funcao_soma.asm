global funcao_soma: function
extern printf

section .bss
    soma RESD 1

section .data
    saida DB "soma eh %d", 0xA, 0x0

section .text
funcao_soma:
    push ebp
    mov ebp, esp
    sub esp, 8

    mov dword[ebp - 4], 5
    mov dword[ebp - 8], 2

    mov EAX, 0
    add EAX, dword[ebp - 4]
    add EAX, dword[ebp - 8]

    mov [soma], EAX

    push dword[soma]
    push saida
    call printf
    add esp, 8

    mov esp, ebp
    pop ebp
    ret
; #include
; void funcao (){
; int a = 5;
; int b = 2;
; int soma = a+b;
; printf("A soma eh: %d", soma);
; }
; int main (){
;
; soma ();
;
; return 0;
; }