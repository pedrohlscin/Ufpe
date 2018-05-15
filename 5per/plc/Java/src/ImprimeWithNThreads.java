
public class ImprimeWithNThreads implements Runnable {
	int limite_inff = 0;
	int limite_sup = 0;
	static int contador;

	public ImprimeWithNThreads(int inf, int sup) {
		// TODO Auto-generated constructor stub
		this.limite_inff = inf;
		this.limite_sup = sup;
	}

	@Override
	public void run() {
		for (int j = limite_inff; j < limite_sup; j++) {
			contador = j;
			System.out.println(contador);
		}
	}
	
	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		
		for(int j =0; j<4; j++) {
			(new Thread(new	ImprimeWithNThreads(0, 10))).start();
		}
		
//		for(int j = 0; j<i; j++)
//			t[j].join();
			
	}

}
