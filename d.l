%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+|[0-9]+"."[0-9]* {
	yylval.real=(float)atof(yytext);
	return NUM;
}
meter {yylval.real=1.0; return meter;}
km {yylval.real=1.0; return km;}
inch {yylval.real=1.0; return inch;}
foot {yylval.real=1.0; return foot;}
yard {yylval.real=1.0; return yard;}
mile {yylval.real=1.0; return mile;}

to {return to;}
[\n] return *yytext;
[\t] ;
. yyerror("Invalid Command");

%%
int yywrap() {return 0;}
