global funcao_soma: function
extern printf

funcao_soma:
    push ebp
    mov ebp, esp

    mov EAX, 0
    add EAX, dword[ebp + 8] ; soma para parâmetro
    add EAX, dword[ebp + 12] ; o retorno fica guardado em eax

    mov esp, ebp
    pop ebp
    ret
; #include
; int funcao(int x, int y);
; int main (){
; int soma;
; soma = funcao (2, 3);
;
; printf("soma eh:%d \n", soma);
; return 0;
; }
;
; int funcao(int x, int y){
; int a = x
; int b = y
;
; return a+b;
; }