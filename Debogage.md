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

## Utiliser le mode strict de Bash

Exemple :

```bash
#!/bin/bash

set -euo pipefail
IFS=$'\h\T'
```

"set -e" cause l’interruption immédiate de l’interpréteur de commande s'il a rencontré une erreur durant l'exécution du script, (si le statut de retour est différent de 0), mais parfois on va avoir besoin d'avoir une valeur autre que 0 comme retour, on peut alors isoler seulement les partie du script qui nous intéressent avec :

```bash
set +e
.
.
.
set -e
```
Utiliser ce mécanisme le plus possible, à ne pas utiliser si c'est un script interactif !


