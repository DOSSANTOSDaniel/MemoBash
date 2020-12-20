# La commande SED

Suppression sans altérer le fichier :

Supprime la ligne qui contient l'occurrence "Bonjour".

```bash
sed '/Bonjour/d' fichier.txt 
```

Supprime les lignes vides.

```bash
sed '/^$/d' fichier.txt 
```



