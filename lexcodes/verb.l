%{
%}

%%
[\t]+ ;
"is"|"am"|"are"|"were"|"was"|"be"|"being"|"do"|"does"|"will"|"would"|"should"|"have"|"had"|"go" {printf("\nverb: %s",yytext);}
"to"|"from"|"behind"|"above"|"below"|"between"|"below" { printf("preposition:%s\n", yytext);}
[a-zA-Z]+ ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}