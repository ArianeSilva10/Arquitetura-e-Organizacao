global main
extern printf

section .bss
	a_shr resd 1

section .data
	i      dd 0x0
	limite dd 0x3
	v_shr  dd 0x80
	saida_ant_shr db "valor antigo shr: %d",0AH,0H
	saida_nov_shr db "valor novo shr %d x/ (2^%d): %d",0AH,0H

section .text
calculo_shr:
	mov eax, [v_shr]         ; Move o valor de v_shl para EAX
	mov [a_shr], eax         ; Armazena o valor de EAX em a_shl
	push DWORD [a_shr]       ; Coloca o valor de a_shl na pilha
	push saida_ant_shr       ; Coloca a string de formato na pilha
	call printf              ; Chama printf para imprimir o valor original
	add esp, 8               ; Limpa os argumentos de printf da pilha
	
	mov ebx, [i]             ; Move o valor de i para EBX (contador)
laco_shr:
	cmp ebx, [limite]        ; Compara o contador com o limite
	jae next_shr             ; Se EBX >= limite, sai do loop
	inc ebx                  ; Incrementa o contador
	mov eax, [a_shr]         ; Move o valor atual de a_shl para EAX
	shr eax, 1               ; Desloca à direita
	mov [a_shr], eax         ; Atualiza o valor de a_shl
	push DWORD [a_shr]       ; Coloca o novo valor de a_shl na pilha
	push ebx                 ; Coloca o contador (EBX) na pilha
	push DWORD [v_shr]       ; Coloca o valor original de v_shl na pilha
	push saida_nov_shr       ; Coloca a string de formato na pilha
	call printf              ; Chama printf para imprimir o novo valor
	add esp, 16              ; Limpa os argumentos de printf da pilha
	
	jmp laco_shr             ; Volta ao início do loop
	
next_shr:
	ret                      ; Retorna para a função chamadora

main:
	mov ebp, esp             ; Para debugging correto
	call calculo_shr         ; Chama a função calculo_shl

	xor EAX, EAX             ; Define EAX como 0 (valor de retorno)
	ret                      ; Retorna da função main
