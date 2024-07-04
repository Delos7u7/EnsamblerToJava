package calculadora;   
import java_cup.runtime.*;
import calculadora.VentanaEstructuraCLASS;
%%

%class AnalizadorLexico
%line
%column
%standalone
%cup

%{   


    private Symbol atiende(int code){
        return symbol(code);
    }
    
    private void muestra (String cad){
        VentanaEstructuraCLASS.agregarRes(cad);
        System.out.print(cad);
    }
    private void muestraln (String cad){
        VentanaEstructuraCLASS.agregarRes(cad+"\n");
        System.out.println(cad);
    }

    private int contador (){
        return   VentanaEstructuraCLASS.contador++;
    }
    private int contadorV (){
        return   VentanaEstructuraCLASS.contadorV++;
    }


    /* To create a new java_cup.runtime.Symbol with
        information about the current token, the token
        will have no value in this case. */
    private Symbol symbol(int type) {
          return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with
       information about the current token, but this
       object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    public boolean esEOF() // Es final de archivo??
    {
       return zzAtEOF;
    }
    public int linea(){ return yyline+1; }
    public int columna(){ return yycolumn+1; }
 
%}

%eofval{
  return symbol(sym.EOF);
%eofval}
%eof{
   muestraln( "José Ramón Paredes Pérez" );
%eof}

    numero = "-"? [0-9]+("."[0-9]*)?
    opRel  = "<"|"<="|">"|">="|"=="|"!="
    id     = [a-zA-Z_]+ ([a-zA-Z_]|[0-9])*
    texto =  [a-zA-Z0-9 ]+

%state COM_1, COM_N, CADENA, VOCALX
%%
<YYINITIAL> { 

    "//"        { yybegin(COM_1); }
    "/*"        { yybegin(COM_N); }
    "\""       { yybegin(CADENA);
                 return atiende(sym.COMILLA); }
    \'         { yybegin(VOCALX);
                 return atiende(sym.COMILLASIM); }
    "if"       { return atiende(sym.IF); }
    "else"     { return atiende(sym.ELSE); }
    "while"    { return atiende(sym.WHILE); }
    "do"       { return atiende(sym.DO); }
    "for"      { return atiende(sym.FOR); }
    "switch"   { return atiende(sym.SWITCH); }
    "case"     { return atiende(sym.CASE); }
    "default"  { return atiende(sym.DEFAULT); }
    "break"    { return atiende(sym.BREAK); }
    "private"  { return atiende(sym.PRIVADO); }
    "public"   { return atiende(sym.PUBLICO); }
    "static"   { return atiende(sym.STATIC); }
    "String"   { return atiende(sym.STRING); }
    "["        { return atiende(sym.COR); }
    "]"        { return atiende(sym.CORA); }
    "main"     { return atiende(sym.MAIN); }
    "int"      { return atiende(sym.ENTERO); }
    "System.out.println"      { return atiende(sym.SOUT); }
    "double"   { return atiende(sym.DOUBLE); }
    "char"     { return atiende(sym.CHAR); }
    "void"     { return atiende(sym.VOID); }
    "class"    { return atiende(sym.CLASS); }
    "("        { return atiende(sym.PARA); }
    ")"        { return atiende(sym.PARC); }
    "{"        { return atiende(sym.LLAVEA); }
    "}"        { return atiende(sym.LLAVEC); }
    {opRel}    { return atiende(sym.OPR); }
    "="        { return atiende(sym.IGUAL); }
    ";"        { return atiende(sym.PUNYCOM); }
    ":"        { return atiende(sym.DOS_P); }
    "+"        { return atiende(sym.MAS); }
    "-"        { return atiende(sym.MENOS); }
    ","        { return atiende(sym.COMA); }
    {numero}   { return atiende(sym.NUM); }
    {id}       { return atiende(sym.ID); }
  
    \n          { /* hacer nada */ }
     .          { /* hacer nada */ }
}

<COM_1> {
    \n          { yybegin(YYINITIAL); }
    .           { /* hacer nada */ }
}

<COM_N> {
    "*/"        { yybegin(YYINITIAL); }
    \n          { /* hacer nada */ }
    .           { /* hacer nada */ }
}
<CADENA> {
    "\""        { 
                  VentanaEstructuraCLASS.unaCadArray[ VentanaEstructuraCLASS.contador]=VentanaEstructuraCLASS.unaCad;
                  contador();
                  VentanaEstructuraCLASS.unaCad="";
                  yybegin(YYINITIAL);
                  return atiende(sym.COMILLA);
                }
    \n          { /* hacer nada */ }
    .           { VentanaEstructuraCLASS.unaCad+= yytext(); }
}
<VOCALX> {
    \'        { 
                  VentanaEstructuraCLASS.vocalx[VentanaEstructuraCLASS.contadorV]=VentanaEstructuraCLASS.vocal;
                  contadorV();
                  yybegin(YYINITIAL);
                  return atiende(sym.COMILLASIM);
                }
    \n          { /* hacer nada */ }
    .           { VentanaEstructuraCLASS.vocal = yytext().charAt(0); }
}