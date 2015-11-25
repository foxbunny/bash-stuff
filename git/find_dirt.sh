#!/bin/bash

for dir in $(ls)
do
    if ! [ -d "$dir" ] || ! [ -d "$dir/.git" ]
    then
        continue
    fi
    echo -n "Checking $dir ..."
    if $(cd "$dir" && git status 2>/dev/null | grep 'working directory clean' > /dev/null)
    then
        echo "OK"
    else
        echo -e "\e[31mDIRTY\e[0m"
    fi
done
