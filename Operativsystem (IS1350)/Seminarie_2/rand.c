#include <math.h>
#include <stdlib.h>
#include <stdio.h>

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

int main(int argc, char *argv[]) {

	if(argc < 2) {
		printf("usage: rand<loop>\n" );
		exit(1);
	}
	int loop = atoi(argv[1]);
	for( int i = 0; i < loop; i++) {
		int size = request();
		printf("%d\n", size );
	}
}