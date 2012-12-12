#!/bin/sh
#start daemon

export TRANSMISSION_WEB_HOME=/var/www/transmission/web
/usr/bin/transmission-daemon -g /etc/transmission-daemon/
#cmd on start daemon
