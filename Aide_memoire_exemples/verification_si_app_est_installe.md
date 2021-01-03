# Vérification si une application est installée ou pas
Détécte les differents types d'installations :
1. Manuelle
2. Via gestionnaire de paquets (apt, dnf, pkg ...)
3. Via snap

```bash
#!/bin/bash

if [[ -z "${1}" ]]
then
  echo "Nom de l'application manquant !"
  exit 1
fi

app=$(echo "${1}" | tr "[:upper:]" "[:lower:]")

stat_app=$(dpkg -s "${app}" | grep Status | awk '{print $2}')

if [[ ${stat_app} != 'install' && ! $(command -v ${app}) ]]
then
  echo -e "\n Installation de ${app} en cours \n"
  apt-get update -q
  apt-get install -qy ${app}
  
  if [[ "${?}" == "0" ]]
  then
    echo -e "\n Installation de ${app} réussie \n"
  else
    echo -e "\n Erreur : \n"
    echo -e "\n Installation de ${app} Impossible!\n"
    exit 1
  fi
fi
```
## Vérification application Flatpak

```bash
#!/bin/bash

readonly var=$(echo "${1}" | tr "[:upper:]" "[:lower:]")
readonly app=$(flatpak list --app | grep ${var} | cut -f1 | tr "[:upper:]" "[:lower:]")

if [[ -z ${var} ]]
then
  echo "Nom manquant !"
  exit 1
elif [[ ${app} == ${var} ]]
then
  echo "L'application ${var} est installée"
else
  echo "L'application ${var} n'est pas installée"
fi

```
