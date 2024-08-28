global main
extern printf

section .bss
	a_sar resd 1

section .data
	i      dd 0x0
	limite dd 0x3
	v_sar  dd -80h
	saida_ant_sar db "valor antigo sar: %d",0AH,0H
	saida_nov_sar db "valor novo sar %d / (2^%d): %d",0AH,0H

section .text
calculo_sar:
	mov eax, [v_sar]         ; Move o valor de v_shl para EAX
	mov [a_sar], eax         ; Armazena o valor de EAX em a_shl
	push DWORD [a_sar]       ; Coloca o valor de a_shl na pilha
	push saida_ant_sar       ; Coloca a string de formato na pilha
	call printf              ; Chama printf para imprimir o valor original
	add esp, 8               ; Limpa os argumentos de printf da pilha
	
	mov ebx, [i]             ; Move o valor de i para EBX (contador)
laco_sar:
	cmp ebx, [limite]        ; Compara o contador com o limite
	jae next_sar             ; Se EBX >= limite, sai do loop
	inc ebx                  ; Incrementa o contador
	mov eax, [a_sar]         ; Move o valor atual de a_shl para EAX
	sar eax, 1               ; Desloca à direita
	mov [a_sar], eax         ; Atualiza o valor de a_shl
	push DWORD [a_sar]       ; Coloca o novo valor de a_shl na pilha
	push ebx                 ; Coloca o contador (EBX) na pilha
	push DWORD [v_sar]       ; Coloca o valor original de v_shl na pilha
	push saida_nov_sar       ; Coloca a string de formato na pilha
	call printf              ; Chama printf para imprimir o novo valor
	add esp, 16              ; Limpa os argumentos de printf da pilha
	
	jmp laco_sar             ; Volta ao início do loop
	
next_sar:
	ret                      ; Retorna para a função chamadora

main:
	mov ebp, esp             ; Para debugging correto
	call calculo_sar         ; Chama a função calculo_shl

	xor EAX, EAX             ; Define EAX como 0 (valor de retorno)
	ret                      ; Retorna da função main
