Explication de la commande shift
La commande shift permet de décaler l’ordre de la liste des arguments passés.
Quand on ne veut pas faire d’actions sur le premier argument mais qu’ont veux utiliser le deuxième argument à la place du premier par exemple.
```Bash
#!/usr/bin/env bash

mkdir $1
cd $1

shift

for dossier in $1 $2 $3
do
  mkdir $dossier
done
```

```Bash
daniel@debgui:~$ ./script_shift.sh dossier_secret secret_1 secret_2 secret_3
```

```Bash
daniel@debgui:~$ tree dossier_secret/
dossier_secret/
├── secret_1
├── secret_2
└── secret_3
```
