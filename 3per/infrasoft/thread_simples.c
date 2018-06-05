#include <pthread.h>
#include <stdio.h>

void *printp(void* threadId){
    int indice = *(int *)threadId;
    printf("Estou na thread\n");
    pthread_exit(NULL);
}

int main(){
    pthread_t threads;
    long tc = pthread_create(&threads, NULL, *printp, NULL);
    if(tc != 0)
        printf("Erro na thread");
    printf("Continuei na thread da main!\n");
    pthread_exit(NULL);
}