#!/bin/bash

read -p "Enter the filename=" fName

if [ -f $fName ];then 
      echo "$fName is present on your device"
else
  echo "$fName is not present on your device"
fi  
