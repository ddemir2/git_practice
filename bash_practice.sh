#!/bin/bash

touch temp.txt

cleanup() 
{
	rm -f temp.txt
	echo "Deleting temp file now"
}

trap cleanup EXIT
trap 'echo "Error on line $LINENO"' ERR

false

