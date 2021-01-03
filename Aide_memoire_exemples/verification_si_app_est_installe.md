# Vérification si une application est installée ou pas
Détécte les differents types d'installations :
1. Manuelle
2. Via gestionnaire de paquets (apt, dnf, pkg ...)
3. Via snap
4. Via flatpak

```bash
#!/bin/bash

if [[ -z "${1}" ]]
then
  echo "Nom de l'application manquant !" # à enlever 
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
