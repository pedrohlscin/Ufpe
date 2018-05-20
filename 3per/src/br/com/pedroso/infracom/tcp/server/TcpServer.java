package br.com.pedroso.infracom.tcp.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class TcpServer {
	ArrayList<Socket> s;

	public TcpServer() {
		this.s = new ArrayList<>();
	}

	public static void main(String args[]) {
		TcpServer server = new TcpServer();
		ServerSocket ss2 = null;
		System.out.println("Server Listening......");
		try {
			ss2 = new ServerSocket(4445); // can also use static final PORT_NUM , when defined

		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Server error");

		}

		while (true) {
			try {
				Socket s = ss2.accept();
				server.s.add(s);
				System.out.println("connection Established");
				ServerThread st = new ServerThread(s, server.s);
				st.start();

			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("Connection Error");

			}
		}

	}

}

class ServerThread extends Thread {

	String line = null;
	BufferedReader is = null;
	volatile ArrayList<PrintWriter> os = null;
	Socket s = null;
	volatile ArrayList<Socket> clients = null;

	public ServerThread(Socket s, ArrayList<Socket> clients) {
		this.clients = clients;
		this.s = s;
		if (this.os == null)
			this.os = new ArrayList<>();
	}

	public void run() {
		try {
			is = new BufferedReader(new InputStreamReader(s.getInputStream()));
			for (Socket socket : clients) {
				if (socket != s)
					os.add(new PrintWriter(s.getOutputStream()));
			}

		} catch (IOException e) {
			System.out.println("IO error in server thread");
		}

		try {
			line = is.readLine();
			while (line.compareTo("QUIT") != 0) {
				for (var writer : os) {
					writer.println(line);
					writer.flush();
					System.out.println("Response to Client  :  " + line);
					line = is.readLine();
				}
			}
		} catch (IOException e) {

			line = this.getName(); // reused String line for getting thread name
			System.out.println("IO Error/ Client " + line + " terminated abruptly");
		} catch (NullPointerException e) {
			line = this.getName(); // reused String line for getting thread name
			System.out.println("Client " + line + " Closed");
		}

		finally {
			try {
				System.out.println("Connection Closing..");
				if (is != null) {
					is.close();
					System.out.println(" Socket Input Stream Closed");
				}

				if (os != null) {
					for (PrintWriter printWriter : os) {
						printWriter.close();
						System.out.println("Socket Out Closed");
					}
				}
				if (s != null) {
					s.close();
					System.out.println("Socket Closed");
				}

			} catch (IOException ie) {
				System.out.println("Socket Close Error");
			}
		} // end finally
	}
}