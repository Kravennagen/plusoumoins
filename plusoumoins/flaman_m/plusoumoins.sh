#!/bin/bash
## plusoumoins.sh for  in /home/flaman_m/plusoumoins
## 
## Made by FLAMANT Morgane
## Login   <flaman_m@etna-alternance.net>
## 
## Started on  Mon Nov  3 16:33:12 2014 FLAMANT Morgane
## Last update Tue Nov  4 11:43:45 2014 FLAMANT Morgane
##

nbr=0
nombre=$RANDOM
let "nombre %= 100"
echo "Bonjour, $USER,"
while test $nbr != 10
do echo "Choisissez un nombre entre 0 et 100"
   let "got = 10 - $nbr"
    if [ $got -eq '1' ]
    then
	echo "Nombres d'essais restant = $got"
    else
        echo "Nombres d'essais restant= $got"
    fi
    read chiffre
    if [ "$chiffre" = "exit" ]
    then
        exit
    fi
    if [ $chiffre ]
    then
    tmp=$(($chiffre * 1))
    if [ "$chiffre" != "$tmp" ]
    then
        echo "Vous arrivez a calculer a+a ?"
        nbr=$(($nbr-1))
    elif [ $chiffre -lt 0 ] || [ $chiffre -gt 100 ]
    then
        echo "Un chiffre entre 0 et 100"
        nbr=$(($nbr-1))
    elif [ $chiffre -ge 0 ] && [ $chiffre -le 100 ]
    then
        if [ $chiffre -eq $nombre ]
            then
            echo "Felicitation ! La solution est la ! "
            exit
        elif [ $chiffre -lt $nombre ]
        then
            echo "C'est plus grand"
        else
            echo "C'est plus petit"
        fi
      fi
else
    echo "J'attends une valeur"
nbr=$(($nbr-1))
fi
    nbr=$(($nbr+1))
done
echo "You loose"