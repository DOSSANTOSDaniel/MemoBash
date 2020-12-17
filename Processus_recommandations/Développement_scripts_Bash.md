# Plan du développement d’un scripts Bash
## Avant le développement
### Modèle et procédure
## Modèle de Kanban pour la création d’un script shell
...

## Pour trouver l’idée si pas d’idées
* Trouver une problématique sur un sujet :
  * lister les fortes tendances de problèmes.
  * lister les idées de solutions.
  * Valider ces idées par de la recherche.

## Pour reprendre un script déjà fait
* Créer deux dossiers :
  * New project (pour le nouveau projet).
  * Old project (pour mettre l’ancien projet).

## Réaliser à la main les actions
* Se former à la technologie en question.
* Suivre des tutoriels.
* Créer une procédure ou article détaillé.

## Cahier des charges fonctionnel
* Titre document  (Cahier des charges fonctionnel)
* Table des matières
* Titre du projet
* Présentation
* Définition des besoins
* Environnement d’exécution
* L’objectif final 
* Identifier les fonctionnalités
* Interactions utilisateur
* Descriptif du script
  * Type de système d’exploitation:
  * Nom du script:
  * Localisation du script:
  * Choix du shell:
  * Exécution du script avec le compte:

* Diviser le projet en différents dossiers, chaque dossier sauf main va contenir des bouts de code divisés par fonctions.

| Dossiers | Description |
|:--|:--|
| Main | Dossier principale, où nous allons rassembler tous les autres morceaux, et les dépendances générales. |
| Ui | Tout code qui demande une saisie. |
| GetOpt | Gestion des options passées. |
| Fonction | Fonctionnalités du projet. |
| Usage | Aide utilisateur. |
| Message | Message affiché (bannière, erreur, info…). |
| Log | Log du déroulement du script. |
| GetApp | Téléchargement d’applications, ou de fichiers. |
| Security | Outils permettant de sécuriser un minimum. |

* Description du fonctionnement pas à pas
* Solutions proposées pour répondre aux besoins et indications techniques
* Les contraintes
* Logigramme
* Index

## Développement
### A chaque module codé
* Vérifier la propreté du bout de code: https://www.shellcheck.net/
* Aide sur la syntax d’une commande: https://explainshell.com/, https://tldr.ostera.io/
* Lutter contre les fautes de frappe, on emploiera en début de
script l’option set –u, qui déclenche une erreur si on fait référence
à une variable non définie.
* set –v, permet d’afficher les lignes au fur et à mesure de leur exécution.
* set –x, elle indique le suivi pour chaque commande simple, pas à pas on peut voir les commandes exécutées.

Ou

bash -x toto.sh

## Après le développement du script

### Cycle d’améliorations :

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

* Le déploiement
  * Besoin
  * Technologie

* Maintenance

...

## Si c'est un petit projet

1. Mettre des commentaires là ou on souhaite coder, les commentaires vont décrire ce qu'il y a à coder cela va nous aider à bien connaître notre besoin avant de coder.

## Utilisation de l'historique pour créer des scripts

- Commencer par effacer l’historique des commandes :

```bash
history -c
```
- Maintenant vous pouvez réaliser le TP exemple installation d'un serveur.
- A la fin vous pouvez enregistrer dans un fichier l'historique des commandes saisies :

```bash
history -w script.sh
```
- Mise en forme et complétion du fichier script.sh.

