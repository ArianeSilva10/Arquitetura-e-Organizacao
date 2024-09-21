section .data
    fmt db "soma eh: %d", 10, 0       

section .bss
    res resd 1                        

section .text
    extern printf
    global main


soma:
    push ebp                        
    mov ebp, esp                     
    push ebx                        

    mov eax, [ebp + 8]               
    mov ecx, [ebp + 12]              
    xor edx, edx                   

loop_:
    test ecx, ecx                    
    jz loop_end                      
    add edx, eax                    
    inc eax                          
    dec ecx                        
    jmp loop_                  

loop_end:
    mov eax, edx                     
    pop ebx                          
    pop ebp                          
    ret                 

main:
    push 5                          
    push 1                         
    call soma                        
    add esp, 8                       

    push eax                        
    push fmt                         
    call printf                     
    add esp, 8                       

   mov eax, 1
   mov ebx, 0
   int 0x80
             


