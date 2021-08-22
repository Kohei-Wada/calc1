%{
#include <stdio.h>
#include <ctype.h>
%}

%token NUM
%left '+' '-'
%left '*' '/' '%'


%%
line : 
	 | line expr  '\n'  { printf("%d\n", $2); YYACCEPT;}
	 | line error '\n' { yyerrok; }
	 ;

expr : expr '+' expr  { $$ = $1 + $3; }
 	 | expr '-' expr  { $$ = $1 - $3; }
	 | expr '*' expr  { $$ = $1 * $3; }
	 | expr '%' expr  { $$ = $1 % $3; }
	 | expr '/' expr  { $$ = $1 / $3; }
	 | '(' expr ')'   { $$ = $2; }
	 | NUM            { $$ = $1; }
	 ; 
%%


void yyerror(char *s)
{
	fprintf(stderr, "%s\n", s);
}

int main(int argc, char **argv)
{
	yyparse();
	return 0;
}

