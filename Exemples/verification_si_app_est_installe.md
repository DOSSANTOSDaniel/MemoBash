# Fonctionnement du code :
1. Détection du système d'exploitation.
2. Détection du gestionnaire de paquets a utiliser.
3. Vérifier si l'application est déjà installée.
4. Installation de l'application si l'application n'est pas installée.

Compatibilité avec différents types d'installations :
1. Manuelle.
2. Via gestionnaire de paquets (apt, yum et dnf).

```bash
#!/usr/bin/env bash

os_type="$(uname -s)"
pkg_managers=('apk' 'apt-get' 'yum' 'dnf' 'zypper' 'pacman' 'pkg')
dependencies=('htop' 'curl' 'aria2' 'screen')

if [ "$(id -u)" != '0' ]; then
  echo "Ce script doit être exécuté en tant que root !"
  exit 1
fi

if [ "$os_type" != 'Linux' ] && [ "$os_type" != 'FreeBSD' ]; then
  echo "OS non pris en charge !"
  exit 1
fi

# Détection du gestionnaire de paquets
for pkg_man in "${pkg_managers[@]}"; do
  if command -v "$pkg_man" &>/dev/null; then
    case "$pkg_man" in
        apk)
            update_cmd="apk update"
            install_cmd="apk add -yq"
            update_status=0
            ;;
        apt-get)
            update_cmd="apt-get update -q"
            install_cmd="apt-get install -yq"
            update_status=0
            dependencies[2]="aria2c"
            ;;
        yum)
            update_cmd="yum check-update -q"
            install_cmd="yum install -yq"
            update_status=0
            ;;
        dnf)
            update_cmd="dnf check-update"
            install_cmd="dnf install -yq"
            update_status=0
            ;;
        pacman)
            update_cmd="pacman -Sy --noconfirm"
            install_cmd="pacman -S --noconfirm"
            update_status=0
            ;;
        zypper)
            update_cmd="zypper refresh"
            install_cmd="zypper install -yq"
            update_status=0
            ;;
        pkg)
            update_cmd="pkg update"
            install_cmd="pkg install"
            update_status=0
            ;;
    esac
    break
  fi
done
# Gestionnaire de paquets non trouvé
if [ -z "$install_cmd" ]; then
  echo "Gestionnaire de paquets non compatible !"
  exit 1
fi

# Installation de chaque dépendance si nécessaire
for package in "${dependencies[@]}"; do
  if ! command -v "$package" &>/dev/null; then
    if [ "$update_status" = 0 ]; then
      $update_cmd && ((update_status++))
    fi
    $install_cmd "$package" || echo "Erreur d'installation de $package !"
  fi
done
```
## Vérification application Flatpak, snap et install

```bash
#!/bin/bash

readonly var=$(echo "${1}" | tr "[:upper:]" "[:lower:]")

readonly app_flat=$(flatpak list --app | grep ${var} | cut -f2)
readonly app_snap=$(snap list --app | grep ${var} | awk '{print $1}')

if [[ $(dpkg -s flatpak 2> /dev/null) && $(command -v flatpak 2> /dev/null) ]]
then
  if ! [[ $(flatpak info ${app_flat} 2> /dev/null) ]]
  then
    flatpak update && flatpak install -y ${app_flat}
  fi
elif [[ $(dpkg -s snapd 2> /dev/null) && $(command -v snap 2> /dev/null) ]]
then
  if ! [[ $(snap info ${app_flat} 2> /dev/null) ]]
  then
    snap install ${app_snap}
  fi
else
  echo ""
fi


```
