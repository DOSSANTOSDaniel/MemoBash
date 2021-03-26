# Les variables en Bash

## Les noms de variables

Ils peuvent contenir des "lettres", "chiffres" et "_".

Un nom de variable ne doit jamais commencer par un nombre, soit on utilise "_"
ou "lettres" :

syntaxe correcte :

_var
var
VAR
Var
.
.
.

Concernant une convention d'écriture des variables :

J'ai pas trouvé de documents officiels qui indiquent clairement une convention d'écriture des noms de variables, Certains documents nous indiquent qu'il est préférable d'écrire les variables en majuscules puis dans d'autres documents c'est indiqué qu'on peut faire ce qu'on veut, puis dans d'autres c'est indiqué d'écrire les variables en snack_case, dans la documentation officielle de Bash GNU, j'ai seulement compris qu'il fallait écrire les variables en majuscule si c'est pour créer une variable d'environnement, mais rien n'indique comment faire dans le cas de la création de variables personnelles dans un script.

Alors que faire :

- Si j’écris mes variables et fonction en majuscule, je risque de les confondre avec des variables d'environnement.

- Si j’écris mes variables et fonction en minuscule, je risque de les confondre avec des commandes.

Même si c'est pas bien grave si j'écrase une variable d'environnement pendant l'exécution de mon script ou que si j’écrase une commande, mais je trouve que c'est pas propre.

Si jamais j'écrase une variable d'environnement dans mon script, tout retournera dans l'ordre une fois l’exécution du script terminé, car se n'est pas persistant.

Si j'écrase le nom d'une commande avec le nom d'une variable, je peux quand même différentier les deux avec la commande "builtin", et puis j’ai remarqué que dans les nouvelles version de Bash on ne peut pas écraser une commande.

Puis j'ai consulter un [ document ](https://github.com/icy/bash-coding-style) qui propose d'écrire les nom de fonctions et les noms de variables en commençant par un '_' et en snack_case.

Exemple :

```bash
#!/bin/bash

_num_1=12
_num_2=5

echo "$((${_num_1}+${_num_2}))"

```

### Méthode non POSIX 

Déclarer une variable en lecture seule :

```bash
declare -r a="toto"
ou
typeset -r a="toto"

```

Déclarer une variable de type entier :

```bash
declare -i b=32
ou
typeset -i b=32

```

Déclarer une variable :

```bash
declare -a tab=(15 2 48)
ou
typeset -a tab=(15 2 48)

```

Les commandes "typeset" et "declare" sont synonymes.

La commande "declare" est compatible avec les version supérieurs à Bash 2.

Typeset est compatible avec Bash mais aussi Ksh.

Avec l'option -x on va pouvoir exporter des variables sur l'environnement d’exécution parent, exemple :

```bash
declare -x $1

```

On peut aussi utiliser "export $1".

| Option | Description |
|:---|:---|
| -a | tableau |
| -A | tableau associé |
| -i | entier |
| -r | readonly |
| -x | export |

### Méthode POSIX

Avec la méthode POSIX c'est les commandes "let" et "((..))" qui vont permettre de typer les variables pour par exemple avoir des entier.

```bash
let 'num= 5+5'

```
## Variable en lecture seule
Méthode POSIX et NON POSIX
```bash
readonly nom="toto"
```

## Les quottes 

Les double quottes "" permettent une analyse et donc exécutent le code.

Les simples cotes '' désignent simplement une chaîne de caractères.

Les back quotes s’obtiennent par (ALTGR +7) `` elles permettent l'exécution du code se trouvant à l’intérieure d’elles.

## Bonne pratique
Il n'est pas conseillé d'utiliser les back quotes, utiliser à la place "$()", exemple :

```bash
rep="$(pwd)"

echo "${rep}"

/home/ana
``` 

## Supprimer une variable
On peut supprimer une variables avec la commande "unset" à condition qu'elle ne soit pas en readonly.

```bash
unset nom
```

## Exporter une variable

Exporter une variable permet de l'utiliser dans un processus fils.

Le script toto.sh:

```bash
#!/bin/bash

echo "${nom}"

```

Exportation :
```bash
[daniel🐧iS3810](~)$ export nom="toto"

[daniel🐧iS3810](~)$ ./toto.sh 

toto

``` 

On peut afficher la liste des variables exportées avec la commande "export":

```bash
[daniel🐧iS3810](~)$ export

declare -x COLORTERM="truecolor"
declare -x DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
declare -x DEFAULTS_PATH="/usr/share/gconf/plasma.default.path"
declare -x DESKTOP_SESSION="plasma"
.
.
.

```

## Interdire les variables indéfinies

Exemple :

```Bash
set -u
```

Attention ce mécanisme interdit les variables "${1}", "${2}", "${3}" car il va les considérer comme des variables non définies!

## Utilisation de la commande "set" et de la variable "IFS"

La variable "IFS" contient  les caractères de séparation des différentes valeurs, par défaut c'est le caractère espace.

Exemple de script :

```bash
#!/bin/bash

nom="ana:daniel:jean:toto"
IFS=":"
set ${nom}
echo "${1}"
echo "${2}"
echo "${3}"
echo "${4}"

```

Résultat :

```bash
[daniel🐧iS3810](~)$ ./toto.sh 

ana
daniel
jean
toto

```

## Expansion de variables

Expansion conditionnelle :

| Expansion | Description |
|:---|:---|
| "${var:-texte}" | si la variable "var" n'est pas définie, cela renvoi la valeur "texte" sans définir la variable var et si elle est définie alors cela envois ça valeur. |
| "${var:=texte}" | si la variable "var" n'est pas définie, cela renvoi la valeur "texte" et définie la variable var avec la valeur "texte", si elle est définie et non vide alors elle renvoi sont contenue. |
| "${var=texte}" | si var est définie, son contenue sera utilisé même s'il est vide, dans le cas contraire cela renvoi 'texte'. |
| "${var:?texte}" | si la variable "var" n'est pas définie, cela renvoi l'erreur "texte". |
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
| "${var:N}" | retourne du texte à partir de la position N |
| "${var:N: X}" | retourne du texte à partir de la position N jusqu’à la position X |
| "${var#texte}" | coupe "texte" du début de la chaîne de caractère |
| "${var%texte}" | coupe "texte" à la fin de la chaîne de caractère |
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

## Traitement des variables avec la commande set

Le mécanisme du shell interprète une variable non définie comme une variable vide ou nulle.

Définir des variables sans leurs associer de valeurs :

```bash
set var

```

Pour supprimer la définition de cette variable :

```bash
unset var

```
