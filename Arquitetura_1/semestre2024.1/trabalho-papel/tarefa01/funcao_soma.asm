global funcao_soma: function

funcao_soma:
    push ebp
    mov ebp, esp
    sub esp, 8

    mov dword[ebp - 4], 2
    mov EAX, 0
    add EAX, dword[ebp - 4]
    mov dword[ebp - 8], 4
    add EAX, dword[ebp - 8]

    mov esp, ebp
    pop ebp
    ret
; ================================
; #include
; void funcao(int x, int y);
;
; int main()
; {
; int soma;
; soma = funcao();
;
; printf("soma eh %d\n", soma);
; return 0;
; }
;
; void funcao(){
;   int a = 2;
;   int b = 4;
;   return a+b;
; }

