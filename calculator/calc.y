%{
#include <stdlib.h>
#include <stdlib.h>
int flag=0;
%}

%token NUMBER
%left  '+' '-'
%left  '*' '/' '%'
%left  '(' ')'

//left and right are associativity operator, written below gets more precedence

%%
ArithmeticExpression : E{printf("\n Result = %d\n",$$);return 0;}
E                    : E '+' E {$$=$1+$3;}
                     | E '-' E {$$=$1-$3;}
                     | E '*' E {$$=$1*$3;}
                     | E '/' E {$$=$1/$3;}
                     | E '%' E {$$=$1%$3;}
                     | '('E')' {$$=$2;}
                     | NUMBER  {$$=$1;}
                     ;
%%

void main()
{
    printf("Enter expression : \n");
    yyparse();
    if(flag==0)
        printf("Expression is valid \n");
}

void yyerror(char *s)
{
    printf("invalid expression");
    flag=1;
}
