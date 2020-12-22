# Les canaux de flux standard

```
                           Commande                  
                       +---------------+             
            STDIN      |               |           STDOUT     
         --------------+               +---------------------------------
  ------>                                ------>                          ----->
         --------------+               +-------------+   +---------------
                       |               |             |   |
                       +-----+   +-----+             |   |
                             |   |                   |   |
                             |   |  STDERR           |   +---------------
                             |   |                   |                    ----->
                             |   |                   +-------------------
                               |                             Redirection 
                               |  
                               v 
                                                    
``` 

|  | Description |
|:---|:---|
| STDIN | Canal d'entrée de flux |
| STDERR | Canal de sortie des erreur redirigé vars l'écran |
| STDOUT | Canal de sortie redirigé vers l'écran |
| Redirection | Redirection personnalisée vars par exemple une autre commande |

On peut envoyer le flux d'une commande vers une autre commande ou vers un fichier à l’aide de "|" ou de ">".

Exemple avec la commande "cat" :

## Redirection vers STDIN d'une autre commande

```bash
[daniel🐧iS3810](~)$ echo "Bonjour !" | cat -n

     1	Bonjour !
```

1. Ici "cat" reçoit en flux d'entrée (STDIN) la commande "echo 'Bonjour !'".
2. Redirige par la suite en sortie (STDOUT) vers l’écran le mot Bonjour ! avec la ligne numéroté.

| STDIN | Commande | STDOUT | STDERR | STDOUT Redirection |
|:---|:---|:---|:---|:---|
| "Bonjour !" | cat -n | 1	Bonjour ! |  |  |

## Avec erreur de "ls"

```bash
[daniel🐧iS3810](~)$ ls /home/toto

ls: impossible d'accéder à '/home/toto': Aucun fichier ou dossier de ce type

```

Le fichier "/home/toto" n'existe pas.

| STDIN | Commande | STDOUT | STDERR | STDOUT Redirection |
|:---|:---|:---|:---|:---|
|  | ls /home/toto |  | ls: impossible d'accéder à '/home/toto': Aucun fichier ou dossier de ce type |  |

## Avec redirection vers un fichier

```bash
[daniel🐧iS3810](~)$ ls /home/daniel > fichier.txt


```

| STDIN | Commande | STDOUT | STDERR | STDOUT Redirection |
|:---|:---|:---|:---|:---|
|  | ls /home/daniel |  |  | vers le fichier "fichier.txt" |

## Contrôler les flux

Exemple rediriger un flux d'erreur dans un fichier :

```bash
[daniel🐧iS3810](~)$ ls /home/toto 2> fic.txt

[daniel🐧iS3810](~)$ cat fic.txt 

ls: impossible d'accéder à '/home/toto': Aucun fichier ou dossier de ce type
[daniel🐧iS3810](~)$ ls /home/toto > fic.txt

ls: impossible d'accéder à '/home/toto': Aucun fichier ou dossier de ce type
[daniel🐧iS3810](~)$ cat fic.txt 


```

|  | Description | Exemple |
|:---|:---|:---|
| > ou 1> | redirection de STDOUT | ls /home/daniel > fic.txt |
| 2> | redirection de STDERR | ls /home/daniel 2> fic.txt |
| 2>&1 | redirection de STDERR et STDOUT | ls /home/daniel > fic.txt 2>&1 |

|  | Description |
|:---|:---|
| > | redirection avec suppression des données antérieures |
| >> | redirection sans suppression des données antérieures |

