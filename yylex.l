%{
#include "parser.tab.h"
#include <stdlib.h>
%}

symbol [=+\-*/\^()\n\%]


%%
0|[1-9][0-9]*      { yylval = atoi(yytext);  return NUM; }
{symbol}           { return yytext[0] ;}
" "                { }
%%


/*this called when yyin reached EOF*/
int yywrap(void) 
{
	return 1;
}

