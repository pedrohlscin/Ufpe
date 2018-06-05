#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<time.h>

long long fat(int i){
    unsigned long long fat = 1;
    int loop;
    for(loop = 1; loop <= i; loop++){
        fat *= loop;
    }
    return fat;
}

    void *read_file_calc_fat(void* entrada){
    int indice;
    while(fscanf((FILE*)entrada, "%d", &indice )!=EOF){
        printf("O fatorial de %d é: %lld\n", indice, fat(indice));
    }
    pthread_exit(NULL);
}

int main(){
    FILE *file;
    clock_t t;
    int numero;
    double timeTaken;
    pthread_t threads[4];
    t = clock();
    file= fopen("entrada.txt","r");
    if(file==NULL){
        printf("Arquivo de entrada nao encontrado\n");
        exit(1);
    }
    int i;
    for(i = 0; i<4; i++){
        int tc = pthread_create(&threads[i], NULL, read_file_calc_fat, (void*)file);
        if(tc != 0){
            printf("Erro na thread %d, código %d",i,tc);
        }
    }
    for(i = 0; i<4;i++){
        pthread_join(threads[i], NULL);
    }
    
    t = clock() - t;
    timeTaken = ((double)t)/CLOCKS_PER_SEC;
    printf("Tempo de execução: %lf\n",timeTaken);
    return 0;
}