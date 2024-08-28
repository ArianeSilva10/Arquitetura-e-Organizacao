global main
extern printf

section .bss
	a_shl resd 1

section .data
	i      dd 0
	limite dd 3
	v_shl  dd 5
	saida_ant_shl db "valor antigo shl: %d",0AH,0H
	saida_nov_shl db "valor novo shl %d x (2^%d): %d",0AH,0H

section .text
calculo_shl:
	mov eax, [v_shl]         ; Move o valor de v_shl para EAX
	mov [a_shl], eax         ; Armazena o valor de EAX em a_shl
	push DWORD [a_shl]       ; Coloca o valor de a_shl na pilha
	push saida_ant_shl       ; Coloca a string de formato na pilha
	call printf              ; Chama printf para imprimir o valor original
	add esp, 8               ; Limpa os argumentos de printf da pilha
	
	mov ebx, [i]             ; Move o valor de i para EBX (contador)
laco_shl:
	cmp ebx, [limite]        ; Compara o contador com o limite
	jae next_shl             ; Se EBX >= limite, sai do loop
	inc ebx                  ; Incrementa o contador
	mov eax, [a_shl]         ; Move o valor atual de a_shl para EAX
	shl eax, 1               ; Desloca à esquerda (multiplica por 2)
	mov [a_shl], eax         ; Atualiza o valor de a_shl
	push DWORD [a_shl]       ; Coloca o novo valor de a_shl na pilha
	push ebx                 ; Coloca o contador (EBX) na pilha
	push DWORD [v_shl]       ; Coloca o valor original de v_shl na pilha
	push saida_nov_shl       ; Coloca a string de formato na pilha
	call printf              ; Chama printf para imprimir o novo valor
	add esp, 16              ; Limpa os argumentos de printf da pilha
	
	jmp laco_shl             ; Volta ao início do loop
	
next_shl:
	ret                      ; Retorna para a função chamadora

main:
	mov ebp, esp             ; Para debugging correto
	call calculo_shl         ; Chama a função calculo_shl

	xor EAX, EAX             ; Define EAX como 0 (valor de retorno)
	ret                      ; Retorna da função main
