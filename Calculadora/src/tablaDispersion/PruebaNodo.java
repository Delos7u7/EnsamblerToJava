/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tablaDispersion;

/**
 *
 * @author Intel
 */
public class PruebaNodo {
    public static void main(String[] args) {
        Nodo n1, n2, n3, aux;
        n1 = new Nodo();
        n2 = new Nodo("Hola", -7, n1);
        n3 = new Nodo("Mundo", -33, n2);
        
        aux = n3;
        
        System.out.println("n3 = " + aux.getLexema() + " " + aux.getAtributo()); 
        
        aux = aux.getSiguiente();
        
        System.out.println("n2 = " + aux.getLexema() + " " + aux.getAtributo()); 
       
        aux = aux.getSiguiente();
        
        System.out.println("n1 = " + aux.getLexema() + " " + aux.getAtributo()); 
    }
}
