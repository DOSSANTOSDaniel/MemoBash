# Sélectionner un utilisateur courant du système

```bash


tab_users=()

nb_users='0'

u_id=$(awk -F':' '{print $3}' /etc/passwd)

min=$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)
max=$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)

for user in ${u_id}
do
  if [[ $user -ge $min && $user -le $max ]]
  then
    user_name=$(grep ":${user}:${user}:" /etc/passwd | awk -F':' '{print $1}')
    tab_users+=("$user_name")
    ((nb_users++))
  fi  
done

if [[ ${nb_users} -gt '1' ]]
then 
  PS3="Votre choix : "

  echo -e "\n -- INFO: Plusieurs utilisateurs détectés -- "
  select ITEM in "${tab_users[@]}" 'Quitter'
  do
    if [[ $ITEM == 'Quitter' ]]
    then
      echo "Fin du programme!"
      exit
    else
      echo -e "\n Utilisateur sélectionné: ${ITEM} \n"
      break
    fi
  done
elif [[ ${nb_users} -eq '1' ]]
then
  echo -e "\n Utilisateur sélectionné: $user_name \n"
else
  echo -e "\n Ce système ne contient pas d'utilisateurs autre que ROOT \n"
fi

```

