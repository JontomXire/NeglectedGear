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


MAJOR_VERSION=$(grep major_version version.lua | sed 's#.* = \([0-9]*\);#\1#')
MINOR_VERSION=$(grep minor_version version.lua | sed 's#.* = \([0-9]*\);#\1#')

MINOR_VERSION=$((${MINOR_VERSION} + 1))

echo "Updating version to ${MAJOR_VERSION}.${MINOR_VERSION}"

sed -i "s#.*minor_version.*#NeglectedGear.minor_version = ${MINOR_VERSION};#" version.lua

git add version.lua


