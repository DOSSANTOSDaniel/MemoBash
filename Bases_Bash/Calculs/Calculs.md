# Les calculs avec Bash

Bash n'est pas un langage orienté calculs.

## Des calculs simples

Exemple :

```bash
echo $((2+2))
4
```

Les différents opérateurs :

| Opérateur | Description |
|:--|:--|
| * | Multiplications |
| / | Division |
| % | Modulo (c'est le reste de la division euclidienne) |
| ** | Puissance |
| + | Addition |
| - | Soustraction |

On peut aussi utiliser la commande "let" et pour des calculs plus complexes on utilise la commande "bc".

Exemple avec "let" :

```bash
[daniel🐧iS3810](~)$ let "a=4+4" ; echo "${a}"

8
```


Exemple avec "bc" :

```bash
[daniel🐧iS3810](~)$ echo "4+4" | bc

8
``` 

## Calcul avec "expr"

La commande réalise aussi des opérations mathématiques :

```bash
[daniel🐧iS3810](~)$ expr 4 + 4

8

```

Attention il faut échapper certains caractère si on veux par exemple faire une multiplication :

```bash
[daniel🐧iS3810](~)$ expr 4 \* 4

16

```