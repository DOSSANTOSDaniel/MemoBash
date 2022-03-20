# La structure de contrôle CASE

Plus orienté vers la prise de décisions à partir d'une valeur.

Exemple :

```Bash
#!/bin/bash

case $nb in
	1 )
		echo "1€"
		;;
	2 )
		echo "2€"
		;;
	3 )
		echo "3€"
		;;
	* )
		echo "erreur"
		;;
esac
```

## Syntaxe

```bash
case <valeur> in
  <choix 1>)
    <commandes>
    ;;
  <choix 2>)
    <commandes>
    ;;
  <choix 3>)
    <commandes>
    ;;
  <tout le reste(*)>)
    <commandes>
    ;;
esac
```

On peut regrouper les conditions avec l'opérateur logique OU "|".

Exemple :

```bash
#!/bin/bash

echo "[sup] pour supprimer un utilisateur"
echo "[add] pour créer un utilisateur"
echo "[mod] pour modifier un utilisateur"

read -p "Que voulez vous faire : " choix

case "${choix}" in
  "sup" | "SUP")
    echo "Supression d'un utilisateur"
    ;;
  "add" | "ADD")
    echo "Ajout d'un utilisateur"
    ;;
  "mod" | "MOD")
    echo "Modification d'un utilisateur"
    ;;
  *)
    echo "Erreur de saisie"
    ;;
esac

```

On peut aussi utiliser des métacaractères, exemple "[0-9]".

