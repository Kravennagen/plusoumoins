#!/bin/bash
## plusoumoins.sh for  in /home/flaman_m/plusoumoins
## 
## Made by FLAMANT Morgane
## Login   <flaman_m@etna-alternance.net>
## 
## Started on  Mon Nov  3 16:33:12 2014 FLAMANT Morgane
## Last update Wed Nov  5 17:03:42 2014 FLAMANT Morgane
##

nbr=0
mine=0

nombre=$RANDOM
let "nombre %= 100"
nh=0
nbj=1
echo "Nombre de joueur ? 1/2"
read nbj

while [ $nbj -gt 2 ] || [ $nbj -lt 1 ]
do echo "Min 1 joueur , max 2 joueurs"
read nbj
done
clear

if [ $nbj -eq 2 ]
then
echo "Joueur 1 entre un nombre entre 0 et 100"
stty -echo
read nombre
stty echo 
echo "On joue avec des mines? o/n"
read mine
regex="^[0-9]*[0-9]$"

while [ $nombre -gt 100 ] || [ $nombre -lt 0]
do
echo "Entre 0 et 100"
stty -echo
read nombre
stty echo
done
clear
echo "Joueur 2 joue"
nh=1
else 
clear
echo "Bonjour, $USER,"
echo "Vous devez choisir un nombre entre 100 et 0, vous avez 10 chances"
echo "Ah, j'oubliais, on joue avec des mines o/n"
read mine

echo "A vous de jouer"
fi

while test $nbr != 10  
do echo "Aller on tape un nombre"
    if [ "$mine" = "o" ]
    then
    nbr2=$RANDOM
    let "nbr2 %= 100"
    else 
	nbr2=1000
    fi
   
    let "got = 10 - $nbr"
    if [  $got -gt 1 ]
    then
    echo "Essais restant = $got"
    else 
	echo "Essai restant = $got"
    fi
    read chiffre
    if [ "$chiffre" = "$nbr2"  ]
    then
	echo "Oooops, vous etes sur une mine"
	exit
    fi
    
    if [ "$chiffre" = "exit" ] 
    then
	exit
    fi
    
    regex="^([0-9])"
    
    if [[ "$chiffre" =~ $regex ]]
    then
    tmp=$(($chiffre * 1))    
    if [ "$chiffre" != "$tmp" ]
    then
        echo "On a dit une valeur entre 0 et 100"
        nbr=$(($nbr-1))
    elif [ $chiffre -lt 0 ] || [ $chiffre -gt 100 ]
    then
        echo "Un chiffre entre 0 et 100"
        nbr=$(($nbr-1))
    elif [ $chiffre -ge 0 ] && [ $chiffre -le 100 ]
    then
	if [ $chiffre -eq $nombre ]
	then
	    clear
	    nbr=$(($nbr+1))
	    echo "Felicitation c'est le nombre"
	    echo "$nbr coup jouer"
	    nbf=1
	    if [ $nh -eq 0 ] ; then
		if [ 'find ./test = 0'  ] ; then
		    echo "$USER = $nbr coup jouer" >> test
		else
		    exec 3<test
		    while read line 0<&3
		    do
			if [ $nbf -eq 0]
			then 
			    break
			fi
		        nbf=$(($nbf+1))
			
		    done
		    echo "$USER = $nbr coup jouer" >> test
		    echo "score:"
		    
		fi
		cat ./test  
	    fi
	    exit
	elif [ $chiffre -lt $nombre ]
	then
	    echo "C'est plus grand"
	else
	    echo "C'est plus petit"
	fi
    fi
    else
	echo "J'attends une valeur entre 0 et 100"
	nbr=$(($nbr-1))
    fi
    nbr=$(($nbr+1)) 
    
done
clear
echo "You loose"
