#!/bin/bash

 # On regle les niveaux audio

amixer -c 0 cset numid=6 78%

sleep 1

amixer -c 0 cset numid=4 12%

sleep 1

screen -dmS "svxlink" svxlink --pidfile=/var/run/svxlink.pid --runasuser=root --config=/etc/spotnik/svxlink.rrf
