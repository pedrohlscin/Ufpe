package br.com.pedroso;

public class Questao1PLC {

    public static class Conta {
        public float saldo;

        Conta(float saldo){
            this.saldo = saldo;
        }

        public synchronized boolean saca(float valor){
            if(this.saldo - valor >= 0) {
                this.saldo -= valor;
                return true;
            }
        }

        public synchronized boolean deposita(float valor){
            this.saldo += valor;
        }
    }

    static class Pessoa{
        String nome;
        Conta c;

        Pessoa(String nome, Conta conta){
            this.nome = nome;
            this.c = conta;
        }
    }

    public static void main(String[] args){
        Pessoa[] pessoas = new Pessoa[6];
        Conta conta = new Conta();
        for(int i = 0; i <= 5; i++){
            pessoas[i] = new Pessoa("Nome" + i , conta);
        }

        for (Pessoa p: pessoas) {

        }
    }
}
