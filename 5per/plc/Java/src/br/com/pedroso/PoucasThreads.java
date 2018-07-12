package br.com.pedroso;

import java.util.ArrayDeque;
import java.util.Queue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class PoucasThreads implements Runnable{
    private final Queue<Runnable> tarefas;
    private final ExecutorService pool;

    public PoucasThreads() {
        this.tarefas = new ArrayDeque<>();
        this.pool = Executors.newFixedThreadPool(10);
    }

    @Override
    public void run() {
        int count = 0, i = 0;
        while(i < 100000){
            count += 1;
            i++;
        }
    }

    public static void main(String[] args){

    }

}
