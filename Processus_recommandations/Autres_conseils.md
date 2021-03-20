# Autres conseils ou astuces

## Utilisation de set 

| | Description |
|:--:|:--:|
| set -e | si erreur = exit |
| set -u | si une variable n'est pas utilisée = exit |
| set -f | désactive le globbing (à enlever si utilisation) |
| shopt -s failglob | si erreur de correspondance avec un regex alors = exit |
| set -o pipefail | si certaines commandes n'ont pas fonctionnées dans le pipe alors = exit  |

## Conseil écriture de scripts

* Ecrire les scripts comme si dans deux ans quelqu'un d'autre alait les faire évoluer.
* Commenter.
* Espacer.
* Indenter.
* Créer des variables explicites. 
* Utiliser $(toto) au lieux de `toto`.
* Avant de quitter un script par une erreur toujours décrire cette erreur.
* Utiliser le plus possible les enchainements de commandes avec &&||| ;...

## Conseils en ligne de commandee 

Preferer les flag au arg
ex:

dpkg -i nom
dpkg --install nom
