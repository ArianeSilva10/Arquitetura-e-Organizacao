;#include
; int main (){
; int a=5;
; printf("a=%d, eax=%d\n", a, a+2);
;
; return 0;
; }
global main
extern printf
extern fim

section .bss
    a RESD 1

section .data
    saida  DB "a=%d, eax=%d", 0xA, 0x0

section .text
main:
    mov dword[a], 5 ; a = 5

    xor EAX, EAX
    mov EAX, dword[a]
    add EAX, 2 ;eax = 5 +2

    push EAX
    push dword[a]
    push saida
    call printf
    add esp, 12 ; 4 bytes do printf + 4 bytes de 'a' + 4 bytes do resultado eax = 12

call fim