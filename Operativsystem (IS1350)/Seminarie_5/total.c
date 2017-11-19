#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <dirent.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <string.h>

unsigned long total_files = 0;
unsigned long total_dirr = 0;
unsigned long total_sym_links = 0;

unsigned long* count(char *path){
	DIR *dirp = opendir(path);

	char subdir[1024];

	struct dirent *entry;
	if(dirp == NULL){
		printf("not able to open %s\n", path );
		return 0;
	}

	while((entry = readdir(dirp)) != NULL){
		switch( entry->d_type ){
			case DT_DIR: //This is directory.
				if((strcmp(entry->d_name, ".") == 0) | (strcmp(entry->d_name, "..") == 0)){
					break;
				};
				sprintf(subdir, "%s/%s", path, entry->d_name);
				total_dirr++;
				count(subdir);
				break;
			case DT_REG: //This is a regular file.
				total_files++;
				break;
			case DT_LNK : //This is a symbolic link.
				total_sym_links++;
				break;
			default:
				break;
		}
	}
	closedir(dirp);
	return 0;
}

int main(int argc, char *argv[]){

	if( argc < 2){
		perror("usage: total <dir>\n");
		return -1;
	}

	char *path = argv[1];
	unsigned long* total = count(path);
	printf("The directory %s contains %lu files\n", path, total_files);
	printf("The directory %s contains %lu soft links\n", path, total_sym_links);
	printf("The directory %s contains %lu directories\n", path, total_dirr);
}