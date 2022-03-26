# Mémo des commandes et autre

## Afficher des commandes par rapport à leurs fonctionnalitées

Exemple je cherche une commande pour travailler avec du Markdown :

```bash
┌──[daniel🐧iS3810]-(~)
│
└─$ man -k 'markdown'

HTML::FormatMarkdown (3pm) - Format HTML as Markdown
mdp (1)              - A command-line based markdown presentation tool

```

## Diagnostique réseau
```bash
#mtr permet d'afficher en continu les résultats d'envois de paquets avec des statistiques détaillées.

mtr 8.8.8.8
```
## Afficher la météo sur le terminal
```bash
# Simple utilisation
curl wttr.in

# Affichage aide
curl wttr.in/:help

# Météo en français dans la ville de Massy
curl fr.wttr.in/Massy

# Les phases de la lune actuellement en France
curl fr.wttr.in/moon@+France

# Avec options
curl fr.wttr.in/Massy?0QF
#0: Affiche seulement la météo de la journée en cours
#Q: Affichage minimal
#F: Ne pas afficher la phrase de publicité

# Création d'une image au format png du résultat de la météo à Massy
curl fr.wttr.in/Massy.png --output Massy.png
ou
curl -O fr.wttr.in/Massy.png

# Image avec transparence
curl fr.wttr.in/Massy_transparency=50.png --output Massy.png
# Transparence de 0 à 255
```
## Affiche les dossiers ou fichiers avec leur taille représentée graphiquement.
```bash
ncdu
```
## Affiche les adresses IP sur la machine
```bash
hostnamectl -I
```
## Supprime un disque entier de manière sécurisé
```bash
nwipe
```
## Affiche des informations sur le matériel
```bash
inxi -Fx
```
## Affiche le taux de remplissage des disques
```bash
pydf
```
## Logo Linux sur le terminal
```bash
linuxlogo -L list
```
## Alternative à SSH
```bash
mosh
```
## Phrases en vocal sur le terminal
```bash
espeak -s 145 -v fr "+Je vous souhaite une bonne journée !"

# -s: vitesse de lecture
# -v: langue

#On peut aussi utiliser say
say "Hello!"
```
## Installation des gestionnares de bureaux
```bash
Tasksel

#https://wiki.debian-fr.xyz/Tasksel
```
## Test d'ouverture d'un port
```bash
telnet localhost 22

nc -zv localhost 22

(echo >/dev/tcp/127.0.0.1/22) &> /dev/null && echo "Port en écoute" || echo "Port fermé"
```
## Permet de télécharger des objets comme avec wget
```bash
curl -L -O url

#-L  suivre une redirection

#-O  sauvegarde le fichier avec le nom source
```
## Commande permettant de supprimer toutes les images et containers d'un coup
```bash
docker system prune
```
## Garder la connexion SSH
```bash
ssh -o "ServerAliveInterval 60" user@domain
```
## Affiche l’occupation des disques
```bash
dfc
```
## Affiche les serveurs samba dans un réseau 
```bash
findsmb
```
## Affiche les ordinateurs possédant un nom netbios sur un réseau
```bash

sudo nbtscan -r 192.168.0.0/24

sudo nbtscan -rv 192.168.0.0/24

nbtscan 192.168.0.1-254

nbtscan -v -s : 192.168.1.0/24
```
## Affiche les numéros de lignes
```bash
cat -n fichier.txt
```
## Test de vitesse d'écriture et lecture de disques
```bash
#!/bin/bash
echo -e "\n Vitesse d'écriture"
echo "--------------------"
sync; dd if=/dev/zero of=/tmp/smart bs=1M count=1024; sync

echo -e "\n Vitesse de lecture"
echo "--------------------"
dd if=/tmp/smart of=/dev/null bs=1M count=1024

rm -rf /tmp/smart
```
## Afficher le résultat d'une commande et en envoyer ce résultat dans un fichier
```bash
#!/bin/bash
commande | tee output.txt
#pareil que:
commande > toto.txt

commande | tee -a output.txt
#pareil que:
commande >> toto.txt
```
## Permet de savoir si on est dans une machine virtuelle ou une machine physique
```bash
sudo virt-what
ou
facter virtual
```
## Récupération de certaines informations du système avec cat
```bash
#Nombres de connections tcp :
cat  /proc/net/tcp | wc -l

#Nombres de connections udp :
cat  /proc/net/udp | wc -l

# Affiche l'adresse MAC d'une machine
cat /sys/class/net/eth0/address

#Table arp :
cat  /proc/net/arp

#Informations sur les interfaces réseau :
cat  /proc/net/route

#wifi :
cat  /proc/net/wireless

#Login :
cat /proc/self/loginuid

#OS type :
cat /proc/sys/kernel/ostype

#Version du kernel :
cat /proc/sys/kernel/osrelease

#Version realease:
cat /proc/sys/kernel/version
```
## Mise en place d'un système de corbeille en cli pour desktop ou serveurs
### La commande trash
```bash
#Installation
apt install trash-cli

#Mettre un fichier à la corbeille
trash-put <fichier>

#Lister les fichiers dans la corbeille
trash-list

#Restorer les fichiers
trash-restore

#Vider la corbeille
trash-empty
```
### La commande gio

```bash
#Installation
#gio est déjà installée sur la plupart des distributions Linux

#Mettre un fichier à la corbeille
gio trash <fichier>

#Lister les fichiers dans la corbeille
gio list trash://

#Vider la corbeille
gio trash --empty
```
## Supprimer proprement un fichier avec la commande shred dans le but d'éviter une éventuelle récupération 

```bash
shred -fuvz -n 5 <fichier>

# -f : Change les permissions en écriture si nécessaire. 
# -u : Supprime le fichier après écrasement.
# -v : Affiche la progression.
# -z : Ajout de zéros à la fin.
# -n : Nombres de phases d'écrasement du fichier.
```
## Afficher un résusltat qui se rafraîchie en une seule ligne
```bash
for i in {1..10000}; do echo -en "$i\r"; done
```
## Faire un tri numérique sur une colonne en particulier à partir d'un fichier
```bash
sort -n -t':' -k 3 /etc/passwd 
```
## Afficher des information sur un utilisateur

```bash
# Avec la commande pinky
┌──[daniel🐧iS3810]-(~)
│
└─$ pinky -l daniel

Identifiant : daniel                      Nom réel :  daniel
Répertoire : /home/daniel                 Interpréteur :  /bin/bash

# Avec la commande id
┌──[daniel🐧iS3810]-(~)
│
└─$ id daniel

uid=1000(daniel) gid=1000(daniel) groupes=1000(daniel),4(adm),20(dialout),24(cdrom),27(sudo),30(dip),46(plugdev),108(kvm),121(lpadmin),131(lxd),132(sambashare),134(libvirt),136(docker)
```
## Récupérer les codes transmis par le clavier
* Scancode
```Bash
showkey -s
```
* Keycode
```Bash
showkey -k
```
## Afficher les charactères invisibles sur un document à la ligne désirée
Exemple à la ligne 197 :
```Bash
cat -A toto.sh | sed -n 197p 
```
## Permet de rechercher des fichiers
```Bash
fzf
```
## Point de montage via SSH
```Bash
sshfs
```
## Plan 
```Bash
telnet mapscii.me
```
## Voir les autres pages des manuels
```Bash
man passwd.5
```
## Exporter en pdf les pages de manuel
```Bash
sudo apt install groff
man -Tpdf ls > ls.pdf
```
## Vérification de la signature
```Bash
sha1_code='4904c8a6df8bac8291b7b7582c26c4da9439f1cf' ; check_sha="$(sha1sum archlinux-2021.08.01-x86_64.iso | awk '{print $1}')" ; [[ $check_sha == $sha1_code ]] && echo 'Vérifié' || echo 'Non vérifié'
```
## L'option -i."nom" de sed permet de faire un backup avant de modifier un fichier
```Bash
sed -i.bak "s/loglevel=3 quiet/loglevel=4" /etc/default/grub
```
## Afficher une image à partir du terminal
```Bash
eog img.png
ou
display img.png
```
## Backup avec RSYNC sur le réseau
```Bash
rsync -v -u -a --rsh=ssh --stats user@'serveur IP':/chemin/dossier/distant/ /chemin/dossier/local
```
## Utilisation de la commande screen
```Bash
# Créer un screen
screen -S "nom"

# Se détacher du screen 
crontrol a + d

# Se rattacher au screen 
screen -r "nom"

# Lister les screens ouverts
screen -ls

# Fermer un screen 
exit

# Se connecter à un screen non détaché 
screen -x "nom"

# Remonter dans l'historique et bien plus dans un screen
# control + a + [
# maintenant on peut naviguer avec les flèches pour sortir de ce mode
# control a + echap
```
## Rechercher des occurrences de textes dans un PDF
```Bash
pdfgrep -F 'tot*' file.pdf
```

## Enregistrer l’activité du terminal et ou le partager

### Enregistrer l’activité du terminal

```Bash
script
scriptreplay
scriptlive
asciinema
```
### Partager le terminal 
En local:
```Bash
screen
tmux
```

Par internet:
[tmate](https://tmate.io/)
[teleconsole](https://www.teleconsole.com/)
[tsl0922](https://tsl0922.github.io/ttyd/)

## Notification popup
```Bash
notify-send "Info IP" "Salut !
```
## Lancement de commandes en parallel
```Bash
#!/bin/bash

task_1() {
    echo "Tâche 1 en cours ..."
    sleep 3
}

task_2() {
    echo "Tâche 2 en cours ..."
    sleep 3
}

task_1 &
task_2 &

wait

echo "Fin de l'éxecution des tâches"
```
## Afficher la première et la dernière ligne 

```Bash
awk 'NR==1{print} END{print}'
```
Exemple :

```Bash
df -h --total | awk 'NR==1{print} END{print}'
```
## Edite la précédente commande dans un éditeur de texte et l'éxécute

```Bash
fc
```
## Affiche le model du périphérique de stockage

Exemple :

```Bash
fdisk -l /dev/sda | grep -m1 ^Disk | awk '{print $3 " " $4}'

SanDisk SSD
```
Ou

```Bash
cat /sys/class/block/sda/device/model

SanDisk SSD PLUS
```

## Démarrer un processus puis le détacher du terminal

Éxécution du processus :

```Bash
sleep 100
```
Interruption du processus :

ctrl z

Mettre le processus en tache de fond :

```Bash
bg
```
Afficher les processus en tache de fond dans le but d'obtenir leur pid :
```Bash
jobs
```

Détacher le processus :

```Bash
disown %<numéro processus(pid)>

exit
```
