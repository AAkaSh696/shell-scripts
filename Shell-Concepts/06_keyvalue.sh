#!/bin/bash

#How to store key values pairs

declare -A myArray
myArray=([name]=Aakash [age]=21 [city]=Paris)
echo "Name is ${myArray[name]}"
echo "Age is ${myArray[age]}"
