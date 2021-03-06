# Mémo des commandes et autre 

## La commande yes pour répondre automatiquement ex:

```bash
yes | apt-get install htop
```

## Diagnostique réseau

```bash
mtr 8.8.8.8

```

## Afficher la météo

```bash
curl wttr.in
```

## Affiche les dossiers les plus lourd dans un point de l'arborescence

```bash
ncdu
```

## Affiche IP

```bash
hostnamectl -I
```

## Supprime disque

```bash
nwipe
```

## Affiche infos HW

```bash
inxi -Fx
```

## Affiche le % des disques

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

## Vocal

```bash
espeak -v fr "titi toto"
```

## Installation des bureaux

```bash
Tasksel
```
https://wiki.debian-fr.xyz/Tasksel

## Test port

```bash
telnet localhost 22
```

## Permet de télécharger des objets comme avec wget

```bash
curl -L -O url
```
-L  suivre une redirection

-O  sauvegarde le fichier avec le nom source

## Commande permettant de supprimer tous les images et containers

```bash
docker system prune
```

## Garder la connexion en SSH

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

## Scanne des ordinateur possèdent un nom net-bios

```bash

sudo nbtscan -r 192.168.0.0/24

sudo nbtscan -rv 192.168.0.0/24

nbtscan 192.168.0.1-254

nbtscan -v -s : 192.168.1.0/24

```

## Affiche l'adresse MAC

```bash
cat /sys/class/net/eth0/address
```
## Affiche les numéros de lignes

```bash
cat -n fichier.txt
```
## Test de vitesse d'écriture et lecture disque

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

## Permet de savoir si on est dans une vm ou une machine physique

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
