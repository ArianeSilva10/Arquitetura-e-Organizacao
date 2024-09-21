section .data
    fmt_entrada db "%d", 0
    resultado db "triângulo: %s", 10, 0
    fmt_n_triangulo db "Não formam um triângulo", 10, 0
    tipo_equilatero db "Equilátero", 0
    tipo_isosceles db "Isósceles", 0
    tipo_escaleno db "Escaleno", 0

section .bss
    lado1 resd 1
    lado2 resd 1
    lado3 resd 1

section .text
    extern printf, scanf
    global main
    global _start

main:
    push dword lado1
    push dword fmt_entrada
    call scanf
    add esp, 8

    push dword lado2
    push dword fmt_entrada
    call scanf
    add esp, 8

    push dword lado3
    push dword fmt_entrada
    call scanf
    add esp, 8

    mov eax, [lado1]
    add eax, [lado2]
    cmp eax, [lado3]
    jle invalido

    mov eax, [lado1]
    add eax, [lado3]
    cmp eax, [lado2]
    jle invalido

    mov eax, [lado2]
    add eax, [lado3]
    cmp eax, [lado1]
    jle invalido

    mov eax, [lado1]
    mov ebx, [lado2]
    mov ecx, [lado3]

    cmp eax, ebx
    jne verificar_isosceles

    cmp eax, ecx
    jne verificar_isosceles

    push dword tipo_equilatero
    push dword resultado
    call printf
    add esp, 8
    jmp fim

verificar_isosceles:
    cmp ebx, ecx
    jne verificar_escaleno

    push dword tipo_isosceles
    push dword resultado
    call printf
    add esp, 8
    jmp fim

verificar_escaleno:
    push dword tipo_escaleno
    push dword resultado
    call printf
    add esp, 8

fim:
    mov eax, 1
    xor ebx, ebx
    int 0x80

invalido:
    push dword fmt_n_triangulo
    call printf
    add esp, 4
    jmp fim

    ret
