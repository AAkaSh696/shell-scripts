#!/bin/bash

myVar="Hey buddy ,How are you?"

myVarLength=${#myVar}
echo "Length of the myVar is $myVarLength"

echo "Upper case is -----${myVar^^}"

echo "Lower case is -----${myVar,,}"

echo "Replacing buddy into bro ${myVar/buddy/bro}"

echo "Slicing ---- ${myVar:6:11}"
