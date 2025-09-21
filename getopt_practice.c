#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <pwd.h>


int main(int argc, char *argv[])
{
	int clo = 0;
	char *OPTIONS = "hrt::gb:";
	char buffer[100];
	int cursor = 0;
	int index = 0;

	#ifndef NOISY_DEBUG
	# define NOISY_DEBUG_PRINT fprintf(stderr, "File: %s   Function: %s()  Line: %d\n", __FILE__, __func__, __LINE__);
	#endif // NOISY_DEBUG

	fprintf(stderr, "argc=%d\n", argc);
	for (int i = 0; i < argc; ++i)
		fprintf(stderr, "argv[%d] = '%s'\n", i, argv[i]);

	while ((clo = getopt(argc, argv, OPTIONS)) != -1)
	{
		switch(clo) {
			case 'h':
				fprintf(stderr, "\nUsing stderr to report h option\n");	
				printf("./whodat [-hr:t::gb:] [logname1] [logname2] ... [lognameN]\n");
				exit(EXIT_SUCCESS);
				break;
			case 'r':
				fprintf(stdout, "\nUsing stdout to report r option, which is whodat\n");
				NOISY_DEBUG_PRINT;
				break;
			case 't':
				sprintf(buffer, "\nThis information is stored in a buffer");
				cursor = strlen(buffer);	
				if (!optarg)
				{
					sprintf(buffer + cursor, ", and no arguement was supplied!\n");
				}
				else
				{
					sprintf(buffer + cursor, ", and the user supplied %s are the arguement!\n", optarg);
				}
				fprintf(stdout, "\n%s", buffer);
				break;
			case 'g':
				false;
				break;
			case 'b':
				fprintf(stdout, "\nUsing stdout to report b option\n");
				if(optarg) {
					printf("optarg is %s\n", optarg);
				}
				break;
			default:
				fprintf(stderr, "\nDefault option executed!\n");
				break;
		}
	}


	NOISY_DEBUG_PRINT;
	fprintf(stderr, "\noptind is %d\n", optind);
	if(argc > 1) {
		for(index = optind; index < argc; index = index + 1) {
			if(!getpwnam(argv[index])) {
				printf("User entry not found for logname = %s\n\n", argv[index]); 
				NOISY_DEBUG_PRINT;
			}	
			else {
				NOISY_DEBUG_PRINT;
				printf("\tName:\t%s\n", getpwnam(argv[index])->pw_gecos);
			}
		}	
	}




	return 0;
}
