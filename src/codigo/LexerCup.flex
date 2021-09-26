package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Gato */
( "#" ) {return new Symbol(sym.Gato, yychar, yyline, yytext());}

/* Dos Puntos */
( ":" ) {return new Symbol(sym.Dos_puntos, yychar, yyline, yytext());}

/* Ampersand */
( "&" ) {return new Symbol(sym.Ampersand, yychar, yyline, yytext());}

/* Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Punto */
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}

/* h */
( "h" ) {return new Symbol(sym.H, yychar, yyline, yytext());}

/* Flecha */
( "->" ) {return new Symbol(sym.Flecha, yychar, yyline, yytext());}

/* Simbolo "<<" */
( "<<" ) {return new Symbol(sym.Simbolo_cout, yychar, yyline, yytext());}

/* Simbolo ">>" */
( ">>" ) {return new Symbol(sym.Simbolo_cin, yychar, yyline, yytext());}

/* Tipos de datos */
( byte | char | long | float | double | enum | size_t) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}

/* Tipo de dato Int*/
( int ) {return new Symbol(sym.Entero, yychar, yyline, yytext());}

/* Tipo de dato String */
( string ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Palabra reservada this */
( this ) {return new Symbol(sym.This, yychar, yyline, yytext());}

/* Palabra reservada const */
( const ) {return new Symbol(sym.Const, yychar, yyline, yytext());}

/* Palabra reservada Return */
( return ) {return new Symbol(sym.Return, yychar, yyline, yytext());}

/* Palabra reservada Cin */
( cin ) {return new Symbol(sym.Cin, yychar, yyline, yytext());}

/* Palabra reservada Cout */
( cout ) {return new Symbol(sym.Cout, yychar, yyline, yytext());}

/* Palabra reservada Endl */
( endl ) {return new Symbol(sym.Endl, yychar, yyline, yytext());}

/* Palabras reservadas Especificadores */
( public | private | protected) {return new Symbol(sym.Especificador, yychar, yyline, yytext());}

/* Palabra reservada Class */
( class ) {return new Symbol(sym.Class, yychar, yyline, yytext());}

/* Palabra reservada Void */
( void ) {return new Symbol(sym.Void, yychar, yyline, yytext());}

/* Palabra reservada Include */
( include ) {return new Symbol(sym.Include, yychar, yyline, yytext());}

/* Palabra reservada using */
( using ) {return new Symbol(sym.Using, yychar, yyline, yytext());}

/* Palabra reservada namespace */
( namespace ) {return new Symbol(sym.Namespace, yychar, yyline, yytext());}

/* Palabra reservada std */
( std ) {return new Symbol(sym.Std, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operadores aritmeticos */
( "+" | "-" | "/" | % ) {return new Symbol(sym.Op_aritmetico, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/*Operador Relacionales */
( "<") {return new Symbol(sym.ParentesisAngular_a, yychar, yyline, yytext());}

/*Operador Relacionales */
( ">") {return new Symbol(sym.ParentesisAngular_c, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}