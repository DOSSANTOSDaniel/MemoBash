# Création d'un Menu
```bash

#!/bin/bash

echo "Menu de tests"
echo "--------------"
PS3='Votre choix: '
options=("Test un" "Test deux" "Test trois" "Test quatre" "Quitter")
select opt in "${options[@]}"
do
  case $opt in
    "Test un")
      echo "Test un"
      ;;
    "Test deux")
      echo "Test deux"
      ;;
    "Test trois")
      echo "Test trois"
      ;;
    "Test quatre")
      echo "Test quatre"
      ;;
    "Quitter")
      echo -e "\n FIN des tests \n"
      exit 1
      ;;
    *)
      echo "Option invalide : ${REPLY}"
      ;;
  esac
done

```

## Autre exemple de menu
```bash
#/bin/bash

PS3="Votre choix : "
options=('un' 'deux' 'trois' 'quitter[q/Q]')

while :
do
  echo -e "\n -- Menu de traduction -- "
  select ITEM in "${options[@]}"
  do
    case ${REPLY} in
      1) echo -e "\n Traduction: one"
        break;;
      2) echo -e "\n Traduction: two"
        break;;
      3) echo -e "\n Traduction: tree"
        break;;
      4|Q|q) exit;;
      *) echo -e "\n Choix incorrect"
        break;;
    esac
  done
done
```
## Autre exemple spécifique à la sélection de fichiers ou dossiers
```bash
#/bin/bash

PS3="Votre choix : "
files=($(ls -A .))

echo -e "\n -- Menu fichiers -- "
select ITEM in "${files[@]}" 'quitter'
do
  if [[ $ITEM == 'quitter' ]]
  then
    echo "Fin du programme!"
    exit
  else
    echo -e "\n Fichier selectionné: ${ITEM} \n"
  fi 
done
```
