# La fonction usage

Cette fonction permet d'afficher l'aide associée à notre script, c'est un exemple de comment notre script fonctionne et aussi de montrer les options et paramètres possibles.

C'est une bonne pratique de toujours ajouter une fonction usage dans les scripts.

Exemple de fonction usage :

```bash
#!/bin/bash

usage() {
  echo "___ Script AGE"
  echo ""
  echo "Parametre passé : ${1}"
  echo ""
  echo "$(basename ${0}) <Année de naissance>"
  echo ""
  echo "'Année de naissance' doit comporter quatre nombes exemple : '1988'" 
  echo ""
}
``` 

Cette pratique est un complément important à la documentation.