%{
int vowels=0;
int consto=0;
%}

%%
[aeiouAEIOU] {vowels++;}
[a-zA-Z] {consto++;}
%%

int yywrap()
{
    return 0;
}
int main()
{
    yylex();
    return 0;
}