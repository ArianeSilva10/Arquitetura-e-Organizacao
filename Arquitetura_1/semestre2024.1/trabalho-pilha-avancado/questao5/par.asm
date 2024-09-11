global par: function

par:
    push ebp
    mov ebp, esp

    mov EAX, dword[ebp + 8]
    mov EBX, 2
    xor EDX, EDX
    div EBX ; divide o valor do parametro por 2
    ;pode retornar eax  q é o resultado da divisão ou edx q é o modulo

    mov esp, ebp
    pop ebp
    ret
; ================================
; #include
; void par(int x);
;
; int main()
; {
; int a;
; a = par(4);
;
; if(a == 0){
;   printf("par = %d", a);
;} else{
;   printf("impar=%d", a);
;}
; return 0;
;}
;
;void par(int x){
;   return x%2;
; }

