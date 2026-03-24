#!/bin/bash
echo "Script to show how to use variables"

a=10
name="Aakash"
age=21

echo "My name is $name and age is $age and a=$a"

name="Paul"
echo "My name is $name"

#Var to store the output of a command 
hostName=$(ls)
echo "List of files is $hostName"
