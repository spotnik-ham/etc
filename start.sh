#!/bin/bash

# DTMF 96 RRF #


# Save network
echo "rrf" > /etc/spotnik/network

#/etc/spotnik/audio.sh

rm /usr/share/svxlink/sounds/fr_FR/PropagationMonitor/name.wav

ln -s /etc/spotnik/Rrf.wav /usr/share/svxlink/sounds/fr_FR/PropagationMonitor/name.wav

rm -f /etc/spotnik/svxlink.rrf
sleep 1
cat /etc/spotnik/svxlink.cfg >/etc/spotnik/svxlink.rrf

echo "HOST=rrf3.f5nlg.ovh" >>/etc/spotnik/svxlink.rrf
echo "AUTH_KEY=Magnifique123456789!" >>/etc/spotnik/svxlink.rrf
echo "PORT=5300" >>/etc/spotnik/svxlink.rrf


sleep 1

# Clear logs
> /tmp/svxlink.log

# Launch svxlink
svxlink --daemon --logfile=/tmp/svxlink.log --pidfile=/var/run/svxlink.pid --runasuser=root --config=/etc/spotnik/svxlink.rrf
sleep 1

# Enable propagation monitor module
echo "10#" > /tmp/svxlink_dtmf_ctrl_pty

