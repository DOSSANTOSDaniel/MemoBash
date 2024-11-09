# Recommandations et bonnes pratiques

## Voici quelques recommandations et bonnes pratiques d'après le "Shell style guide" de Google.

1. Privilégier l'utilisation de l’interpréteur Bash au lieu de sh ou autre.
2. L'indentation dans un script (2 espaces), pas de tabulation.
3. Systématiquement documenter le script à l'aide de commentaires.
4. Toujours implémenter une fonction usage(), qui permet de documenter et de décrire le fonctionnement du script, voir dossier "Fonctions".
5. Appeler les variable ainsi : "${toto}".
6. Privilégier les variables en lecture seule si possible, voir le dossier "Variables".
7. Toujours typer les variables.
8. Utiliser un maximum les quottes pour les variables, exemple : "${toto}".
9. Ne jamais utiliser les quottes pour des entiers.
10. Privilégier "${@}" à ${*}.
11. L'utilisation de la commande "eval" n'est pas recommandée.
12. Toujours vérifier la valeur de statut à chaque opération.

## Autres recommandations

1. Il n'est pas conseillé d'écrire le chemin absolu d'une commande dans un script, car cela impactera ça portabilité sur un autre système.
2. Utiliser au maximum les variables locales dans une fonction.
3. Mettre en place des messages de log dans les scripts.
4. Mettre la variable qui accueille la valeur de saisie de "read" en lecture seule si possible.
5. Veiller à ce que le fonctionnement du script soit toujours idempotent.
6. Au lieu de remplir le script de commentaires non nécessaires mieux vaux bien nommer ces fonctions et variables de manière à comprendre sans avoir besoin de commentaires supplémentaires.
7. Faire le moins possible de scripts interactifs, par exemple au lieu d'utiliser la commande read il est recommandé plutôt d'utiliser les arguments en d'entrée d'un script ou d'utiliser l'entrée standard pour définir le contenue des variables, cela permet au script d'être utilisé par d'autres scripts ou par le système sans qu'il y ait besoin d'un humain, donc il est conseillé de bien réfléchir à la pertinence d'une saisie dans un script.
8. Privilégier les commandes shell et les traitement de flux par rapport au boucles si possible.
9. Toujours veiller à tester les variables avant de les utilisées.

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

* Écrire les scripts comme si dans deux ans quelqu'un d'autre allait les faire évoluer.
* Commenter.
* Espacer.
* Indenter.
* Créer des variables explicites. 
* Utiliser $(toto) au lieux de ``` `toto` ```.
* Avant de quitter un script par une erreur toujours décrire cette erreur.
* Utiliser le plus possible les enchaînements de commandes avec &&||| ;...

## Conseils en ligne de commande 

Préférer les flag au arg
ex:

dpkg -i nom
dpkg --install nom

## Pourquoi documenter mes scripts

Il est important de toujours documenter son code pour que nous puissions l'améliorer ou le réparer même dans 2 ans et aussi pour que d'autres personnes puissent le poursuivre plus facilement ou si jamais nous avons besoin d'un bout de code pour un autre script alors on comprendras mieux le code si c'est bien commenté.

## Quelle extention pour mon script
Au lieu de mettre une extension en .sh pour des scripts qui tournent avec bash il vaudrait mieux utiliser .bash pour ne pas confondre entre un script ecrit en sh et un autre ecrit en bash. 

10. Il n'est pas recommandé de travailler avec des fichiers temporaires car cela consomme trop de ressources du fait des accès disque il vaut mieux privilégier l'utilisation des flux des commandes shell.
11. Toujours travailler sur une copie jamais sur l'original (fichiers de configuration). 
12. Il n'est pas conseillé d'utiliser la commande apt dans un script, car il se peut que le retour de la commande évolue dans le temps, alors qu'avec la commande apt-get on grade le même retour sur plusieurs systèmes, on a ainsi une compatibilité plus forte entre les systèmes, préférez donc la commande apt-get et apt-cache.
13. Placer les expressions régulières dans des variables avant de les utiliser.
