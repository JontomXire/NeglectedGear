#!/bin/bash

COMMIT_FILES=$(git diff HEAD --name-only | grep -v "\.sh$")

for i in ${COMMIT_FILES}
do
    if [ -x "$i"  -a ! -d "$i" ]
    then
        echo "Fixing permissions on: $i"
        chmod 644 $i
        git add $i
    fi
done

