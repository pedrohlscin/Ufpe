package br.com.pedroso.plc.thread;

public class HelloRunnable extends Thread{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Hello from thread.");
	}
	
	public static void main(String[] args) {
		new Thread(new HelloRunnable()).start();
	}
}
