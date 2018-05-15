package br.com.pedroso.infracom.tcp.server;

import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class TrataCliente extends Thread{

	Socket cliente_origem;
	Socket cliente_destino;

	public TrataCliente(Socket cliente) {
		// TODO Auto-generated constructor stub
		this.cliente_origem = cliente;
	}
	
	@Override
	public void run() {
		encaminhar_mensagem();
	}

	private void encaminhar_mensagem() {
		System.out.println("Cliente ip: " + this.cliente_origem.getInetAddress().getHostAddress());
		try {
			Scanner sc = new Scanner(this.cliente_origem.getInputStream());
			while(sc.hasNext()) {
				
			}
			sc.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
