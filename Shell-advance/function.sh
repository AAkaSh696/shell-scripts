#!/bin/bash
 
greet(){
	name=$1
	echo "Hello,$name!"
}

add(){
a=$1
b=$2
sum=$((a+b))
echo "Sum of two numbers is $sum"
}

greet "Aakash"
add 3  7
