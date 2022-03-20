# La commande SED

Sed permet d’éditer ou d'afficher du texte en streaming.

## La fonction filtre

On peut utiliser la commande sed pour filtrer et remplacer certaines occurrences.

Exemple :

```bash

sed '/^a/s/o/x/g' fic.txt

```

Ici on va remplacer les e en X sur tous les lignes commençant par B.

On peut observer que c'est juste un affichage il n'y a pas eu de modification du fichier.

```bash
[daniel🐧iS3810](~)$ cat fic.txt 

Arduino
Bibliothèque calibre
Bureau
Documents
git
GNUstep
Images
Modèles
Musique
Nextcloud
Public
PycharmProjects
snap
Téléchargements
Vidéos
[daniel🐧iS3810](~)$ sed '/^B/s/e/X/g' fic.txt 

Arduino
BibliothèquX calibrX
BurXau
Documents
git
GNUstep
Images
Modèles
Musique
Nextcloud
Public
PycharmProjects
snap
Téléchargements
Vidéos


```

Si on veux modifier le fichier on doit indiquer l'option -i.

Remplacer les a par des Z partout sauf pour les lignes commençant par B.

```bash
[daniel🐧iS3810](~)$ sed -i '/^B/!s/a/Z/g' fic.txt 

[daniel🐧iS3810](~)$ cat fic.txt 

Arduino
BibliothèquX calibrX
BurXau
Documents
git
GNUstep
ImZges
Modèles
Musique
Nextcloud
Public
PychZrmProjects
snZp
TéléchZrgements
Vidéos


``` 

Syntaxe :

```bashh
sed '/<regex>/s/<occurrence à remplacer>/<nouvelle occurrence>/g' <fichier>
```

Suppression sans altérer le fichier :

Supprime la ligne qui contient l'occurrence "Bonjour".

```bash
sed '/Bonjour/d' fichier.txt 
```

Supprime les lignes vides.

```bash
sed '/^$/d' fichier.txt 
```

## Sed c'est aussi un langage de scripts

Exemple de script sed :

```sed
sed -f script.sed fichier.txt
```



