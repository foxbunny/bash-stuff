#!/bin/bash

for d in *
do
    if [ -d "$d" ] && [ -d "$d/.git" ]
    then
        echo $d: $(cd "$d" && git log --decorate=short | grep commit | grep '(HEAD' | cut -f2 -d' ')
    fi
done
