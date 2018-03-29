#!/bin/bash

# gbv260318 
# debut gestion timer salon:
echo  > /etc/spotnik/temp

# CPTR correspond au nombre de minutes  max souhaitees dans le sa$
CPTR=$((3*60));


ligne0=`sed -n '$p' /tmp/svxlink.log`;
a=$(echo $ligne0 | cut -c 1-24);

if ! [ -z ${lign0} ]; then
PRNH=$(date +%s -d "$a");
date >> /etc/spotnik/temp
else
date >> /etc/spotnik/temp

PRMH=$(date +'%s');
fi
DRNH=$PRMH;
tpsecoule=$(($PRMH-$DRNH));
while [ $tpsecoule -le $CPTR ];
do
#on prend seulement les 20 derniere lignes du log svxlink
#on ne garde que les 4 premières colonnes
#on ne conserve  au final que les lignes contenant Rx1
tail -20 /tmp/svxlink.log | cut -d: -f1,2,3,4 | grep Rx1 > /tmp/tmptim;
ligne=`sed -n '$p' /tmp/tmptim`;
#seule la dernière ligne Rx1 est affectée a la variableligne

if ! [ -z ${ligne} ]; then
 a=$(echo $ligne | cut -c 1-24);
 b=$(date +%s -d "$a");

 if [ $b -ge $PRMH ]; then
        DRNH=$b;
 fi
fi
sleep 10;
ACTH=$(date +'%s');
tpsecoule=$(($ACTH-$DRNH));
echo tpsecoule $tpsecoule CPTR $CPTR >>  /etc/spotnik/temp
done

# f4gbv 260318 fin gestion timer salons
