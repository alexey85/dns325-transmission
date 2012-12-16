#!/bin/sh

SCRIPT_DIR=$(dirname $0)
path_src=$1
path_des=$2

#stop daemon
sh "$SCRIPT_DIR"/stop.sh

#remove application`s link
sh $SCRIPT_DIR/clean.sh

#cmd on reinstall
# backup home directory
[ -d $path_src/transmission-home ] && cp -Rf $path_src/transmission-home /tmp/
#[ -d $path_des ] && rm -r $path_des

#copy file to installed directory
#sh $SCRIPT_DIR/install.sh $path_src $path_des
