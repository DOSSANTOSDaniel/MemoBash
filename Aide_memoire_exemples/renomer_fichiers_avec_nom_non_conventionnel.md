# Renomer des fichiers qui ont des noms non conventionnels

```bash

#!/bin/bash

for i in *
do  
  # variable
  file_name="${i}"

  # Substituer 
  sub_name="$(echo $i | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]')"

  # renomer les fichiers
  if [[ "${file_name}" != "${sub_name}" ]]
  then
    mv "${file_name}" "${sub_name}"
    if [[ "${?}" == "0" ]]
    then
      echo "renome ok !"
      file_name="${sub_name}"
    else
      echo " ERREUR pour renomer le fichier !"
      exit 1
    fi
  fi

  echo "${file_name}"

done

```
