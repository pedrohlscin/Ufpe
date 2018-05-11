package br.com.pedroso.infracom.udp.server;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UdpServer {
	public static void main(String[] args) {
		try (DatagramSocket socket = new DatagramSocket(1212)){
			System.out.println("Aguardando pacotes..");
			byte[] buff_in = new byte[1024];
			byte[] buff_out = new byte[1024];
			int port;
			while(true) {
				DatagramPacket receivePkt = new DatagramPacket(buff_in, buff_in.length);
				socket.receive(receivePkt);
				String entrada = new String(buff_in, 0, buff_in.length);
				InetAddress ipAddressSource = receivePkt.getAddress();
				port = receivePkt.getPort();
				
				System.out.println("Entrada recebida ~> " + entrada);
				
				buff_out = "Recebida!".getBytes();
				DatagramPacket sendPkt = new DatagramPacket(buff_out, buff_out.length, ipAddressSource, port);
				socket.send(sendPkt);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
