# Utilisation de la crontab 

Permet d'exécuter des commandes automatiquement et de manière récurrente.

| Options de la crontab | Description |
|:---|:---|
| "-e" | Modifie la crontab |
| "-l" | Liste la crontab de l'utilisateur courent |
| "-r" | Supprime la crontab |

Ligne temporelle :

|  | m | h | dom | mon | dow | commande |
|:---|:---|:---|:---|:---|:---|:---|
|Description : |Minutes|Heures|Jour du mois|Mois|Jour de la semaine| Les commandes ou scripts a exécuter|
|Temps : |De 0 à 59|De 0 à 23 |De 1 à 31 |De 1 à 12 |De 0 à 6, 0=Dimanche||

Toujours mettre le chemin absolu pour les scripts ou commandes.