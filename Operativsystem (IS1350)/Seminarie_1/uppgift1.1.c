#include <stdlib.h>
#include <stdio.h>

void zot( long z1, long z2, long z3, long z4, long z5, long z6, long z7, unsigned long *stop ){
	
	unsigned long zs = 0xcccccccccccccccc;
	
	unsigned long *i;
	printf(" i: %p\n", i);
	for( i = &zs; i <= stop; i++ ){
	printf(" %p		0x%lx\n", i, *i );
	}
}

void foo( long f1, long f2, long f3, long f4, long f5, long f6, long f7, unsigned long *stop ){
	unsigned long fs = 0xbbbbbbbbbbbbbbbb;
	zot(f1, f2, f3, f4, f5, f6, f7, stop );	
}

int main() {
	
	unsigned long m = 0xaaaaaaaaaaaaaaaa;
	
	foo( 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, &m );
	
	back: 
		printf("	m: %p \n", &m);
		printf("	back: %p \n", &&back);
		return 0;
}