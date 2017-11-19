#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

	struct chunk {
		int size;
		struct chunk *next;
	};
	struct chunk* mem_list = NULL; 


void *malloc ( size_t size) {
	if( size == 0){
		return NULL;
	}
	struct chunk *next = mem_list;
	struct chunk *prev = NULL;
	
	while(next != NULL){
		if( next->size >= size ){
			if(prev != NULL){
				prev->next = next->next;
			} else {
				mem_list = next->next;
			}
			return (void*)(next + 1);
		} else {
			prev = next;
			next = next->next;
		}
	}
	
void *memory = sbrk(size + sizeof( struct chunk));
	if( memory == (void *)-1) {
		return NULL;
	} else {
		struct chunk *cnk = (struct chunk*) memory;
		cnk->size = size;
		return (void*)(cnk+1);
	}
}


void free(void *memory){

	if(memory != NULL) {
		/*we're jumping back one chunk position */
		struct chunk *cnk = (struct chunk*)((struct chunk*)memory -1);
		
		struct chunk *this = mem_list;
		struct chunk *prev = NULL;
		
		
		while(this != NULL){
			if( this->size >= cnk->size ){
				if(prev != NULL){
					prev->next = cnk;
					cnk->next = this;
				} else {
					cnk->next = mem_list;
					mem_list = cnk;
				}
				return;
			} else {
				prev = this;
				this = this->next;
			}
		}
		if(prev != NULL){
			prev->next = cnk;
			cnk->next = NULL;
		} else {
			mem_list = cnk;
			cnk->next = NULL;
		}

		return;
		
	}
	return;
}

void print_info(){
		int count = 0;
		struct chunk *this = mem_list;
		
		while(this != NULL){
			count += this->size;
				this = this->next;
		}

	printf("Total external fragmentation %d Kbytes \n", count/1024);
}
