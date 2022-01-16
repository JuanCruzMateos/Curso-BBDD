package sistema.ambulancia;

/**
 * Interfaz que modela los estimulos que puede recibir la ambulancia.
 */
public interface IState {
    boolean solicitudAtencionDomicilio();

    boolean solicitudTrasladoClinica();

    boolean solicitudVolverAClinica();

    boolean solicitudReparacion();
}
