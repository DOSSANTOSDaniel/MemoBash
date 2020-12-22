# La commande basename
Cette commande permet de retirer le répertoire parent du nom du chemin d'un fichier, mais aussi de retirer l'extension du nom d'un fichier.

Exemple, si nous sommes dans "/home/daniel" :
```Bash
basename $(pwd)
daniel
```

Retirer l'extension d'un fichier :

```bash
basename -s txt toto.txt
toto.
```
