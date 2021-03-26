# Créer un tableau avec la commande read

## Exemple

```bash
[daniel🐧iS3810](~)$ read -d '' -a tab < <(ls ~daniel)

[daniel🐧iS3810](~)$ echo "${tab[@]}"

Arduino Bureau Documents git Images Modèles Musique Public snap Téléchargements Vidéos

[daniel🐧iS3810](~)$ echo "${tab[5]}"

Images

```

| Options | Descriptions |
|:--|:--|
| IFS=$'\n' | C'est une variable de shell, qui permet de définir les séparateur de champs sur l’interpréteur de commandes. |
| -r | Indique de ne pas interpréter les '\' si besoin. |
| -d | Délimiteur de champs, ici découpe les champs par des espaces. |
| -a | Affecte les mots lus séquentiellement à la variable tableau. |

La variable IFS dans notre cas elle permet d'indiquer que les champs ne son plus délimités par des espaces mais par des sauts de ligne dans le but de se prémunir des nom de fichiers avec espaces.

### Exemple

IFS par défaut :

```bash
[daniel🐧iS3810](~)$ set | grep ^IFS=

IFS=$' \t\n'
[daniel🐧iS3810](~)$ for i in $(ls); do echo $i; done

Bureau
Documents
git
Images
le
fichier
toto
Modèles
Musique
Public
snap
Téléchargements
Vidéos

```

On peut ici observer que le fichier 'le fichier toto' a été découpé en trois le, fichier et toto. 


IFS modifié à '\n' :

```bash
[daniel🐧iS3810](~)$ IFS=$'\n'

[daniel🐧iS3810](~)$ for i in $(ls); do echo $i; done

Bureau
Documents
git
Images
le fichier toto
Modèles
Musique
Public
snap
Téléchargements
Vidéos
```


Il faut noter que pour cet exemple on a pas besoin d'utiliser IFS on peut tout simplement utiliser les doubles quottes exemple :

```bash
[daniel🐧iS3810](~)$ set | grep ^IFS=

IFS=$' \t\n'
[daniel🐧iS3810](~)$ for i in "$(ls)"; do echo "$i"; done

Bureau
Documents
git
Images
le fichier toto
Modèles
Musique
Public
snap
Téléchargements
Vidéos

```


## Autres exemples d'utilisation d'IFS

Avec la valeur d'IFS par défaut :

```bash
[daniel🐧iS3810](~)$ set | grep ^IFS=

IFS=$' \t\n'

[daniel🐧iS3810](~)$ var="daniel:filipe ana nicolas:olivier"

[daniel🐧iS3810](~)$ for i in ${var}; do echo "Prénom : ${i}"; done

Prénom : daniel:filipe
Prénom : ana
Prénom : nicolas:olivier

```

Avec une valeur d'IFS modifiée :

```bash
[daniel🐧iS3810](~)$ IFS=$':'

[daniel🐧iS3810](~)$ for i in ${var}; do echo "Prénom : ${i}"; done

Prénom : daniel
Prénom : filipe ana nicolas
Prénom : olivier 

```

Ici on peut voir que les champs ont été séparé par des ':'
```
daniel:filipe ana nicolas:olivier
|  1  ||       2         || 3   |
+-----++-----------------++-----+
```
Il y a 3 parties, la séparation n'est plus faite par des espaces!
