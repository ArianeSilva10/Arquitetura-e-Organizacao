global calculo_sar:function
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
	mov eax, [v_sar]     
	mov [a_sar], eax        
	push DWORD [a_sar]     
	push saida_ant_sar     
	call printf          
	add esp, 8              
	
	mov ebx, [i]             
laco_sar:
	cmp ebx, [limite]      
	jae next_sar             ; se EBX >= limite, sai do loop
	inc ebx                

	mov eax, [a_sar]         ; move o valor atual de a_shl para EAX
	sar eax, 1               ; desloca
	mov [a_sar], eax         ; atualiza o valor de a_shl

	push DWORD [a_sar]    
	push ebx              
	push DWORD [v_sar]    
	push saida_nov_sar   
	call printf           
	add esp, 16          
	
	jmp laco_sar         
	
next_sar:
	ret                               
