# Mise en forme sur Bash

Les terminaux de type ANSI/VT100 permettent d'afficher de la couleur et de proposer des effets de caractère.

| Codes | Descriptions |
|:---:|:---:|
| ‘\e[‘ | Balise de commencement |
| ‘32m’ | Code couleur |
| ‘Bonjour’ | Caractères à colorier |
| ‘\e[m’ | Termine l'effet de la couleur |

Il y a plusieurs manières d'écrire le caractère espace(ESC) :

* \e
* \E
* \033
* \x1B

## Codes d'effets de caractère

| Descriptions | Codes |
|:---:|:---:|
| Gras | 1 |
| Foncé | 2 |
| Italique | 3 |
| Soulignage | 4 |
| Clignotement | 5 ou 6 |
| Inverse la police et le fond | 7 |
| Invisible | 8 |
| Barré | 9 |
| Soulignage double | 21 |
| Surlignage | 53 |

## couleurs de la police

| Descriptions | Codes |
|:---:|:---:|
| Noir | 30 |
| Rouge | 31 |
| Vert | 32 |
| Jaune | 33 |
| Bleu | 34 |
| Magenta | 35 |
| Cyan | 36 |
| Gris claire | 37 |
| Couleur par défaut | 39 |
| Gris foncé | 90 |
| Rouge claire | 91 |
| Vert claire | 92 |
| Jaune claire | 93 |
| Bleu claire | 94 |
| Magenta claire | 95 |
| Cyan claire | 96 |
| Blanc | 97 |

Le code 38 suivie de 5;(n) :

* Valeur (n) de 0 à 15 correspond aux couleurs basiques.
* Valeur (n) de 16 à 255 correspond à plus de nuances de couleurs.
* On peut aussi utiliser le code 38 suivie de 2;r;g;b avec pour chaque argument(r,g,b) la possibilité d'avoir de 0 à 255 Valeurs.

## couleurs de fond

| Descriptions | Codes |
|:---:|:---:|
| Noir | 40 |
| Rouge | 41 |
| Vert | 42 |
| Jaune | 43 |
| Bleu | 44 |
| Magenta | 45 |
| Cyan | 46 |
| Gris claire | 47 |
| Fond par défaut | 49 |
| Gris foncé | 100 |
| Rouge claire | 101 |
| Vert claire | 102 |
| Jaune claire | 103 |
| Bleu claire | 104 |
| Magenta claire | 105 |
| Cyan claire | 106 |
| Blanc | 107 |

Le code 48 suivie de 5;(n) :

* Valeur (n) de 0 à 15 correspond aux couleurs basiques.
* Valeur (n) de 16 à 255 correspond à plus de nuances de couleurs.
* On peut aussi utiliser le code 48 suivie de 2;r;g;b avec pour chaque argument(r,g,b) la possibilité d'avoir de 0 à 255 Valeurs.

## Codes de neutralisation

| Codes | Descriptions |
|:---:|:---:|
| 0 | Normal, remet à zéro le formatage |
| 21 | Gras |
| 22 | Sombre |
| 24 | Soulignement |
| 25 | Clignotement |
| 27 | Inverse |
| 28 | Invisible |
| 55 | surlignement |

On peut combiner les différents codes(attributs), chaque attribut doit être séparer par un ";".

Le code 58 permet de changer la couleur du soulignage tout en gardant une autre couleur pour la police.

## Sources

<https://en.wikipedia.org/wiki/ANSI_escape_code>

<https://misc.flogisoft.com/bash/tip_colors_and_formatting>

<https://man7.org/linux/man-pages/man4/console_codes.4.html>

<https://handwiki.org/wiki/ANSI_escape_code>