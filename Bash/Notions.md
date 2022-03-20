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

Il y a des commande spécifiques au shell Bash et d'autres non.

Les commandes spécifiques au shell Bash sont appelé "builtins" ou "primitives" , pour savoir si une commande et une "builtins" ou pas on utilise la commande "type".

Exemple :

```bash
[daniel🐧iS3810](~)$ type cd

cd est une primitive du shell

```

Si on veux connaître le chemin des binaires d'une commande :

```bash
[daniel🐧iS3810](~)$ type -a ls

ls est un alias vers « ls --color=auto »
ls est /usr/bin/ls
ls est /bin/ls

```

Si on veux connaître l'emplacement des binaires de toutes les commandes, il faut afficher la variable "$PATH" :

```bash
[daniel🐧iS3810](~)$ echo "${PATH}"

/home/daniel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

```