#!/bin/sh

SCRIPT_DIR=$(dirname $0)
path=$1

#remove application`s link
sh $SCRIPT_DIR/clean.sh

#remove application`s link
sh $SCRIPT_DIR/clean.sh

#cmd on remove

#remove intstalled directory
rm -r $path
