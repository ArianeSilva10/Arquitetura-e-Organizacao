global calculo_ror:function
extern printf

section .bss
    valor resd 1

section .data
    valor_atual  db  11110000b  
    i                dd  0x0         
    limite           dd  0x3        
    
    saida_antg_ror db "valor antigo ror: %.8b", 0xA, 0x0
    saida_nova_ror db "valor novo ror: (%.8b >> %d): %.8b", 0xA, 0x0

section .text
calculo_ror:
    mov al, [valor_atual]  
    movzx eax, al               
    push eax                     
    push saida_antg_ror           
    call printf               
    add esp, 8                  
    
    mov ebx, [i]               

laco_ror:
    cmp ebx, [limite]            
    jae next_rol                 ; se EBX >= limite, salta para next_rol
    inc ebx                     

    mov ecx, dword[valor_atual]
    mov dword[valor], ecx
    
    mov al, [valor_atual]
    ror al, 1                    ; rotaciona à direita em AL
    mov [valor_atual], al
    
    movzx eax, al

    push eax                     
    push ebx                 
    push dword [valor]
    push saida_nova_ror          
    call printf               
    add esp, 16                 
    
    jmp laco_ror               
    
next_rol:
    ret                     