#!/bin/bash

# DTMF 102#

# Stop svxlink
pkill -TERM svxlink
sleep 2

# Save network
echo "el" > /etc/spotnik/network

#/etc/spotnik/audio.sh


sleep 1

# Clear logs
#> /tmp/svxlink.log

# Launch svxlink
svxlink --daemon --logfile=/tmp/svxlink.log --pidfile=/var/run/svxlink.pid --runasuser=root --config=/etc/spotnik/svxlink.echo
sleep 1

# Enable EchoLink 
echo "2#" > /tmp/svxlink_dtmf_ctrl_pty

# debut gestion timer salon:
pkill -f timersalon
sh /etc/spotnik/timersalon.sh &
