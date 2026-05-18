#!/usr/bin/env bash
#Petit script pour régler facilement le bon fuseau horaire dans le web terminal de Holy Claude
#zf260518.1831

# source: 

echo -e "
ATTENTION:
Il faut faire ceci:

source /workspace/set-tz.sh

DIRECTEMENT dans le web terminal pour changer le fuseau horaire !

"

date
echo "export TZ=Europe/Zurich" >> ~/.bashrc && source ~/.bashrc
date

