# La boucle for

La boucle for permet d'itérer une action un nombre de fois connu.

Syntaxe :

```bash
for <variable d'itération> in <Liste de chaînes de caractères>
do
  <Commandes>
done
``` 

Exemple :

```bash
for var in 1 2 3
do
  echo "${var}"
done
```

Valeur à la boucle numéro 1 : var = 1

Valeur à la boucle numéro 2 : var = 2

Valeur à la boucle numéro 3 : var = 3

Comme on peut le voir le contenue de la variable var change à chaque itération.

N'importe quelles séries de valeurs séparée par des espaces ou des tabulation peut être utilisé.

## Création de listes de valeurs

Quelques exemples :

| Liste | Description |
|:---|:---|
| * | permet de lister tous les fichier présents dans le répertoire courant |
| $(<commande>) | liste créer à partir du résultat d'une commande exemple : $(ls /home/toto/*) |
| {1..5} | plage de 1 à 5, accepte aussi les valeurs négatives |
| a b c | découpe chaque occurrence séparée par un espace, a,b et c |
| a 'b c' | avec les simples ou doubles cotes on peut modifier la découpe, a et 'b c', ici 'b c' est considérer comme une occurrence. |

## On peut aussi utiliser une syntaxe proche du language C pour créer une boucle for

```bash
for (( expr1; expr2; expr3 ))
do
 command1
 command2
 ..
done
```
Explication :

```
                                     for (( "expression1"; "expression2"; "expression3" ))
                                                  ▲               ▲             ▲
                                                  │               │             │
Initialise la variable d'itération.───────────────┘               │             │
                                                                  │             │
La boucle continue jusqu'à ce que cette valeur soit vraie.────────┘             │
                                                                                │
Incrémente la variable d'itération.─────────────────────────────────────────────┘
```
Exemple avec une boucle for permettant de faire une multiplication :

```bash
#!/bin/bash

nb1="8"
multiplicateur="2"
resultat=0

for (( i=0; i <= multiplicateur-1; i++ ))
do
  (( resultat += nb1 ))
done

echo "${resultat}"

```

