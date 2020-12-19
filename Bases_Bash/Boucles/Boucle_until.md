# La boucle until

"Until" fonctionne comme while à une différence près, l'interprétation de sa condition.

La boucle "until" (jusqu'à ce que) en anglais, va s'exécuter jusqu’à ce que la condition soit vraie puis une fois que la condition est vrais alors la boucle s’arrête.

La boucle "while" (tant que) en anglais, va s'exécuter tant que la condition est vraie, puis une fois que la condition n'est plus vrais alors la boucle s’arrête.

Syntaxe :

```bash
#!/bin/bash

tour=0

until ((tour >= 10))
do
  echo "Salut ! ${tour}"
  ((tour++))
done

```

Explication : Boucler jusqu'à ce que tour soit supérieur ou égal à 10.