# Travailler avec un fichier temporaire dans un script

Cela permet d'effacer à chaque fois ces traces si besoin d'utiliser un fichier temporaire.

Exemple :

```bash
#!/bin/bash

temp_file="$(mktemp)"

<commandes et utilisation du fichier temporaire>
<echo "date +%Y" >> ${temp_file}>

rm -rf "${temp_file}" # Supprimer à la fin du script

``` 

Par contre si jamais le script est interrompue alors le fichier temporaire ne sera effacé que au prochaine démarrage du système.

Nous allons alors améliorer ce système :

```bash
#!/bin/bash

finish(){
  rm -rf "${temp_file}" # Supprimer à la fin du script
}

trap finish EXIT

temp_file="$(mktemp)"

```

Ici à partir du moment qu'il y a un signale exit, alors la fonction finish est exécutée !

On va pouvoir utiliser cette technique pour faire du nettoyage à la fin de l'exécution de nos scripts.

Il est pas conseiller d'utiliser des fichiers temporaires car il vont consommer beaucoup de ressources a cause des accès disque.


