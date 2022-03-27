# Infos et messages

```Bash
mesg_info()
{
  mesg_progress="${2}"
  type_info="${1}" # w for warning and i for info

  #Colors
  RED="\033[0;31m"
  GREEN="\033[0;32m"
  NC="\033[0m" # Stop Color

  if [[ ${1} == 'w' ]]
  then
    echo -e "\n${RED}>>> ${2} ...${NC}"
  elif [[ ${1} == 'i' ]]
  then
    echo -e "\n${GREEN}>>> ${2} ...${NC}"
  else
    echo -e "\n>>> ${2} ..."
  fi

  nb_c="${#2}" # retourne le nombre de caractères
  #nb_c=$(echo "${2}" | tr -d '\n' | wc -c)
  array=(----)
  for (( i=0; i <= ${nb_c}; i++ ))
  do
    array+=(-)
  done
  printf %s "${array[@]}" $'\n'
  echo
}

mesg_info "w" "Erreur système !"
```
