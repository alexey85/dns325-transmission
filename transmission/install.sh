#!/bin/sh
path_src=$1
path_des=$2

#copy file to installed directory
cp -R $path_src $path_des
# restore old home if exists
[ -d /tmp/transmission-home ] && cp -Rf /tmp/transmission-home $path_des/transmission/


