#!/bin/bash

filter=$1

for dir in $(ls | egrep "$filter" 2>/dev/null); do 
    if [ -d "$dir" ] && [ -d "$dir/.git" ]
    then
        echo -ne "\e[32mChecking $dir\e[0m "
        (cd $dir ; git fetch 2>&1 > /dev/null ; git pull 2>&1 || echo -e "\e[31mFAILED\e\[0m")
    fi
done
