# Plage d'itération


## Méthode 1

Utiliser la commande "seq"

Chaque numéro est considéré comme de type float, avec la commande seq le nombre s'incrément de 1 à chaque fois.

On peut incrémenter 1..10 ou décrémenter de 10..1.

Options de seq :

-W : imprimer tous les nombres avec une largeur égale.

Exemple :
```Bash
seq -w 01 10

01
02
03
04
05
06
07
08
09
10

```

-f : indiquer un format en particulier, %f,%g,%e, %g est utilisé par défaut.

| Format | Description |
|:---:|:---:|
| %e | nombre exponentiel à virgule |
| %f | nombre à virgule |
| %g | nombre entier |

Exemple :

```Bash
seq -f "%g/03/2022" 10

1/03/2022
2/03/2022
3/03/2022
4/03/2022
5/03/2022
6/03/2022
7/03/2022
8/03/2022
9/03/2022
10/03/2022

```

-s (string) : permet de séparer les numbres avec des charactères, par défaut c'est un retour à la ligne.

Exemple :

```Bash
seq -s - 10

1-2-3-4-5-6-7-8-9-10

```

Manières d'utiliser seq :

```Bash
seq 10        # de 1 à 10.
seq 10 20     # de 10 à 20.
seq 20 -2 10  # de 20 à 10 avec un pas de -2.

# Sur une boucle for
for i in $(seq 1 5 20)
do
   echo "De 5 en 5 : $i"
done
```

## Méthode 2

Alternative à la commande seq sur une boucle for.

syntaxe : {Début..Fin[..Incrémentation]}

Exemple :

```Bash
for i in {10..0..-2}
do
    echo "$i"
done

```


On peut aussi lui appliquer un préfix ou sufix.

Exemple :

```Bash

for i in img{1..30}.png
do
    echo "Image : $i"
done
```
