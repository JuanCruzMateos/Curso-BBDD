package sistema.simulacion;

import sistema.ambulancia.Ambulancia;

import java.util.Observable;
import java.util.Observer;

@SuppressWarnings("deprecation")
public class ObservadorAmbulanciaConsola implements Observer {
    private Ambulancia ambulancia;

    public ObservadorAmbulanciaConsola(Ambulancia ambulancia) {
        this.ambulancia = ambulancia;
        ambulancia.addObserver(this);
    }

    @Override
    public void update(Observable o, Object arg) {
        if (o != this.ambulancia)
            throw new IllegalArgumentException();
        else {
            System.out.println(arg);
            System.out.println("------------------------------------------------------------------------------------------------");
        }
    }
}
