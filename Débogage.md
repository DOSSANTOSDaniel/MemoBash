# Le débogage

Le débogage est le fait d’analyser l’exécution d'un script soit parce qu'il y a eu des erreurs soit pour prévenir d’éventuels erreurs.

En Bash les outils de débogage sont intégrés.

## Afficher les commandes d'un script avant leur exécution, pour cela on utilise l'option "-v" :

```bash
[daniel🐧iS3810](~)$ bash -v script.sh 

#!/bin/bash

echo "Bonjour, vous êtes dans le répertoire : $(pwd)"
Bonjour, vous êtes dans le répertoire : /home/daniel
```

## L'option "-x" détaille au maximum les opérations effectuées par le script :

```bash
[daniel🐧iS3810](~)$ bash -x script.sh 

++ pwd
+ echo 'Bonjour, vous êtes dans le répertoire : /home/daniel'
Bonjour, vous êtes dans le répertoire : /home/daniel
```

Ici le symbole "+" désigne une action, cela permet de voir le résultat de l’interprétation des lignes de commandes.

## Autre outil

ShellCheck est un outil qui permet de vérifier et améliorez la qualité des scripts.

Installation :
```bash
sudo apt install shellcheck
```
Utilisation :
```bash
shellcheck script.sh
```
