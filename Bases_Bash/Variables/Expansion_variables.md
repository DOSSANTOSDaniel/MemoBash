# Expansion de variables

Expansion conditionnelle :

| Expansion | Description |
|:---|:---|
| "${var:-texte}" | si la variable "var" n'est pas définie, cela renvoi la valeur "texte" sans définir la variable var et si elle est définie alors cela envois sa valeur. |
| "${var:=texte}" | si la variable "var" n'est pas définie, cela renvoi la valeur "texte" et définie la variable var avec la valeur "texte", si elle est définie et non vide alors elle renvoi sont contenue. |
| "${var=texte}" | si var est définie, son contenue sera utilisé même s'il est vide, dans le cas contraire cela renvoi 'texte'. |
| "${var:?texte}" | si la variable "var" n'est pas définie, cela renvoi l'erreur "texte" et termine l'exécution du script. |
| "${var:+texte}" | si la variable "var" est définie, cela retourne la valeur "texte" si non cela retourne une valeur vide.  |

Exemple :

Variable sans valeur.

```bash
[daniel🐧iS3810](~)$ cat toto.sh 

#!/bin/bash

var=""

echo "${var:?texte}"
[daniel🐧iS3810](~)$ ./toto.sh 

./toto.sh: ligne 5: var: texte

```

Variable avec une valeur.

```bash
[daniel🐧iS3810](~)$ cat toto.sh 

#!/bin/bash

var="linux"

echo "${var:?texte}"
[daniel🐧iS3810](~)$ ./toto.sh 

linux

```

Expansion de chaînes de caractères :

| Expansion | Description |
|:---|:---|
| "${var}" | même que $var mais en plus propre |
| "${#var}" | retourne le nombre de caractères |
| "${!var}" | exécute le contenu de $var (voir exemple) |
| "${!texte*}" | retourne les noms de variables commençant par "texte" |
| "${var:N}" | retourne le texte à partir de la position du caractère N |
| "${var:N:X}" | retourne le texte à partir de la position du caractère N jusqu’à la position X (${var:position:longueur})|
| "${var#texte}" | coupe "texte" du début de la chaîne de caractère vers la fin|
| "${var%texte}" | coupe "texte" de la fin de la chaîne de caractère vers le début |
| "${var##texte}" | coupe "texte" du début de la chaîne de caractère vers la fin et toutes les occurences |
| "${var%%texte}" | coupe "texte" de la fin de la chaîne de caractère vers le début et toutes les occurences|
| "${var/texte/'nouveau texte'}" | substitut "texte" par "nouveau texte" une seule fois |
| "${var//texte/'nouveau texte'}" | substitut "texte" par "nouveau texte" partout |
| "${var/#texte/'nouveau texte'}" | substitut "texte" par "nouveau texte" si la chaîne de caractère commence par "texte"|
| "${var/%texte/'nouveau texte'}" | substitut "texte" par "nouveau texte" si la chaîne de caractère se termine par "texte"|

Exemples :

```bash
[daniel🐧iS3810](~)$ cat toto.sh


#!/bin/bash

var="Bonjour daniel"

echo "${var#Bonjour}"
```

```bash
[daniel🐧iS3810](~)$ ./toto.sh

daniel

```

```bash
[daniel🐧iS3810](~)$ cat toto.sh


#!/bin/bash

var="toto"

toto="Bonjour"

echo "${!var}"

```

```bash
[daniel🐧iS3810](~)$ ./toto.sh 

Bonjour

```

```bash
[daniel🐧iS3810](~)$ cat toto.sh

#!/bin/bash

var="un bonjour"

echo "${var/un/deux}"

```

```bash
[daniel🐧iS3810](~)$ ./toto.sh 

deux bonjour

```

Connaitre la position d'une lettre dans une chaine de caractère :

```bash
daniel@debian:~$ var="Daniel"
daniel@debian:~$ expr index ${var} a
2
```
