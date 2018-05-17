package br.com.pedroso.plc.Arvore;

public class ArvoreBuscaTesteWT {
	public static void main(String[] args) {
		BinarySearchTree arvore = new BinarySearchTree();
		long start = System.currentTimeMillis();
		for (int i = 0; i < 6000; i++) {
			arvore.insert((int)Math.random()+10);
		}
		long time = (System.currentTimeMillis() - start);
		System.out.println(arvore.depth(arvore.root) + ", tempo: " + time);
	}
}
