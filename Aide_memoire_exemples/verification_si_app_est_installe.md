# Vérification si une application est installée ou pas

```bash
#!/bin/bash

readonly app=$(echo "${1}" | tr "[:upper:]" "[:lower:]")

if [[ "$(command -v ${app})" || "$(flatpak list --app | grep ${app})" ]]
then
  echo "Installé !"
else
  echo "Non installé !"
fi

```
