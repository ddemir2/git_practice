#!/bin/bash
# /u/ddemir2/git_practice_2/other_directory

touch temp.txt
touch temp2.txt


# testing
# write to one temp file, write and append to the other
echo "hello " > temp.txt
echo "hello " > temp2.txt
echo "hello " >> temp2.txt
# compare
echo -e "\nComparing file with one write to file with write and append:\n"
DIFF1=$(diff temp.txt temp2.txt)
if [ $? -eq 1 ]; then
	echo "difference!"
else
	echo "same!"	
fi
echo -e "\n"


# write to both temp files 
echo "hello " > temp.txt
echo "hello " > temp2.txt
# compare
echo -e "\nComparing one write to both files:\n"
diff temp.txt temp2.txt
if [ $? -eq 1 ]; then
	echo "difference!"
else
	echo "same!"	
fi
echo -e "\n"



rm -f temp.txt
rm -f temp2.txt
