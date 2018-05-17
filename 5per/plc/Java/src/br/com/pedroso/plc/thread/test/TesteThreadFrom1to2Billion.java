package br.com.pedroso.plc.thread.test;

import br.com.pedroso.plc.thread.From1To2Bilion;

public class TesteThreadFrom1to2Billion {

	public static void main(String[] args) throws InterruptedException {
		Thread threads[] = new Thread[4];
		for(int i = 0; i < 4; i++) {
			threads[i] = new Thread(new From1To2Bilion(0, 1000000));
			threads[i].start();
		}
		for(int i = 0; i < 4; i++)
			threads[i].join();
	}

}
