#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

	struct chunk {
		int size;
		struct chunk *next;
	};
	

	struct chunklist {
		int size;
		int length;
		struct chunk *first_chunk;
		struct chunklist *next_chunklist;
		
	};
	struct chunklist* chunk_list = NULL;
	
	
void *malloc ( size_t size) {
	if( size == 0){
		return NULL;
	}
	
	struct chunk * chunklist_next = chunk_list;
	struct chunk * chunklist_prev = NULL;
	

	//Size + size och chunk
	int total_size = size + sizeof( struct chunk);
	//Get total size by taking 16*2^n >=  size + size of chunk
	for(int i = 16; i <= total_size; i *= 2){
		total_size = i;
	}
	

	while(chunklist_next->size <= total_size){
		if( chunklist_next->size = total_size ){
			struct chunk * chunk_next = chunk_list->first_chunk;
			if(chunk_next != NULL){
				chunklist->first_chunk = chunk_next->next;
			} else {
				struct chunk* big_chunk = get_chunk(chunklist_next);
				if(big_chunk != NULL)
					return (void*)(chunk + 1);
				
				void *memory = sbrk(total_size);
				if( memory == (void *)-1) {
					return NULL;
				} else {
					struct chunk *cnk = (struct chunk*) memory;		
					return (void*)(cnk+1);
				}
			}
			chunk_list->length = chunk_list->length - 1;
			return (void*)(chunk_next + 1);		
		} else {
			chunklist_prev = chunklist_next;
			chunklist_next  = chunklist_next->next;
	}
	}
		
	
	void *memory = sbrk(sizeof( struct chunklist ) + total_size);
	
	if( memory == (void *)-1) {
		return NULL;
	} else {

		void *cnk_memory = memory + sizeof(struct chunklist);
		struct chunk *cnk = (struct chunk*) cnk_memory;
		cnk->size = total_size;
		new_chunklist = (struct chunklist*) memory;

		if(chunklist_prev != NULL){
			chunklist_prev->next = new_chunklist;
			new_chunklist->next = chunklist_next;
		} else {
			new_chunklist->next = chunk_list;
			chunk_list = new_chunklist;
		}
		return (void*)(cnk+1);
	}
}

void* get_chunk(struct chunklist *chunkList){

	struct chunk *cnk = chunkList->first_chunk;
	if(cnk != NULL){
		chunkList->first_chunk = cnk->next;
		chunkList->length = chunkList->length - 1;
		return cnk;
	}
	if(chunkList->next != NULL){
		void *memory = sbrk(chunkList->size * 2);
		struct chunklist next_chunklist = chunkList->next;

		void *memory = memory + sizeof(struct chunklist);
		struct chunk *cnk = (struct chunk*) memory;
		cnk->size = total_size;
		
		struct chunk new_chunk = get_chunk(chunkList->next);
	}
	else
		return NULL;

	if(new_chunk != NULL){
		chunkList->first_chunk = (void *)(new_chunk + chunkList->size);
		chunkList->length = chunkList->length + 1;
	}

	return new_chunk;
}

void free(void *memory){

	if(memory != NULL) {
		/*we're jumping back one chunk position */
		struct chunk *cnk = (struct chunk*)((struct chunk*)memory -1);
		
		struct chunk *this = chunk_list;
				
		while(this->size <= cnk->size){
			if( this->size = cnk->size ){

				if(this->first_chunk != NULL){
				cnk->next = this->first_chunk;
				this->first_chunk = cnk;

				} else {
					this->first_chunk = cnk;
					cnk-next = NULL;
				}
				this->length = this->length + 1;

				return;
			} else {
				this = this->next;
			}
		}	
	}
	return;
}

int ext_frag(){
		int count = 0;
		struct chunk *this = mem_list;
		
		while(this != NULL){
			count += this->size;
			printf("%d B \n", this->size);
				this = this->next;
		}
		return count;
}
