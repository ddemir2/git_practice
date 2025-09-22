CFLAGS = -g -Wall -Wextra -Wshadow -Wunreachable-code -Wredundant-decls -Wmissing-declarations \
	 -Wold-style-definition -Wmissing-prototypes -Wdeclaration-after-statement -Wno-return-local-addr \
	 -Wunsafe-loop-optimizations -Wuninitialized -Werror -Wno-unused-parameter 

all: darkive

darkive: darkive.o
	gcc $(CFLAGS) -o darkive darkive.o -lz

darkive.o: darkive.c darkive.h
	gcc $(CFLAGS) -c darkive.c

clean cls:
	rm -f darkive *.o *~ \#*

rev:
	git add *
	git commit -m "commiting from make"
	git push
