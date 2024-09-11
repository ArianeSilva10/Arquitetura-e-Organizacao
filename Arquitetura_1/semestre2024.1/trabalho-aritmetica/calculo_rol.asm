global calculo_rol:function
extern printf

section .bss
    a_rol resd 1
    valor resd 1

section .data
    i      dd 0x0     
    limite dd 0x3       
    saida_ant_rol db "valor antigo rol: %b", 0xA, 0x0
    saida_nov_rol db "valor novo rol: (%b << %d): %b", 0xA, 0x0

section .text
calculo_rol:
    mov al, 0b11110000         ; al = eax(8 bits)
    mov [a_rol], al          
    push dword [a_rol] 
    push saida_ant_rol      
    call printf               
    add esp, 8              
    
    mov ebx, [i]              
laco_rol:
    cmp ebx, [limite]       
    jae next_rol               ; se EBX >= limite, salta para next_rol
    inc ebx    
    
    mov ecx, dword[a_rol]
    mov dword[valor], ecx      

    mov al, [a_rol]            ; carrega o valor atual de a_rol em AL
    rol al, 1                  ; rotaciona a esquerda
    mov [a_rol], al            ; armazena o valor rotacionado em a_rol
    
    push dword [a_rol]       
    push ebx                  
    push dword [valor]       
    push saida_nov_rol        
    call printf             
    add esp, 16                
    
    jmp laco_rol            
    
next_rol:
    ret                                      
