package br.com.pedroso;

public class SerialThread {
    public static void main(String[] args) throws InterruptedException {
        double ini = System.currentTimeMillis();
        Thread[] threads = new Thread[50];
        for (int i = 0; i < 50; i++) {
            threads[i] = new CalculaFat();
            threads[i].start();
        }
        for (int i = 0; i < 50; i++) {
            threads[i].join();
        }
        double fim = System.currentTimeMillis();
        System.out.println("Finished all threads in: " + (fim-ini)/1000);
    }
}
