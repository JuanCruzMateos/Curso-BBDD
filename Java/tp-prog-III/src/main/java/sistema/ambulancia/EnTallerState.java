package sistema.ambulancia;


public class EnTallerState implements IState {
    private final Ambulancia ambulancia;

    public EnTallerState(Ambulancia ambulancia) {
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
        this.ambulancia.setEstado(new RegresandoDeTallerState(this.ambulancia));
        return true;
    }

    @Override
    public boolean solicitudReparacion() {
        return false;
    }

    @Override
    public String toString() {
        return "En el taller";
    }
}
