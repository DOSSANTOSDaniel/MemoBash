# Mémo des commandes et autre 
```bash
#La commande yes pour répondre automatiquement ex:

yes | apt-get install htop
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
## Affiche les dossiers ou fichiers avec leur taille representée graphiquement.
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
```
## Installation des gestionnares de bureaux
```bash
Tasksel

#https://wiki.debian-fr.xyz/Tasksel
```
## Test d'ouverture d'un port
```bash
telnet localhost 22
```
## Permet de télécharger des objets comme avec wget
```bash
curl -L -O url

#-L  suivre une redirection

#-O  sauvegarde le fichier avec le nom source
```
## Commande permettant de supprimer tous les images et containers d'un coup
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
## Affiche l'adresse MAC d'une machine
```bash
cat /sys/class/net/eth0/address
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
## Permet de savoir si on est dans une machiine virtuelle ou une machine physique
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
