#!/bin/bash

#Array
arr=(1 29.3 83 hloo "Hello man!")

echo "${arr[1]}"
echo "Value in 4 index is ${arr[4]}"
echo "All the values in array are ${arr[*]}"

# How to find no. of values in array
echo "Length of array is ${#arr[*]}"

#How to get specific values
echo "${arr[*]:1}"
echo "Values from index 1-3 ${arr[*]:1:2}"

#Updating our array with new values
arr+=(no 90 123)
echo "Values of new array are ${arr[*]}"

