#!/bin/bash

count=0
read -p "Enter number:" num

while [ $count -le $num ]
do 
	echo "Numbers are $count"
	((count++)) #let count++
done
