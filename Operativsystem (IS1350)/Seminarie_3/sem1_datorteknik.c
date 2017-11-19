#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <linux/futex.h>
#include <sys/syscall.h>

void adder (const int *x, const int *y, int *z){
	*z = *x + *y;
	return;
}
int foo(int a){
	const int k = 10;

	int res = 0;

	adder(&k, &a, &res);

	return res;
}

int main(int argc, char *argv[]){
	printf("%d\n", foo(atoi(argv[1])));

}
