global funcao_soma: function

funcao_soma:
    push ebp
    mov ebp, esp
    sub esp, 4 ; reservo 4 bytes

    mov dword[ebp - 4], 5 ; guardo 5 nesses 4 bytes q reservei

    mov EAX, 0
    add EAX, dword[ebp + 8] ; eax = 0 + inicio da pilha(2)
    add EAX, dword[ebp - 4]; eax = eax + 5

    mov esp, ebp
    pop ebp
    ret
; #include
; int funcao(int x){
; int a = 5;
; int b = x;
;
; return a+b;
; }
; int main (){
; int soma;
; soma = funcao (2);
;
; printf("soma eh:%d \n", soma);
;
; return 0;
; }