global main
extern printf

section .data
    array dd 10, 20, 30, 40
    fmt db "%d ", 0x0  

section .text
main:
    mov ebp, esp    

    mov eax, [array + 12]  
    
    mov ecx, 3             
    lea esi, [array + 8]   
    
rotacao:
    mov edx, [esi]         
    mov [esi + 4], edx     
    sub esi, 4             
    loop rotacao           

    mov [array], eax       

    mov ecx, 4             
    lea esi, [array]       

print_loop:
    mov eax, [esi]         
    push eax               
    push fmt               
    call printf            
    add esp, 8             
    add esi, 4             
    loop print_loop        

    xor eax, eax           
    ret
