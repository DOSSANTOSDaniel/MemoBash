# La valeur de retour d'une fonction

L'instruction "return" permet de retourner la valeur de retour d'une fonction.

Cette instruction permet d'envoyer une valeur à la variable de contrôle d'état "${?}" à la sortie d'un script.

Exemple script :

```bash
#!/bin/bash

fonction_toto() {
  return 200
}

fonction_toto

echo "${?}"

```

Exemple utilisation :

```bash
[daniel🐧iS3810](~)$ ./script.sh 

200

``` 

Cette instruction est a utiliser seulement pour indiquer une erreur par rapport à l’exécution d'une fonction.

