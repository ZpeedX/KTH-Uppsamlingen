#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <assert.h>

	struct chunk {
		int size;
		struct chunk *next;
		int internal;
	};
	

	struct chunklist {
		int size;
		int length;
		int internal;
		struct chunk *first_chunk;
		struct chunklist *next;
		
	};
	struct chunklist* chunk_list = NULL;

/**
*Prints out every chunklist size and length, total internal and external fragmentation.
*/
void print_info(){
		int count_chunks = 0;
		int external = 0;
		int internal = 0;
		struct chunklist *this = chunk_list;
		
		while(this != NULL){
			printf("chunklist size: %d bytes \n", this->size);
			printf("chunklist length: %d \n", this->length);
			printf("chunklist internal fragmentation: %d bytes \n", this->internal);
			internal += this->internal;
			struct chunk *cnk = this->first_chunk;
			while(cnk != NULL){
				external += cnk->size;
				count_chunks++;
				cnk = cnk->next;
			}
			printf("\n");

			this = this->next;
		}
	printf("Amount of Chunks in lists: %d\n", count_chunks);
	printf("Total internal fragmentation: %d Kbytes \n", internal/1024);
	printf("Total external fragmentation: %d Kbytes \n", external/1024);
	}

/**
*Recursively go to next linked chunklist and get an available chunk.
*If the next linked chunklist it NULL, take double current chunklist size from kernel and return second half recusively.
*Return the chunk recusively and devide it into two chunks where the first chunk will be added
*to the previous chunlist and second chunk will be returned recursively. 
*At the ned return the last chunk to user.
*
**/
void* get_chunk(struct chunklist* chunkList){
	if(chunkList->first_chunk != NULL){
		struct chunk *cnk = chunkList->first_chunk;
		chunkList->first_chunk = cnk->next;
		cnk->next= NULL;
		chunkList->length = chunkList->length -1;
		return (void *)(cnk +1);
	}
	if(chunkList->next == NULL){
		void *memory = sbrk(chunkList->size *2);
		struct chunk *cnk = (struct chunk*) memory;
		struct chunk *cnk2 = (struct chunk*)((void*) cnk + chunkList->size);
		cnk2->next = NULL;
		cnk2->size = chunkList->size;
		cnk->next = NULL;
		chunkList->first_chunk = cnk;
		cnk->size = chunkList->size;
		chunkList->length = chunkList->length + 1;
		return (void *)(cnk2 + 1);

	}

	struct chunk *cnk = (struct chunk*) ((struct chunk *) get_chunk(chunkList->next) -1);
	struct chunk *cnk2 = (struct chunk*)((void*) cnk + chunkList->size);
	cnk->size = chunkList->size;
	cnk->next = chunkList->first_chunk;
	chunkList->first_chunk = cnk;
	cnk2->size = chunkList->size; 
	cnk2->next = NULL;

	chunkList->length = chunkList->length + 1;
	return (void *)(cnk2 + 1);
}
/**
*Return 2^n >= size bytes to user depending on user input.
**/
void *malloc( size_t size) {
	if( size == 0){
		return NULL;
	}
	//Inlitilize first chunklist 
	if(chunk_list == NULL){
		void *memory = sbrk(sizeof(struct chunklist));
		struct chunklist *list = (struct chunklist*) memory;
		list->next= NULL;
		list->size= 32;
		list->length = 0;
		list->first_chunk = NULL;
		chunk_list = list;
	}
	
	struct chunklist * chunklist_next = chunk_list;
	struct chunklist * chunklist_prev = NULL;
	

	//Size + size och chunk
	int allocated_size = 0;
	int target_size = (size + sizeof(struct chunk));
	//Get total size by taking 2^n >=  size + size of chunk
	for(int i = 16; i <= target_size; i *= 2){
		allocated_size = i*2;
		if(chunklist_next != NULL){
			//If chunklist if the needed is has been found, take a chunk from the chunklist.
			if(chunklist_next->size >= target_size){
				struct chunk* chunk_next = chunklist_next->first_chunk;
				if(chunk_next != NULL){
					chunklist_next->first_chunk = chunk_next->next;
					chunklist_next->length = chunklist_next->length -1;
				}
				//If the chunklist doesn't have any chunks, call on function get_chunk(current chunklist) and return a chunk of needed size
				else{
					void* mem = (void *)(get_chunk(chunklist_next));
					struct chunk * cnk = (struct chunk*)((struct chunk*)mem - 1);
					cnk->internal = chunklist_next->size - target_size;
					chunklist_next->internal = chunklist_next->internal + cnk->internal;
					return (void *)(cnk + 1);

				}
				chunk_next->internal = chunklist_next->size - target_size;
				chunklist_next->internal = chunklist_next->internal + chunk_next->internal;
				return (void *)(chunk_next + 1);

			}

		}
		//If the chunklist with needed size is not found, create chunklist with current chunklist->size * 2 until we get to our neede size
		//and return a pointer if needed chunk + 1 to the user. 
		else {

			void *memory = NULL;
			if(allocated_size >= target_size){
				memory = sbrk(allocated_size + sizeof(struct chunklist));
			}else{
				memory = sbrk(sizeof(struct chunklist));
			}
			chunklist_next = (struct chunklist*) memory;
			chunklist_prev->next = chunklist_next;
			chunklist_next->next = NULL;
			chunklist_next->size = allocated_size;
			chunklist_next->length = 0;
			chunklist_next->first_chunk = NULL;

			if(allocated_size >= target_size){

				struct chunk* cnk = (struct chunk*)((void*) chunklist_next + sizeof(struct chunklist));
				cnk->internal = chunklist_next->size - target_size;
				cnk->size = allocated_size;
				cnk->next = NULL;
				return (void *)(cnk+1);
			}
		}
				chunklist_prev = chunklist_next;
				chunklist_next  = chunklist_next->next;
		
	}
}

//Free returned user memory if it exists
void free(void *memory){
	if(memory != NULL) {

		/*we're jumping back one chunk position */
		struct chunk *cnk = (struct chunk*)((struct chunk*)memory -1);
		struct chunklist *this = chunk_list;
				
		while(this != NULL){
			if( this->size == cnk->size ){
				cnk->next = this->first_chunk;
				this->first_chunk = cnk;
				this->internal = this->internal - cnk->internal;
				cnk->internal = 0;
				this->length = this->length + 1;

				return;
			} else {
				this = this->next;
			}
		}	
	}

	return;
}
