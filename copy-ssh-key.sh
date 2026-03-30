#!/usr/bin/env bash
#Petit script pour copy très facilement sa clef ssh dans le container docker après que Holy Claude ait démarré
#ATTENTION: ne support pas l'arrêt du container, donc il faudra le lancer chaque fois que l'on a besoin d'une connexion ssh avec le container !
#zf260330.1224

# source: 

echo -e "
Copie de sa clef ssh dans le container...

"

scp -P 2222 -r /root/.ssh/ claude@localhost:/home/claude/


echo -e "


Copie terminée !

On peut se connecter dans le container Holy Claude avec ceci:

ssh root@localhost -p 2222
ssh claude@localhost -p 2222

ou copier sa clef ssh dans le container

scp -P 2222 -r /root/.ssh/ claude@localhost:/home/claude/

après l'avoir générée avec:

ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519

ATTENTION: pour qu'elle soit valide sur Github, il faudra lui donner la clef publique !

"

