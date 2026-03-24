#!/bin/bash

if [[ $UID -eq 0 ]]
then
	echo "User is root"
else
	echo "Not a root user"
fi
