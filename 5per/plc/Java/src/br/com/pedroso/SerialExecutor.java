package br.com.pedroso;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class SerialExecutor {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(5);
        double ini = System.currentTimeMillis();
        for (int i = 0; i < 50; i++) {
            Runnable cf = new CalculaFat();
            executor.execute(cf);
        }
        executor.shutdown();
        while(!executor.isTerminated()){}
        double fim = System.currentTimeMillis();
        System.out.println("Finished all threads in: " + (fim-ini)/1000);
    }
}

class CalculaFat extends Thread {

    long fat(long i) {
        if (i == 0 || i == 1)
            return i;
        else return fat(i - 1) + fat(i - 2);
    }

    public void run() {
        for (int i = 0; i < 20; i++) {
            System.out.println(fat(i));
        }
    }
}
