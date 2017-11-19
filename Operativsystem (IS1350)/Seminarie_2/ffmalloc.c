#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

	struct chunk {
		int size;
		struct chunk *next;
	};
	struct chunk* mem_list = NULL; 

void print_info(){
		int count = 0;
		int c = 0;
		struct chunk *this = mem_list;
		
		while(this != NULL){
			c++;
			count += this->size;
				this = this->next;
		}
	printf("%d\n", c);
	printf("Total external fragmentation %d Kbytes \n", count/1024);
}

void *malloc1 ( size_t size) {
	if( size == 0){
		return NULL;
	}
	struct chunk *next = mem_list;
	struct chunk *prev = NULL;
	
	while(next != NULL){
		if( next->size >= size){
			int g = (next->size - size - sizeof(struct chunk));
			if(g >= 32){
				struct chunk *cnk = (struct chunk*)((void *)next + g);
				cnk->size = size;
				next->size = g;
				return (void*)(cnk +1);
			} else {
				if(prev != NULL){
					prev->next = next->next;
				} else {
					mem_list = next->next;
				}
				return (void*)(next + 1);
			}		
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
	


void free1(void *memory){

	if(memory != NULL) {
		/*we're jumping back one chunk position */
		struct chunk *cnk = (struct chunk*)((struct chunk*)memory -1);
		cnk->next = mem_list;
		mem_list = cnk;
	}
	return;
}


