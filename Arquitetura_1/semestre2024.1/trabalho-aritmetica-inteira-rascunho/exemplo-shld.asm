section .bss
    valor resd 1
section .text
global main
; tambem shrd

main:
    mov ebp, esp; for correct debugging
    mov ax, 0x0e0
    mov bx, 0x009d
    shld eax, ebx, 1
    
    mov dword[valor], eax
    
    mov eax, 0
    ret