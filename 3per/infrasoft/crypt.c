#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#define TAM 8 //define o tamanho das strings
#define NUM_THREADS 4
char senha[] = "12345678"; //string original
char descoberto[TAM+1]={"\0"};
pthread_mutex_t mymutex[TAM]; //vetor de mutexes

void* crack(void *b){
    long indice= (long)b;
    //debbug
    //printf("T #%ld\n", indice);
    int i,pos;
    for(pos=0;pos<TAM;pos++){
        //debbug
        //printf("POS #%d\n", pos);
        if(pthread_mutex_trylock(&mymutex[pos]) !=0){
        	//printf("LOCKED");
            for(i=32;i<127;i++){
                if(senha[pos]==i){
                    descoberto[pos]=i;
                }
            }
        	pthread_mutex_unlock(&mymutex[pos]);
        }
    }
    pthread_exit(NULL);
}
int main(){
    pthread_t threads[NUM_THREADS];
    int ids[NUM_THREADS];
    long i=0;
    for(i = 0; i<NUM_THREADS; i++){
       mymutex[i] = (pthread_mutex_t)PTHREAD_MUTEX_INITIALIZER;
    }

    for(i=0; i<NUM_THREADS;i++){
        ids[i] = i;
        int saida = pthread_create(&threads[i], NULL, crack, (void*)i);
        if(saida != 0)
            printf("Erro: %d\n",saida);
    }
    for(i=0; i<NUM_THREADS;i++){
        pthread_join(threads[i], NULL);
        pthread_mutex_destroy(&mymutex[i]);
    }
    printf("%s\n",descoberto);
    return 0;
}