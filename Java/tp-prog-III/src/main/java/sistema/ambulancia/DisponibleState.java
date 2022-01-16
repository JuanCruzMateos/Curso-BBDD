package sistema.ambulancia;

/**
 * Modela estado disponible en clinica.
 */
public class DisponibleState implements IState {
    private final Ambulancia ambulancia;

    public DisponibleState(Ambulancia ambulancia) {
        this.ambulancia = ambulancia;
    }

    @Override
    public boolean solicitudAtencionDomicilio() {
        this.ambulancia.setEstado(new AtencionDomicilioState(this.ambulancia));
        return true;
    }

    @Override
    public boolean solicitudTrasladoClinica() {
        this.ambulancia.setEstado(new TrasladoAClinicaState(this.ambulancia));
        return true;
    }

    @Override
    public boolean solicitudVolverAClinica() {
        return false;
    }

    @Override
    public boolean solicitudReparacion() {
        this.ambulancia.setEstado(new EnTallerState(this.ambulancia));
        return true;
    }

    @Override
    public String toString() {
        return "Disponible en Clinica";
    }
}
