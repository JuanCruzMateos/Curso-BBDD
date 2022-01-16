package sistema.temporizador;

import sistema.ambulancia.Ambulancia;

import java.util.Observable;
import java.util.Observer;

import javax.swing.JTextPane;

@SuppressWarnings("deprecation")
public class ObservadorAmbulanciaVentana implements Observer {
    private Ambulancia ambulancia;
    private JTextPane text;

    public ObservadorAmbulanciaVentana(Ambulancia ambulancia, JTextPane text) {
        this.ambulancia = ambulancia;
        this.text = text;
        ambulancia.addObserver(this);
    }

    @Override
    public void update(Observable o, Object arg) {
        if (o != this.ambulancia)
            throw new IllegalArgumentException();
        else
        	text.setText(text.getText() + "\n" + arg);
        	text.setText(text.getText() + "\n-------------------------------------------------------------------");
    }
}
