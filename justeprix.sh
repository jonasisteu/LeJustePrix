#!/bin/bash

#Définition du nombre cible dans une variable avec la command shuf

tarnum=$(shuf -i 1-100 -n 1)
count=1
try=0
#Affichage du nombre cible pour test

#echo $tarnum

#Lire l'entrée du joueur qui servira de nombre de comparaison avec le nombre cible

while [ $try -ne $tarnum ]
do
    echo -n "Coup $count : " && read try
    
    #Vérifier si le nombre est compris entre 1 et 100
    if [[ $try =~ ^[0-9]+$ ]]
    then
	
	#Conditions de comparaison
	if [ $try -ge 1 ] && [ $try -le 100 ]
	then
	    
	    if [ $try -eq $tarnum ]
	    then	
		echo "Félicitations ! Vous avez trouvé le juste prix *$tarnum* en $count coups !"
		break
	    fi
	    if [ $try -lt $tarnum ]
	    then
		echo "C'est plus !"
		count=$((count+1))
	    fi
	    if [ $try -gt $tarnum ]
	    then
		echo "C'est moins !"
		count=$((count+1))
	    fi
	else
	    echo "Entrez un nombre valide entre 1 et 100 !"
	fi
    else
	echo "Entrez un nombre valide entre 1 et 100 !"
	try=0
    fi
done
