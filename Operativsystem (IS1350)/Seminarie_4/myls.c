#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>
#include <assert.h>


int main(int argc, char *argv[]){

	if(argc < 2){
		perror("usage: myls <dir>\n");
	}

	char *path = argv[1];

	DIR *dirp = opendir(path);

	struct dirent *entry;

	while((entry = readdir(dirp)) != NULL){
		printf("type %u\n", entry->d_type );
		printf("\tinode %lu\n", entry->d_ino);
		printf("tname %s\n", entry->d_name);
	}
}
