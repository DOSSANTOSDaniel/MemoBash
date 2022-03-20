# La structure de contrôle IF
Orientée vers les testes et les conditions.

Exemple (Tester si une variable est définie ou pas):

```bash
#!/bin/bash

var_toto=""

if [[ -z "$var_toto" ]]
then
  echo "Variable non définie !"
else
  echo "Variable définie !"
fi

``` 

## syntaxe

```bash
ìf [[ condition ]]
then
  <commandes>
elif [[ condition ]]
  <commandes>
elif [[ condition ]]
. <commandes>
.
.
.
else
  <commandes>
fi
```

## Bonne pratique

Toujours tester le type d'une variable avant de lui imposer un test dans le but d'être sure que soit la valeur est numérique, soit une chaîne de caractères ou booléenne...

En shell Bash la notion de type n'existe pas don pour connaître le type d'une variable on va utiliser les expression régulières.

Exemple :

```bash
#!/bin/bash

var_toto="jean"

if [[ "$var_toto" =~ [0-9] ]]
then
  echo "c'est numérique"
else
  echo "c'est pas numérique"
fi
```