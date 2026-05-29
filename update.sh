#!/usr/bin/env bash
#Petit script pour updater facilement Holy Claude full
#zf260529.0957

# source: 

echo -e "
Update de Holy Claude...


"

./stop.sh
docker system prune -a -f --volumes
./start_full.sh


echo -e "

Holy Claude updaté et démarré !

"

