%{
#include<stdio.h>
#include<stdlib.h>
%}

%token A B NL

%%
Stmt : A A A A A S B NL {printf("valid string\n");
                        exit(0);}
  ;
S : S A
  |
  ;
%%

int yyerror(char *s)
{
    printf("invalid string\n");
    exit(0);
}

int main()
{
    printf("Enter string\n");
    yyparse();
    return 0;
}




