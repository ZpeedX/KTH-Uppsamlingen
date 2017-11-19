#include <stdlib.h>
#include <stdio.h>

int main( int argc, char *argv[]) {

	int size = atoi(argv[1]);
	
	long *block = malloc( size );
	
	printf(" magic: 0x%lx \n", block[-1]);
	
	return 0;
}
//8 bytes overhead & 1 byte for how much malloc is allocated
//if the size of malloc + overhead + 1 byte is bigger than 0xXX it will add 16 bytes

