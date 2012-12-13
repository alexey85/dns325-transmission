#!/bin/sh

path=$1
#remove application`s link
[ -L /usr/bin/transmission-create ] && rm /usr/bin/transmission-create  2> /dev/null
[ -L /usr/bin/transmission-daemon ] && rm /usr/bin/transmission-daemon  2> /dev/null
[ -L /usr/bin/transmission-edit ] && rm /usr/bin/transmission-edit      2> /dev/null
[ -L /usr/bin/transmission-remote ] && rm /usr/bin/transmission-remote  2> /dev/null
[ -L /usr/bin/transmission-show ] && rm /usr/bin/transmission-show      2> /dev/null

#create link for transmission home dir
[ -L /etc/transmission-daemon ] && rm /etc/transmission-daemon 2> /dev/null

# webpage link
[ -L /var/www/transmission ] && rm /var/www/transmission 2> /dev/null

# application web content link
[ -L /usr/share/transmission ] && rm /usr/share/transmission 2> /dev/null

#create link
ln -s $path/bin/transmission-create /usr/bin/transmission-create
ln -s $path/bin/transmission-daemon /usr/bin/transmission-daemon
ln -s $path/bin/transmission-edit /usr/bin/transmission-edit
ln -s $path/bin/transmission-remote /usr/bin/transmission-remote
ln -s $path/bin/transmission-show /usr/bin/transmission-show

#create link for config
ln -s $path/transmission-home /etc/transmission-daemon

# application web content link
ln -s $path/share/transmission /usr/share/transmission

# webpage link
ln -s $path/web /var/www/transmission