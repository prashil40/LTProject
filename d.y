%{
#include<stdio.h>
#include<math.h>
%}

%union{
int integer;
float real;
}

%token <real> NUM meter km inch foot yard mile
%token to
%type <real> S A1 A2 A3 A4 A5 A6 T
%%
S : NUM T {$$ =$1*$2;printf("Answer : %f",$$);};
T :   meter to A1 {$$ = $1*$3;}
    | km to A2  {$$ = $1*$3;} 
    | inch to A3 {$$ = $1*$3;} 
    | foot to A4 {$$ = $1*$3;} 
    | yard to A5 {$$ = $1*$3;} 
    | mile to A6 {$$ = $1*$3;} ;

A1 :  meter {$$=$1*1;}
    | km    {$$=$1*0.001;}
    | inch  {$$=$1*39.37008;}
    | foot  {$$=$1*3.28084;}
    | yard  {$$=$1*1.093613;}
    | mile  {$$=$1*0.0006213712;};

A2 :  meter {$$=$1*1000;}
    | km    {$$=$1*1;}
    | inch  {$$=$1*39370.1;}
    | foot  {$$=$1*3280.84;}
    | yard  {$$=$1*1093.61;}
    | mile  {$$=$1*0.621371;};

A3 :  meter {$$=$1*0.0254;}
    | km    {$$=$1*0.0000254;}
    | inch  {$$=$1*1;}
    | foot  {$$=$1*0.0833333;}
    | yard  {$$=$1*0.0277778;}
    | mile  {$$=$1*0.000015783;};

A4 :  meter {$$=$1*0.3048;}
    | km    {$$=$1*0.0003048;}
    | inch  {$$=$1*12;}
    | foot  {$$=$1*1;}
    | yard  {$$=$1*0.333333;}
    | mile  {$$=$1*0.000189394;};

A5 :  meter {$$=$1*0.9144;}
    | km    {$$=$1*0.0009144;}
    | inch  {$$=$1*36;}
    | foot  {$$=$1*3;}
    | yard  {$$=$1*1;}
    | mile  {$$=$1*0.000568182;};

A6 :  meter {$$=$1*1609.34;}
    | km    {$$=$1*1.60934;}
    | inch  {$$=$1*63360;}
    | foot  {$$=$1*5280;}
    | yard  {$$=$1*1760;}
    | mile  {$$=$1*1;};
%%

void yyerror(char* s){
	fprintf(stderr, "%s\n",s);
	return;
}

int main(int argc,char *argv[])
{
printf("Distance Convertor\n");
printf("Measurements are as below:\n\n meter \n km \n inch \n foot \n yard \n mile \n\n ");
printf("To convert any distance, write \"X meter to km\"\n");


int i,n=0;

printf("How many times would you like to use this converter\n");
scanf("%d\n",&n);
for( i=0;i<n*2;i++){
yyparse();
}
return 0;
}

