#!/usr/bin/env bash
#Petit script pour copier facilement sa clef ssh dans le dossier de Holy Claude afin de pouvoir utiliser Holy Claude avec Github
#zf260518.1749

# source: 

echo -e "
Copie de la clef SSH...


"


cp -R ~/.ssh/ ./data/claude/
chown -R 1000:1000 ./data/claude/.ssh/

echo -e "

Clef SSH copiée !

On peut tester si cela fonctionne avec cette commande à faire tourner dans le web terminal de Holy Claude

ssh -T git@github.com


"

