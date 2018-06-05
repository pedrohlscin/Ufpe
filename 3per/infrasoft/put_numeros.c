#include<stdio.h>
#include<stdlib.h>

int main(int argc, char* argv[]){
    FILE *file;
    int numero;
    file= fopen("entrada.txt","w");
    if(file==NULL){
        printf("Arquivo de entrada nao encontrado\n");
        exit(1);
    }
    //printf("%d\n",atoi(argv[1]));
    for(numero = 1; numero < atoi(argv[1]); numero++){
        fprintf(file, "%d\n", numero);
        //printf("%d\n", numero);
    }
    fclose(file);
    return 0;
}