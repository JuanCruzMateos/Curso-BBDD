package sistema.personas.pacientes;

import sistema.ambulancia.Ambulancia;
import sistema.temporizador.Util;

import java.io.Serializable;
import java.util.Objects;
import java.util.Random;

public class Asociado extends Paciente implements Runnable {
    private final Random rand = new Random();
    private int nroConsultas;

    public Asociado() {

    }

    public Asociado(String nombre, String apellido, String direccion, long telefono, int dni) {
        super(nombre, apellido, direccion, telefono, dni);
    }

    @Override
    public void run() {
        int k, i;

        for (i = 0; i < this.nroConsultas; i++) {
            k = this.rand.nextInt(2);
            if (k == 0)
                Ambulancia.getInstance().solicitudAtencionDomicilio(this);
            else
                Ambulancia.getInstance().solicitudTrasladoClinica(this);
            Util.esperarRand(10);
        }
    }

    @Override
    public boolean quedaEnSalaVipFrenteA(Paciente p) {
        return false;
    }

    @Override
    public boolean quedaNino() {
        return false;
    }

    @Override
    public boolean quedaJoven() {
        return false;
    }

    @Override
    public boolean quedaMayor() {
        return false;
    }

    public void setNroConsultas(int nroConsultas) {
        this.nroConsultas = nroConsultas;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Asociado asociado = (Asociado) o;
        return dni == asociado.dni;
    }

    @Override
    public int hashCode() {
        return Objects.hash(dni);
    }

    @Override
    public String toString() {
        return "Asociado{" +
                "nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", direccion='" + direccion + '\'' +
                ", telefono=" + telefono +
                ", dni=" + dni +
                '}';
    }
}
