#!/bin/bash

for target in $(git branch | tee | grep -v "*")
do
    [[ $(git branch -r | grep $target | wc -l) -gt 0 ]] \
    && echo "Remote branch detected :"$target \
    || (git branch -D $target && echo "["$target"] branch is deleted")
done;
