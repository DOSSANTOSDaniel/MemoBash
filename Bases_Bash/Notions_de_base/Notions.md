# Notions de base

## Indiquer l'interpréteur à utiliser
Cette indication doit toujours être présente à la première ligne d'un script.
```Bash
#!/bin/bash
```

Si l'interpréteur n'est pas spécifié le système va invoquer l'interpréteur par défaut.

## Exécution d'un script Bash

Avant d'exécuter un script il faut lui donner le droit de s'exécuter :
```Bash
sudo chmod +x script.sh
```

Droits a donner à un script : 755.


On peut exécuter un script de trois manières différentes :
```Bash
1 : /home/toto/script.sh
2 : ./script.sh
3 : bash script.sh
```

La programmation shell est de nature procédurale.

## Informations sur les commandes

