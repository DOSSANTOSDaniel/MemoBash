# Code permettant de détecter si on est connecté sur :
1. Une machine physique.
2. Une VM KVM ou VirtualBox
3. Un conteneur Docker

```bash

#!/bin/bash

if [[ ${LOGNAME} != "root" ]]
then
  echo "Utilisateur : ${LOGNAME}"
  echo "Ce script doit être exécuté en tant que root !"
  exit 1
fi

# Variables VirtualBox
vbox1=$(hostnamectl status 2> /dev/null | grep 'Virtualization' | awk '{print $2}')
vbox2=$(systemd-detect-virt 2> /dev/null)
vbox3=$(dmidecode -t system 2> /dev/null | grep 'Product Name' | awk '{print $2}')

# Variables KVM
kvm1=$(hostnamectl status 2> /dev/null | grep 'Virtualization' | awk '{print $2}')
kvm2=$(systemd-detect-virt 2> /dev/null)
kvm3=$(dmidecode -t system 2> /dev/null | grep 'Manufacturer' | awk '{print $2}')

# Variables Conteneurs Docker
ct1=$(grep devices /proc/self/cgroup | cut -d ':' -f3 | cut -d '/' -f2)
ct2=$(grep -c docker /proc/1/cgroup)


if [[ ${vbox1} == 'oracle' || ${vbox2} == 'oracle' || ${vbox3} == 'VirtualBox' ]]
then
  echo "On est dans une VM VirtualBox !"
elif [[ ${kvm1} == 'kvm' || ${kvm2} == 'kvm' || ${kvm3} == 'QEMU' ]]
then
  echo "On est dans une VM KVM"
elif [[ -f /run/systemd/container || ${ct2} -gt 0 || ${ct1} == "docker" ]]
then
  if [[ -f /.dockerenv ]]
  then
    echo "On est dans un conteneur Docker !"
  fi
else
  echo "On est probablement dans une machine physique !"
fi

```
