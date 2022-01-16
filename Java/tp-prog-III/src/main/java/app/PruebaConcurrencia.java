package app;

import sistema.ambulancia.Ambulancia;
import sistema.excepciones.SimulacionImposibleExeption;
import sistema.personas.Operario;
import sistema.personas.pacientes.Asociado;
import sistema.simulacion.Simulacion;
import sistema.simulacion.ObservadorAmbulanciaConsola;
import sistema.temporizador.Temporizador;


public class PruebaConcurrencia {
    public static void main(String[] args) {
        Ambulancia ambulancia = Ambulancia.getInstance();
        ambulancia.setCantidadTotalSolicitudes(13);
        Asociado a1 = new Asociado("juan", "cruz", "almafuerte 1610", 4512154, 38443617);
        Asociado a2 = new Asociado("cande", "mateos", "matheu 1610", 5512154, 5443617);
        Asociado a3 = new Asociado("caro", "lina", "formosa 1610", 8812154, 36443617);

        Operario operario = new Operario();
        Temporizador temp = new Temporizador();
        Simulacion simulacion = new Simulacion(operario, temp);

        simulacion.agregarAsociado(a1, 2);
        simulacion.agregarAsociado(a2, 3);
        simulacion.agregarAsociado(a3, 5);

        simulacion.cantidadDeConultasOperario(3);

        try {
            simulacion.iniciarSimulacion(new ObservadorAmbulanciaConsola(Ambulancia.getInstance()));
        } catch (SimulacionImposibleExeption simulacionImposibleExeption) {
            System.out.println(simulacionImposibleExeption.getMessage());
        }
//        a1.setNroConsultas(2);
//        a2.setNroConsultas(3);
//        a3.setNroConsultas(5);
//        Thread t1 = new Thread(a1);
//        Thread t2 = new Thread(a2);
//        Thread t3 = new Thread(a3);
//
//        operario.setCantSolicitudes(3);
//        Thread opTreado = new Thread(operario);

//        t1.start();
//        t2.start();
//        t3.start();
//        opTreado.start();
//        temp.start();
    }
}
