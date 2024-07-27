segment .data
    tam_buffer equ 0xA

segment .bss
    buffer resb 0x1

segment .text

;-----------------------------------
; Saida no terminal da string
;-----------------------------------
mst_saida:
    call tamStr
    mov EAX, 0x4
    mov EBX, 0x1
    int 0x80
    ret

saidaResultado:
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, buffer
    mov EDX, tam_buffer
    int 0x80
ret

;-----------------------------------
; Calcular o tamanho da string
;-----------------------------------
; Entrada: valor da string em ECX
; Saída: tamanho da string em EDX
;-----------------------------------
tamStr:
    mov EDX, ECX
proxchar:
    cmp byte[EDX], 0xD
    jz terminei
    inc EDX
    jmp proxchar
terminei:
    sub EDX, ECX
    ret

section .data
    tit db 0xA, '+-------------------+', 0xA, 'Calculadora |', 0xA, '+-------------------+',0xA, 0xD
    obVal1 db 0xA, 'Valor 1:',0xA, 0xD
    obVal2 db 0xA, 'Valor 2:',0xA, 0xD
    opc1 db 0xA, '1. Adicionar', 0xD
    opc2 db 0xA, '2. Subtrair', 0xD
    opc3 db 0xA, '3. Multiplicar', 0xD
    opc4 db 0xA, '4. Dividir', 0xD
    msgOpc db 0xA, 'Deseja realizar?',0xA, 0xD
    msgErro db 0xA, 'Valor de Opção Inválido',0xA, 0xD
    p1 db 0xA, 'Processo de Adicionar',0xA, 0xD
    p2 db 0xA, 'Processo de Subtrair',0xA, 0xD
    p3 db 0xA, 'Processo de Multiplicar',0xA, 0xD
    p4 db 0xA, 'Processo de Dividir',0xA, 0xD
    msgFim db 0xA, 'Terminei',0xA, 0xD

section .bss
    opc resb 1
    num1 resb 1
    num2 resb 1
    novoN1 resb 1
    novoN2 resb 1

section .text
    global _start

_start:
     mov ECX, tit
     call mst_saida

;mostrar opcoes
    mov ECX, opc1
    call mst_saida
    mov ECX, opc2
    call mst_saida
    mov ECX, opc3
    call mst_saida
    mov ECX, opc4
    call mst_saida

;obter opcao
    mov ECX, msgOpc
    call mst_saida
    mov EAX, 0x3
    mov EBX, 0x0
    mov ECX, opc
    mov EDX, 0x3
    int 0x80

; converter e ir para o ponto correto
    mov ah, [opc]
    sub ah, '0'


;verifica se é correto
    cmp ah, 4
    jg mstErro
    cmp ah, 1
    jl mstErro
    
;obter valores
     mov ECX, obVal1
     call mst_saida
     mov EAX, 0x3
     mov EBX, 0x0
     mov ECX, num1
     mov EDX, 0x3
     int 0x80

;convertendo
    lea ESI, [num1]
    mov ECX, 0x3
    call string_to_int
    mov [novoN1], EAX
    ret

     mov ECX, obVal2
     call mst_saida
     mov EAX, 0x3
     mov EBX, 0x0
     mov ECX, num2
     mov EDX, 0x3
     int 0x80

    lea ESI, [num2]
    mov ECX, 0x3
    call string_to_int
    mov [novoN2], EAX
    ret

; selecionar o ponto

; converter e ir para o ponto correto
    mov ah, [opc]
    sub ah, '0'


    cmp ah, 1
    je adicionar
    cmp ah, 2
    je subtrair
    cmp ah, 3
    je multiplicar
    cmp ah, 4
    je dividir


saida:
    mov ECX, msgFim
    call mst_saida

    mov EAX, 0x1
    mov EBX, 0x0
    int 0x80

;Funções a serem realizadas
adicionar:
    mov ECX, p1
    call mst_saida
    mov EAX, [novoN1]
    mov EBX, [novoN2]
    add EAX, EBX
    call int_to_string
    call saidaResultado
    jmp saida

subtrair:
    mov ECX, p2
    call mst_saida
    mov EAX, [num1]
    mov EBX, [num2]
    sub EAX, EBX
    mov ECX, [EAX]
    call mst_saida
    jmp saida

multiplicar:
    mov ECX, p3
    call mst_saida
    mov EAX, [num1]
    mov EBX, [num2]
    imul EAX, EBX
    mov ECX, [EAX]
    call mst_saida
    jmp saida

dividir:
    mov ECX, p4
    call mst_saida
    mov EAX, [num1]
    mov EBX, [num2]
    div EBX
    mov ECX, [EAX]
    call mst_saida
    jmp saida

mstErro:
    mov ECX, msgErro
    call mst_saida
    jmp saida

string_to_int:
    xor EBX, EBX
.prox_digito:
    movzx EAX, byte[ESI]
    inc ESI
    sub al, '0'
    imul EBX, 0xA
    add EBX, EAX
    loop .prox_digito
    ret

int_to_string:
    lea ESI, [buffer]
    add ESI, 0x9
    mov byte[ESI], 0xA
    mov EBX, 0xA

.prox_digito
    xor EDX, EDX
    div EBX
    add dl, '0'
    dec ESI
    mov [ESI], dl
    test EAX, EAX
    jnz .prox_digito
    ret