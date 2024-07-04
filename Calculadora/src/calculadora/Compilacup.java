package calculadora;

public class Compilacup {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String opciones[] = new String[5];

//Seleccionamos la opción de dirección de destino
        opciones[0] = "-destdir";

//Le damos la dirección
        opciones[1] = "src\\calculadora\\";

//Seleccionamos la opción de nombre de archivo
        opciones[2] = "-parser";

//Le damos el nombre que queremos que tenga
        opciones[3] = "AnalizadorSintactico";

//Le decimos donde se encuentra el archivo .cup
        opciones[4] = "src\\calculadora\\espsint.cup";

        try {
            java_cup.Main.main(opciones);
        } catch (Exception e) {
            System.out.print(e);
        }
    }
}
