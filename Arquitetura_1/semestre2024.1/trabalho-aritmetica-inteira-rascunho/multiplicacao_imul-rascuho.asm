global main
extern printf

section .bss
    flag resd 1

section .data
    valor_inicial  db  0xd
    i                dd  0x0      
    limite           dd  0x3    
    saida_valor_inicial db "valor antigo: %d, OF = %d", 0xA, 0x0
    saida_novo_valor db    "valor novo:   %d, OF = %d", 0xA, 0x0

section .text
multiplicacao_imul:   
    mov eax, [valor_inicial]
    
    lahf
    and ah, 1
    mov byte[flag], ah

    push dword[flag]
    push eax
    push saida_valor_inicial        
    call printf            
    add esp, 12         
    
    mov ebx, [i]                

laco_imul:
    stc
    cmp ebx, [limite]            
    jae next_imul                 
    inc ebx                      

    xor EAX, EAX
    mov eax, [valor_inicial]
    cmp byte[flag], 1
    jne _else
    _if:
        stc
        jmp _end_if
    _else:
        clc
     _end_if:

    mov ecx, -2
    imul ecx
    
    mov [valor_inicial], eax
    
    lahf
    and ah, 1
    mov byte[flag], ah
         
    push ebx ; preserva o contador

    push dword[flag]
    push dword [valor_inicial]
    push saida_novo_valor        
    call printf                 
    add esp, 12                 
    
    pop ebx
    jmp laco_imul               
    
next_imul:
    ret                          
main:
    mov ebp, esp                 
    call multiplicacao_imul             
    xor eax, eax                 
    ret                          
