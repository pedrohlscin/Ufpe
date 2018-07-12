package br.com.pedroso.plc;

public class Questao4 {

    private int count;

    public void down(){
        synchronized (this){
            while(count <= 0){
                try{
                    wait();
                }catch (InterruptedException ex){

                }
            }
            count--;
        }
    }

    public void up(){
        synchronized (this){
            count++;
            if(count == 1){
                notify();
            }
        }
    }

}
