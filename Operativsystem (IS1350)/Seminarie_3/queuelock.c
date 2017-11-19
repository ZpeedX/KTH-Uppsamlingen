#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>
#include <linux/futex.h>
#include <sys/syscall.h>

#define MAX 10

typedef struct Node {
	int data;
	struct Node* next;
	int mutex;
}Node;

int enqueue_mutex;
int dequeue_mutex;
int mutex;
int checked[MAX];
int sleeper = 0;
int threads;
int sleeper_mutex;
int threads_done;
int sleeping;

struct Node* front = NULL;
struct Node* rear = NULL;

int futex_wait(volatile int *futexp){
	return syscall(SYS_futex, futexp, FUTEX_WAIT, 1, NULL, NULL, 0);
}
void futex_wake(volatile int *futexp){
	syscall(SYS_futex, futexp, FUTEX_WAKE, 1, NULL, NULL, 0);
}

int try(volatile int *mutex){
	return __sync_val_compare_and_swap(mutex, 0, 1);
}

int lock(volatile int *mutex){
	while(try(mutex) != 0){

	} //spin
}

void unlock(volatile int *mutex){
	*mutex = 0;
}

int sleeplock(volatile int *mutex){

	lock(&sleeper_mutex);
	sleeper++;
	unlock(&sleeper_mutex);
	while(try(mutex) != 0){

		if(sleeper >= (threads- (2 + threads_done))){
			futex_wake(mutex);
		}

	} //spin
	lock(&sleeper_mutex);
	sleeper--;
	unlock(&sleeper_mutex);
}


void enqueue (int x){
	lock(&enqueue_mutex);
	struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
	temp->data = x;
	temp->next = NULL;

	if(front == NULL && rear == NULL){
		front = rear = temp;
	} else {

		lock(&temp->mutex);

		rear->next = temp;
		rear = temp;
		unlock(&temp->mutex);
	}
	futex_wake(&dequeue_mutex);

	unlock(&enqueue_mutex);
	return;
}

void dequeue() {
	sleeplock(&dequeue_mutex);
	if(front == NULL){
		if(threads_done != (threads-1)){
			sleeping++;
			futex_wait(&dequeue_mutex);
			sleeping--;
		}
		if(front== NULL){
			unlock(&dequeue_mutex);
			return;
		}
	}
	lock(&front->mutex);
	struct Node* temp = front;
		
	if(front == rear){
		lock(&enqueue_mutex);
		front = rear = NULL;
		unlock(&enqueue_mutex);
	}else {
		front = front->next;
	}

	unlock(&temp->mutex);
	free(temp);
	unlock(&dequeue_mutex);
}

void print() {
	struct Node* temp = front;
	while(temp != NULL){
		printf("%d\n", temp->data);
		temp = temp->next;
	}
	printf("\n");
}



typedef struct{int inc; int id;} args;

void *bench(void *arg){
	int inc = ((args*)arg)->inc;
	int id = ((args*)arg)->id;

	for(int i = 0; i < inc; i++){
		int r = rand() % 2;
		int random = rand() % MAX;
		if(r != 1){
			dequeue();
		} else {
			enqueue(random);
		}
	}
}


int main(int argc, char *argv[]){
	if(argc != 3){
		printf("usage: list <total><threads>\n");
		exit(0);
	}
	int n = atoi(argv[2]);
	int inc = (atoi(argv[1]) / n);
	threads = n;

	printf("%d threads doing %d operations each\n", n, inc);

	args *thra = malloc(n * sizeof(args));
	for(int i = 0; i < n; i++){
		thra[i].inc = inc;
		thra[i].id = i;
	}

	struct timespec t_start, t_stop;

	clock_gettime(CLOCK_MONOTONIC_COARSE, &t_start);

	pthread_t *thrt = malloc(n * sizeof(pthread_t));
	for(int i = 0; i < n; i++){
		pthread_create(&thrt[i], NULL, bench, &thra[i]);
	}


	for(int i = 0; i < n; i++){
		while(sleeping > 0){
			futex_wake(&dequeue_mutex);
			unlock(&dequeue_mutex);
			unlock(&enqueue_mutex);
			if(front != NULL)
				unlock(&front->mutex);
			if(rear != NULL)
				unlock(&rear->mutex);


		}
		pthread_join(thrt[i], NULL);
		threads_done++;
	}

	clock_gettime(CLOCK_MONOTONIC_COARSE, &t_stop);

	long wall_sec = t_stop.tv_sec - t_start.tv_sec;
	long wall_nsec = t_stop.tv_nsec - t_start.tv_nsec;
	long wall_msec = (wall_sec *1000) + (wall_nsec / 1000000);

	printf("done in %ld ms\n", wall_msec);
	return 0;
}