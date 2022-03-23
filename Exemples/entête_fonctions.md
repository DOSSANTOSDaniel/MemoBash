```Bash
### Function

# Function name : toto
# 
# GLOBALS: 
# 	$HOME
# ARGUMENTS: 
# 	Le chemin du dossier principale de l'utilisateur daniel. 
# OUTPUTS: 
# 	Un texte.
# RETURN: 
# 	0 si succes, si non autre.

toto () {
	echo "$HOME >>> $1"
}
```
