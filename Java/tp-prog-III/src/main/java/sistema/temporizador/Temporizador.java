package sistema.temporizador;

import sistema.ambulancia.Ambulancia;

/**
 * Temporizador
 * Solicita a la ambulancia el retorno a la clinica.
 */
public class Temporizador extends Thread {
    @Override
    public void run() {
        while (!Ambulancia.getInstance().finSimulacion()) {
            Ambulancia.getInstance().solicitudVolverAClinica();
            Util.esperarRand(10);
        }
        Ambulancia.getInstance().solicitudVolverAClinica();
//        System.out.println("fin contador");
    }
}
