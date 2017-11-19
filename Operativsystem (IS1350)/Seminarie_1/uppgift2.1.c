#include <stdlib.h>
#include <stdio.h>

int main () {
	
	char *heap = malloc(20);
	*heap = 0x61;
	printf(" heap pointing to: 0x%x\n", *heap );
	free ( heap );
	
	char *foo = malloc( 20 );
	*foo = 0x62;
	printf(" fo pointing to: 0x%x\n", *foo );
	
	*heap = 0x63;
	printf(" fo pointing to: 0x%x\n", *foo );
	
	return 0;
}
	
	