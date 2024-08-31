 global main
extern printf


section .data
    valor_inicial_ax dd 0x00e0
    valor_inicial_bx dd 0x009d 
    i                dd  0x0      
    limite           dd  0x3    
    saida_valor_inicial db "valor antigo a: %.8b, valor antigo b: %.8b", 0xA, 0x0
    saida_novo_valor db    "valor novo:     %p", 0xA, 0x0

section .text
calculo_shld:
    
    mov ax, [valor_inicial_ax]
    mov bx, [valor_inicial_bx]

    movzx eax, ax
    movzx ebx, bx

    push ebx           
    movzx eax, ax             
    push eax
    push saida_valor_inicial        
    call printf            
    add esp, 12         
    
    mov ebx, [i]                

laco_shld:

    cmp ebx, [limite]            
    jae next_shld                 
    inc ebx                      

    xor EAX, EAX
    mov eax, dword[valor_inicial_ax]
    mov ecx, dword[valor_inicial_bx]
    
    shld eax,ecx, 1             
    
    mov dword[valor_inicial_ax], eax
    
    push ebx ; preserva o contador

    push eax                    
    push saida_novo_valor        
    call printf                 
    add esp, 8                
    
    pop ebx
    jmp laco_shld               
    
next_shld:
    ret                          
main:
    mov ebp, esp                 
    call calculo_shld             
    xor eax, eax                 
    ret 