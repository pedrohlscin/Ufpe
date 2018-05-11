
public class TesteThread {

	public static void main(String[] args) {
		int i = 3;
		// TODO Auto-generated method stub
		for(int j =0; j<i; j++)
			(new Thread(new	ImprimeWithNThreads(j*2, j*4))).start();
	}

}
