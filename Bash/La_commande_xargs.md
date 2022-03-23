# La commande xargs

Permet de rediriger la sortie d'une commande comme argument vers une autre commande.

## Syntaxe

```Bash
"commande_1" | xargs [options] "commande_2"
```
Xargs sépare les arguments de la première commande par l'espace ou le retour à la ligne, il permet de ne pas utiliser de boucles.

On peut changer le délimiteur avec les options suivantes : `-d ou --delimiter`

l'option -n permet de déterminer combient d'ocurences traiter par ligne.
l'option -I remplace l'argument.

## Exemples
```Bash
cat files.txt | xargs touch
```

```Bash
cat files.txt | xargs rm -v
```

## Autre utilité
Rediriger la sortie d'une commande en tant qu'argument vers une commande qui ne support pas le piping. 
Exemple avec la commande date :

```Bash
date | echo
```
Ici nous avons pas eu de résultat car la commande echo ne supporte pas piping donc la sortie de la commande date ne peut pas aller sur l'entrée de la commande echo, mais avec xargs cela fonctionne.
```Bash
date | xargs echo

mer. 23 mars 2022 16:22:27 CET
```

Changement du délimiteur "-" et traitement d'une occurence par ligne.

Exemple :

```Bash
echo -n 123-456-7890 | xargs -d "-" -n 1 echo
```

On peut représenter les arguments passés par un symbole, définition du symbole : -I(le symbole). 
Cela fonctionne comme une variable.
```Bash
echo -n "123-456-789" | xargs -d - -n 1 -I{} echo {}
```
