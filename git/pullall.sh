#!/bin/bash
for dir in *; do 
    if [ -d "$dir" ] && [ -d "$dir/.git" ]
    then
        echo -e "\e[32mChecking $dir\e[0m"
        (cd $dir ; git fetch ; git pull > /dev/null | grep "Fetching")
    fi
done
