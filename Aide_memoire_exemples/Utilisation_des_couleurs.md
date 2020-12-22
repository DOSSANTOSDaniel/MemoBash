# Utilisation des couleurs

```bash

#!/bin/bash

### variables de couleurs

rouge='\e[0;31m' 
vert='\e[0;32m' 
orange='\e[0;33m' 
bleu='\e[0;34m'  
neutre='\e[0;m'

bannos="$(cat << 'ban'

 ____            _     
| __ )  __ _ ___| |__  
|  _ \ / _` / __| '_ \ 
| |_) | (_| \__ \ | | |
|____/ \__,_|___/_| |_|

ban
)"

echo -e "${vert} \n ${bannos} \n ${neutre}"

```
