package sistema.ambulancia;


public class RegresandoDeTallerState implements IState {
    private final Ambulancia ambulancia;

    public RegresandoDeTallerState(Ambulancia ambulancia) {
        this.ambulancia = ambulancia;
    }

    @Override
    public boolean solicitudAtencionDomicilio() {
        return false;
    }

    @Override
    public boolean solicitudTrasladoClinica() {
        return false;
    }

    @Override
    public boolean solicitudVolverAClinica() {
        this.ambulancia.setEstado(new DisponibleState(this.ambulancia));
        return true;
    }

    @Override
    public boolean solicitudReparacion() {
        return false;
    }

    @Override
    public String toString() {
        return "Regresando del Taller";
    }
}
