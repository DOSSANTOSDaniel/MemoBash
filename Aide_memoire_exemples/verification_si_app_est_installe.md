# Vérification si une application est installée ou pas

```bash

#!/bin/bash

if [[ "$(command -v ${1})" || "$(flatpak list --app | grep ${1})" ]]
then
  echo "Installé !"
else
  echo "Non installé !"
fi

```
