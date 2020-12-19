# Récupération de paramètres d'un script

## Utilisation de if

```bash
if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]
then
    usage
else
    echo "Option incorrecte !"
    usage
fi
```

## Utilisation de case

```bash
case "${1}" in
    --help | -h) usage ;;
    --version | -v) version ;;
    *)exit 1 ;;
esac
```

## Utilisation de GETOPTS

La commande "getopts" permet de faciliter l'analyse des arguments passé en entrée d'un script.

"getopts" est une commande filtre qui peut s'imbriquer dans une boucle while, est découpe ainsi les les arguments fournis en entrée d'un script.

Le premier argument de la commande,(OPTSTRING) permet de décrire les options acceptées par le script et si ces options sont associer à une valeur d'argument à étudier ou pas.

Le second argument indique le nom de la variable dans laquelle est placé l'option passée au script.

"getopts" ne permet pas de définir des options longues telles que --help, il permet seulement de définir des options avec une seule lettre -h, mais "getopts" accepte les options associées à une valeur, comme par exemple : "ssh -p 888", ici "-p" permet de spécifier le port de connexion pour la commande SSH.

Syntaxe :

```bash
getopts OPTSTRING VARNAME [ARGS...]

```

|  | Description |
|:---|:---|
| OPTSTRING | c'est la liste d'options disponible pour le script |
| VARNAME | c'est une variable contenant l'option passée au script |

Exemple :

```bash
#!/bin/bash

usage() {
  echo "Voici l'aide"
}

version() {
  echo "Voici la version"
}

while getopts "s:d:hv" argument
do
  case "${argument}" in
    h)
      usage
      ;;
    v)
      version
      ;;
    s)
      readonly source_file="${OPTARG}"
      echo "Voici la source : ${source_file}"
      ;;
    d)
      readonly dest_file="${OPTARG}"
      echo "Voici la destination : ${dest_file}"
      ;;
    :)
      echo "L'option nécessite un argument."
      exit 1
      ;;
    *)
      exit 2
      ;;
  esac
done


``` 

Explication :

```bash
while getopts "s:d:hv" argument
               ------  --------
                  ^       ^
                  |       |______ Nom de la variable qui contient l'option passé au script.
                  | 
                  |______________ Description des options acceptées par le script.
```

Options acceptées :

|  | Description |
|:---|:---|
| s + : | "s" c'est une option et ":" signifie que l'option "s" attend une valeur, exemple : (./script.sh -s /home/toto/Images/photo.jpg) . |
| d + : | "d" c'est une option et ":" signifie que l'option "d" attend une valeur. |
| h | c'est une option qui n'a pas de valeur associée, qui n'attend aucune valeur. |
| v | c'est une option qui n'a pas de valeur associée, qui n'attend aucune valeur. |

Autre exemple :

```bash
while getopts ":s:d:hv" argument
               ^
               |_______________ Indique le mode silencieux, n'affiche pas les erreurs.
```

Exemple si "./script.sh -s /home/toto/Images/photo.jpg" : 

|    |
|:---|
| Option choisie : "s" |
| La valeur de la variable "argument" : "s" |
| La valeur de la variable "$OPTARG" : "/home/toto/Images/photo.jpg" |

Au niveau de case :

|| Description |
|:---|:---|
| \?) | quand case détecte une option invalide. |
| :) | quand l'option qui requière un argument n'as pas d’arguments. |

On peut combiner tous les option en une seule fois.

Autre exemple :

Contexte : c'est un script permettant de faire des copies de fichiers dans une machine en local !

```bash

#!/bin/bash

readonly version="1"

usage() {
  echo ""
  cat <<USAGE
    Avec arguments :
    Usage: ./script.sh -s|d [arg]

    Option 1:   -s     Chemin source des fichiers à copier.
    Option 2:   -d     chemin de destination des fichier copiés.
   
    Sans arguments :
    Usage: ./script.sh -h|v

    Option 3:   -v     Affiche la version du script.
    Option 4:   -h     Affiche l'aide.

    Exemples:
    ./script.sh -s /home/toto/vidéo.avi -d /home/toto/vidéos
    ./script.sh -v
    ./script.sh -h	
USAGE
  echo ""
}

version() {
  echo -e "\n Script : $(basename ${0})"
  echo -e "Version : ${version} \n" 
}

# Filtrage des options utilisateur
if [[ ${#} -eq "0" ]]
then
  echo "-----> Il manque des options !"
  usage
  exit 1
elif [[ ${#} -gt "4" ]]
then
  echo "-----> Il y a trop d'options !"
  usage
  exit 2
elif [[ ${1} =~ ^[^-.] ]]
then
  echo "-----> ${1} n'est pas une option valide ! "
  usage
  exit 3
fi

readonly options=":s:d:hv"

while getopts "${options}" argument
do
  case "${argument}" in
    h)
      usage
      ;;
    v)
      version
      ;;
    s)
      readonly source_file="${OPTARG}"
      echo "Voici la source : ${source_file}"
      ;;
    d)
      readonly dest_file="${OPTARG}"
      echo "Voici la destination : ${dest_file}"
      ;;
    :)
      echo "-----> L'option nécessite obligatoirement d'un argument !"
      usage
      exit 6
      ;;
   \?)
      echo -e "-----> L'option ne fait pas partie des options valides !"
      usage
      exit 7
      ;;
  esac
done

if [[ -z ${dest_file} ]] || [[ -z ${source_file} ]]
then
echo "-----> L'option -d et -s doivent fonctionner ensemble !"
usage
exit 8
fi

```

## Bonne pratique

La commande "getopts" est conseillée pour de petits script mais pas pour de grands projets, pour un projet plus important il faut utiliser un mécanisme plus performant.