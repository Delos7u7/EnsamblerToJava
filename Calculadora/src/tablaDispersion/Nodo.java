/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tablaDispersion;

/**
 *
 * @author Intel
 */
public class Nodo {
    private String lexema;
    private int atributo;
    private Nodo siguiente; 

    public Nodo() {
        lexema = "";
        atributo = -1;
        siguiente = null;
    }

    public Nodo(String lexema, int atributo, Nodo siguiente) {
        this.lexema = lexema;
        this.atributo = atributo;
        this.siguiente = siguiente;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }

    public Nodo getSiguiente() {
        return siguiente;
    }

    public void setSiguiente(Nodo siguiente) {
        this.siguiente = siguiente;
    }

    public int getAtributo() {
        return atributo;
    }

    public void setAtributo(int atributo) {
        this.atributo = atributo;
    }
    
    
    
    
}
