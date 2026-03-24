#!/bin/bash

read -p "Enter your number=" num

while [ $num -gt 0 ]
do 
	echo "Counting : $num"
	num=$((num-1))
done
