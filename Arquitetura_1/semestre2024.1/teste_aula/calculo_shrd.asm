global calculo_shrd:function
extern printf

section .data
    valor_inicial_ax dd 0x00e0
    valor_inicial_bx dd 0x009d 
    i                dd  0x0      
    limite           dd  0x3    
    saida_valor_inicial db "calculo shrd, valor antigo a: %b, valor antigo b: %b", 0xA, 0x0
    saida_novo_valor db    "valor novo:     %b", 0xA, 0x0

section .text
calculo_shrd:
    
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

laco_shrd:

    cmp ebx, [limite]            
    jae next_shrd                 
    inc ebx                      

    xor EAX, EAX
    mov eax, dword[valor_inicial_ax]
    mov ecx, dword[valor_inicial_bx]
    
    shrd eax,ecx, 1             
    
    mov dword[valor_inicial_ax], eax
    
    push ebx ; preserva o contador

    push eax                    
    push saida_novo_valor        
    call printf                 
    add esp, 8                
    
    pop ebx
    jmp laco_shrd               
    
next_shrd:
    ret                          