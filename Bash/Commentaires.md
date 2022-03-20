# Les commentaires

Les commentaires permettent de clarifier le code en rajoutant des informations supplémentaires.

On peut commenter soit au dessus de la ligne soit après la ligne.

Commentaire au dessus :

```Bash
#!/bin/bash
# Affiche Bonjour
echo "Bonjour"
```

Commentaire après la ligne : 
```Bash
#!/bin/bash
echo "Bonjour"  # Affiche Bonjour
```

# Commentaires sur plusieurs lignes

Le shell Bash ne permet pas d'avoir des commentaires sur plusieurs lignes !

Ceci est du bricolage, a ne pas faire :

```bash
#!/bin/bash

# commentaire sur plusieurs lignes

: << COM
'ligne 1
ligne 2
ligne 3'
COM

```

Le nom COM permet d'indiquer où commence le commentaire et où il se termine, au lieu de COM, on peut choisir n'importe quel autre nom.