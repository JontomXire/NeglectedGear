#!/bin/bash

mkdir NeglectedGear
cp -r Libs NeglectedGear
cp NeglectedGear.toc NeglectedGear.xml embeds.xml *.lua NeglectedGear
zip -r NeglectedGear.zip NeglectedGear
rm -rf NeglectedGear


