#!/bin/sh

path_src=$1
path_des=$2
#stop daemon

killall transmission-daemon 2> /dev/null
#remove link
[ -L /usr/bin/transmission-create ] && rm /usr/bin/transmission-create  2> /dev/null
[ -L /usr/bin/transmission-daemon ] && rm /usr/bin/transmission-daemon  2> /dev/null
[ -L /usr/bin/transmission-edit ] && rm /usr/bin/transmission-edit      2> /dev/null
[ -L /usr/bin/transmission-remote ] && rm /usr/bin/transmission-remote  2> /dev/null
[ -L /usr/bin/transmission-show ] && rm /usr/bin/transmission-show      2> /dev/null

#create link for config
[ -L /etc/transmission-daemon ] && rm /etc/transmission-daemon   2> /dev/null

[ -L /var/www/transmission/index.html ] && rm /var/www/transmission/index.html 2> /dev/null
[ -L /var/www/transmission ] && rm /var/www/transmission 2> /dev/null
#cmd on reinstall
[ -d $path_des ] && rm -r $path_des
#copy file to installed directory
#[ -d $path_des ] && [ -d $path_src ] && cp -R $path_src $path_des