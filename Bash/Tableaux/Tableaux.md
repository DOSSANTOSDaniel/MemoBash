# Les tableaux

## Déclarer un tableau

```bash
tab=(1 5 9)
```

Méthode non POSIX :

```bash
declare -a tab=(1 5 9)

ou

declare -a tab

tab=(1 5 9)

```

Affiche le champ à la l'index 2 :

```bash
[daniel🐧iS3810](~)$ tab=(1 5 9)

[daniel🐧iS3810](~)$ echo "${tab[2]}"

9

```

Afficher le nombre de champs dans le tableau :

```bash
[daniel🐧iS3810](~)$ tab=(1 5 9)

[daniel🐧iS3810](~)$ echo "${#tab[@]}"

3

```

Afficher tous les champs :

```bash
[daniel🐧iS3810](~)$ echo "${tab[@]}"

1 5 9

```

Affiche du deuxième champ au troisième champ :

```bash
[daniel🐧iS3810](~)$ tab=(1 5 9)

[daniel🐧iS3810](~)$ echo "${tab[@]:1:2}"

5 9

```

Ajouter un nouveau élément au tableau :

```bash
[daniel🐧iS3810](~)$ tab=(10 20 30)

[daniel🐧iS3810](~)$ tab+=(40 50) 

[daniel🐧iS3810](~)$ echo "${tab[@]}"

10 20 30 40 50

```

Mettre à jour une nouvelle donnée, par exemple 10 en 00 :

```bash
[daniel🐧iS3810](~)$ tab=(10 20 30)

[daniel🐧iS3810](~)$ tab[0]=00

[daniel🐧iS3810](~)$ echo "${tab[@]}"

00 20 30

```

Supprimer un élément du tableau :

```bash
[daniel🐧iS3810](~)$ tab=(10 20 30)

[daniel🐧iS3810](~)$ unset tab[1]

[daniel🐧iS3810](~)$ echo "${tab[@]}"

10 30

```

## Déclaration d'un tableau associatif
```bash
declare -A tab

tab[fruit]=orange
tab[fleur]=rose
tab[animal]=chien
```
ou
```bash
declare -A tab

tab=(
  ["fruit"]="orange"
  ["fleur"]="rose"
  ["animal"]="chien"
)
```
Afficher les clés :

```Bash
┌──[daniel👾archos]-(~)
│
└─$ echo ${!tab[@]}

fruit animal fleur
```
Afficher les valeurs :

```Bash
┌──[daniel👾archos]-(~)
│
└─$ echo ${tab[@]}

orange chien rose
```
Boucle for à partir d'un tableau avec une syntaxe c
```Bash	
valeurs=("valeur1" "valeur2" "valeur3" "valeur4")
for ((i=0; i<${#valeurs[@]}; i++))
do
    [commande "{valeurs[i]}"]
done
```
