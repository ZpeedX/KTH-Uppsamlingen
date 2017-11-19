#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <dirent.h>
#include <fcntl.h>
#include <sys/stat.h>

int main(int argc, char *argv[]){

	if(argc < 2){
		perror("usage: myls <dir>\n");
		return -1;
	}

	char *path = argv[1];

	DIR *dirp = opendir(path);

	struct dirent *entry;

	while((entry = readdir(dirp)) != NULL){
		struct stat file_st;
		fstatat(dirfd(dirp), entry->d_name, &file_st, 0);
		printf("\tinode: %lu", entry->d_ino);
		printf("\tsize: %lu", file_st.st_size);
		printf("\tname: %s\n", entry->d_name);

	}
}
