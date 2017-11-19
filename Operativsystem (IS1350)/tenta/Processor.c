#include <unistd.h>
#include <stdio.h>


int x = 42;
int main(){
	printf("hello\n");
	
	printf("this is, %d \n", getpid());	
	if(fork() == 0){
		x++;
		printf("x = %d\n\n", x);
	} else {
		printf("this is, %d \n", getpid());
		x++;
		printf("x = %d\n\n", x);		
	}
	
	return 0;
}