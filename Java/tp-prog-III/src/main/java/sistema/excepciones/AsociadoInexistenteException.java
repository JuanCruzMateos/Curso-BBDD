package sistema.excepciones;

public class AsociadoInexistenteException extends Exception {
    private int dniInexistente;
    
    public AsociadoInexistenteException(String message, int dniInexistente) {
        super(message);
        this.dniInexistente = dniInexistente;
    }

    public int getDniInexistente() {
        return this.dniInexistente;
    }
}
