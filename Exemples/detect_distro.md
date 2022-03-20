# Détection de l'OS et de la distribution
Fonctionne sur :
1. MAC OSX
2. BSD
3. LINUX

```bash

#!/bin/bash

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

```
