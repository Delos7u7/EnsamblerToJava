/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tablaDispersion;

/**
 *
 * @author Intel
 */
public class TablaHash {

    private Nodo[] tabla = new Nodo[13];

    public TablaHash() {
        for (int i = 0; i < tabla.length; i++) {
            tabla[i] = null;

        }
    }

    public void insertar(String lexema, int atributo) {
        int i = funcHash(lexema);
        if (tabla[i] == null) { //primer dato de la lista i
            tabla[i] = new Nodo(lexema,atributo,null);
        } else {
            Nodo aux = tabla[i];
            while (aux.getSiguiente() != null) {
                aux = aux.getSiguiente();
            }
            aux.setSiguiente(new Nodo(lexema,atributo,null));
        }
    }

    public String contenidoTabla() {
        String contenido = "";
        for (int i = 0; i < tabla.length; i++) {
            Nodo aux = tabla[i];
            contenido += "" + i + "-";
            while (aux != null) {
                contenido += aux.getLexema()+
                        "[" + aux.getAtributo() + "]" + "-";
                aux = aux.getSiguiente();
            }
            contenido += "\n";
        }
        return contenido;
    }

    private int funcHash(String dato) {
        int ind = 0;
        for (int i = 0; i < dato.length(); i++) {
            ind = ind + dato.charAt(i);
        }
        return ind % 13;
    }

}
