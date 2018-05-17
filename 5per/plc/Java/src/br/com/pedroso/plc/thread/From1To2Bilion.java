package br.com.pedroso.plc.thread;

public class From1To2Bilion extends Thread{

	public volatile int count = 0;
	private int end;
	private int start;

	public From1To2Bilion(int start, int end) {
		this.start = start;
		this.end = end;
	}

	@Override
	public void run() {
		for (int i = start; i < end; i++) {
			System.out.println(Thread.currentThread().getName() + " printed " + count);
			count++;
		}
	}
}
