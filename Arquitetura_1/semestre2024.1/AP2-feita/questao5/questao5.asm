global main
extern printf
extern scanf

section .bss
    preco resd 1

section .data
    saida_barato db "Barato", 0xA, 0x0
    saida_normal db "Normal", 0xA, 0x0
    saida_caro db "Caro", 0xA, 0x0
    saida_muito_caro db "Muito Caro", 0xA, 0x0
    tipo db "%d", 0x0

section .text
main:
    lea eax, [preco]  
    push eax           
    push tipo          
    call scanf
    add esp, 8         

    mov eax, [preco]   
    cmp eax, 200     
    jge print_muito_caro
    cmp eax, 120       
    jge print_caro
    cmp eax, 80       
    jg print_normal

print_barato:
    push saida_barato
    call printf
    add esp, 4
    jmp fim

print_normal:
    push saida_normal
    call printf
    add esp, 4
    jmp fim

print_caro:
    push saida_caro
    call printf
    add esp, 4
    jmp fim

print_muito_caro:
    push saida_muito_caro
    call printf
    add esp, 4

fim:
    xor eax, eax
    ret
