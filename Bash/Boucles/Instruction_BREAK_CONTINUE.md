# Instruction break et continue

## l'Instruction break

Permet d’interrompre une boucle à n’importe quelle étape de celle-ci.

Fonctionne avec les boucles : while, until et for.

Une fois que l'instruction break est interprétée le shell sautera la boucle pour aller à l’instruction suivante.

## l'Instruction continue

La commande continue ne permet pas d’arrêter une boucle, elle retourne à la condition sans exécuter le code après elle.

Fonctionne aussi avec les boucles : while, until et for.

Exemple :

```bash
#!/bin/bash

for var in $(ls /home/daniel/)
do
  if [[ "${var}" =~ "Images" ]]
  then
    continue
  fi
  echo "Le dossier : ${var}"
done             
``` 

Résultat :

```bash
[daniel🐧iS3810](~)$ ./script.sh 

Le dossier : Arduino
Le dossier : Bureau
Le dossier : Documents
Le dossier : git
Le dossier : Modèles
Le dossier : Musique
Le dossier : Nextcloud
Le dossier : Public
Le dossier : PycharmProjects
Le dossier : snap
Le dossier : Téléchargements
Le dossier : Vidéos

```

On peut observer que quand la condition "if [[ "${var}" =~ "Images" ]]" est devenue vrai alors la commande "continue" s'est exécutée et est repartie à la condition for "for var in $(ls /home/daniel/)" et n'a pas permis l'exécution de "echo "Le dossier : ${var}"", elle a sauter cette étape.

