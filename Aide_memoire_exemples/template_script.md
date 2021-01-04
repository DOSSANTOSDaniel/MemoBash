
# Template de script Bash

```bash
#!/bin/bash

#************************************************#
# Nom:     <nom>.sh                              #
# Auteur:  toto <toto@mail.com>                  #
# Date:    01/12/2058                            #
# Version: 1.1                                   #
#                                                #
# Rôle:    <Que fait le script ?>                #
# Usage:   <nom>.sh [arg]                        #
# Limites: <limites d'utilisation>               #
# Contraintes:
# Licence:
#************************************************#

### Inclusions ###
./script.sh

### Fonctions ###
usage() {
  echo "___ Script toto"
  echo ""
  echo "Parametre passé : ${1}"
  echo ""
  echo "$(basename ${0}) <opt> <arg>"
  echo ""
  echo " Ce script permet de ..." 
  echo ""
}

version() {
  echo "Script version : 0.99"
}

alert_info() {
  # $1 : ERREUR, INFO, ALERTE.
  # $2 : Informations complémentaires.
  echo "\n ${1} : ${2} \n"
}

test_user() {
if [[ ${LOGNAME} != "root" ]]
 then
   echo "Utilisateur : ${LOGNAME}"
 else
   echo "Super utilisateur : ${LOGNAME}"
fi
}

test_distro() {
case "$OSTYPE" in
  linux*) echo "LINUX"
	  if [[ -f /etc/os-release ]]
	  then
	    cat /etc/os-release | grep "^PRETTY_NAME" | cut -d '=' -f2
	    uname -r
          elif [[ -f /etc/redhat-release ]] # Ancienne distribution de la famille RedHat
	  then
	    cat /etc/redhat-release
          elif [[ -f /etc/debian_version ]] # Ancienne distribution de la famille Debian
	  then
	    cat /etc/debian_versioin
	  fi
	  ;;
    bsd*) echo "BSD"
	  uname -rs
	  ;;
  darwin*) echo "OSX"
	  sw_vers || uname -rs 
	  ;;
  *) echo "OS inconnu : $OSTYPE" 
	  ;;
esac
}

check_installed() {
app=$(echo "${1}" | tr "[:upper:]" "[:lower:]")

stat_app=$(dpkg -s "${app}" | grep Status | awk '{print $2}')

if [[ ${stat_app} != 'install' && ! $(command -v ${app}) ]]
then
  echo -e "\n Installation de ${app} en cours \n"
  apt-get update -q
  apt-get install -qy ${app}
  
  if [[ "${?}" == "0" ]]
  then
    echo -e "\n Installation de ${app} réussie \n"
  else
    echo -e "\n Erreur : \n"
    echo -e "\n Installation de ${app} Impossible!\n"
    exit 1
  fi
fi
}

### Main ###

# Variables 

# Bannière
cat << "EOF"
               _       _
 ___  ___ _ __(_)_ __ | |_
/ __|/ __| '__| | '_ \| __|
\__ \ (__| |  | | |_) | |_
|___/\___|_|  |_| .__/ \__|
                |_|
EOF

# Test de l'utilisateur
test_user

# Test de la distribution
test_distro

# Dépendances
check_installed <application>

# GetOps
while getopts "hv" arguments
do
  case "${arguments}" in
    h)
      usage
      ;;
    v)
      version
      ;;
    *)
      exit 1
      ;;
  esac
done

# Menu
echo "Menu de tests"
echo "--------------"
PS3='Votre choix: '
options=("Test un" "Test deux" "Test trois" "Test quatre" "Quitter")
select opt in "${options[@]}"
do
  case $opt in
    "Test un")
      echo "Test un"
      ;;
    "Test deux")
      echo "Test deux"
      ;;
    "Test trois")
      echo "Test trois"
      ;;
    "Test quatre")
      echo "Test quatre"
      ;;
    "Quitter")
      echo -e "\n FIN des tests \n"
      exit 1
      ;;
    *)
      echo "Option invalide : ${REPLY}"
      ;;
  esac
done

# Effacer les traces

```
