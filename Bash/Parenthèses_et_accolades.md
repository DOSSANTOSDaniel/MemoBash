# Bash avec une condition if quelle est la différence entre parenthèses et accolades...

## Sans symbole

```Bash
if commande_1
then
   commande_2
else
   commande_3
fi
```

Si la commande_1 retourne le code de sortie 0 alors la commande_2 s’exécute si non c'est la commande_3 qui s'exécute.

## Avec le symbole [] 

```Bash
if [ test ]
then
   commande_2
else
   commande_3
fi
```

Utilisation de la commande test, disponible sur tous les shells POSIX ou non POSIX.

Si le test est vrai alors la commande_2 s’exécute, si non c'est la commande_3 qui s'exécute.

## Avec le symbole [[]]

```Bash
if [[ test ]]
then
   commande_2
else
   commande_3
fi

num='2022'

if [[ $num =~ ^[0-9]+$ ]]
then
   commande_2
else
   commande_3
fi
```

Utilisation d'une nouvelle version de la commande test existant sur KSH, BASH et ZSH.

Mais elle permet aussi de tester si une chaîne correspond à une expression régulière.

## Avec le symbole $(()) et (())

```Bash

# Calcul
rest=$((5+5))

# Condition
if (( 5+5 ))
then
   commande_2
else
   commande_3
fi

# Boucle for
for (( ; ; ))
do
   echo "boucle"
done
```

Nouvelle extension sur KSH et aussi supportée sur BASH et ZSH qui permet les calculs arithmétiques mais aussi les boucles for de type C.

## Avec le symbole $() et ()

```Bash
# Sous shell

if ( commands1 )
then
   commands2
else
   commands3
fi

ou

user_dir=$(pwd)
```

Exécute la commande dans un sous shell 
si code de sortie = 0 la commande à réussi.

Pourquoi le faire dans un sous-shell ?
c'est pour limiter les effets du bout de code sur le code générale, exemple les variables du bout de code vont disparaître quand le bout de code est terminé.

Ces commandes sont exécutées dans un sous-processus distinct du processus d'exécution du script.

## A voir

```
https://qastack.fr/unix/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs


https://unix.stackexchange.com/questions/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs


https://superuser.com/questions/1533900/difference-between-and-or-and-in-bash
```