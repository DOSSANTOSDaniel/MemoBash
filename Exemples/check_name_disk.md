# Vérification de la désignation du disque

```Bash
check_name_disk() {
  disk="$disk_device"

  regex="^[sh][d][a-z]$"

  if [[ ! $(basename $disk) =~ ${regex} ]]
  then
    echo "Erreur de saisie ! :"
    echo " La valeur $(basename $disk) n'est pas permise !"
    usage
    exit 1
  fi
}
```
