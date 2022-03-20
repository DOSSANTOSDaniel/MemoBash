# La boucle while

"While" permet de faire une itération sur une action un nombre de fois inconnu.

Boucle tant qu'une certaine valeur est vrai.

Syntax :

```bash
#!/bin/bash

tour=0

while ((tour <= 10))
do
  echo "Salut ! ${tour}"
  ((tour++))
done

```

Tant que "tour" est inférieur ou égal à 10 alors afficher "Salut !" si non quitter la boucle.

Résultat :

```bash
[daniel🐧iS3810](~)$ ./toto.sh 

Salut ! 0
Salut ! 1
Salut ! 2
Salut ! 3
Salut ! 4
Salut ! 5
Salut ! 6
Salut ! 7
Salut ! 8
Salut ! 9
Salut ! 10

```

## Utilisation de while avec la commande read

l'instruction "while" permet d'accepter des données sur son entrée standard et de placer le résultat sur sa sortie standard.

Exemple :

```bash
[daniel🐧iS3810](~)$ cat toto.sh 

#!/bin/bash

cat /etc/passwd | \
while read line
do
  echo "${line}" | cut -d ':' -f1
  sleep 1
done
[daniel🐧iS3810](~)$ ./toto.sh 

root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data

```
Ici le script affiche ligne par ligne les noms des utilisateurs sur le système avec une temporisation de 1 seconde.


