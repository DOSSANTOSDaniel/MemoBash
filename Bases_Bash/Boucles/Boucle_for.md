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
