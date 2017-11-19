#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

void square_reverse (float *x, float *y, int z){
	for(int i = 0; i < z; i++){
		*((double *)y +i) = *((double *)x + (z-1-i)) * *((double *)x + (z-1-i));
	}
	return;
}

int main(int argc, char *argv[]){
	double in[] = {11.0, 20.0, 100.0};
	double out[3];
	square_reverse((float *)&in, (float *)&out, sizeof(out)/sizeof(double));

	printf("%lf\n", out[0] );
	printf("%lf\n", out[1] );
	printf("%lf\n", out[2] );
}
