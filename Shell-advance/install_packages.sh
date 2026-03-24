#!/bin/bash

if [ "$EUID" -ne 0 ];then 
	echo "Run as root"
	exit 1
fi 

packages=("nginx" "curl" "wget")
for pkg in ${packages[@]}
do
       	echo "Package : $pkg"
	if  dpkg -s $pkg &>/dev/null; then
        echo "$pkg is already  installed"
else
        echo "Installing package"
	sudo yum install $pkg
	fi
done

