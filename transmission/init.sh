#!/bin/sh

SCRIPT_DIR=$(dirname $0)
path=$1
#remove application`s link
sh $SCRIPT_DIR/clean.sh

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