package sistema.simulacion;

import sistema.ambulancia.Ambulancia;
import sistema.excepciones.SimulacionImposibleExeption;
import sistema.personas.Operario;
import sistema.personas.pacientes.Asociado;
import sistema.temporizador.Temporizador;

import java.util.ArrayList;
import java.util.Observer;

/**
 * Clase responsable de la Simulacion.
 * Debe seleccionarse al menos un asociado para ejecutar la simulacion.
 */
@SuppressWarnings("deprecation")
public class Simulacion {
    private ArrayList<Thread> asociados = new ArrayList<>();
    private int cantidadTotalDeConsultas;
    private Operario operario;
    private Temporizador temporizador;

    public Simulacion(Operario operario, Temporizador temporizador) {
        this.operario = operario;
        this.temporizador = temporizador;
    }

    /**
     * Agregar un asociado para desarrollar la simulacion.<br>
     * <b>Pre: </b> asociado distinto de null, cantidad de consultas mayor a cero.<br>
     * <b>Post: </b> se agrega un asociado mas para la simulacion.br>
     *
     * @param asociado     Asociado a incluir en la simulacion.<br>
     * @param nroConsultas Cantidad de consultas que el asosiado hara.<br>
     */
    public void agregarAsociado(Asociado asociado, int nroConsultas) {
        this.cantidadTotalDeConsultas += nroConsultas;
        asociado.setNroConsultas(nroConsultas);
        this.asociados.add(new Thread(asociado));
    }

    /**
     * Setea cantidad de solicitudes del operario antes de inicial la simulacion.<br>
     * <b>Pre: </b>  cantidad de solicitudes mayor a cero.<br>
     *
     * @param cantidadSolicitudes cantidad de solicitudes que realizara el operario.<br>
     */
    public void cantidadDeConultasOperario(int cantidadSolicitudes) {
        this.cantidadTotalDeConsultas += cantidadSolicitudes;
        this.operario.setCantSolicitudes(cantidadSolicitudes);
    }

    /**
     * Inicia la simulacion. <br>
     * Para iniciar una simulacion es necesario que se haya agregado al menos un asociado, de lo contrario
     * se lanza la excepcion SimulacionImposibleExeption.<br>
     *
     * @param observer
     * @throws SimulacionImposibleExeption
     */
    public void iniciarSimulacion(Observer... observer) throws SimulacionImposibleExeption {
        if (this.asociados.isEmpty())
            throw new SimulacionImposibleExeption("Debe agregar mas asociados para ejecutar la simulacion");
        Ambulancia.getInstance().setCantidadTotalSolicitudes(this.cantidadTotalDeConsultas);
        Ambulancia.getInstance().setSolicitudesProcesadas(0);
        for (Thread asociado : this.asociados) {
            asociado.start();
        }
        Thread operarioThread = new Thread(this.operario);
        operarioThread.start();
        temporizador.start();
    }
}
