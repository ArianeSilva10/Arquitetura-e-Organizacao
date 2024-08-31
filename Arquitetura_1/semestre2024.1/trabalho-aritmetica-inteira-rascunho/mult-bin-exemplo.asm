section .text
global main
; multiplicacao binaria
main:
    mov ebp, esp; for correct debugging
    mov eax, 0x7B  
    mov ecx, eax
    shl ecx, 2
   
    mov edx, eax
    shl edx, 5
     
    add ecx, edx 
    
    mov eax, 0
    ret