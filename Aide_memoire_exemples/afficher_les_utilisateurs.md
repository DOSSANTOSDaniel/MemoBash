# Affichage des utilisateurs

Fonctionne sur : Famille Debian et RedHat

```bash

#!/bin/bash

min=$(grep ^UID_MIN /etc/login.defs | awk '{print $2}')
max=$(grep ^UID_MAX /etc/login.defs | awk '{print $2}')

user_id=$(cat /etc/passwd | awk -F':' '{print $3}')
for id in ${user_id}
do
  if [[ ${id} -ge ${min} && ${id} -le ${max} ]]
  then
    cat /etc/passwd | grep ":${id}:${id}:" | awk -F':' '{print $1}'
    cat /etc/passwd | grep ":0:0:" | awk -F':' '{print $1}'
  fi  
done

```
