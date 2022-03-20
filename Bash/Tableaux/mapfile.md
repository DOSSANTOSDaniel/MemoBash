# La commande mapfile

Mapfile est une commande intégrée au shell Bash, elle permet de lire des éléments en entrée standard puis place chaque élément dans un tableau indexé.

Readarray est un alias de mapfile.

Si le tableau n'est pas déclaré alors la variable par défaut qui contient le tableau est MAPFILE.

| Options | Descriptions |
|:--|:--|
| mapfile [ -n count ] | Lit les n lignes par rapport à count si count = 0, toutes les lignes seront copiées. |
| mapfile [ -O origine ] | Commence à écrire des ligne à un index donné, par défaut c'est 0. |
| mapfile [ -s count ] | Supprime les n premières lignes avant d'écrire dans le tableau. |
| mapfile [ -t ] | Supprime les sauts de ligne pour chaque ligne lue. |
| mapfile [ -u fd ] | Lisez les lignes à partir d'un fichier descripteur plutôt que de l'entrée standard. |
| mapfile [ tableau ] | Le nom de la variable du tableau où les lignes doivent être écrites, si tableau est omis, la variable par défaut est MAPFILE. |

## Exemples

Créer un tableau à partir de la lecture des mots suivants "un" "deux" "trois".

```bash
[daniel🐧iS3810](~)$ mapfile -t tab < <(echo -e "un\ndeux\ntrois")


[daniel🐧iS3810](~)$ echo "${tab[@]}"

un deux trois

[daniel🐧iS3810](~)$ echo "${tab[0]} ${tab[1]} ${tab[2]}"

un deux trois
```


Créer un tableau à partir de la liste des fichiers dans le dossier /home/user.

```bash
[daniel🐧iS3810](~)$ mapfile -t files < <(ls ~daniel)

[daniel🐧iS3810](~)$ echo "${files[@]}"

Arduino Bureau Documents git GNUstep Images Modèles mu_code Musique Nextcloud Public PycharmProjects snap Téléchargements TP Vidéos
[daniel🐧iS3810](~)$ echo "${files[5]}"

Images
```

La portabilité de la commande mapfile est limité mais elle est plus performante de read, mapfile doit être utilisée avec substitution de processus.
