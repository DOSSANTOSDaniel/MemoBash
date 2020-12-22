# La gestion des erreurs

Il est important de mettre en place une politique de gestion des erreurs au sein d'un script, car par exemple si jamais une commande retourne une erreur le script ne va pas forcement s’arrêter et cela peut causer une catastrophe au niveau de votre système.

Pour éviter ce comportement par défaut du shell on a la commande set -e, qui permet d’interrompre le script là où il y a eu l'erreur, au moindre retour d'erreur le script s’arrête immédiatement.

Il est fortement conseiller de toujours utiliser set -e dans nos scripts.

Par contre si jamais notre script a pour fonction de cherche à avoir une erreur pour un test quelconque alors il ne faut pas utiliser set -e car si non le script s’arrêterait immédiatement et nous permettrait pas d'avoir le temps de traiter l'erreur.

A l'aide de la commande set -e on peut sélectionner les bouts de code que nous voulons soumettre à la commande set -e et ainsi le comportement de set -e n'affectera pas l’ensemble du script mais seulement certaines parties.

Exemple :

S'appliqua à tout le script.

```bash
#!/bin/bash

set -e
.
.
.
.
.
.
.
.

``` 

S'applique à une section du script.

```bash
#!/bin/bash
.
.      <-------- section non contrôlée
.
set +e
.
.      <-------- section contrôlée
.
set -e
.
.
.      <-------- section non contrôlée
.

``` 

## Gérer les erreurs au niveau des commandes utilisées avec flux

Suite à l’enchaînement de plusieurs commandes on peut récupérer l’état de retour de chaque commande avec la variable "$PIPESTATUS".

Exemple :

```bash
[daniel🐧iS3810](~)$ cd /home/daniel/fileX | uptime

bash: cd: /home/daniel/fileX: Aucun fichier ou dossier de ce type
 17:13:03 up 10:12,  2 users,  load average: 0,02, 0,08, 0,14
[daniel🐧iS3810](~)$ echo "${?}"

0

```

Ici on peut voir que malgré l'erreur, l’exécution des commandes a continuée, car la commande uptime a été exécutée et on peut observer que le retour est de 0.

```bash
[daniel🐧iS3810](~)$ cd /home/daniel/fileX | uptime

bash: cd: /home/daniel/fileX: Aucun fichier ou dossier de ce type
 18:07:49 up 11:07,  2 users,  load average: 0,20, 0,26, 0,24
[daniel🐧iS3810](~)$ echo "${PIPESTATUS[@]}"

1 0

```

$PIPESTATUS est un tableau qui contient tous les retours des commandes passées en flux. 