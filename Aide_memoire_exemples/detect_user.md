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

```Bash
if [[ $(id -u) -ne 0 ]]
then
  echo "Le script doit être lancé en tant que root"
  usage
  exit 1
fi   
```
