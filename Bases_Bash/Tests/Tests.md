# Les tests

## Utilisation de la commande "test"

Elle permet de tester certaines conditions, la commande test est à utiliser avant de créer une condition "if", ce qui va permettre de valider le bon fonctionnement du test pour par la suite l'intégrer à une condition "if".

## Tests d'expression numériques
Ne fonctionne pas avec des chaînes de caractères.

| Opérateur | Description |
|:---|:---|
| "-eq" ou "==" | Vérifie que les valeurs sont identiques. |
| "-ne" ou "!=" | Vérifie que les valeurs sont différentes, l'opérateur "!=" fonctionne aussi avec les chaînes de caractères. |
| "-lt" ou "<" | Vérifie qu'une des valeurs est inférieur à l'autre. |
| "-gt" ou ">" | Vérifie qu'une des valeurs est supérieur à l'autre. |
| "-le" ou "<=" | Vérifie qu'une des valeurs est inférieur ou égal à l'autre. |
| "-ge" ou ">="| Vérifie qu'une des valeurs est supérieur ou égal à l'autre. |

Exemple :

```Bash
[daniel🐧iS3810](~)$ test 10 -gt 5

[daniel🐧iS3810](~)$ echo "${?}"

0
```

## Tests sur des chaînes de caractères

| Opérateur | Description |
|:---|:---|
| test "toto" = "toto" | Vérifie que le contenue des chaînes est identique. |
| test "tata" != "toto" | Vérifie que le contenue des chaînes est différent. |
| test "yes" ou test -n "yes" | Vérifie que le contenue de la chaîne est pas vide, vrai si c'est pas vide, faux si la valeur est vide. |
| test -z "" | Vérifie que le contenue de la chaîne est vide, vrai si le contenue de la chaîne est vide. |

Exemple :

```Bash
[daniel🐧iS3810](~)$ test -z ""

[daniel🐧iS3810](~)$ echo "${?}"

0
```

## Tests sur des fichiers ou dossiers


| Option | Description |
|:---|:---|
| test "fichier1" -ef "fichier2" | fichier1 et fichier2 sont des liens physiques pointant vers le même fichier  |
| test "fichier1" -nt "fichier2" | fichier1 est plus récent que fichier2 (utilisation de la date de modification) |
| test "fichier1" -ot "fichier2" | fichier1 est plus ancien que fichier2 |
| test -b "fichier" | Vrai si le fichier existe et est de type bloc, (voir le chapitre "Les fichiers spéciaux" en dessous) |
| test -c "fichier" | Vrai si le fichier existe et est de type caractère, (voir le chapitre "Les fichiers spéciaux" en dessous) |
| test -d "fichier" | Vrai si le fichier existe et est de type répertoire |
| test -e "fichier" | Vrai si le fichier existe |
| test -f "fichier" | Vrai si le fichier existe et est de type fichier régulier et pas un fichier de type caractère ou bloc |
| test -g "fichier" | Vrai si le fichier existe et que l'utilisateur courent dispose de la permission set-group-ID (sgid) sur le fichier ou le répertoire, quand un répertoire est configuré pour autoriser le (sgid), alors si un fichier est créer dans ce répertoire il va automatiquement appartenir au groupe du répertoire peut importe l'utilisateur qui l'a créé. |
| test -G "fichier" | Vrai si le fichier existe et appartient au groupe de l'utilisateur courant|
| test (-h ou -L) "fichier" | Vrai si le fichier existe et est de type lien symbolique |
| test -k "fichier" | Vrai si le fichier existe et est configuré en sticky bit, c'est a dire que le fichier est chargé en mémoire |
| test -O "fichier" | Vrai si le fichier existe et appartient à l'utilisateur courant |
| test -p "fichier" | Vrai si le fichier existe et est de type pipe |
| test -r "fichier" | Vrai si le fichier existe et a la permission en lecture |
| test -s "fichier" | Vrai si le fichier existe et à une taille plus grande que zéro, (fichier non vide) |
| test -S "fichier" | Vrai si le fichier existe et est de type socket|
| test -t "descripteur de fichier" | Vrai si le fichier est ouvert sur un terminal |
| test -u "fichier" | Vrai si le fichier existe et que l'utilisateur courant dispose de la permission set-user-id (suid) sur ce fichier, un fichier appartenant à root et configuré avec le set-user-id est automatiquement lancé avec les privilèges de root, même si c'est un utilisateur ordinaire qui l'a lancé |
| test -w "fichier" | Vrai si le fichier existe et a la permission en écriture |
| test -x "fichier" | Vrai si le fichier existe et a la permission en exécution |

```Bash
[daniel🐧iS3810](~)$ ls -l tyty.txt 

-rw-rw-r-- 1 daniel daniel 4881 déc.  16 09:43 tyty.txt
[daniel🐧iS3810](~)$ test -G tyty.txt ; echo "${?}"

0

```

## Les fichiers spéciaux

Sur des systèmes sous Linux/Unix les entrées et sorties vers des périphériques se font à l'aide de fichiers spéciaux se trouvant dans "/dev/".

On accède à un périphérique comme on accède à un fichier, mais ces fichier spéciaux ne contiennent pas de données claires, ils spécifient plutôt comment on doit faire pour communiquer avec le périphérique en question.

Il y a deux types de fichiers spéciaux :

1. Le type Bloc

	Exemple : disque dur, cd-rom...
	
	Un fichier de type bloc transfert les données (bloc par bloc) vers un périphérique en utilisant les buffers du système, (se qui permet d’accélérer le transfert).
	

2. Le type Caractères

	Exemple : terminal, imprimantes, écrans...
	
	Un fichier de type caractère transfère les données vers un périphérique sous forme de flux, (un caractère est transféré à la fois, sans utiliser les buffers du système). 


## Les opérateurs booléens

| Opérateur | Description |
|:---|:---|
| "-o" | ou logique |
| "-a" | et logique |
| "!" | négation logique |

Exemple :

```Bash
[daniel🐧iS3810](~)$ ls -l tyty.txt 

-rw-rw-r-- 1 daniel daniel 4881 déc.  16 09:43 tyty.txt

[daniel🐧iS3810](~)$ test -f tyty.txt -a -O tyty.txt ; echo "${?}"

0

```

On peut remplacer la commande test par des "[[  ]]"

Exemple :

```Bash
[[ -f tyty.txt ]]
echo "${?}"
0
```
C'est cette syntaxe que nous allons utiliser pour les structures de contrôles comme "if". 

## Utilisation d'expressions régulières dans les tests

La commande test ne permet pas l'utilisation d'expressions régulières.

On peut utiliser des expressions régulières entre "[[ ]]" et avec l'opérateur spécial "=~".

Exemple :

```Bash
[daniel🐧iS3810](~)$ [[ "toto" =~ [a-z] ]] ; echo "${?}"

0

[daniel🐧iS3810](~)$ [[ "toto" =~ [A-Z] ]] ; echo "${?}"

1
```