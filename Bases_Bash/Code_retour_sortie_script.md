 
# Code retour d'une commande et sortie d'un script

Quand l'exécution d'une commande ou d'un script se fait le système place un retour de statut d’exécution dans la variable "${?}", ce retour permet de savoir si la commande à réussi (code retour 0) ou si elle a échoué (code retour 1).

Exemple :

```Bash
mkdir toto
echo "${?}"
0
```

Parfois dans un script nous avons besoin de quitter le script avant la fin de celui-ci, et pour cela on va utiliser la commande "exit".

La commande "exit" permet de mettre fin au script immédiatement.

Exemple :

```Bash
rm -rf /home/toto/tortue.txt
if [[ ${?} == "0" ]]
then
  echo "Suppression réussie"
else
  echo "Erreur de Suppression"
  exit 1
fi

touch /home/toto/tortue.txt
```
Ici le script efface le fichier tortue.txt et s'il réussi alors il va recréer un nouveau fichier tortue.txt, par contre s'il échoue à supprimer le fichier alors on quitte de script.

On peut indiquer un argument à la commande "exit", exemple : "exit 1", "exit 26".
L'argument est une valeur positive ou négative, elle permet de spécifier un type personnel d'erreur :

Exemple :

Script : script.sh

```Bash
rm -rf /home/toto/tortue.txt
if [[ ${?} == "0" ]]
then
  echo "Suppression réussie"
else
  echo "Erreur de Suppression"
  exit 5
fi

touch /home/toto/tortue.txt
```

Documentation : l'erreur "5" signifie que le fichier n'a pas pu être supprimé.

```bash
./script.sh
Erreur de Suppression
echo "${?}"
5
```
Le code retour récupéré avec "${?}" sera 5 car il a été définie par la commande "exit", mais par défaut les retours d'une commande c'est soit 0 quand elle réussie soit 1 quand elle échoue. 

On peut donc attribuer un code de retour par rapport à une erreur spécifique, et indiquer cela dans la documentation du script cela facilite le débogage.

On doit donc attribuer une valeur différentes par rapport aux différents erreurs possibles dans notre script.

De cette manière selon le code d'erreur on peut identifier très rapidement la source de l'erreur.


 