# etc
spotnik configuration files

the main files are in /etc/spotnik

This part contains .sh and configurations files for the spotnik HAM radio/internet relay.

for user documentation please refer to the [spotnik documentation]

## 1ST très important et dépendant de l'architecture 

il faut avoir une connection wifi fonctionnel dans /etc/NetworkManager/system-connections
peut importe son nom, il faut la renommer en SPOTNIK en majuscule pour que la configuration faite par l'interface graphique
gui fonctionne correctement .

## /etc/rc.local 
```
# Orange Pi0
echo "7" > /sys/class/gpio/export
sleep 1
echo out > /sys/class/gpio/gpio7/direction
echo "10" > /sys/class/gpio/export 
sleep 1
echo in > /sys/class/gpio/gpio10/direction
echo "6" > /sys/class/gpio/export 
sleep 1
echo out > /sys/class/gpio/gpio6/direction
echo "2" > /sys/class/gpio/export 
sleep 1
echo in > /sys/class/gpio/gpio2/direction
sleep 1

# Raspberry Pi 
#echo "17" >sys/class/gpio/export
#sleep 1
#echo out > /sys/class/gpio/gpio7/direction
#echo "18" > /sys/class/gpio/export 
#sleep 1
#echo in > /sys/class/gpio/gpio18/direction

sleep 1
/etc/spotnik/restart

sleep 2
cd /opt/spotnik/gui
make start 

exit 0

...

## /etc/asound.conf 

# copy to /etc/asound.conf
#
# configuration alsa loop for svxlink

pcm_slave.hw_Loopback_1_1 {
  pcm "hw:Loopback,0,1"
  format S16_LE
  channels 2
  rate 48000
}

pcm.plug_Loopback_1_1 {
  type plug
  slave hw_Loopback_1_1
  ttable {
    # Copy  input 0 channel to output channel 0 and 1  
    0.0 = 1
    0.1 = 1
  }
}
pcm_slave.hw_Loopback_1_2 {
  pcm "hw:Loopback,1,2"
  format S16_LE
  channels 2
  rate 48000
}

pcm.plug_Loopback_1_2 {
  type plug
  slave hw_Loopback_1_2
  ttable {
    # Copy  input 0 channel to output channel 0 and 1  
    0.0 = 1 
    0.1 = 1
  }
}

## Modif SP2ONG

ctl.equal {
type equal;
controls "/etc/alsaequal.bin"
}
pcm.zequal {
type equal;
slave.pcm "plughw:1,0";
controls "/etc/alsaequal.bin"
}
pcm.equal {
type plug;
slave.pcm plugequal;
}

...

## Production

### Install

```
ssh spotnik
cd /etc
git clone --single-branch --branch Version_4 https://github.com/spotnik-ham/etc.git spotnik

```

### Update

```
ssh spotnik
cd /etc/spotnik
git pull

```

