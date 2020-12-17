# La commande read

Permet de demander une saisie interactive.

Exemple :

```bash
echo "Votre nom : "

read nom

echo "${nom}"

``` 

On peut aussi directement afficher du texte avec la commande read.

Exemple :

```bash
read -p "Votre nom : " nom

echo "${nom}"

```

Il faut savoir que si on insère plusieurs valeurs à la variable nom elle se transformera en tableau :
```bash
[daniel🐧iS3810](~)$ read -p "Votre nom : " nom

Votre nom : daniel ana jean nicolas toto

[daniel🐧iS3810](~)$ echo "${nom[@]}"

daniel ana jean nicolas toto 

```

Si nous ne mettons pas de variable à la commande "read", on peut toujours récupérer la saisie de l'utilisateur avec la variable "$REPLY" :

```bash
[daniel🐧iS3810](~)$ read -p "Votre nom : "

Votre nom : daniel
[daniel🐧iS3810](~)$ echo "${REPLY}"

daniel

```

## Bonne pratique

Mettre la variable de récupération de la saisie en lecture seule :

```bash
#!/bin/bash

read -p "Votre nom : " nom

readonly nom

```

readonly est compatible POSIX et non POSIX.

L'option -s permet de masquer l'affichage de la saisie, pratique pour la saisie de mots de passe, puis l'option -t permet de limité la saisie à dans ce cas 6 secondes :
```bash
[daniel🐧iS3810](~)$ read -t 6 -a passtoto -p "Password : " -s

Password : 
 
[daniel🐧iS3810](~)$ echo "${passtoto}"

daniel

``` 

L'option -n permet de limiter le nombre de caractères saisies, ici la limite est de 4 :

```bash
[daniel🐧iS3810](~)$ read -n 4 -p "Votre code non secret : " codetoto

Votre code non secret : 1254
 
[daniel🐧iS3810](~)$ echo "${codetoto}"

1254

```

Aide sur la commande read :

```bash
[daniel🐧iS3810](~)$ read --help

read: read [-ers] [-a tableau] [-d delim] [-i texte] [-n ncars] [-N ncars] [-p prompt] [-t timeout] [-u fd] [nom ...]
    Lit une ligne depuis l'entrée standard et la découper en morceaux.
    
    Lit une simple ligne depuis l'entrée standard ou depuis le descripteur de
    fichier FD si l'option « -u » est fournie.  La ligne est découpée en morceaux
    comme des mots, et le premier mot est assigné au premier NOM, le deuxième mot
    au deuxième NOM, et ainsi de suite, le dernier NOM récupérant la liste des mots
    restants. Seuls les caractères trouvés dans $IFS sont reconnus comme délimiteurs
    de mots
    
    Si aucun NOM n'est fourni, la ligne lue est stockée dans la variable REPLY.
    
    Options :
      -a tableau	affecte les mots lus séquentiellement aux indices de la variable
    		tableau ARRAY en commençant à 0
      -d délim	continue jusqu'à ce que le premier caractère de DELIM soit lu,
    		au lieu du retour à la ligne
      -e		utilise « Readline » pour obtenir la ligne
      -i texte	Utilise TEXTE comme texte initial pour « Readline »
      -n n	termine après avoir lu N caractères plutôt que d'attendre
    		un retour à la ligne, mais obéi à un délimiteur si moins de N caractères
    		sont lus avant le délimiteur
      -N n	termine seulement après avoir lu exactement N caractères, à moins
    		que le caractère EOF soit rencontré ou que le délai de lecture n'expire.
    		Les délimiteurs sont ignorés
      -p prompt	affiche la chaîne PROMPT sans retour à la ligne final, avant de
    		tenter une lecture
      -r	ne pas permettre aux barres obliques inverses de se comporter comme
    		des caractères d'échappement
      -s	ne pas répéter l'entrée provenant d'un terminal
      -t timeout	expire et renvoie un code d'échec si une ligne d'entrée complète
    		n'est pas lue en moins de TIMEOUT secondes.  La valeur de la variable TIMEOUT
    		est le délai d'expiration par défaut.  TIMEOUT peut être un nombre décimal.
    		Si TIMEOUT est à zéro, la lecture se termine immédiatement sans essayer de
    		lire la moindre donnée mais elle renvoie un code de succès seulement
    		si l'entrée est disponible sur le descripteur de fichier.  Le code
    		de sortie est supérieur à 128 si le délai a expiré
      -u fd	lit depuis le descripteur de fichier FD plutôt que l'entrée standard
    
    Code de sortie :
    Le code de retour est 0, à moins qu'une fin de fichier ne survienne, que le délai expire,
    ou qu'un descripteur de fichier non valable ne soit fourni comme argument à « -u ».
[daniel🐧iS3810](~)$ 

```