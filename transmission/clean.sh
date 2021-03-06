#!/bin/sh

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
