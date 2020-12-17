# Les logs

## La commande "logger"

Cette commande permet l'insertion de messages dans les logs du système.

Exemple :

```bash
logger -p local5.info "message"

```
Titre du message : local5

Contenue du message : "message"

Niveau de sévérité : information

## Autre manière de faire

Cette manière de faire c'est si nous voulons choisir le fichier qui va servir de log.

```Bash
#!/bin/bash

#Variable date du jour
dat=$(date "+%m_%d_%y-%H_%M_%S")

#Création des logs
ficlog="smartlog_$dat"
touch "${ficlog}"
exec > >(tee -a "${ficlog}")
exec 2>&1
```