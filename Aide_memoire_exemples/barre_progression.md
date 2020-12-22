# Barre de progression
 
```bash

#!/bin/bash
terr=$(ls | wc -l)
#progress=""
nbcount=0
declare -A my_array

for i in *
do
    ((nbcount++))
    my_array[$nbcount]='#'
    echo -e "\n"
    echo " [ ${nbcount} fichiers sur ${terr} ] "
    echo " [ ${my_array[@]} > "
    echo -e "\n"
    sleep 1 
    clear
done

```