#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include "bfmalloc.h"
#define ROUNDS 100
#define LOOP 100000
#define BUFFER 100
#define MAX 4000
#define MIN 8

int request() {
	/* k is log(MAX/MIN) */
	double k = log(((double) MAX) / MIN);
	
	/* r is [0..k[ */
	double r = ((double)( rand() % (int)(k*10000))) / 10000;
	
	/* size is [0..MAX[ */
	int size = (int)((double)MAX / exp(r));
	
	return size;
}

int main() {
	void *init = sbrk(0);
	void *current;
	
	void *buffer[BUFFER];
	for(int i =0; i < BUFFER; i++) {
		buffer[i] = NULL;
	}
	
	printf("The initial top of the heap is %p. \n", init );
	
	for( int j=0; j< ROUNDS; j++) {
		for(int i=0; i < LOOP ; i++){
			int index = rand() % BUFFER;
			if( buffer[index] != NULL) {
				free1(buffer[index]);
			}
			size_t size = ( size_t ) request();
			int *memory;
			memory = malloc1(size);
			if(memory == NULL) {
				fprintf( stderr, "malloc failed\n" );
				return (1);
			}
			buffer[index] = memory;
			/* writing to the memory so we know it exists */
			*memory = 123;
		}
		current = sbrk(0);
		int allocated = ( int )(( current - init ) / 1024);
		printf("%d\n", j );
		printf("The current top of the heap is %p. \n", current );
		printf("		increased by %d Kbyte\n", allocated );
	}
	print_info(); 
	return 0;
}
