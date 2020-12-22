# La commande grep

Cette commande permet de filtrer, sélectionner ou afficher des résultats.

## rechercher une occurrence

```bash

[daniel🐧iS3810](~)$ cat fichier.txt 

 fdff       2	Arduino
 fdff       4	Bibliothèque calibre


```


```bash

[daniel🐧iS3810](~)$ cat fichier.txt | grep Arduino

 fdff       2	Arduino


```

```bash

[daniel🐧iS3810](~)$ grep Arduino fichier.txt

 fdff       2	Arduino


```

Grep peut être utilisé avec des expressions régulières

Quelques exemples :

| Regex | Description |
|:---|:---|
| grep ^'occurrence' | commence par 'occurrence' |
| grep 'occurrence'$ | se termine par 'occurrence' |

Une ligne avant et après l'occurrence :

```bash
grep -1 Arduino fichier.txt

```

Deux lignes après l'occurrence :

```bash
grep -A 2 Arduino fichier.txt

```

Compte les lignes vides :

```bash
grep -c ^$ fichier.txt

```

