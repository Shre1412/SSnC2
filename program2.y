%{
#include <stdio.h>
%}
%token A B
%%
Str:S '\n'
S:A S1 B|B
S1:;|A S1;
%%
int main(){
printf("Enter the String: ");
if(yyparse() == 0)
printf("\nValid String! ");
return 0;
}
yyerror()
{
printf("\nInvalid String");
return 1;
}


$lex program2.l
$yacc -d program2.y
$cc -c lex.yy.c y.tab.c
$cc -o a.out lex.yy.o y.tab.o -ll
$./a.out
