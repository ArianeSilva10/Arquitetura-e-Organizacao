global calculo_shr:function
extern printf

section .bss
	a_shr resd 1

section .data
	i      dd 0x0
	limite dd 0x3
	v_shr  dd 0x80
	saida_ant_shr db "valor antigo shr: %d",0AH,0H
	saida_nov_shr db "valor novo shr %d / (2^%d): %d",0AH,0H

section .text
calculo_shr:
	mov eax, [v_shr]      
	mov [a_shr], eax        
	push DWORD [a_shr]      
	push saida_ant_shr      
	call printf             
	add esp, 8            
	
	mov ebx, [i]          
laco_shr:
	cmp ebx, [limite]      
	jae next_shr             ; se EBX >= limite, sai do loop
	inc ebx                 
	mov eax, [a_shr]         ; move o valor atual de a_shl para EAX
	shr eax, 1               ; desloca
	mov [a_shr], eax         ; atualiza o valor de a_shl
	push DWORD [a_shr]     
	push ebx              
	push DWORD [v_shr]     
	push saida_nov_shr     
	call printf            
	add esp, 16           
	
	jmp laco_shr         
	
next_shr:
	ret          