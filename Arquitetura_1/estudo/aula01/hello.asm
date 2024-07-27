section .data
    msg db 'Hello World!', 0xA ; 0xA - significa a quebra de linha
                            ; de acordo com a tabela ASCII (10)
    tam equ $- msg  ; equ - significa igual à **** aí 
                    ; pega o numero de caracteres

section .text ; início do código

global _start
_start:
    mov EAX, 0X4 ; fazer uma saida
    mov EBX, 0X1 ; quero uma saida pra saida padrão
    mov ECX, msg ; quero que esta seja a saida (quero que imprima msg)
    mov EDX, tam ; e a saida que eu quero tem esse tamanho
    int 0x80 ; pegue estas informações e execute

saida:
    mov EAX, 0x1 ; informo ao código de que o programa vai encerrar
    mov EBX, 0x0 ; espécie de 'return 0 ' de assembly,
                ; para garantir que o programa foi executado com sucesso
    int 0x80 ; pegue as informações e executa