global main
extern printf

section .data
    valor_inicial  db  100d
    i                dd  0x0      
    limite           dd  0x3    
    saida_valor_inicial db "funcao div, valor antigo: %d", 0xA, 0x0
    saida_novo_valor db    "valor novo:   %d, mod = %d", 0xA, 0x0

section .text
multiplicacao_div:   
    mov eax, [valor_inicial]

    push eax
    push saida_valor_inicial        
    call printf            
    add esp, 8        
    
    mov ebx, [i]                

laco_div:
    cmp ebx, [limite]            
    jae next_div                 
    inc ebx                      

    xor EAX, EAX
    xor EDX, EDX
    mov eax, [valor_inicial]
    mov ecx, 0x3
    div ecx
    
    mov [valor_inicial], eax

    push ebx ; preserva o contador

    push edx
    push dword [valor_inicial]
    push saida_novo_valor        
    call printf                 
    add esp, 12                 
    
    pop ebx
    jmp laco_div               
    
next_div:
    ret      
    
main:
    mov ebp, esp                 
    call multiplicacao_div             
    xor eax, eax                 
    ret                     