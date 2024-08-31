global main
extern printf

section .data
    valor_inicial  db  0b10001000
    i                dd  0x0      
    limite           dd  0x3    
    saida_valor_inicial db "valor antigo: %.8b, CF = %d", 0xA, 0x0
    saida_novo_valor db    "valor novo:   %.8b, CF = %d", 0xA, 0x0
    flag: db 0

section .text
calculo_rcl:
    clc
    mov al, [valor_inicial]

    lahf
    and ah, 1
    mov byte[flag], ah


    push dword[flag]             
    movzx eax, al             
    push eax
    mov al, [valor_inicial]
    push saida_valor_inicial        
    call printf            
    add esp, 12         
    
    mov ebx, [i]                

laco_rcl:
    clc

    cmp ebx, [limite]            
    jae next_rcl                 
    inc ebx                      

    xor EAX, EAX
    mov al, byte[valor_inicial]
  
    cmp byte[flag], 1
    jne _else
    _if:
        stc
        jmp _end_if
    _else:
        clc
    _end_if:

    rcl al, 1                  
    mov [valor_inicial], al
    
    lahf
    and ah, 1
    mov byte[flag], ah

    movzx eax, al
    push ebx ; preserva o contador

    push dword[flag]                    
    push dword [valor_inicial]
    push saida_novo_valor        
    call printf                 
    add esp, 12                 
    
    pop ebx
    jmp laco_rcl               
    
next_rcl:
    ret                          
main:
    mov ebp, esp                 
    call calculo_rcl             
    xor eax, eax                 

    ret                          
