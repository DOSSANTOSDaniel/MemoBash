# La commande cut

Permet de découper des partie d'une ligne.

| Option | Description |
|:---|:---|
| -f | découpe la ligne suivant la colonne délimité par le caractère de séparation, (à utiliser avec l'option "-d"). |
| -d | spécification d'un caractère de séparation |
| -s | ignore les lignes qui ne contiennent pas le caractère de séparation |
| -c | découpe la ligne en colonnes sans caractère de séparation, chaque caractère fait partie d'une colonne |

Exemple :

Contenu du fichier fichier.txt

```bash
[daniel🐧iS3810](~)$ cat fichier.txt 

# fichier de configuration

nom=daniel;age=32;ville=massy

nom=ana;age=20;ville=massy

nom=robert;age=48;ville=paris

nom=toto;age=99;ville=totul 

```

Exemple 1, récupération du nom :

```bash
[daniel🐧iS3810](~)$ cut -s -d";" -f1 fichier.txt 

nom=daniel
nom=ana
nom=robert
nom=toto

```

Exemple 2, Récupération du nom et de la ville :

```bash
[daniel🐧iS3810](~)$ cut -s -d";" -f1,3 fichier.txt

nom=daniel;ville=massy
nom=ana;ville=massy
nom=robert;ville=paris
nom=toto;ville=totul

```
