#!/bin/bash

read -p "Enter number:" num

if [ $num -le 0 ]; then
	echo "Number is Negative"
elif [ $num -gt 0 ];then 
	echo "Number is Positive"
else
	echo "Number is Zero"
fi
