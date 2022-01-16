package sistema.ambulatorio;

import sistema.excepciones.AsociadoExistenteException;
import sistema.excepciones.AsociadoInexistenteException;
import sistema.personas.pacientes.Asociado;

import java.io.Serializable;
import java.util.HashMap;

/**
 * Modolo cuya responsabilidad es la gestion de los asociados a la clinica.<br>
 */
public class ModuloAtencionAmbulatoria implements Serializable {
    private HashMap<Integer, Asociado> registroAsociados = new HashMap<>();

    public ModuloAtencionAmbulatoria() {

    }

    public void agregarAsociado(String nombre, String apellido, String direccion, Long long1, int dni) throws AsociadoExistenteException {
        if (this.registroAsociados.containsKey(dni))
            throw new AsociadoExistenteException("Asociado existente");
        this.registroAsociados.put(dni, new Asociado(nombre, apellido, direccion, long1, dni));
    }

    public void eliminarAsociado(int dni) throws AsociadoInexistenteException {
        if (!this.registroAsociados.containsKey(dni))
            throw new AsociadoInexistenteException("Asociado Inexistente", dni);
        else
            this.registroAsociados.remove(dni);
    }

    public HashMap<Integer, Asociado> getRegistroAsociados() {
        return registroAsociados;
    }

    public void setRegistroAsociados(HashMap<Integer, Asociado> registroAsociados) {
        this.registroAsociados = registroAsociados;
    }
}
