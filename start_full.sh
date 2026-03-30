#!/usr/bin/env bash
#Petit script pour démarrer facilement Holy Claude full
#zf260330.1022

# source: 

echo -e "
Démarrage de Holy Claude full...


"

docker compose -f docker-compose.full.yaml up -d ; docker compose logs -f


echo -e "

Holy Claude démarré !

"

