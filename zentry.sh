#!/usr/bin/env bash
#Petit script pour démarrer facilement un script quand le container docker de Holy Claude a démarré
#zf260330.1022

# source: 

echo -e "
Démarrage de zentry...


"

docker exec -it holyclaude sh -c 'apt update && apt install -y openssh-server locales && sed -i "/fr_CH.UTF-8 UTF-8/s/^# //g" /etc/locale.gen && locale-gen fr_CH.UTF-8 && export LANG=fr_CH.UTF-8 && update-locale LANG=fr_CH.UTF-8'

#&& echo "root:tototutu" | chpasswd'

docker exec -it holyclaude sh -c 'sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/"  /etc/ssh/sshd_config && echo "root:tototutu" | chpasswd'


#docker exec -it holyclaude sh -c 'apt install -y locales && sed -i "/fr_CH.UTF-8 UTF-8/s/^# //g" /etc/locale.gen && locale-gen fr_CH.UTF-8 && export LANG=fr_CH.UTF-8 && update-locale LANG=fr_CH.UTF-8'


docker exec -it holyclaude sh -c 'mkdir -p /run/sshd && chmod 0755 /run/sshd && chown root:root /run/sshd'
docker exec -d holyclaude sh -c "pkill sshd; /usr/sbin/sshd -D"



echo -e "

zentry démarré !

"

