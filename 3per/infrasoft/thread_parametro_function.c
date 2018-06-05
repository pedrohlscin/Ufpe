#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NUMTHREADS 100

void *printp(void* threadId){
    long id = (long) threadId;
    printf("Estou na thread n# %ld\n",id);
    pthread_exit(NULL);
}

int main(){
    long i =0;
    pthread_t threads[NUMTHREADS];
    for(i = 0; i < NUMTHREADS; i++){
        int tc = pthread_create(&threads[i], NULL, *printp, (void *)i);
        if(tc != 0){
            printf("Erro na thread n# %d\n",tc);
            exit(-1);
        }
    }
    pthread_exit(NULL);
}