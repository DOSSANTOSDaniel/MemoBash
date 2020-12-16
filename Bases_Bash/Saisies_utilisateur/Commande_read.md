# La commande read

Permet de demander un saisie interactive.

Exemple :

```bash
echo "Votre nom : "

read nom

echo "${nom}"

``` 

On peut aussi directement afficher du texte avec la read.

Exemple :

```bash
read -p "Votre nom : " nom

echo "${nom}"

```

