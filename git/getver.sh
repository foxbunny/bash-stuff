#!/bin/bash

for d in *
do
    if [ -d "$d" ] && [ -d "$d/.git" ]
    then
        echo $d: $(cd "$d" && git log --decorate=short --pretty=oneline -1 | egrep -o '.* \(.*\)')
    fi
done
