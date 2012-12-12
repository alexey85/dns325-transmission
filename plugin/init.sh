#!/bin/sh

path=$1
#remove link
[ -L /usr/bin/transmission-create ] && rm /usr/bin/transmission-create  2> /dev/null
[ -L /usr/bin/transmission-daemon ] && rm /usr/bin/transmission-daemon  2> /dev/null
[ -L /usr/bin/transmission-edit ] && rm /usr/bin/transmission-edit      2> /dev/null
[ -L /usr/bin/transmission-remote ] && rm /usr/bin/transmission-remote  2> /dev/null
[ -L /usr/bin/transmission-show ] && rm /usr/bin/transmission-show      2> /dev/null
#create link for config
[ -L /etc/transmission-daemon ] && rm /etc/transmission-daemon 2> /dev/null

# webpage link
[ -L /var/www/transmission ] && rm /var/www/transmission 2> /dev/null

#create link
ln -s $path/bin/transmission-create /usr/bin/transmission-create
ln -s $path/bin/transmission-daemon /usr/bin/transmission-daemon
ln -s $path/bin/transmission-edit /usr/bin/transmission-edit
ln -s $path/bin/transmission-remote /usr/bin/transmission-remote
ln -s $path/bin/transmission-show /usr/bin/transmission-show

#create link for config
ln -s $path/transmission-home /etc/transmission-daemon

# webpage link
ln -s $path/share/transmission /var/www/transmission
ln -s $path/index.html /var/www/transmission/index.html

