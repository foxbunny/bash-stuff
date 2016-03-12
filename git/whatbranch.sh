#!/bin/bash

for d in *
do
    if [ -d "$d/.git" ]
    then
        echo -e "\e[32m$d\e[0m"
        (cd "$d" ; git branch | sed 's|^|    |' | sed 's| \*|->|')
    fi
done
