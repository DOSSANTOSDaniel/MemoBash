#!/bin/bash

i_need() {
app="${1}"

if [[ "$OSTYPE" == 'linux-gnu' ]]
then
  if (command -v apt-get 2> /dev/null)
  then
    apt-get update -q
    if ! (apt-get install -qy ${app})
    then
      echo "'ERREUR' Installation de ${app} Impossible!"
      exit 1
    fi
  elif (command -v dnf 2> /dev/null)
  then
    dnf check-update > /dev/null
    if ! (dnf install -qy ${app})
    then
      echo "'ERREUR' Installation de ${app} Impossible!"
      exit 1
    fi
  elif (command -v yum 2> /dev/null)
  then
    yum check-update > /dev/null
    if ! (yum install -qy ${app})
    then
      echo " 'ERREUR' Installation de ${app} Impossible!"
      exit 1
    fi
  else
    echo -e "\n Gestionnaire de paquets non prit en charge."
    echo -e "Merci d'installer ${app} manuellement. \n"
    exit 1
  fi
else
  echo -e "\n Système non prit en charge. \n"
  exit 1
fi
}

app="${1}"

if ! (command -v ${app} 2> /dev/null)
then
  i_need "${app}"
fi
