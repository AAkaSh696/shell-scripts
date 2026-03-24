#!/bin/bash

set -e 
mkdir /tmp/devops-test || echo "Directory already exists"
cd /tmp/devops-test || echo "Failed to enter /tmp/devops-test"
touch file.txt || echo "Can't create file"
