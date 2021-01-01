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
  echo "Nom de l'application manquant !"
  exit 1
fi

readonly app=$(echo "${1}" | tr "[:upper:]" "[:lower:]")

if [[ "$(command -v ${app})" || "$(flatpak list --app | grep ${app})" ]]
then
  echo "Installé !"
else
  echo "Non installé !"
fi

```
