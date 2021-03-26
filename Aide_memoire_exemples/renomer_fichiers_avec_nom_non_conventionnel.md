# Renommer des fichiers qui ont des noms non conventionnels

```bash

#!/bin/bash

for i in *
do  
  # variable
  file_name="${i}"
  dir_name=$(dirname "${file_name}")
  base_name=$(basename "${file_name}")
  
  # Substituer 
  sub_name="$(echo ${base_name} | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]')"

  # renomer les fichiers
  if [[ "${file_name}" != "${sub_name}" ]]
  then
    if (mv "${dir_name}/${file_name}" "${dir_name}/${sub_name}")
    then
      echo "renome ok !"
    else
      echo " ERREUR pour renommer le fichier !"
      exit 1
    fi
  fi
done

```
