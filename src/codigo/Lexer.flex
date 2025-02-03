package codigo; //nombre del paquete donde está el código
import static codigo.Tokens.*; //tokens del analizador léxico

//Declaraciones
%%
%class Lexer
%type Tokens
L=[a-zA-z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme; //clase pública
%}
%%

//Palabras reservadas
int |
if |
else |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
{L}({L}{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")") | {D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
