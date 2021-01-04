# Détection de l'utilisateur courant
## Fonctionne sur :
1. LINUX Famille Debian/RedHat
2. BSD

```bash
#!/bin/bash

if [[ ${LOGNAME} != "root" ]]
then
  echo "Utilisateur : ${LOGNAME}"
else
  echo "Super utilisateur : ${LOGNAME}"
fi

```
