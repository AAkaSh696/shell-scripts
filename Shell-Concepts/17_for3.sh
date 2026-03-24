#!/bin/bash

#for loop in array

arr=( 1 2 3 hi Hloo 7 22 )
length=${#arr[*]}
for(( i=0;i<$length;i++ )) 
do 
	echo "Elements of array is ${arr[$i]}"
done
