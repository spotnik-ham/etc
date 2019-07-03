#!/bin/bash

# gbv260318 4hwn280619
# debut gestion timer salon:
echo  > /tmp/timtmp

# CPTR correspond au nombre de minutes  max souhaitees dans le sa$
CPTR=$((6*60));

ligne0=`sed -n '$p' /tmp/svxlink.log`;
# a=$(echo $ligne0 | cut -c 1-23);
 a=$(echo $ligne0 | cut -d ":" -f1,2,3);


if ! [ -z "$lign0" ]; then
PRMH=$(date +%s -d "$a");
else
PRMH=$(date +'%s');
fi

date >> /tmp/timtmp

DRNH=$PRMH;
tpsecoule=$(($PRMH-$DRNH));

while [ $tpsecoule -le $CPTR ];
do
#on prend seulement les 20 derniere lignes du log svxlink
#on ne garde que les 4 premières colonnes
#on ne conserve  au final que les lignes contenant Rx1
tail -20 /tmp/svxlink.log | cut -d: -f1,2,3,4 | grep Tx1 > /tmp/tmptim;
ligne=`sed -n '$p' /tmp/tmptim`;
#seule la dernière ligne Rx1 est affectée a la variableligne

if [ -z "$ligne" ]; then
	echo . > null;
else
# a=$(echo $ligne | cut -c 1-23);
 a=$(echo $ligne | cut -d ":" -f1,2,3);

 b=$(date +%s -d "$a");

 if [ $b -ge $PRMH ]; then
        DRNH=$b;
 fi
fi
sleep 10;
ACTH=$(date +'%s');
tpsecoule=$(($ACTH-$DRNH));
echo tpsecoule $tpsecoule CPTR $CPTR >>  /tmp/timtmp
done
date >> /tmp/timtmp

# f4gbv 260318 fin gestion timer salons
# f4hwn 280619 retour sur le RRF
/etc/spotnik/restart.rrf
