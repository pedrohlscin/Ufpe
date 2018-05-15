package br.com.pedroso.infracom.tcp.client;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class ClientTcpN {
	public static void main(String argv[]) throws Exception {
		String sentence;
		String modifiedSentence;

		BufferedReader inFromUser = new BufferedReader(new InputStreamReader(System.in));

		Socket clientSocket = new Socket("localhost", 6789);

		while (true) {
			DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());

			BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));

			sentence = inFromUser.readLine();

			outToServer.writeBytes(sentence + '\n');

			if (sentence.equals("EXIT")) {
				break;
			}

			modifiedSentence = inFromServer.readLine();

			System.out.println("FROM SERVER: " + modifiedSentence);

		}
		clientSocket.close();
	}
}
