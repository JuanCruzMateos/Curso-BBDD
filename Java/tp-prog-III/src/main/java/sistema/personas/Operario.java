package sistema.personas;

import sistema.ambulancia.Ambulancia;
import sistema.temporizador.Util;

@SuppressWarnings("deprecation")
public class Operario extends Persona implements Runnable {
    private int cantSolicitudes;

    public Operario() {

    }

    public void setCantSolicitudes(int cantSolicitudes) {
        this.cantSolicitudes = cantSolicitudes;
    }

    public int getCantSolicitudes() {
        return cantSolicitudes;
    }

    @Override
    public void run() {
        int i;

        for (i = 0; i < this.cantSolicitudes; i++) {
            Ambulancia.getInstance().solicitudReparacion();
            Util.esperarRand(10);
        }
    }
}
