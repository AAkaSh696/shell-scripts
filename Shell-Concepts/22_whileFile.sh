#!/bin/bash

while read myVar
do 
	echo "Name is $myVar"
done < names.txt
