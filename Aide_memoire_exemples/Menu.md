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
