#!/usr/bin/env bash
#Petit script pour installer facilement openssh-server dans le container docker après que Holy Claude ait démarré
#ATTENTION: ne support pas l'arrêt du container, donc il faudra le lancer chaque fois que l'on a besoin d'une connexion ssh avec le container !
#zf260330.1154

# source: 

echo -e "
Installation de openssh-server dans le container...


"

docker exec -it holyclaude sh -c 'apt update && apt install -y openssh-server locales && sed -i "/fr_CH.UTF-8 UTF-8/s/^# //g" /etc/locale.gen && locale-gen fr_CH.UTF-8 && export LANG=fr_CH.UTF-8 && update-locale LANG=fr_CH.UTF-8'
docker exec -it holyclaude sh -c 'sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/"  /etc/ssh/sshd_config && echo "root:tototutu" | chpasswd && echo "claude:tototutu" | chpasswd'
docker exec -it holyclaude sh -c 'mkdir -p /run/sshd && chmod 0755 /run/sshd && chown root:root /run/sshd'
docker exec -d holyclaude sh -c "pkill sshd; /usr/sbin/sshd -D"



echo -e "


Installation terminée !

On peut se connecter dans le container Holy Claude avec ceci:

ssh root@localhost -p 2222
ssh claude@localhost -p 2222

"

