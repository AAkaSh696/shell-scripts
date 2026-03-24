#!/bin/bash

#Getting values from file names.txt

File="names.txt"

for name in $(cat $File)
do 
	echo "Name is $name"
done
