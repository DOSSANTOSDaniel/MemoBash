# Enchaîner plusieurs commandes

|  | Description |
|:---|:---|
| "commande 1" ; "commande 2" | Les commandes sont exécutées de manière séquentiel |
| "commande 1" `||` "commande 2" | 'ou logique' commande 2 s'exécute seulement si commande 1 a échouée |
| "commande 1" && "commande 2" | 'et logique' commande 2 s'exécute seulement si commande 1 a réussi |
| "commande 1" | "commande 2" | La commande 2 s'exécute avec comme flux d'entrée (STDIN) le flux de sortie (STDOUT) de la commande 1 |
