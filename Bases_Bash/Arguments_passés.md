# Arguments passés à un script

Le système met à disposition plusieurs variables spéciales qui vont contenir les arguments du script.

Les variables vont de "${1}" à "${n}"...

Exemple :
```Bash
#!/bin/bash
calcul=(($1 + $2))
echo ${calcul}
```

Résultat :
```Bash
./script.sh 5 4
9
```

"${1}" va contenir 5 et "${2}" va contenir 4. 

- Afficher le nombres de paramétrés transmis : "${#}"
- Afficher les paramètres sous forme de chaîne de caractère : "${*}"
- Afficher les paramètres sous forme de tableau : "${@}"
- Afficher le nom du script : "${0}"