package br.com.pedroso.plc.Arvore;

public class ArvoreBuscaTesteT implements Runnable{

	private BinarySearchTree arvore;

	@Override
	public void run() {
		for(int i = 0; i < 2000; i++) {
			int x = (int) Math.random()*10;
			arvore.insert(x);
		}
	}
	
	public ArvoreBuscaTesteT(BinarySearchTree t) {
		 this.arvore = t;
	}
	
	public static void main(String[] args) throws InterruptedException {
		Thread[] threads = new Thread[3]; 
		BinarySearchTree arvore = new BinarySearchTree();
		long start = System.currentTimeMillis();
		for(int i = 0; i < 3; i++) {
			threads[i] = new Thread(new ArvoreBuscaTesteT(arvore));
			threads[i].start();
		}
		for(int i = 0; i < 3; i++) {
			threads[i].join();
		}
		long end = System.currentTimeMillis();
		System.out.println("Altura: " + arvore.depth(arvore.root) + ", tempo: " + (end-start));
	}
	
}
