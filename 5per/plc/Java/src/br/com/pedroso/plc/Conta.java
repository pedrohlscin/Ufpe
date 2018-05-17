package br.com.pedroso.plc;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Conta {
	private Lock l = new ReentrantLock();
	private double saldo;
	
	void transferir(Conta dest, double money) {
		boolean t1 = l.tryLock();
		boolean t2 = dest.l.tryLock();
		try {
			while(!(t1 && t2)){
				if(t1) l.unlock();
				if(t2) dest.l.unlock();
				t1 = l.tryLock(); t2 = dest.l.tryLock();
			}
			this.saldo -= money;
			dest.saldo += money;
		}finally {
			if(t1) l.unlock();
			if(t2) dest.l.unlock();
		}
	}
}
