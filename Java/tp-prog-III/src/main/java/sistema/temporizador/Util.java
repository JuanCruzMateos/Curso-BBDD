package sistema.temporizador;

import java.util.Random;

public class Util {
    private static final Random rand = new Random();

    public static void esperar(int seg) {
        try {
            Thread.sleep(seg*1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void esperarRand(int seg) {
        try {
            Thread.sleep(Util.rand.nextInt(seg) * 1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
