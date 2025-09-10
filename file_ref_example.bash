#!/bin/bash
# /u/rchaney/Classes/cs333/Labs/Lab1/whodat
touch tmp1.txt
touch tmp2.txt



echo "Testing whodat when just 'ddemir2' is supplied on command line:"
# comparing line count only
/u/ddemir2/CS333/Lab1/./whodat ddemir2 | wc -l > tmp1.txt
/u/rchaney/Classes/cs333/Labs/Lab1/./whodat ddemir2 | wc -l > tmp2.txt

diff tmp1.txt tmp2.txt > /dev/null 2> /dev/null

if [ $? -eq 0 ]
then
    	echo "	Damir and Jesse's line counts match!"
else
    	echo "	Damir and Jesse's line counts do not match!"
fi


# comparing byte count only
/u/ddemir2/CS333/Lab1/./whodat ddemir2 | wc -c > tmp1.txt
/u/rchaney/Classes/cs333/Labs/Lab1/./whodat ddemir2 | wc -c > tmp2.txt
diff tmp1.txt tmp2.txt > /dev/null 2> /dev/null

if [ $? -eq 0 ]
then
    	echo "	Damir and Jesse's byte counts match!"
else
   	echo "	Damir and Jesse's byte counts do not match!"
fi


# comparing exit status
# source: finding exit status within pipeline:
# https://stackoverflow.com/questions/1221833/pipe-output-and-capture-exit-status-in-bash
/u/ddemir2/CS333/Lab1/./whodat ddemir2 > tmp1.txt
if [ ${PIPESTATUS[0]} -eq 0 ]
then
	echo "	Exited succesfully!"
else
	echo "	Damir's exited with failure . . ."
fi

# verbose level
# Source: https://www.geeksforgeeks.org/head-command-linux-examples/
echo "Testing whodat with varying numbers of -v supplied"
echo "	ddemir2 -v"
/u/ddemir2/CS333/Lab1/./whodat ddemir2 -v | awk '"Verbose enabled 1" {print "		verbose printed correctly"}' | head -n 1
echo "	ddemir2 -v -v"
/u/ddemir2/CS333/Lab1/./whodat ddemir2 -v -v | awk '"Verbose enabled 2" {print "		verbose printed correctly"}' | head -n 1
echo "	ddemir2 -v -v -v"
/u/ddemir2/CS333/Lab1/./whodat ddemir2 -v -v -v | awk '"Verbose enabled 3" {print "		verbose printed correctly"}' | head -n 1


echo "Testing Issue: -l supplied as same time as -L with a number"
/u/ddemir2/CS333/Lab1/./whodat ddemir2 -l -L 5 | awk '">> Logon information not requested" {print "	>> Not Requested << Message Sucessfully Printed"}' | head -n 1


echo "Testing Issue: incorrect logname supplied as arguement"
/u/ddemir2/CS333/Lab1/./whodat ddemir > tmp1.txt
/u/rchaney/Classes/cs333/Labs/Lab1/./whodat ddemir 2> tmp2.txt
diff tmp1.txt tmp2.txt > /dev/null 2> /dev/null
if [ $? -eq 0 ]
then
    	echo "	Damir and Jesse's output match!"
else
    	echo "	Damir and Jesse's output don't match!"
fi


rm tmp1.txt
rm tmp2.txt
