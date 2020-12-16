# Structure d'un script Bash

Un script écrit en Bash est composé de plusieurs sections.

| Nb | Section |
|:--|:--|
| 0 | #!/bin/bash |
| 1 | Bannière de description, décrire la fonction du programme et un journal des modifications, Une déclaration de licence |
| 2 | Inclusions |
| 3 | Fonctions (Avec une fonction d'aide et une fonction pour tester si l'utilisateur du programme est root)|
| 4 | Variables |
| 5 | Vérification de l’utilisateur |
| 6 | Une méthode pour évaluer les options de ligne de commande (GetOpt) |
| 7 | Code principal (Main) |


## A avoir sur chaque script

| Tests | Description |
|:--|:--|
| Test la distribution Linux | Un test permettant de détecter la distribution Linux sur laquelle démarre le script |
| Test l'utilisateur | Permet de détecter l'utilisateur qui à démarrer le script |
| Fonction Usage | C'est la fonction d'aide du script |
| Options passées | Permet de passer des option ou des paramétrés au script (getopt) |
| Dépendances | Permet de voir si les programmes dans le script, on besoin de dépendances. |
| Logs | C'est facultatif mais peut être très utile|
| Effacer les traces | Effacer les traces à la fin du script |

Exemple d'entête de script :

```Bash
#! / bin / bash
 ##############################################   
 # scriptTemplate #
 # #
 # Utilisez ce modèle comme début d'un nouveau programme. Placer un court #
 # description du script ici. #
 # #
 # Historique des modifications #
 # 11/11/2019 David Both Code original. Ceci est un modèle pour créer #
 # nouveaux scripts shell Bash. #
 # Ajoutez de nouvelles entrées d'historique au besoin. #
 # #
 # #
 ###############################################  ###############################################  
 ###############################################   
 # #
 # Copyright (C) 2007, 2019 David Both #
 # LinuxGeek46@both.org #
 # #
 # Ce programme est un logiciel libre; vous pouvez le redistribuer et / ou modifier #
 # sous les termes de la Licence Publique Générale GNU telle que publiée par #

 # la Free Software Foundation; soit la version 2 de la licence, soit #
 # (à votre choix) toute version ultérieure. #
 # #
 # Ce programme est distribué dans l'espoir qu'il sera utile, #
 # mais SANS AUCUNE GARANTIE; sans même la garantie implicite de #
 # QUALITÉ MARCHANDE ou ADÉQUATION À UN USAGE PARTICULIER. Voir le               #
 # GNU General Public License pour plus de détails. #
 # #
 # Vous devriez avoir reçu une copie de la licence publique générale GNU #
 # avec ce programme; sinon, écrivez au logiciel libre #
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 États-Unis #
 # #
 ################################################## 
 ################################################## 
 ################################################## 
```

## Tester son code :

1. Créez un plan de test simple.
2. Commencez les tests dès le début du développement.
3. Effectuez un test final lorsque le code est terminé.
4. Passez à la production et testez davantage.

## Création d'un plan de tests :

* Le nom et une brève description du logiciel testé.
* Une description des fonctionnalités du logiciel à tester
* Les conditions de départ pour chaque test
* Les fonctions à suivre pour chaque test
* Une description du résultat souhaité pour chaque test
* Tests spécifiques conçus pour tester les résultats négatifs
* Teste la façon dont le programme gère les entrées inattendues
* Une description claire de ce qui constitue une réussite ou un échec pour chaque test
* Autres tests
