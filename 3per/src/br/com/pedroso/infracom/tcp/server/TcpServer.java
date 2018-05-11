package br.com.pedroso.infracom.tcp.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class TcpServer {
	public static void main(String[] args) {
		try (ServerSocket socket = new ServerSocket(123123)){
			System.out.println("Porta aberta!");
			Socket cliente = socket.accept();
			TrataCliente trata = new TrataCliente(cliente);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
