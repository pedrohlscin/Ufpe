package br.com.pedroso.infracom.udp.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UdpClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("-1 to exit!");
		BufferedReader inFromUser = new BufferedReader(new InputStreamReader(System.in));
		while (!inFromUser.equals("-1")) {
			try (DatagramSocket clientSocket = new DatagramSocket()){
				InetAddress IPAddress = InetAddress.getByName("127.0.0.1");
				byte[] sendData = new byte[1024];
				byte[] receiveData = new byte[1024];
				String sentence = inFromUser.readLine();
				sendData = sentence.getBytes();
				DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, 1212);
				long init = System.nanoTime();
				clientSocket.send(sendPacket);
				DatagramPacket receivePkt = new DatagramPacket(receiveData, receiveData.length);
				long end = System.nanoTime();
				clientSocket.receive(receivePkt);
				String entrada = new String(receiveData, 0, receiveData.length);
				System.out.println("Rtt: " + ((end - init)/1000) + ", Texto recebido: " + entrada);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
