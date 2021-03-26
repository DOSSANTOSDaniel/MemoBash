# La commande AWK

AWK permet la manipulation de fichiers textes pour des opérations de recherches, remplacements et de transformations.

Syntaxe de base :

```bash
awk -<option> '{ instruction }' fichier 
```

## Les options

| Option | Description |
|:---|:---|
| -F <séparateur> | permet de définir un séparateur de champs |

Exemple :

Objectif extraire le nom des utilisateurs système et leur shell.

```bash
[daniel🐧iS3810](~)$ awk -F ':' '{print $1, $7}' /etc/passwd

root /bin/bash
daemon /usr/sbin/nologin
bin /usr/sbin/nologin
.
.
.
```

$1-n représente les colonnes :

```bash
          Séparateur
               |  
               v 
root:x:0:0:root:/root:/bin/bash
 ^   ^ ^ ^  ^     ^       ^
 |   | | |  |     |       |_________ $7
 |   | | |  |     |_________________ $6
 |   | | |  |_______________________ $5
 |   | | |__________________________ $4
 |   | |____________________________ $3
 |   |______________________________ $2
 |__________________________________ $1
   
```

$0 représente la totalité du fichier.

Personnaliser le retour :

```bash
[daniel🐧iS3810](~)$ awk -F ':' '{print $1, " <=======> "$7}' /etc/passwd

root  <=======> /bin/bash
daemon  <=======> /usr/sbin/nologin
bin  <=======> /usr/sbin/nologin
.
.
.
```

Faire des comparaisons :

Récupérer les utilisateurs avec un UID supérieur ou égal à 1000.

```bash
[daniel🐧iS3810](~)$ awk -F ':' '$3 >= 1000 {print "Utilisateur : "$1, " UID : "$3}' /etc/passwd

Utilisateur : nobody  UID : 65534
Utilisateur : daniel  UID : 1000
Utilisateur : libvirt-qemu  UID : 64055

```

Afficher les utilisateurs ayant un shell Bash :

```bash

[daniel🐧iS3810](~)$ awk -F ':' '$NF == "/bin/bash" {print "Utilisateur : "$1, " Shell : "$NF}' /etc/passwd

Utilisateur : root  Shell : /bin/bash
Utilisateur : daniel  Shell : /bin/bash

```

$NF désigne le dernier champs !

Afficher les lignes supérieures à 90 caractères :

```bash
[daniel🐧iS3810](~)$ awk 'length > 90' /etc/passwd

cups-pk-helper:x:113:121:user for cups-pk-helper service,,,:/home/cups-pk-helper:/usr/sbin/nologin
_flatpak:x:130:140:Flatpak system-wide installation helper,,,:/nonexistent:/usr/sbin/nologin

```


```bash
[daniel🐧iS3810](~)$ awk -F ':' '{print $1, $7}' /etc/passwd

root /bin/bash
daemon /usr/sbin/nologin
bin /usr/sbin/nologin
sys /usr/sbin/nologin
sync /bin/sync
games /usr/sbin/nologin
man /usr/sbin/nologin

```

## AWK est aussi un langage de script 

Forme d'un script AWK :

```awk
BEGIN {
}
.
.
.
END {
}
```

Pour exécuter un script awk :

```bash
awk -f script.awk fichier.txt

```