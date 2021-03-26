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
    echo -e "\n Fichier sélectionné: ${ITEM} \n"
  fi 
done
```
## Autre exemple avec navigation entre fichiers et retour en arrière
```bash
#/bin/bash

PS3="Votre choix : "
total='.'
files=($(ls ${total}))
count=0

# Fonctions
menu() {
echo -e "\n -- Menu fichiers -- "
select ITEM in "${files[@]}" 'Retour' 'Quitter'
do
  if [[ "${ITEM}" == "Quitter" ]]
  then
    echo "Fin du script !"
    exit 1
  elif [[ "${ITEM}" == "Retour" ]]
  then
    retour
    break
  else
    total="${total}/${ITEM}"
    ((count++))
    break
  fi
done
}

retour() {
if [[ ${count} -gt 0 ]]
then
  total=$(dirname ${total})
  ((count--))
fi
}

while :
do
  files=($(ls ${total}))
  menu
  if [[ -f ${total} ]]
  then
    echo "le fichier : ${ITEM}"
    exit 0
  fi
done
```
