package sistema.ambulancia;

import sistema.personas.pacientes.Asociado;

import java.util.Observable;

/**
 * Unica ambulancia de la clinica
 * Aplica Patron Singleton, State y Observer-Observable
 * Recurso compartido por los Threads
 */
@SuppressWarnings("deprecation")
public class Ambulancia extends Observable {
    private static Ambulancia instance;
    private IState estado;
    private int cantidadTotalSolicitudes;
    private int solicitudesProcesadas;

    private Ambulancia() {
        // Singleton
    }

    public synchronized static Ambulancia getInstance() {
        if (Ambulancia.instance == null) {
            Ambulancia.instance = new Ambulancia();
            Ambulancia.instance.setEstado(new DisponibleState(Ambulancia.instance));
        }
        return Ambulancia.instance;
    }

    /**
     * Setear el estado de la ambulancia, siguiendo patron State.<br>
     * El modificador de aceso es protected a fin de que solo puede ser invocado dentro del mismo paquete.<br>
     *
     * @param estado Nuevo estado de la ambulancia.<br>
     */
    protected void setEstado(IState estado) {
        this.estado = estado;
    }

    /**
     * Solicitud de atencion a domicilio por parte de un asociado.<br>
     * <b>Pre:</b> Asociado distinto de null.<br>
     * <b>Post:</b> El asociado es atendido.<br>
     *
     * @param asociado Asociado que solicita atencion a domicilio.<br>
     */
    public synchronized void solicitudAtencionDomicilio(Asociado asociado) {
        while (!this.estado.solicitudAtencionDomicilio()) {
            this.setChanged();
            this.notifyObservers("Rechazo Solicitud de Atencion a domicilio de " + asociado.getNombre() + "\n --- Situacion: " + this.estado);
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.solicitudesProcesadas += 1;
        this.setChanged();
        this.notifyObservers("Acepto Solicitud de Atencion a domicilio de " + asociado.getNombre() + "\n --- Situacion: " + this.estado);
        this.notifyAll();
    }

    /**
     * Solicitud de traslado a la clinica por parte de un asociado.<br>
     * <b>Pre:</b> Asociado distinto de null.<br>
     * <b>Post:</b> El asociado es trasladado a la clinica.<br>
     *
     * @param asociado Asociado que solicita el traslado.<br>
     */
    public synchronized void solicitudTrasladoClinica(Asociado asociado) {
        while (!this.estado.solicitudTrasladoClinica()) {
            this.setChanged();
            this.notifyObservers("Rechazo Solicitud de Traslado a Clinica de " + asociado.getNombre() + "\n --- Situacion: " + this.estado);
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.solicitudesProcesadas += 1;
        this.setChanged();
        this.notifyObservers("Acepto Solicitud de Traslado a Clinica de " + asociado.getNombre() + "\n --- Situacion: " + this.estado);
        this.notifyAll();
    }

    /**
     * Solicitud de retorno a la clinica por parte del temporizador.<br>
     */
    public synchronized void solicitudVolverAClinica() {
        while (!this.estado.solicitudVolverAClinica()) {
            this.setChanged();
            this.notifyObservers("Rechazo Solicitud de Regreso a Clinic \n --- Situacion: " + this.estado);
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.setChanged();
        this.notifyObservers("Acepto Solicitud de Regreso a Clinica" + "\n --- Situacion: " + this.estado);
        this.notifyAll();
    }

    /**
     * Solicitud de reparacion por parte del operario.<br>
     * <b>Post:</b> La ambulancia se dirije al taller.<br>
     */
    public synchronized void solicitudReparacion() {
        while (!this.estado.solicitudReparacion()) {
            this.setChanged();
            this.notifyObservers("Rechazo Solicitud de Reparacion\n --- Situacion: " + this.estado);
            try {
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.solicitudesProcesadas += 1;
        this.setChanged();
        this.notifyObservers("Acepto Solicitud de Reparacion\n --- Situacion: " + this.estado);
        this.notifyAll();
    }

    /**
     * Metodo auxiliar a la simulacion.<br>
     * Setea la cantidad de solicitudes que se haran a la ambulancia antes de iniciar la simulacion.<br>
     * <b>Pre: </b> cantidadTotalSolicitudes mayor a cero.<br>
     *
     * @param cantidadTotalSolicitudes cantidad de solicitudes que procesara la ambulancia.<br>
     */
    public void setCantidadTotalSolicitudes(int cantidadTotalSolicitudes) {
        this.cantidadTotalSolicitudes = cantidadTotalSolicitudes;
    }

    /**
     * Metodo auxiliar a la simulacion.<br>
     * Setea la cantidad de solicitudes procesadas por la ambulancia.<br>
     * <b>Pre: </b> Antes de inciar la simulacion debe invocarse con parametro cero.<br>
     *
     * @param solicitudesProcesadas cantidad de solicitudes procesadas.<br>
     */
    public void setSolicitudesProcesadas(int solicitudesProcesadas) {
        this.solicitudesProcesadas = solicitudesProcesadas;
    }

    /**
     * Control del fin de la simulacion.<br>
     *
     * @return true si se procesarion todas las solicitudes, false en cualquier otro caso.
     */
    public boolean finSimulacion() {
        return this.solicitudesProcesadas == this.cantidadTotalSolicitudes;
    }
}
