#!/bin/bash

name="$1"

if [ $# -lt 1 ];then
	echo "Useage :./greet.sh <name>"
else
echo "Hello,$name"
fi
