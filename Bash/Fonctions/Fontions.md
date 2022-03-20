# Les fonctions

Les fonction permettent de découper notre code en plusieurs parties pour pouvoir par la suite les réutiliser sans avoir besoin de les réécrire.

A l'aide des fonction on peut aussi scoper du code pour qu'il ne soit accessible que dans la fonction et ainsi utiliser des variable locales.

Utiliser les fonctions est primordiale car cela simplifie le code et facilite sont maintient.

## Syntaxe

```bash
nom de la fonction() {
  # contenu de la fonction
}
```

## Utilisation des fonctions
On va créer une fonction qui permet de mettre en majuscule une chaîne de caractères :
```Bash
chaine_maj() {
  echo "${1}" | tr "[a-z]" "[A-Z"
}
```

Utilisation de la fonction "chaine_maj" :
```bash
chaine_maj daniel

DANIEL

```

En Bash on ne passe pas de paramètres aux fonction, il y aura donc jamais de paramètres entre "()" on va plutôt utiliser la même technique que pour les arguments d'entrée d'un script, de "${1}" à "${n}".

Il faut toujours placer la définition de la fonction avant sont appel et avant le corps du script.

Par défaut toute les variables déclarer dans un script sont accessibles dans les fonction mais par contre dans certains cas seulement, les variables déclarées dans une fonction peuvent être visibles aussi dans le script et pour éviter cela on déclare une variable locale avec la commande "local".

## Les variables locales dans une fonction
On peut créer des variables visibles que dans leur fonction avec la commande "local" :

```Bash
#!/bin/bash

chaine_maj() {
  local nom="daniel"
  echo "${nom}" | tr "[a-z]" "[A-Z"
}

echo "Le nom est : ${nom}"

chaine_maj
```

## Variable interne à une fonction

La variable "$FUNCNAME" contient le nom de la fonction en cours d’exécution.

## bonne pratique

Il est recommandé d'utiliser des variables locales pour contenir les arguments d'entrée d'une fonction ici la variable locale "nom" contient "${1}":

```bash
#!/bin/bash

chaine_maj() {
  local nom="${1}"
  echo "${nom}" | tr "[a-z]" "[A-Z"
}

chaine_maj daniel
```


 
