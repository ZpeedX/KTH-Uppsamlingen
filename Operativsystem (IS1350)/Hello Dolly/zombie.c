#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main () {
	int pid = fork();
	
	if(pid == 0) {
		printf("check the status\n" );
		sleep( 10 );
		printf(" and again \n" );
		return 42;
	} else {
		sleep(20);
		int res;
		wait(&res );
		printf(" the result was %d\n", WEXITSTATUS(res));
		printf(" and again \n" );
		sleep(10);
	}

/*	printf("I'm the child %d\n", getpid());
	sleep(1);
	} else {
		printf("My child is called %d\n", pid);

		wait(NULL);
				printf("My child has terminated \n");

	}
	printf("This is the end  (%d)\n", getpid());*/
	
	return 0;
}