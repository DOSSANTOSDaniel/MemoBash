# Les tableaux

Déclarer un tableau :

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

Déclaration d'un tableau associatif :
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


