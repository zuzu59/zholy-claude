#!/usr/bin/env bash
#Petit script pour installer facilement openssh-server dans le container docker après que Holy Claude ait démarré
#ATTENTION: ne support pas l'arrêt du container, donc il faudra le lancer chaque fois que l'on a besoin d'une connexion ssh avec le container !
#zf260331.1059

# source: 

echo -e "

Avez-vous configuré la variable d'environnent pour le password SSH ?

Password actuel: $SSH_PASSWORD

Si non, faire ceci avant !

export SSH_PASSWORD=votre_password_ssh

"

read -p "Voulez-vous continuer l'installation ?"



echo -e "
Installation de openssh-server dans le container...

"

docker exec -it holyclaude sh -c 'apt update && apt install -y openssh-server locales && sed -i "/fr_CH.UTF-8 UTF-8/s/^# //g" /etc/locale.gen && locale-gen fr_CH.UTF-8 && export LANG=fr_CH.UTF-8 && update-locale LANG=fr_CH.UTF-8'
#docker exec -it holyclaude sh -c 'sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/"  /etc/ssh/sshd_config && echo "root:$SSH_PASSWORD" | chpasswd && echo "claude:$SSH_PASSWORD" | chpasswd'

docker exec -it holyclaude sh -c "sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && echo root:$SSH_PASSWORD | chpasswd && echo claude:$SSH_PASSWORD | chpasswd"


docker exec -it holyclaude sh -c 'mkdir -p /run/sshd && chmod 0755 /run/sshd && chown root:root /run/sshd'
docker exec -d holyclaude sh -c "pkill sshd; /usr/sbin/sshd -D"



echo -e "


Installation terminée !

On peut se connecter dans le container Holy Claude avec ceci:

ssh root@localhost -p 2222
ssh claude@localhost -p 2222

ou copier sa clef ssh locale dans le container

./copy-ssh-key.sh


"

