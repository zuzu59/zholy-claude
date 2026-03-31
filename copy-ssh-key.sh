#!/usr/bin/env bash
#Petit script pour copier très facilement sa clef ssh locale dans le container docker après que Holy Claude ait démarré
#ATTENTION: ne support pas l'arrêt du container, donc il faudra le lancer chaque fois que l'on a besoin de sa clef ssh dans le container !
#zf260331.1045

# source: 


echo -e "

Avez-vous déjà une clef ssh locale ?
Si non, faire ceci avant !

ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519

"

read -p "Voulez-vous continuer avec la copie de votre clef ssh locale dans le container Holy Claude ?"

echo -e "
Copie de sa clef ssh locale dans le container...

"

echo -e "Copie de sa clef publique pour l'utilisateur root..."
ssh-copy-id -p 2222 root@localhost

echo -e "Copie de sa clef publique pour l'utilisateur claude..."
ssh-copy-id -p 2222 claude@localhost

echo -e "Copie de sa clef privée pour l'utilisateur claude..."
scp -P 2222 -r /root/.ssh/ claude@localhost:/home/claude/


echo -e "


Copie terminée !

On peut se connecter dans le container Holy Claude avec ceci:

ssh root@localhost -p 2222
ssh claude@localhost -p 2222


ATTENTION: pour qu'elle soit valide sur Github, il faudra aussi lui donner votre clef publique !

"

