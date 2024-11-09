# Plan du développement d’un scripts Bash

## Docummentation

### Définir l'objectif du script
- La finalité et les résultats attendus du script.

### Pour trouver l’idée
Trouver une problématique sur un sujet :
- lister les fortes tendances de problèmes.
- lister les idées de solutions.
- Valider ces idées par la recherche d'informations.

### Etudier les technologies a utiliser
- Se former à la technologie en question.
- Créer une procédure ou article détaillé sur l'action a automatiser.

### Création d'un document de présentation du projet
- Titre du projet
- Présentation
- Définition de la problèmatique et des besoins
- Environnement d’exécution
- Identifier les fonctionnalités
- Interactions utilisateur
- Descriptif du script :
  - Type de système d’exploitation
  - Répertoire de travail
  - Choix du shell
  - Les droits d'exécution du script
  - Solutions proposées pour répondre aux besoins et indications techniques
  - Les contraintes

### Choisir le nom du fichier
- Un nom clair et descriptif, qui donne un aperçu de ce que le script fait, en utilisant des noms courts et explicites.

### Pseudo-code ou liste à Puces Structurée
- Écrire les étapes principales du script sous forme de pseudo-code ou de liste structurée.

### Mind Map (Carte Mentale)
- Un mind map permet de placer l’objectif du script au centre, puis d’ajouter des branches pour chaque étape ou sous-processus.
	
### Ordinogrammes(Diagramme de flux)
- Un diagramme de flux représente chaque étape du script sous forme de bloc, avec des flèches pour indiquer l'ordre et la logique (début, étapes, conditions, boucles, fin).

## Développement

### Écrire un en-tête
- Indiquer l'interpreteur(#!/usr/bin/env bash).
- Nom du script.
- L'auteur.
- Date de création.
- Version du script.
- Version de bash.
- La description des fonctionnalités du script.
- Les paramètres et options du script(Usage).
- Les dépendances(commandes et outils nécessaires).
- Les permissions(utilisation de sudo, droits de lecture/écriture, utilisateur...).

### Ajouter des fichiers(Inclusions) si besoin

### Sécuriser le script
Utilisation de set 

| | Description |
|:--:|:--:|
| set -e | si erreur = exit |
| set -u | si une variable n'est pas utilisée = exit |
| set -f | désactive le globbing (à enlever si utilisation) |
| shopt -s failglob | si erreur de correspondance avec un regex alors = exit |
| set -o pipefail | si certaines commandes n'ont pas fonctionnées dans le pipe alors = exit  |

### Organiser le code en sections
- Commentaires pour chaque étape importante (`# Section de sauvegarde`, `# Section de vérification des erreurs`, etc.).

### Utiliser des variables explicites
- Privilégiez des noms de variables clairs et descriptifs pour éviter les confusions. Mettez également en majuscule les noms de variables constantes (ex : `TARGET_DIR="/path/to/backup"`).

### Fonctions
Avec une fonction d'aide et une fonction pour tester si l'utilisateur du programme est root

### Gérer les erreurs et les exceptions
- Ajoutez une gestion des erreurs pour chaque étape critique.

### Commentaires et documentation
- Ajoutez des commentaires pour expliquer les sections ou lignes complexes du code.

### Rendre le script réutilisable
- Créez des fonctions si une logique doit être répétée.
- Si possible, passez des paramètres au script pour qu’il puisse être adapté à différentes situations.

### Ajouter la journalisation des logs
- Les logs sont utiles pour comprendre le déroulement d'un script en cas de problème.

## Tester sur un environnement de développement
- Avant de l'utiliser en production, testez le script dans un environnement contrôlé pour détecter d'éventuels problèmes.

### debuger le code
- Utiliser shellcheck
- Utiliser (set -x ou bash -x script.sh) pour visualiser le fonctionnement du script étape par étape.

### Tester le script dans tous les cas de figure
Créez un plan de test simple :
- Le nom et une brève description du logiciel testé.
- Une description des fonctionnalités du logiciel à tester
- Les conditions de départ pour chaque test
- Une description du résultat souhaité pour chaque test
- Teste la façon dont le programme gère les entrées inattendues
- Liste des différents testes 

## Après le développement

### Cycle d’amélioration

```
+-------------+
|             |
|  Analyser   |<--+
|             |   |
+-------------+   |
      |           |
      v           |
+-------------+   |
|             |   |
|  Développer |   |
|             |   |
+-------------+   |
      |           |
      v           |
+-------------+   |
|             |   |
|  Tester     |   |
|             |   |
+-------------+   |
      |           |
      v           |
+-------------+   |
|             |   |
|  Optimiser  |   |
|             |   |
+-------------+   |
      |           |
      v           |
+-------------+   |
|             |   |
|  Intégrer   |   |
|             |   |
+-------------+   |
      |           |
      v           |
+-------------+   |
|             |   |
|  Vérifier   |---+
|             |
+-------------+
      |
      v
+-------------+
|             |
|  Déployer   |
|             |
+-------------+

```
