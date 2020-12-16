# Recommandations et bonnes pratiques

Voici quelques recommandations et bonnes pratiques d'après le "Shell style guide" de Google.

1. Privilégier l'utilisation de l’interpréteur Bash au lieu de sh ou autre.
2. L'indentation dans un script (2 espaces), pas de tabulation.
3. Systématiquement documenter le script à l'aide de commentaires.
4. Toujours implémenter une fonction usage(), qui permet de documenter et de décrire le fonctionnement du script, voir dossier "Fonctions".
5. Appeler les variable ainsi : "${toto}".
6. Privilégier les variables en lecture seule si possible, voir le dossier "Variables".
7. Toujours typer les variables.
8. Utiliser un maximum les quottes pour les variables, exemple : "${toto}".
9. Ne jamais utiliser les quottes pour des entiers.
10. Privilégier "${@}" à ${*}.
11. L'utilisation de la commande "eval" n'est pas recommandée.
12. Toujours vérifier la valeur de statut à chaque opération.
 
