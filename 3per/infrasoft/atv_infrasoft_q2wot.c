#include<stdio.h>
#include<stdlib.h>
#include<time.h>

long long fat(int i){
    unsigned long long fat = 1;
    int loop;
    for(loop = 1; loop <= i; loop++){
        fat *= loop;
    }
    return fat;
}


int main(){
    FILE *file;
    clock_t t;
    int numero;
    double timeTaken;
    t = clock();
    file= fopen("entrada.txt","r");
    if(file==NULL){
        printf("Arquivo de entrada nao encontrado\n");
        exit(1);
    }
    int indice;
    while(fscanf(file, "%d", &indice )!=EOF){
        printf("O fatorial de %d é: %lld\n", indice, fat(indice));
    }

    t = clock() - t;
    timeTaken = ((double)t)/CLOCKS_PER_SEC;
    printf("Tempo de execução: %lf\n",timeTaken);
    return 0;
}