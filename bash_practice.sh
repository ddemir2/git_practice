#!/bin/bash
# /u/ddemir2/git_practice_2/other_directory

touch temp.txt
touch temp2.txt

cleanup() 
{
	rm -f temp.txt
	rm -f temp2.txt
	TREE=$(ls -l)
	echo "Deleting temp file now"
	echo -e "\nconfirming deletion:\n"
	echo "$TREE"
	echo -e "\n\n"
}

# write to temp files
/u/ddemir2/git_practice_2/./other_directory > temp.txt
/u/ddemir2/git_practice_2/./other_directory > temp2.txt
/u/ddemir2/git_practice_2/./other_directory >> temp2.txt

# compare temp files
diff temp.txt temp2.txt
if [ $? -eq 1 ]; then
	echo "difference!"
else
	echo "same!"	
fi


trap cleanup EXIT
trap 'echo "Error on line $LINENO"' ERR
trap 'echo "Interruption signal sent!"; exit 0;' SIGINT
trap 'echo "Kill signal received . . ."' SIGKILL

echo -e "Before cleanup, here are the contents of temp.txt:\n-------------------------------------\n"
cat temp.txt

echo -e "\n-------------------------------------\n"

echo "You have 3 seconds to attempt a signal interruption . . ."
sleep 3

echo "Too late. Attempting Error Signal . . ."
false



