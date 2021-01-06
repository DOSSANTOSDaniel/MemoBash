# Détection du gestionnaire de paquets
Fonctionne sur les OS qui utilisent :
1. apt ou apt-get
2. dnf
3. yum

```bash
  case "$OSTYPE" in
    linux*)
      if [[ -f /etc/os-release || -f /etc/redhat-release || -f /etc/debian_version ]]
      then
        if [[ $(dpkg -s "apt" 2> /dev/null) || $(dpkg -s "apt-get" 2> /dev/null) ]]
        then
          pkg_os='apt-get'
        elif [[ $(rpm -qi "dnf" 2> /dev/null) ]]
        then
          pkg_os='dnf'
        elif [[ $(rpm -qi "yum" 2> /dev/null) ]]
        then
          pkg_os='yum'
        else
          alert_info 'INFO' 'Gestionnaire de paquets non prit en charge'
          exit 1
        fi
      fi ;;
    *) alert_info 'INFO' "OS non prit en charge : $OSTYPE" ;;
  esac
```
