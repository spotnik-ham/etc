#!/bin/bash

# ARGUMENTS :
# %1 : chemin&nom_du_fichier (exemple : /tmp/svxlink.log)


#231218 f4gbv sauvegarde des logs anciens. sur [nbJ] jours
# syntaxe :
# ./conserve_log.sh nom_fichier 
# exemple
# ./conserve_log.sh  /tmp/svxlink.log
#
# résultat après ce script :
# un fichier nommé:   /tmp/svxlink.logAAMMJJ~    est créé 
#



#paramètres :
nbJ="10"   # nombre de jours pendant lesquels on conserve les sauvegardes de logs.

sArchive="l archive existe déjà";
if [ -f "$1" ]; then
	if ! [ -z "$1" ]; then
		dDateJour=$(date +"%y%m%d")
		if ! [ -f "$1$dDateJour~" ]; then
			cp $1 $1`date +"%y%m%d"`~;
			sArchive="archivage effectué avec succès";
		else
			#complement a l archive du jour:
			cat $1 >> $1`date +"%y%m%d"`~;
		fi
		ligne=`ls -lr $1??????~ | tail -1 | tail -c8`
		ligne1=${#ligne:0:6}
		dDateValide=$(date -d "$ligne1" +'%s')
	else
		# au cas où on a oublié de mettre le nom de fichier en argument :	
		unset ligne1;
	fi	
		
	if ! [ -z "$ligne1" ]; then
		dixJours=$(date -d "-$nbJ days" +'%s');
		if [ "$dDateValide" -le "$dixJours" ]; then 
			echo	suppression de $1$ligne;
			echo CTRL-C pour annuler ...
			sleep 5;
			rm -f $1$ligne;
			echo fichier supprimé !;
			ls -lr $1??????~;
		else
			echo $sArchive;
			echo la plus ancienne archive date de AAMMJJ:$ligne;
		fi
	else
		echo pas d archive à supprimer ;
	fi
else
	echo le fichier n existe pas;
fi