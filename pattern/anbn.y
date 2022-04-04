%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
%}

%token A B NL

%%
stmt : S NL {printf("valid string\n");
                exit(0);}
    ;
S    : A S B|
; 
%%

void yyerror(char *s){
    printf("invalid string\n");

}

int main()
{
    printf("enter message\n");
    yyparse();
    return 0;
}
