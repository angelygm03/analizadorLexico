package codigo; //nombre del paquete donde está el código
import static codigo.Tokens.*; //tokens del analizador léxico

//Declaraciones
%%
%class Lexer
%type Tokens
L=[a-zA-z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme; //clase pública
%}
%%

//Palabras reservadas
int {lexeme=yytext(); return Int;}
if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
while {lexeme=yytext(); return While;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"(" {lexeme=yytext(); return Parentesis_a;}
")" {lexeme=yytext(); return Parentesis_c;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
"main" {lexeme=yytext(); return Main;}
";" {lexeme=yytext(); return Punto_coma;}
{L}({L}{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")") | {D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
