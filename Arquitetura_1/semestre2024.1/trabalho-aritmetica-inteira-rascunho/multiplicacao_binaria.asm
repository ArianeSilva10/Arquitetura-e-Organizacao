global main
extern printf

section .data
    valor_inicial  db  0x7b
    i                dd  0x0      
    limite           dd  0x3    
    saida_valor_inicial db "valor antigo: %d", 0xA, 0x0
    saida_novo_valor db    "valor novo:   %d", 0xA, 0x0

section .text
multiplicacao_binaria:   
    mov eax, [valor_inicial]

    push eax
    push saida_valor_inicial        
    call printf            
    add esp, 8         
    
    mov ebx, [i]                

laco_binaria:
    cmp ebx, [limite]            
    jae next_binaria                 
    inc ebx                      

    xor EAX, EAX
    mov eax, [valor_inicial]
    
    mov ecx, eax
    shl ecx, 2
    
    mov edx, eax
    shl edx, 5
    
    add ecx, edx
    mov eax, ecx
    
    mov [valor_inicial], eax
 
    push ebx ; preserva o contador

    push dword [valor_inicial]
    push saida_novo_valor        
    call printf                 
    add esp, 8                 
    
    pop ebx
    jmp laco_binaria               
    
next_binaria:
    ret                          
main:
    mov ebp, esp                 
    call multiplicacao_binaria             
    xor eax, eax                 
    ret                          
