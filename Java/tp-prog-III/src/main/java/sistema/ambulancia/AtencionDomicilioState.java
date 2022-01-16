package sistema.ambulancia;


public class AtencionDomicilioState implements IState {
    private final Ambulancia ambulancia;

    public AtencionDomicilioState(Ambulancia ambulancia) {
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
        this.ambulancia.setEstado(new RegresandoDeAtencionState(this.ambulancia));
        return true;
    }

    @Override
    public boolean solicitudReparacion() {
        return false;
    }

    @Override
    public String toString() {
        return "Estoy atendiendo a domicilio.";
    }
}
