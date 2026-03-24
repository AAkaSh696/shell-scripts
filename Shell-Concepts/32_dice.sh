#!/bin/bash

#Generating a random number between 1 to 6

num=$(($RANDOM%6+1))
echo $num
