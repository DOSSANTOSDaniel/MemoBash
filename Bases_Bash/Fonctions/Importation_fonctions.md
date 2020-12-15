# Importation de fonctions à partir d'un autre fichier

C'est utile si nous voulons partager des fonctions entre plusieurs scripts.

```
+---------
| Fichier \
|          |
|    de    |
|          |
| Fonctions|
+----------+
    |   |
    |   |_________________
    |                     |
    |                     |
    |                     |
    v                     v
+---------             +---------
|         \            |         \
| Script   |           | Script   |
|    1     |           |    2     |
|          |           |          |
|          |           |          |
+----------+           +----------+

``` 

Pour importer un fichier de fonction dans un script :

```bash
#!/bin/bash

./fonctions.sh
```
Ici en réalité on va exécuter le script fonctions.sh en même temps que le script courant, il est donc important d'avoir seulement des fonctions dans le script fonctions.sh car s'il y a aussi un autre code il s’exécutera au même temps que le script courant.

On peut aussi utiliser la commande source pour le faire :
```bash
#!/bin/bash

source ./fonctions.sh
```

Bonnes pratiques :
- Il est préférable de regrouper les inclusion au début du script.

