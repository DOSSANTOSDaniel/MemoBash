# Exemple d'entête pour une fonction

```bash
#---------Titre function---------
# DESC: 
# GLOBALS:
# ARGS: 
# OUTS: 
# RETURN:
```

|| Description |
|:--:|:--:|
| DESC: | Description du rôle de la fonction |
| GLOBALS: | Liste des variables globales utilisées ou modifiées |
| ARGS: | Les arguments pris en entrée par la fonction |
| OUTS: | Les sorties de le fonction stdout et stderr |
| RETURN: | Valeurs de retour autre que 0 ou erreur|

## Exemple 

```bash
#---------exist_user---------
# DESC: Vérifie si un utilisateur est present dans le système.
# GLOBALS: 
# ARGS: $1
# OUTS: Affiche le résultat
# RETURN: 0
exist_user() {

user_test="${1}"

if (id "${user_test}" > /dev/null 2>&1)
then
  echo "L'utilisateur ${user_test} existe !"
else
  echo "L'utilisateur ${user_test} n'existe pas !"
fi
}
```

```bash
┌──[daniel🐧iS3810]-(~)
│
└─$ ./test.sh daniel

L'utilisateur daniel existe !
```
