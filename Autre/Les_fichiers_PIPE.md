# Les fichiers PIPE

Un fichier PIPE se comporte comme "|", il permet de contrôler le flux qui passe d'une commande à l'autre.

```                
                   +------+ 
                   |       \
                   |Fichier|
<commande 1> ----> |       | ----> <commande 2> 
                   | PIPE  |
                   |       |
                   +-------+
``` 

Exemple avec analogie par rapport à un écrivain et un lecteur :

```                
                        +------+ 
                        |       \
                        |Fichier|
    Écrivain -------->  |       |  --------> Lecteur 
Qui écrit en temps réel | PIPE  |        Lit le fichier en temps réel
                        |       |
                        +-------+
``` 

Le fichier PIPE va permettre de contrôler ce que fait l'écrivain...