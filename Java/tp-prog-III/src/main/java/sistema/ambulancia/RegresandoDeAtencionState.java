package sistema.ambulancia;


public class RegresandoDeAtencionState implements IState {
    private final Ambulancia ambulancia;

    public RegresandoDeAtencionState(Ambulancia ambulancia) {
        this.ambulancia = ambulancia;
    }

    @Override
    public boolean solicitudAtencionDomicilio() {
        this.ambulancia.setEstado(new AtencionDomicilioState(this.ambulancia));
        return true;
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
        return "Regresando de Atencion a Domicilio";
    }
}
