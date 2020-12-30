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

## Pour cp et mv

```bash
#!/bin/bash

declare -r p_1="$1"
declare -r p_2="$2"
declare -i nbcount=0
declare -A my_array
declare -ir total="$(du -s ${p_1} | cut -f1)"

cp "${p_1}" "${p_2}" ; sync &
declare -i nb_dest="$(du -s ${p_2} | cut -f1)"

until [ ${nb_dest} > 0 ]
do
  clear
  echo " 0%"
  echo " [ > ]"
  sleep 1
done

while [ ${nb_dest} != ${total} ]
do
  sleep 1
  clear
  nb_dest="$(du -s ${p_2} | cut -f1)"
  p_cal=$(echo "${nb_dest}/${total}*100" | bc -l)
  p_int=$(echo "${p_cal}" | cut -d '.' -f1)
  echo " ${p_int} %"
  ((nbcount++))	  
  my_array[$nbcount]='='
  echo " [ ${my_array[@]} > ]"
done
```
### Autre solution

```bash
sudo apt install progress
cp toto.iso /tmp | progress -m
```
