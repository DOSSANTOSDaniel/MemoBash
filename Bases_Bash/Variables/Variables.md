# Les variables en Bash

## Déclarer une variable

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

### Méthode POSIX

Avec la méthode POSIX c'est les commandes "let" et "((..))" qui vont permettre de typer les variables pour par exemple avoir des entier.

```bash
let 'num= 5+5'

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


## Interdire les variables indéfinies

Exemple :

```Bash
set -u
```

Attention ce mécanisme interdit les variables "${1}", "${2}", "${3}" car il va les considérer comme des variables non définies!
