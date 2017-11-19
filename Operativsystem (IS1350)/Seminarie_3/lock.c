#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>

/* The list will contain elemnts from 0 to 99 */

#define MAX 10000

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

typedef struct cell {
	int val;
	struct cell *next;
	int mutex;

} cell;

cell sentinel = {MAX, NULL, 0};

cell dummy =  {-1, &sentinel, 0};

cell *global = &dummy;

int mutex;
int checked[MAX];

int search(int r){
	cell *prev = global;
	cell *this = prev->next;

	while(this->val < r){
		prev = this;
		this = this->next;
	}
	if(this->val == r)
		return 1;
	return 0;
}

struct cell *search_func(cell *lst, int r){
	cell *prev = lst;
	lock(&prev->mutex);
	cell *this = prev->next;
	lock(&this->mutex);

	while(this->val < r){
		unlock(&prev->mutex);
		prev = this;
		this = this->next;
		lock(&this->mutex);
	}

	return prev;
}

void add(cell* list, int r){
	if(search(r) != 0) return; 
	cell *prev = search_func(list, r);
	cell *this = prev->next;

	if(this->val != r){
		cell *new =  malloc(sizeof(cell));
		new->val = r;
		new->next = this;
		prev->next = new;
		new = NULL;
	}

	unlock(&prev->mutex);
	unlock(&this->mutex);
	return;
}

void delete(cell* list, int r){
	if(search(r) != 1) return; 
	cell *prev = search_func(list, r);
	cell *this = prev->next;

	cell *removed = NULL;
	if(this->val == r){
		prev->next = this->next;
		removed = this;
	}
	unlock(&prev->mutex);
	unlock(&this->mutex);
	if(removed != NULL) free(removed);
	return;
}

typedef struct{int inc; int id; cell* list;} args;

void *bench(void *arg){
	int inc = ((args*)arg)->inc;
	int id = ((args*)arg)->id;
	cell *lstp = ((args*)arg)->list;

	for(int i = 0; i < inc; i++){
		int r = rand() % MAX;
		lock(&mutex);
		if(checked[r] == 1){
			checked[r] = 0;
			unlock(&mutex);
			delete(lstp, r);
		} else {
			checked[r] = 1;
			unlock(&mutex);
			add(lstp, r);
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

	printf("%d threads doing %d operations each\n", n, inc);

	args *thra = malloc(n * sizeof(args));
	for(int i = 0; i < n; i++){
		thra[i].inc = inc;
		thra[i].id = i;
		thra[i].list = global;
	}

	struct timespec t_start, t_stop;

	clock_gettime(CLOCK_MONOTONIC_COARSE, &t_start);

	pthread_t *thrt = malloc(n * sizeof(pthread_t));
	for(int i = 0; i < n; i++){
		pthread_create(&thrt[i], NULL, bench, &thra[i]);
	}


	for(int i = 0; i < n; i++){
		pthread_join(thrt[i], NULL);
		printf("done\n");
	}

	clock_gettime(CLOCK_MONOTONIC_COARSE, &t_stop);

	long wall_sec = t_stop.tv_sec - t_start.tv_sec;
	long wall_nsec = t_stop.tv_nsec - t_start.tv_nsec;
	long wall_msec = (wall_sec *1000) + (wall_nsec / 1000000);

	printf("done in %ld ms\n", wall_msec);
	return 0;
}