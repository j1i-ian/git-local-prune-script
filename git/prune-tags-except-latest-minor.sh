#!/bin/bash

TAG_PREFIX="release-"
LATEST_MINOR_VERSION=$(git tag -l | grep -E "\d.\d" | sed "s/$TAG_PREFIX//" | sort -rV | head -n 1 | awk -F"." '{ print $2 }')

echo "Latest minor version is "$LATEST_MINOR_VERSION

REMOVE_TARGETS=$(git tag -l | grep -Eiv "\d.$LATEST_MINOR_VERSION.\d")

for target in $REMOVE_TARGETS
do 
    git tag -d $target
done
