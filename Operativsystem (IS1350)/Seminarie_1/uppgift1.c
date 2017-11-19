#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

char str [] = "This is a string";

const int cnst = 0xAABBCCDD;

int main (){
	
	int pid = getpid();
	
	int *foo = malloc(sizeof(int));
	*foo = 42;
	
	foo:
		printf("the string: %p\n" , &str);
		printf("the constant integer: %p\n" , &cnst );
		printf("the code: %p\n" , &&foo);
		printf("location of foo: %p\n" , &foo);
		printf("fo pointing to: %p\n" , foo);
		printf("the location foo is pointing to contains: %d\n" ,  *foo );
		
		printf("\n\n /proc/%d/maps \n\n", pid );
		
		char command[50];
		
		sprintf(command, "cat  /proc/%d/maps", pid );
		system( command );
		
		return 0;
}