global main 
extern printf
extern scanf

section .bss
    ano_nascimento  RESD 1
    ano_atual       RESD 1

section .data
    tipo db "%d", 0x0
    saida_anos db "%d anos", 0xA, 0x0
    saida_meses db "%d meses", 0xA, 0x0
    saida_dias db "%d dias", 0xA, 0x0

section .text
main:
    mov ebp, esp; for correct debugging
    push ano_nascimento
    push tipo
    call scanf
    add esp, 8

    push ano_atual
    push tipo
    call scanf
    add esp, 8

    mov eax, [ano_atual]
    sub eax, [ano_nascimento]
    mov ecx, eax

    push ecx
    
    push eax
    push saida_anos
    call printf
    add esp, 8

    pop ecx
    
    xor eax, eax
    mov ebx, 12
    mov edx, ecx

loop_meses:
    add eax, ebx
    dec edx
    jnz loop_meses

    cmp ecx, 0
    je zero_meses

    push ecx

    push eax
    push saida_meses
    call printf
    add esp, 8
    jmp fim_meses
    

zero_meses:
    mov eax, 0
    push eax
    push saida_meses
    call printf
    add esp, 8

fim_meses:
    
    pop ecx
    xor eax, eax
    mov ebx, 365
    mov edx, ecx

loop_dias:
    add eax, ebx
    dec edx
    jnz loop_dias

    cmp ecx, 0
    je zero_dias

    push eax
    push saida_dias
    call printf
    add esp, 8
    jmp fim_dias

zero_dias:
    mov eax, 0
    push eax
    push saida_dias
    call printf
    add esp, 8

fim_dias:

    xor eax, eax
    ret
