#!/bin/bash

local_demo(){
	local var="I m local variable"
	echo "$var"
}

reg_demo(){
	var="I m regular variable"
	echo "$var"
}

local_demo
echo "After local_demo function : $var"

reg_demo
echo "After reg_demo function : $var"
